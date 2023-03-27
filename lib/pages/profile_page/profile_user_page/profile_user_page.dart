import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/common/widget/primary_btn.dart';
import 'package:PregnancyApp/pages/profile_page/profile_user_page/change_profile_page.dart';
import 'package:PregnancyApp/pages/profile_page/profile_user_page/request_password.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../../common/network/http/http_client.dart';
import '../../../data/firebase/g_authentication.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../flavors.dart';
import '../../../utils/function_utils.dart';
import '../../survey_page/bloc/survey_page_bloc.dart';
import '../bloc/profile_page_bloc.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  @override
  void initState() {
    onRefresh();
    super.initState();
  }

  void onRefresh() async {
    Injector.resolve<ProfilePageBloc>().add(const InitialProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfilePageBloc, ProfilePageState>(
      listener: (context, state) async {
        if (state.submitStatus == FormzStatus.submissionFailure) {
          const snackBar = SnackBar(
              content: Text("Gagal posting"), backgroundColor: Colors.red);
          Scaffold.of(context).showSnackBar(snackBar);
        } else if (state.submitStatus == FormzStatus.submissionSuccess) {
          if (state.type == 'changePhoto') {
            const snackBar = SnackBar(
                content: Text("Berhasil"),
                backgroundColor: EpregnancyColors.primer);
            Scaffold.of(context).showSnackBar(snackBar);
            await Future.delayed(const Duration(seconds: 1));
          }
        }
      },
      child: BlocBuilder<ProfilePageBloc, ProfilePageState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: EpregnancyColors.profileBg,
            // appBar: AppBar(
            //   // leading: const BtnBackIosStyle(),
            //   elevation: 0,
            //   backgroundColor: Colors.white,
            //   title: Text(
            //    state.user?.name??"",
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontWeight: FontWeight.w700,
            //         fontSize: 24.sp),
            //   ),
            //   actions: [
            //     InkWell(
            //       onTap: () {
            //         _showPicker(context);
            //       },
            //       child: Container(
            //         height: 40.h,
            //         width: 40.w,
            //         margin: EdgeInsets.only(right: 10.w, top: 10.w),
            //         decoration: const BoxDecoration(shape: BoxShape.circle),
            //         child:   state.user?.imageUrl != null?  Container(
            //           // width: 62,
            //
            //           child: ClipRRect(
            //             borderRadius:
            //             BorderRadius.circular(40),
            //             child: FadeInImage(
            //               placeholder: const AssetImage(
            //                   'assets/ic_no_photo.png'),
            //               image: NetworkImage(state.user?.imageUrl??
            //                   ""),
            //               width: 40,
            //               height: 40,
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ):Container(
            //           // width: 62,
            //
            //           child: ClipRRect(
            //             borderRadius:
            //             BorderRadius.circular(40),
            //             child: const FadeInImage(
            //               placeholder: AssetImage(
            //                   'assets/ic_no_photo.png'),
            //               image: AssetImage(
            //                   'assets/ic_no_photo.png'),
            //               width: 40,
            //               height: 40,
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  // color: Colors.white,
                  padding: EdgeInsets.only(top: 20.h, left: 0.w, right: 0.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 14.h),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // _showPicker(context);
                                  },
                                  child: Container(
                                    height: 80.h,
                                    width: 80.w,
                                    margin: EdgeInsets.only(
                                        right: 10.w, top: 10.w, bottom: 10.h),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: state.user?.imageUrl != null
                                        ? Container(
                                            // width: 62,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: FadeInImage(
                                                placeholder: const AssetImage(
                                                    'assets/ic_no_photo_blue.png'),
                                                image: NetworkImage(
                                                    state.user?.imageUrl ?? ""),
                                                width: 40,
                                                height: 40,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            // width: 62,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: const FadeInImage(
                                                placeholder: AssetImage(
                                                    'assets/ic_no_photo_blue.png'),
                                                image: AssetImage(
                                                    'assets/ic_no_photo_blue.png'),
                                                width: 40,
                                                height: 40,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    margin: EdgeInsets.only(bottom: 18.h),
                                    child: BtnPrimary(
                                        text: "Ubah Data Diri",
                                        function: () async {
                                          // print("user name : ${state.user?.name}");
                                          // _showPicker(context);
                                          var _user = await AppSharedPreference.getUser();
                                          DateTime cdt = DateTime.now();
                                          DateTime lastBiodataView = DateTime.parse(_user.lastBiodataView ?? DateTime.now().toString());
                                          DateTime lastBiodateViewDateTime = lastBiodataView.add(Duration(hours: F.appFlavor == Flavor.PRODUCTION ?  0 : -1));
                                          Duration diff = cdt.difference(lastBiodateViewDateTime);
                                          print("last biodata view : $lastBiodateViewDateTime");
                                          print("date time now : $cdt");
                                          print("diff in minutes : ${diff.inMinutes}");
                                          if(diff.inMinutes >= 15){
                                            Navigator.of(context).push( MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return const  RequestPasswordPage();
                                                },
                                                fullscreenDialog: true
                                            ));
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const ChangeProfilePage()));
                                          }
                                        }))
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            padding: EdgeInsets.only(
                                left: 20, right: 0, top: 20, bottom: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade200, width: 1.5.h),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            // color: Colors.greenAccent,
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(left: 50, right: 50),
                                      child: SvgPicture.asset(
                                        'assets/ic_invitation.svg',
                                        // height: 200,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200,
                                          margin: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: const Text(
                                            "Undang teman anda\nuntuk mendapatkan poin !",
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: TextStyle(
                                                // letterSpacing: 1.0,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10, top: 5.h),
                                          child: Text(
                                            "Bagikan kode dengan teman Anda dan dapatkan 100 poin",
                                            textAlign: TextAlign.left,
                                            maxLines: 5,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 20, top: 10.h, bottom: 10.h),
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.w),
                                      color: EpregnancyColors.primerSoft),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            state.user?.referralCode ?? "",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    EpregnancyColors.blueDark),
                                            maxLines: 3,
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              FlutterClipboard.copy(state
                                                          .user?.referralCode ??
                                                      "")
                                                  .then((value) {
                                                const snackBar = SnackBar(
                                                    content:
                                                        Text("Berhasil dicopy"),
                                                    backgroundColor:
                                                        EpregnancyColors
                                                            .primer);
                                                Scaffold.of(context)
                                                    .showSnackBar(snackBar);
                                              });
                                            },
                                            child: SvgPicture.asset(
                                                "assets/icCopy.svg"))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 8.h),
                          child: Text(
                            "Pengaturan Akun",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  //todo change password
                                  // Navigator.of(context)
                                  //     .pushNamed(RouteName.surveyPageBaby, arguments: true);

                                  Navigator.of(context)
                                      .pushNamed(RouteName.changePasswordPage);
                                },
                                child: ListTile(
                                  leading: Text(
                                    StringConstant.passwordChange,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: EpregnancyColors.greyText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                child: Divider(
                                  color: Colors.grey,
                                  height: 1.5.h,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  //todo change password
                                  // Navigator.of(context)
                                  //     .pushNamed(RouteName.surveyPageBaby, arguments: true);

                                  Navigator.of(context).pushNamed(
                                      RouteName.disclaimer,
                                      arguments: {
                                        'user_id': state.user?.id,
                                        'from': "account"
                                      });
                                },
                                child: ListTile(
                                  leading: Text(
                                    StringConstant.termAndCondition,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: EpregnancyColors.greyText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                child: Divider(
                                  color: Colors.grey,
                                  height: 1.5.h,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  final Uri emailLaunchUri = Uri(
                                    scheme: 'mailto',
                                    path: StringConstant.emailCsUser,
                                    query:
                                        encodeQueryParameters(<String, String>{
                                      'subject':
                                          'Pertanyaan/Feedback untuk Komunitaz',
                                      'body':
                                          'Halo, saya punya pertanyaan .....',
                                    }),
                                  );

                                  launchUrl(emailLaunchUri);
                                },
                                child: ListTile(
                                  leading: Text(
                                    StringConstant.feedback,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: EpregnancyColors.greyText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                child: Divider(
                                  color: Colors.grey,
                                  height: 1.5.h,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // todo delete account
                                  Toast.show("Fitur ini akan segera hadir");
                                  // Navigator.of(context)
                                  //     .pushNamed(RouteName.changePasswordPage);
                                },
                                child: ListTile(
                                  leading: Text(
                                    StringConstant.deleteAccount,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // trailing: const Icon(
                                  //   Icons.arrow_forward_ios,
                                  //   color: EpregnancyColors.greyText,
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 5.h),
                          margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          height: 100.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset("assets/icApp.png"),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "KOMUNITAZ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.sp),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'App Versi 1.0.3',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () async {
                                      await GAuthentication.signOut(
                                          context: context);
                                      // await AppSharedPreference.clear();
                                      await AppSharedPreference.remove(
                                          AppSharedPreference.user);
                                      await AppSharedPreference.remove(
                                          AppSharedPreference.userRegister);
                                      await AppSharedPreference.remove(
                                          AppSharedPreference.baby);
                                      await AppSharedPreference.remove(
                                          AppSharedPreference.baby);
                                      await AppSharedPreference.remove(
                                          AppSharedPreference.hospital);
                                      await AppSharedPreference.remove(
                                          AppSharedPreference.otp);
                                      await AppSharedPreference.remove(
                                          AppSharedPreference.token);
                                      await AppSharedPreference.remove(
                                          AppSharedPreference.loginResponse);
                                      await AppSharedPreference.remove(
                                          AppSharedPreference.cookie);
                                      _showMyDialog(context);
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icLogoutNakes.svg'),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          StringConstant.logout,
                                          style: TextStyle(
                                              color: EpregnancyColors.primer,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _Loading()
              ],
            ),
            // bottomSheet:
          );
        },
      ),
    );
  }

  Future<bool?> _showMyDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda Yakin Ingin Keluar?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Tidak'),
            ),
            FlatButton(
              onPressed: () {
                Injector.resolve<SurveyPageBloc>()
                    .add(const SurveyDisposeEvent());
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteName.login, (Route<dynamic> route) => false,
                    arguments: {
                      'token_expired': false,
                      'is_from_register': false
                    });
              },
              child: Text('Ya'),
            ),
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
        Injector.resolve<ProfilePageBloc>()
            .add(ChangePhotoProfileEvent(croppedFile.path));
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
        Injector.resolve<ProfilePageBloc>()
            .add(ChangePhotoProfileEvent(croppedFile.path));
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
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocBuilder<ProfilePageBloc, ProfilePageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'updateProfile') {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}
