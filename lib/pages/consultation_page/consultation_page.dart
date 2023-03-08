import 'dart:io';

import 'package:PregnancyApp/data/model/room_model/room_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/chat_page/dashboard.dart';
import 'package:PregnancyApp/pages/consultation_page/archive_page/archive_consultation_patient_page.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/home_page/tab_bar_event_page.dart';
import 'package:PregnancyApp/pages/pin_checkin/pin_checkin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:toast/toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/firebase/event/event_user.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/model/hospital_model/hospital_model.dart';
import '../../data/model/user_model_api/user_model.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';
import '../chat_page/chat_patient_page/initial_consultation_load_page.dart';
import '../chat_page/chat_room.dart';
import '../chat_page/event/event_chat_room.dart';
import '../home_page/list_event.dart';
import 'bloc/consultation_page_bloc.dart';
import 'list_forum.dart';
import 'package:tap_to_dismiss_keyboard/tap_to_dismiss_keyboard.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({Key? key, this.role}) : super(key: key);
  final String? role;

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  UserModelFirebase user = UserModelFirebase.empty();
  UserRolesModelFirebase rolesModel = UserRolesModelFirebase.empty();
  String? imagePath = "";
  final _controller = TextEditingController();
  final PublishSubject<bool> _psLikesCount = PublishSubject();
  HospitalModel? _hospitalModel;
  String? _userId;

  void onRefresh() async {
    Injector.resolve<ConsultationPageBloc>()
        .add(const ConsultationFetchEvent());
    Injector.resolve<ConsultationPageBloc>()
        .add(const ConsultationDisposeEvent());
    setState(() {
      imagePath = "";
      clearText();
    });
  }

  void clearText() {
    _controller.clear();
  }

  void getHospitalFromLocal() async {
    HospitalModel _hospital = await AppSharedPreference.getHospital();
    if (_hospital != null && mounted) {
      setState(() {
        _hospitalModel = _hospital;
      });
    }
  }

  void getUserId() async {
    UserModel _userModel = await AppSharedPreference.getUser();
    if (_userModel != null && mounted) {
      setState(() {
        _userId = _userModel.id;
      });
    }
  }

  @override
  void initState() {
    onRefresh();
    getHospitalFromLocal();
    getUserId();
    super.initState();
  }

  void dispose() {
    _psLikesCount.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapToDissmissKeyboard(
      child: Scaffold(
        // todo dismiss keyboard
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade200,
        body: BlocListener<ConsultationPageBloc, ConsultationPageState>(
          listener: (context, state) async {
            print('state consultation : ${state.type}');
            if (state.submitStatus == FormzStatus.submissionFailure) {
              SnackBar snackBar = SnackBar(
                  content: Text("Gagal posting ${state.errorMessage}"), backgroundColor: Colors.red);
              Scaffold.of(context).showSnackBar(snackBar);
            } else if (state.submitStatus == FormzStatus.submissionSuccess) {
              if (state.type == 'update' || state.type == 'delete-post-success') {
                const snackBar = SnackBar(
                    content: Text("Berhasil"),
                    backgroundColor: EpregnancyColors.primer);
                Scaffold.of(context).showSnackBar(snackBar);
                await Future.delayed(const Duration(seconds: 1));
                onRefresh();
                FocusScope.of(context).requestFocus(FocusNode());
              }
            }
          },
          child: BlocBuilder<ConsultationPageBloc, ConsultationPageState>(
            builder: (context, state) {
              var _height = MediaQuery.of(context).size.height;
              print('width : $_height');
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxScrolled) {
                  return <Widget>[
                    SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: true,
                        snap: false,
                        floating: false,
                        backgroundColor: Colors.white,
                        expandedHeight: _height <= 820 && _height >= 680  ? MediaQuery.of(context).size.height * 0.35 : MediaQuery.of(context).size.height * 0.29,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          collapseMode: CollapseMode.pin,
                          title: Text(innerBoxScrolled ? "Diskusi" : "", style: TextStyle(color: Colors.black),),
                          background: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Diskusi",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      InkWell(
                                          onTap: () {
                                            // todo manage routes
                                            Navigator.push(context, MaterialPageRoute
                                              (builder: (context) => ArchiveConsultationPatientPage(userId: _userId!,)));
                                          },
                                          child: SvgPicture.asset(
                                              'assets/icArchive.svg'))
                                    ],
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(
                                    bottom: 10, right: 20, left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: EpregnancyColors.primer,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(15.0),
                                        ),
                                        child: FlatButton(
                                          minWidth: MediaQuery.of(context)
                                              .size
                                              .width /
                                              4,
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              bottom: 20,
                                              right: 10,
                                              left: 10),
                                          onPressed: () async {
                                            // new method for hubungi profesional
                                            if(_hospitalModel?.name == ''){
                                              Navigator.pushNamed(context, RouteName.locationSelect).then((value) {
                                                if(value != null){
                                                  setState(() {
                                                    _hospitalModel = value as HospitalModel?;
                                                  });
                                                }
                                              });
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          InitialConsultationLoadPage(userId: _userId??'',)));
                                            }
                                          },
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Image.asset(
                                                    'assets/icon-hubungi-profesional.png',
                                                    height: 25),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                widget.role == "PATIENT"
                                                    ? Text(
                                                  "Tanya Bidan",
                                                  style: TextStyle(
                                                      fontSize: 12),
                                                )
                                                    : Text(
                                                  "Cek Diskusi",
                                                  style: TextStyle(
                                                      fontSize: 12),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // tanya ke komunitas wording
                              // Padding(
                              //   padding: EdgeInsets.only(left: 16.w, top: 20.h),
                              //     child: Text('Tanya ke komunitas untuk dapatkan 200 Poin',style: TextStyle(color: EpregnancyColors.primer, fontWeight: FontWeight.w700, fontSize: 12.sp),)),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 20,
                                      bottom: 20,
                                      left: 20,
                                      right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      state.userModel?.imageUrl != null?  Container(
                                        // width: 62,

                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(40),
                                          child: FadeInImage(
                                            placeholder: const AssetImage(
                                                'assets/ic_no_photo.png'),
                                            image: NetworkImage(state.userModel?.imageUrl??
                                                ""),
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ):Container(
                                        // width: 62,

                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(40),
                                          child: const FadeInImage(
                                            placeholder: AssetImage(
                                                'assets/ic_no_photo.png'),
                                            image: AssetImage(
                                                'assets/ic_no_photo.png'),
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 260,
                                            margin: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                imagePath != ""
                                                    ? InkWell(
                                                  onLongPress: () {
                                                    _showPickerDelete(
                                                        context);
                                                  },
                                                  child: Container(
                                                      margin:
                                                      const EdgeInsets
                                                          .only(
                                                          left: 0,
                                                          right: 0,
                                                          bottom:
                                                          10,
                                                          top: 10),
                                                      child: Image.file(
                                                        File(
                                                            imagePath ??
                                                                ""),
                                                        height: 70,
                                                      )),
                                                )
                                                    : Container(),
                                                TextField(
                                                  controller: _controller,
                                                  maxLines: 5,
                                                  autofocus: false,
                                                  minLines: 1,
                                                  decoration:
                                                  const InputDecoration(
                                                    // prefixIcon: Image(image: image),
                                                    hintText:
                                                    'Tanya ke komunitas...',
                                                    border: InputBorder.none,
                                                    isDense: true,
                                                  ),
                                                  textInputAction: TextInputAction.send,
                                                  onSubmitted: (val){
                                                    Injector.resolve<
                                                        ConsultationPageBloc>()
                                                        .add(
                                                        ConsultationSubmittedEvent());
                                                  },
                                                  onChanged: (value) {
                                                    Injector.resolve<
                                                        ConsultationPageBloc>()
                                                        .add(
                                                        ConsultationDescriptionChanged(
                                                            value));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Container(
                                          //   width: 100,
                                          //   height: 30,
                                          //   decoration: BoxDecoration(
                                          //       borderRadius:
                                          //           BorderRadius.circular(
                                          //               10.0),
                                          //       color:
                                          //           EpregnancyColors.primer),
                                          //   child: FlatButton(
                                          //     minWidth: MediaQuery.of(context)
                                          //             .size
                                          //             .width /
                                          //         5,
                                          //     onPressed: () {
                                          //       Injector.resolve<
                                          //               ConsultationPageBloc>()
                                          //           .add(
                                          //               ConsultationSubmittedEvent());
                                          //     },
                                          //     child: Container(
                                          //       child: Text(
                                          //         "Kirim",
                                          //         style: TextStyle(
                                          //             color: Colors.white),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _showPicker(context);
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(),
                                            child: Image.asset('assets/icPictureColor.png')),
                                      ),
                                    ],
                                  )),
                              Divider(),
                            ],
                          ),
                        )
                    ),

                  ];
                }, body: Container(
                  child: state.listConsultation?.length == 0 ? const Center(
                    child: CircularProgressIndicator(),
                  ): ListForumWidget(
                    tipeAcara: 'Acara umum',
                    listConsul: state.listConsultation?.reversed.toList() ?? [],
                    userId: _userId,
                    psLikesCount: _psLikesCount,
                  )),

              );
            },
          ),
        ),
      ),
    );
  }


  Widget oldForumPage(){
    return BlocBuilder<ConsultationPageBloc, ConsultationPageState>(
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              children: [
                Container(
                    padding: EdgeInsets.only(bottom: 0, top: 20),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top: 40,
                                    left: 20,
                                    right: 20,
                                    bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Diskusi",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    InkWell(
                                        onTap: () {
                                          // todo manage routes
                                          Navigator.push(context, MaterialPageRoute
                                            (builder: (context) => ArchiveConsultationPatientPage(userId: _userId!,)));
                                        },
                                        child: SvgPicture.asset(
                                            'assets/icArchive.svg'))
                                  ],
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                  bottom: 10, right: 20, left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: EpregnancyColors.primer,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(15.0),
                                      ),
                                      child: FlatButton(
                                        minWidth: MediaQuery.of(context)
                                            .size
                                            .width /
                                            4,
                                        padding: EdgeInsets.only(
                                            top: 20,
                                            bottom: 20,
                                            right: 10,
                                            left: 10),
                                        onPressed: () async {
                                          // new method for hubungi profesional
                                          if(_hospitalModel?.name == ''){
                                            Navigator.pushNamed(context, RouteName.locationSelect).then((value) {
                                              if(value != null){
                                                setState(() {
                                                  _hospitalModel = value as HospitalModel?;
                                                });
                                              }
                                            });
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        InitialConsultationLoadPage(userId: _userId??'',)));
                                          }
                                        },
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Image.asset(
                                                  'assets/icon-hubungi-profesional.png',
                                                  height: 25),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              widget.role == "PATIENT"
                                                  ? Text(
                                                "Tanya Bidan",
                                                style: TextStyle(
                                                    fontSize: 12),
                                              )
                                                  : Text(
                                                "Cek Diskusi",
                                                style: TextStyle(
                                                    fontSize: 12),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // tanya ke komunitas wording
                            // Padding(
                            //   padding: EdgeInsets.only(left: 16.w, top: 20.h),
                            //     child: Text('Tanya ke komunitas untuk dapatkan 200 Poin',style: TextStyle(color: EpregnancyColors.primer, fontWeight: FontWeight.w700, fontSize: 12.sp),)),
                            Container(
                                margin: EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                    left: 20,
                                    right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    state.userModel?.imageUrl != null?  Container(
                                      // width: 62,

                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(40),
                                        child: FadeInImage(
                                          placeholder: const AssetImage(
                                              'assets/ic_no_photo.png'),
                                          image: NetworkImage(state.userModel?.imageUrl??
                                              ""),
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ):Container(
                                      // width: 62,

                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(40),
                                        child: const FadeInImage(
                                          placeholder: AssetImage(
                                              'assets/ic_no_photo.png'),
                                          image: AssetImage(
                                              'assets/ic_no_photo.png'),
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 260,
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                            BorderRadius.circular(12),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              imagePath != ""
                                                  ? InkWell(
                                                onLongPress: () {
                                                  _showPickerDelete(
                                                      context);
                                                },
                                                child: Container(
                                                    margin:
                                                    const EdgeInsets
                                                        .only(
                                                        left: 0,
                                                        right: 0,
                                                        bottom:
                                                        10,
                                                        top: 10),
                                                    child: Image.file(
                                                      File(
                                                          imagePath ??
                                                              ""),
                                                      height: 70,
                                                    )),
                                              )
                                                  : Container(),
                                              TextField(
                                                controller: _controller,
                                                maxLines: 5,
                                                minLines: 1,
                                                decoration:
                                                const InputDecoration(
                                                  // prefixIcon: Image(image: image),
                                                  hintText:
                                                  'Tanya ke komunitas...',
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                ),
                                                textInputAction: TextInputAction.send,
                                                onSubmitted: (val){
                                                  Injector.resolve<
                                                      ConsultationPageBloc>()
                                                      .add(
                                                      ConsultationSubmittedEvent());
                                                },
                                                onChanged: (value) {
                                                  Injector.resolve<
                                                      ConsultationPageBloc>()
                                                      .add(
                                                      ConsultationDescriptionChanged(
                                                          value));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Container(
                                        //   width: 100,
                                        //   height: 30,
                                        //   decoration: BoxDecoration(
                                        //       borderRadius:
                                        //           BorderRadius.circular(
                                        //               10.0),
                                        //       color:
                                        //           EpregnancyColors.primer),
                                        //   child: FlatButton(
                                        //     minWidth: MediaQuery.of(context)
                                        //             .size
                                        //             .width /
                                        //         5,
                                        //     onPressed: () {
                                        //       Injector.resolve<
                                        //               ConsultationPageBloc>()
                                        //           .add(
                                        //               ConsultationSubmittedEvent());
                                        //     },
                                        //     child: Container(
                                        //       child: Text(
                                        //         "Kirim",
                                        //         style: TextStyle(
                                        //             color: Colors.white),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _showPicker(context);
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(),
                                          child: Image.asset('assets/icPictureColor.png')),
                                    ),
                                  ],
                                )),
                            Divider(),
                          ],
                        ),
                      ],
                    )),
                Expanded(
                    child: state.listConsultation?.length == 0 ? const Center(
                      child: CircularProgressIndicator(),
                    ): ListForumWidget(
                      tipeAcara: 'Acara umum',
                      userId: _userId,
                      listConsul:
                      state.listConsultation?.reversed.toList() ?? [],
                      psLikesCount: _psLikesCount,
                    )),
              ],
            ),
            _Loading()
          ],
        );
      },
    );
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
        Injector.resolve<ConsultationPageBloc>()
            .add(ConsultationImageChanged(croppedFile.path));

        Injector.resolve<
            ConsultationPageBloc>()
            .add(
            ConsultationDescriptionChanged(
                " "));
        setState(() {
          imagePath = croppedFile.path;
        });

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
        Injector.resolve<ConsultationPageBloc>()
            .add(ConsultationImageChanged(croppedFile.path));

        Injector.resolve<
            ConsultationPageBloc>()
            .add(
            ConsultationDescriptionChanged(
                " "));
        setState(() {
          imagePath = croppedFile.path;
        });
      }
    }
  }

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
                        Navigator.pop(context);
                        pickAndCropImageGallery();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () async {
                      Navigator.pop(context);
                      pickAndCropImageCamera();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showPickerDelete(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: [
                  ListTile(
                      leading: const Icon(Icons.delete),
                      title: const Text('Delete'),
                      onTap: () async {
                        Navigator.pop(context);
                        setState(() {
                          imagePath = "";
                        });
                        Injector.resolve<ConsultationPageBloc>()
                            .add(const ConsultationImageChanged(""));
                      }),
                ],
              ),
            ),
          );
        });
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocBuilder<ConsultationPageBloc, ConsultationPageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'update') {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = FlatButton(
    child: Text("Batal"),
    onPressed: () => Navigator.of(context).pop(false),
  );
  Widget continueButton = FlatButton(
    child: Text("Lanjutkan"),
    onPressed: () {
      Navigator.of(context).pop(true);
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Anda ingin keluar dari halaman ini?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
