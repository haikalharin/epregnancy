import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/data/entity/chat_message_entity.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_send_request.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/data/remote_datasource/remote_datasource.dart';
import 'package:PregnancyApp/data/shared_preference/app_shared_preference.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gugor_emoji/emoji_picker_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/model/chat_model/chat_pending_send_request.dart';
import '../../data/model/hospital_model/hospital_model.dart';
import '../../data/model/user_info/user_info.dart';
import '../../env.dart';
import '../../flavors.dart';
import '../../utils/basic_loading_dialog.dart';
import '../../utils/function_utils.dart';
import '../../utils/secure.dart';
import '../location_select_page/bloc/hospital_bloc.dart';
import '../nakes_page/bloc/chat_pending_bloc.dart';
import 'bloc/chat_bloc/chat_bloc.dart';

class NewChatRoom extends StatefulWidget {
  const NewChatRoom({Key? key, this.chatMessageList,
    this.isNakes = false, this.isArchive = false,
    this.pendingChat = false, this.toName, required this.fromId, required this.toId, required this.toImageUrl})
      : super(key: key);
  final List<ChatMessageEntity>? chatMessageList;
  final String? fromId;
  final String? toId;
  final bool? pendingChat;
  final String? toName;
  final String? toImageUrl;
  final bool? isNakes;
  final bool? isArchive;

  @override
  State<NewChatRoom> createState() => _NewChatRoomState();
}

class _NewChatRoomState extends State<NewChatRoom> {
  _NewChatRoomState();
  final ScrollController _scrollController = ScrollController();
  bool isOpenBottomSheet = false;
  FocusNode keyboardFocusNode = FocusNode();
  final TextEditingController _messageEditingController = TextEditingController();

  String? imagePath;
  String? imageBase64;

  String? myImageProfile;

  bool mine = true;
  bool showEmoji = false;
  bool isPendingChat = false;
  String? toName;
  String? toId;
  late WebSocket _webSocket;
  String message = '';
  bool chatHasEnded = false;

  List<ChatMessageEntity>? chatMessageList = [];

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: [
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () async {
                        pickAndCropImageGallery();
                        Navigator.pop(context);
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () async {
                      pickAndCropImageCamera();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void pickAndCropImageGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper.platform
          .cropImage(sourcePath: pickedFile.path, aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]);
      if (croppedFile != null) {

        // todo convert to base 64
        print('cropped file : ${croppedFile.path}');
        setState(() {
          imagePath = croppedFile.path;
          imageBase64 = convertImageToBase64(croppedFile.path);
          log('imagebase64: $imageBase64');
        });

        chatMessageList?.add(
            ChatMessageEntity(
                mine: true,
                dateTime: DateTime.now().toString(),
                message: _messageEditingController.text,
                name: 'sender',
                imagePath: imagePath
            )
        );
        _messageEditingController.clear();
        ChatSendRequest _chatSendRequest = ChatSendRequest(
            fromId: widget.fromId, toId: toId, message: _messageEditingController.text,
        imageBase64: StringConstant.base64tag+imageBase64!);

        Injector.resolve<ChatBloc>().add(SendChatEvent(_chatSendRequest));
        _scrollDown();
      }
    }
  }

  void pickAndCropImageCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      imageQuality: 25,
    );
    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper.platform
          .cropImage(sourcePath: pickedFile.path, aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]);
      if (croppedFile != null) {
        // todo convert to base64
        print('cropped file : ${croppedFile.path}');
        setState(() {
          imagePath = croppedFile.path;
          imageBase64 = convertImageToBase64(croppedFile.path);
        });

        chatMessageList?.add(
            ChatMessageEntity(
                mine: true,
                dateTime: DateTime.now().toString(),
                message: _messageEditingController.text,
                name: 'sender',
                imagePath: imagePath
            )
        );
        _messageEditingController.clear();
        ChatSendRequest _chatSendRequest = ChatSendRequest(
            fromId: widget.fromId, toId: toId, message: _messageEditingController.text,
            imageBase64: StringConstant.base64tag + imageBase64!);

        Injector.resolve<ChatBloc>().add(SendChatEvent(_chatSendRequest));
        _scrollDown();
      }
    }
  }

  void archiveChatRoom(String personUid) async {
    var value = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          children: [
            ListTile(
              onTap: () => Navigator.pop(context, 'delete'),
              title: Text('Akhiri percakapan'),
            ),
            ListTile(
              onTap: () => Navigator.pop(context),
              title: Text(''
                  'kembali'),
            ),
          ],
        );
      },
    );
    if (value == 'delete') {
      // final response = await EventChatRoom.archiveRoomChat(
      //     myUid: _myPerson!.uid, personUid: personUid);
      // if (response) {
      //   EventChatRoom.deleteChatRoom(
      //       myUid: _myPerson!.uid, personUid: personUid);
      // }
    }
  }
  HospitalModel? _hospitalModel;
  void getHospitalFromLocal() async {
    HospitalModel _hospital = await AppSharedPreference.getHospital();
    if (_hospital != null && mounted) {
      setState(() {
        _hospitalModel = _hospital;
      });
    }
  }

  UserModel? userModel;
  void getUserModel() async {
    UserModel _userInfo = await AppSharedPreference.getUser();
    if (_userInfo != null && mounted) {
      setState(() {
        userModel = _userInfo;
      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return WillPopScope(
              child: Center(
                child: Container(
                  width: 240.w,
                  height: MediaQuery.of(context).size.height * 0.75,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.w))),
                  child: Material(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(child: Scrollbar(
                          isAlwaysShown: true,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ListView(
                              children: [
                                Center(
                                  child: Text("Boleh dan tidak boleh dilakukan pada fitur \"Tanya Yuk\"",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: EpregnancyColors.blueDark,
                                        fontSize: 14.sp,
                                        fontFamily: "bold"),
                                  ),
                                ),

                                widget.isNakes == true ? SizedBox(height: 0.h,) : SizedBox(height: 10.h,),

                                widget.isNakes == true ? Container(): Center(
                                  child: Text(widget.isNakes == true ? "" : "Disclaimer!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: EpregnancyColors.blueDark,
                                        fontSize: 12.sp,
                                        fontFamily: "bold"),
                                  ),
                                ),

                                widget.isNakes == true ? const SizedBox.shrink() :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Aplikasi digunakan Hanya untuk mendapatkan informasi umum seperti kehamilan dengan Bidan dan bukan untuk telekonsultasi medis. Penyediaan informasi umum oleh Bidan bukan merupakan nasihat medis", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == true ? const SizedBox.shrink() :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Bidan akan menjawab tergantung availability Bidan itu sendiri", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == true ? const SizedBox.shrink() :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• PT Asuransi Life Indonesia hanya merupakan penyedia aplikasi dan tidak bertanggung jawab atas (i) Pembicaraan antara pengguna dan Bidan; dan (ii) penggunaan oleh pengguna atas setiap informasi yang terdapat dalam aplikasi ini.", style: TextStyle(fontSize: 10.sp,),),),


                                SizedBox(height: 10.h,),

                                Center(
                                  child: Text(widget.isNakes == true ? "Yang bisa dilakukan hal ini ya!" : "Tidak perlu bingung Moms, ini yang boleh dilakukan!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: EpregnancyColors.blueDark,
                                        fontSize: 14.sp,
                                        fontFamily: "bold"),
                                  ),
                                ),

                                widget.isNakes == true ? Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Menanyakan kondisi ataupun keluhan yang dihadapi ibu hamil secara umum.", style: TextStyle(fontSize: 10.sp,),),) :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Bertanya informasi dan tips-tips umum seputar periode kehamilan (hamil usia 10 minggu, ada tips apa, olahraga apa yang baik saat masa kehamilan, makanan yang sebaiknya dikonsumsi)", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == true ? Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Memberikan tips, edukasi dan informasi non medis seputar kehamilan sesuai dengan sharing yang disampaikan ibu hamil.", style: TextStyle(fontSize: 10.sp,),),) :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Memberi informasi kapan terkahir kali tindakan kehamilan ke Puskesmas / Rumah Sakit", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == true ? Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Dalam hal ibu hamil menyampaikan keluhan atau penyakit seputar kehamilan, Bidan memberikan saran agar melakukan pemeriksaan rutin di Puskesmas atau Rumah Sakit terdekat.", style: TextStyle(fontSize: 10.sp,),),) :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Bertanya Sehubungan dengan waktu Hari Perkiraan Lahir (HPL)", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == true ? Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Menanyakan kapan terkahir kali tindakan ke Puskesmas / Rumah Sakit, dan menyarankan untuk tindakan sesuai dengan jadwal kehamilan.", style: TextStyle(fontSize: 10.sp,),),) :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Bertanya sehubungan dengan persiapan apa saja yang harus dilakukan untuk proses persalinan", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == true ? Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Menanyakan apakah sudah mendapat vitamin, asam folat, supplement dari Puskesmas atau Rumah Sakit. Menanyakan apakah konsumsi vitamin dan supplement sudah seusai jadwal.", style: TextStyle(fontSize: 10.sp,),),) :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Kondisi apa saja yang mengharuskan ibu hamil menghubungi dokter", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == true ? const SizedBox.shrink() :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Memberi informasi kapan rencana kunjungan berikutnya ke Puskesmas / Rumah Sakit", style: TextStyle(fontSize: 10.sp,),),),
                                SizedBox(height: 4.h,),
                                Center(
                                  child: Text(widget.isNakes == true ? "Jangan lakukan hal ini!" :"Eitss.. Moms tidak boleh melakukan hal ini ya!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: EpregnancyColors.blueDark,
                                        fontSize: 14.sp,
                                        fontFamily: "bold"),
                                  ),
                                ),
                                widget.isNakes == true ? Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Menanyakan informasi pribadi, termasuk riwayat medis, yang tidak berhubungan dengan kehamilan", style: TextStyle(fontSize: 10.sp,),),) :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Menanyakan informasi di luar seputar kehamilan", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == true ? Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Memberikan rekomendasi pengobatan atau tindakan medis", style: TextStyle(fontSize: 10.sp,),),) :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Menanyakan keluhan yang dialami secara pribadi, dan menanyakan perawatan atau pengobatan yang perlu dilakukan.", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == true ? Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Memberikan informasi yang tidak sesuai dengan standar profesi bidan dan kode etik profesi bidan", style: TextStyle(fontSize: 10.sp,),),) :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Memberikan informasi pribadi, termasuk informasi medis, dan memberikan informasi yang tidak berhubungan dengan kehamilan", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == true ? Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Menawarkan produk, jasa dalam bentuk apapun", style: TextStyle(fontSize: 10.sp,),),) :
                                Padding(padding: EdgeInsets.only(top: 4.w), child: Text("• Meminta atau menanyakan rekomendasi pengobatan atau tindakan medis seperti:", style: TextStyle(fontSize: 10.sp,),),),
                                // widget.isNakes == true ? Padding(padding: EdgeInsets.only(top: 4.w), child: Text("", style: TextStyle(fontSize: 10.sp,),),) : Padding(padding: EdgeInsets.only(top: 4.w), child: Text("", style: TextStyle(fontSize: 10.sp,),),),
                                widget.isNakes == false || widget.isNakes == null ?  Padding(
                                  padding:  EdgeInsets.only(left: 10.w),
                                  child: Column(
                                    children:  [
                                      Text("- Vaksinasi seperti apa yang harus didapatkan selama masa kehamilan", style: TextStyle(fontSize: 10.sp,)),
                                      Text("- Tindakan medis apabila mengalami kram atau terdapat bercak darah", style: TextStyle(fontSize: 10.sp,)),
                                      Text("- Apa saja jenis vitamin yang perlu dikonsumsi saat hamil", style: TextStyle(fontSize: 10.sp,)),
                                    ],
                                  ),
                                ): const SizedBox.shrink(),
                                widget.isNakes == false || widget.isNakes == null ? Text("• Menawarkan produk, jasa dalam bentuk apapun", style: TextStyle(fontSize: 10.sp,),) : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),),
                        InkWell(
                          child: Padding(
                              padding:
                              EdgeInsets.fromLTRB(0.w, 24.w, 0.w, 0.w),
                              child: SizedBox(
                                height: 46.w,
                                width: MediaQuery.of(context).size.width,
                                child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(4.w)),
                                    color: EpregnancyColors.blueDark,
                                    disabledColor: Colors.grey,
                                    child: Text('Oke',
                                        style: TextStyle(
                                            fontFamily: "bold",
                                            fontSize: 13.sp,
                                            color: Colors.white)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              )),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              onWillPop: () => Future.value(false));
        },
      );
    });
    setState(() {
      chatMessageList = widget.chatMessageList;
      toName = widget.toName;
      toId = widget.toId;
      chatHasEnded = widget.isArchive ?? false;
      isPendingChat = widget.pendingChat ?? false;
      chatMessageList?.forEach((element) {
        if(element.mine == true){
          myImageProfile = element.profileImage;
          print('my image profile : $myImageProfile');
        }
      });
    });
    _initWebSocket();
    getHospitalFromLocal();
    getUserModel();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollDown();
    });
    super.initState();
  }


  @override
  void dispose() {
    _webSocket.close();
    super.dispose();
  }

  void _scrollDown() {
    print('scrol to bottom');
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  _initWebSocket() async {
    UserModel userModel = await AppSharedPreference.getUser();
    Future<WebSocket> futureWebSocket = WebSocket.connect('${F.appFlavor == Flavor.PRODUCTION ?  environment['websockets'] : devEnvironment['websockets']}${userModel.id}');
    // Future<WebSocket> futureWebSocket = WebSocket.connect('${environment['websockets']}${userModel.id}');
    // print('ws url : ${environment['websockets']}${userModel.id}');
    futureWebSocket.then((WebSocket ws) {
      _webSocket = ws;
      print('websocket ready state: ' + _webSocket.readyState.toString());

      _webSocket.listen((d) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        );

        Map<String, dynamic> socketResponse = jsonDecode(d);
        print('action websocket : ${socketResponse['action']}');
        log('websocket payload mentah : $d');

        print('ispending chat : $isPendingChat');
        if(socketResponse['action'] == StringConstant.updateLatestChat){
          String fromIdPayload = socketResponse['data']['from_id'];
          String _toId = socketResponse['data']['to_id'];
          if(fromIdPayload == toId && _toId == widget.fromId){
            setState(() {
              chatMessageList?.add(
                  ChatMessageEntity(
                    name: socketResponse['data']['id'],
                    message: socketResponse['data']['message'],
                    dateTime: socketResponse['data']['created_date'],
                    mine: socketResponse['data']['from_id'] == widget.fromId ? true : false,
                    imageUrl: socketResponse['data']['image_url'],
                    profileImage: socketResponse['data']['from_id'] == widget.fromId ? socketResponse['data']['to']['image_url'] : socketResponse['data']['from']['image_url'],
                  )
              );
              isPendingChat = false;
              _scrollDown();
              _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
            });
          }
        } else if (isPendingChat == true && socketResponse['action'] == 'new-chat') {
          setState(() {
            String? name = socketResponse['data']['to']['name'];
            name =  decryptName(name!);
            isPendingChat = false;
            toId = socketResponse['data']['to_id'];
            // toName = name;
          });
          Toast.show("$toName Telah Merespon Diskusi Anda, Silahkan Jelaskan Kondisi Anda Lebih Lanjut", gravity: Toast.center);
        } else if (socketResponse['action'] == 'end-chat') {
          Toast.show("$toName Diskusi anda telah selesai, Terima Kasih!", gravity: Toast.center);
          // Navigator.pop(context, "end");
          setState(() {
            chatHasEnded = true;
          });
        }
        // print('ispending chat : $isPendingChat');
        // print('toId : $toId');
        // print('toName : $toName');
      }, onError: (e) {
        print("error websocket: ${e.toString()}");
        print(e);
      }, onDone: () => print("done"));
    });
  }

  String? decryptName(String encryptedName)  {
    String? name = encryptedName;
    aesDecryptor(encryptedName).then((value) {
      // name = value;
      setState(() {
        toName = value;
      });
      print("name in then: $toName");
    });
    print("name : $toName");
    return name;
  }


  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context, 'back');
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
          // resizeToAvoidBottomInset: true,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: BtnBackIosStyle(),
            title: Row(
              children: [
                Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: widget.toImageUrl == null ?  Image.asset('assets/dummies/dummy_avatar.png') : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                      child: Image.network(widget.toImageUrl!)),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  toName ?? '',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )
              ],
            ),
            actions: [
              chatHasEnded || isPendingChat == true ? Container(): Container(
                margin: EdgeInsets.only(right: 10, top: 10.h, bottom: 10.h),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(EpregnancyColors.white),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: EpregnancyColors.blueDark)))),
                    onPressed: () {
                      basicLoadinDialog(context);
                      if(widget.isNakes!){
                        Injector.resolve<ChatBloc>().add(EndChatEvent(toId));
                        // Injector.resolve<ChatBloc>().add(FetchChatOngoingEvent());
                      } else {
                        Injector.resolve<ChatBloc>().add(EndChatEvent(toId));
                        // Navigator.pop(context, 'endchat');
                      }

                      Future.delayed(Duration(seconds: 1), (){
                        Navigator.pop(context);
                      });
                    },
                    child: Center(
                      child: Text(
                        "Akhiri sesi",
                        style: TextStyle(
                            color: EpregnancyColors.blueDark, fontSize: 16),
                      ),
                    )),
              )
              // IconButton(
              //     onPressed: () {
              //       archiveChatRoom("personUid");
              //     },
              //     icon: Icon(
              //       Icons.more_vert,
              //       color: Colors.black,
              //     ))

            ],
          ),
          body: BlocListener<ChatBloc, ChatState>(
            listener: (context, state) {
              print('state chat : ${state.type}');
              if(state.type == 'end-chat-success'){
                setState(() {
                  chatHasEnded = true;
                });
                // if(widget.isNakes!){
                //   // Navigator.of(context).pushReplacementNamed(
                //   //     RouteName.dashboardNakesPage,
                //   //     arguments: {'name': userModel?.name, 'hospital_id': _hospitalModel?.id}
                //   // );
                //   Navigator.pop(context, "endchat");
                // } else {
                //   Navigator.pop(context, "endchat");
                // }
              } else if (state.type == 'end-chat-failed'){
                // Navigator.pop(context);
                Toast.show('Terjadi Kesalahan Saat Mengakhiri sesi');
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: chatMessageList?.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // widget for sender
                        if (chatMessageList![index].mine!) {
                          if(chatMessageList![index].imagePath != null || chatMessageList![index].imageUrl != null){
                            if (chatMessageList![index].imagePath != null) {
                              return Align(
                                  alignment: (chatMessageList![index].mine!
                                      ? Alignment.topRight
                                      : Alignment.topLeft),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(File(chatMessageList![index].imagePath!), height: 150.h, width: 150.w,)));
                            } else {
                              return Align(
                                  alignment: (chatMessageList![index].mine!
                                      ? Alignment.topRight
                                      : Alignment.topLeft),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(chatMessageList![index].imageUrl!, height: 150.h, width: 150.w,)));
                            }
                          } else {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.only(
                                          left: 14, right: 14, top: 10, bottom: 10),
                                      child: Align(
                                        alignment: (chatMessageList![index].mine!
                                            ? Alignment.topRight
                                            : Alignment.topLeft),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                  bottomLeft: chatMessageList![index].mine! != true
                                                      ? Radius.circular(0)
                                                      : Radius.circular(20),
                                                  bottomRight: chatMessageList![index].mine! != true
                                                      ? Radius.circular(20)
                                                      : Radius.circular(0)),
                                              color: (chatMessageList![index].mine! != true
                                                  ? EpregnancyColors.greyChatBubble
                                                  : EpregnancyColors.primer),
                                            ),
                                            padding: EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  chatMessageList![index].message ?? "",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: chatMessageList![index].mine! != true
                                                          ? Colors.black
                                                          : Colors.white,
                                                      overflow: TextOverflow.visible),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Text(DateFormatter.hourOnly.format(DateTime.parse(chatMessageList![index].dateTime!)),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: chatMessageList![index].mine! != true
                                                          ? Colors.grey
                                                          : Colors.white,
                                                    ),
                                                    textAlign: TextAlign.end,),
                                                )
                                              ],
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                        margin: EdgeInsets.only(top: 20.h),
                                        height: 20.h,
                                        width: 20.w,
                                        decoration: BoxDecoration(shape: BoxShape.circle),
                                        child: chatMessageList![index].profileImage != null ? CircleAvatar(
                                          backgroundImage: NetworkImage(chatMessageList![index].profileImage!, scale: 1.0),
                                        ) : Image.asset('assets/dummies/dummy_avatar.png')
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else {
                          // widget for other
                          if(chatMessageList![index].imagePath != null || chatMessageList![index].imageUrl != null){
                            if (chatMessageList![index].imagePath != null) {
                              return Align(
                                  alignment: (chatMessageList![index].mine!
                                      ? Alignment.topRight
                                      : Alignment.topLeft),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(File(chatMessageList![index].imagePath!), height: 150.h, width: 150.w,)));
                            } else {
                              return Align(
                                  alignment: (chatMessageList![index].mine!
                                      ? Alignment.topRight
                                      : Alignment.topLeft),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(chatMessageList![index].profileImage!, height: 150.h, width: 150.w,)));
                            }
                          } else {
                            return Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 20.h),
                                    height: 20.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                    child: chatMessageList![index].profileImage != null ? CircleAvatar(
                                      backgroundImage: NetworkImage(widget.toImageUrl!, scale: 1.0),
                                    ) : Image.asset('assets/dummies/dummy_avatar.png')
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.only(
                                        left: 14, right: 14, top: 10, bottom: 10),
                                    child: Align(
                                      alignment: (chatMessageList![index].mine!
                                          ? Alignment.topRight
                                          : Alignment.topLeft),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: chatMessageList![index].mine! != true
                                                    ? Radius.circular(0)
                                                    : Radius.circular(20),
                                                bottomRight: chatMessageList![index].mine! != true
                                                    ? Radius.circular(20)
                                                    : Radius.circular(0)),
                                            color: (chatMessageList![index].mine! != true
                                                ? EpregnancyColors.greyChatBubble
                                                : EpregnancyColors.primer),
                                          ),
                                          padding: EdgeInsets.all(16),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                chatMessageList![index].message!,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: chatMessageList![index].mine! != true
                                                        ? Colors.black
                                                        : Colors.white,
                                                    overflow: TextOverflow.visible),
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(DateFormatter.hourOnly.format(DateTime.parse(chatMessageList![index].dateTime!)),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: chatMessageList![index].mine! != true
                                                        ? Colors.grey
                                                        : Colors.white,
                                                  ),
                                                  textAlign: TextAlign.end,),
                                              )
                                            ],
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                        color: Colors.white,
                        child: chatHasEnded ? Center(
                          child: Text("Diskusi Telah Berakhir", style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold
                          ),)
                        ) : Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 3.h),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isOpenBottomSheet = !isOpenBottomSheet;
                                      if(isOpenBottomSheet){
                                        keyboardFocusNode.unfocus();
                                      } else {
                                        keyboardFocusNode.requestFocus();
                                      }
                                    });
                                  },
                                  icon: !isOpenBottomSheet?  FaIcon(FontAwesomeIcons.faceSmile) : FaIcon(FontAwesomeIcons.keyboard)),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _messageEditingController,
                                textInputAction: TextInputAction.send,
                                onFieldSubmitted: (val){
                                  if(val.isNotEmpty){
                                    if (isPendingChat == false) {
                                      print('to_id: $toId');
                                      setState(() {
                                        chatMessageList?.add(
                                            ChatMessageEntity(
                                                mine: true,
                                                profileImage: myImageProfile,
                                                dateTime: DateTime.now().toString(),
                                                message: val,
                                                name: 'sender'
                                            )
                                        );
                                        _messageEditingController.clear();
                                        _scrollDown();
                                        ChatSendRequest _chatSendRequest = ChatSendRequest(
                                            fromId: widget.fromId, toId: toId, message: val);

                                        Injector.resolve<ChatBloc>().add(SendChatEvent(_chatSendRequest));
                                      });
                                    } else {
                                      Toast.show('Mohon tunggu respon Nakes sebelum membuat chat baru', duration: 3, gravity: 1);
                                    }
                                  }
                                },
                                focusNode: keyboardFocusNode,
                                onTap: (){
                                  if(isOpenBottomSheet){
                                    setState(() {
                                      isOpenBottomSheet = false;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 5.h),
                                    border: InputBorder.none,
                                    hintText: 'Tulis pesan...',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                if(isPendingChat == false) {
                                  _showPicker(context);
                                } else {
                                  Toast.show('Mohon tunggu respon Nakes sebelum membuat chat baru', duration: 3, gravity: 1);
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 5.h),
                                child:SvgPicture.asset('assets/icAttachment.svg')
                                ,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                if(_messageEditingController.text.isNotEmpty){
                                  if (isPendingChat == false) {
                                    print('to_id: $toId');
                                    setState(() {
                                      chatMessageList?.add(
                                          ChatMessageEntity(
                                              mine: true,
                                              profileImage: myImageProfile,
                                              dateTime: DateTime.now().toString(),
                                              message: _messageEditingController.text,
                                              name: 'sender'
                                          )
                                      );
                                      _scrollDown();
                                      ChatSendRequest _chatSendRequest = ChatSendRequest(
                                          fromId: widget.fromId, toId: toId, message: _messageEditingController.text);

                                      Injector.resolve<ChatBloc>().add(SendChatEvent(_chatSendRequest));
                                      _messageEditingController.clear();
                                    });
                                  } else {
                                    Toast.show('Mohon tunggu respon Nakes sebelum membuat chat baru', duration: 3, gravity: 1);
                                  }
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 5.h, right: 10.w, left: 10.w),
                                child:Icon(Icons.send, color: EpregnancyColors.primer,)
                                ,
                              ),
                            )
                          ],
                        ),
                      ),
                      if (isOpenBottomSheet)
                        FadeInUp(
                            duration: Duration(milliseconds: 500),
                            child: Container(
                              padding: MediaQuery.of(context).viewInsets,
                              height: 250.h,
                              child: EmojiPicker(
                                onEmojiSelected: (category, emoji) {
                                  // Do something when emoji is tapped
                                  String? _currentText = _messageEditingController.text;
                                  _messageEditingController.text = _currentText + emoji.emoji;
                                },
                                // onBackspacePressed: () {
                                //   if (_messageEditingController.text != null && _messageEditingController.text.length > 0) {
                                //     _messageEditingController.text = _messageEditingController.text.substring(0, _messageEditingController.text.length • 1);
                                //   }
                                // },
                                config: Config(
                                    columns: 7,
                                    emojiSizeMax: 22 * (Platform.isIOS ? 1.30 : 1.0),
                                    // Issue: https://github.com/flutter/flutter/issues/28894
                                    verticalSpacing: 0,
                                    horizontalSpacing: 0,
                                    initCategory: Category.RECENT,
                                    bgColor: Color(0xFFF2F2F2),
                                    indicatorColor: Colors.blue,
                                    iconColor: Colors.grey,
                                    iconColorSelected: Colors.blue,
                                    progressIndicatorColor: Colors.blue,
                                    backspaceColor: Colors.blue,
                                    skinToneDialogBgColor: Colors.white,
                                    skinToneIndicatorColor: Colors.grey,
                                    enableSkinTones: true,
                                    showRecentsTab: true,
                                    recentsLimit: 28,
                                    noRecentsText: "No Recents",
                                    noRecentsStyle:
                                    const TextStyle(fontSize: 20, color: Colors.black26),
                                    tabIndicatorAnimDuration: kTabScrollDuration,
                                    categoryIcons: const CategoryIcons(),
                                    buttonMode: ButtonMode.MATERIAL),
                              ),
                            ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  void showEmojiBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext subContext) {
          return Container(
            padding: MediaQuery.of(context).viewInsets,
            height: 180.h,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {
                // Do something when emoji is tapped
                print('selected emoji : ${emoji.emoji}');
              },
              onBackspacePressed: () {
                // Backspace-Button tapped logic
                // Remove this line to also remove the button in the UI
              },
              config: Config(
                  columns: 7,
                  emojiSizeMax: 20 * (Platform.isIOS ? 1.30 : 1.0),
                  // Issue: https://github.com/flutter/flutter/issues/28894
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  initCategory: Category.RECENT,
                  bgColor: Color(0xFFF2F2F2),
                  indicatorColor: Colors.blue,
                  iconColor: Colors.grey,
                  iconColorSelected: Colors.blue,
                  progressIndicatorColor: Colors.blue,
                  backspaceColor: Colors.blue,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  showRecentsTab: true,
                  recentsLimit: 28,
                  noRecentsText: "No Recents",
                  noRecentsStyle:
                      const TextStyle(fontSize: 20, color: Colors.black26),
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: const CategoryIcons(),
                  buttonMode: ButtonMode.MATERIAL),
            ),
          );
        });
  }
}
