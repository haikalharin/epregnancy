import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/profile_page/bloc/profile_page_bloc.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';

class ChangeProfilePage extends StatefulWidget {
  const ChangeProfilePage({Key? key}) : super(key: key);

  @override
  State<ChangeProfilePage> createState() => _ChangeProfilePageState();
}

class _ChangeProfilePageState extends State<ChangeProfilePage> {
  String? _getAge(String dob) {
    DateTime birthday = DateTime.parse(dob);
    DateDuration duration;
    duration = AgeCalculator.age(birthday);
    return duration.years.toString() + " tahun";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BtnBackIosStyle(),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Ubah Data Diri",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp),
          ),
        ),
        body: BlocListener<ProfilePageBloc, ProfilePageState>(
          listener: (context, state) {
            // todo listener
          },
          child: BlocBuilder<ProfilePageBloc, ProfilePageState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // avatar
                    Center(
                      child: Container(
                          height: 80.h,
                          width: 80.w,
                          margin: EdgeInsets.only(
                              right: 10.w, top: 10.w, bottom: 10.h),
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: state.user?.imageUrl != null
                              ? Stack(
                                  overflow: Overflow.visible,
                                  children: [
                                    Container(
                                      // width: 62,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: FadeInImage(
                                          placeholder: const AssetImage(
                                              'assets/ic_no_photo_blue.png'),
                                          image: NetworkImage(
                                              state.user?.imageUrl ?? ""),
                                          width: 80.w,
                                          height: 80.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: -10,
                                      child: InkWell(
                                        onTap: () {
                                          _showPicker(context);
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.w),
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: EpregnancyColors.primer,
                                              size: 15.w,
                                            ),
                                          ),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                50,
                                              ),
                                            ),
                                            color: EpregnancyColors.primerSoft2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Stack(
                                  overflow: Overflow.visible,
                                  children: [
                                    Container(
                                      // width: 62,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: FadeInImage(
                                          placeholder: AssetImage(
                                              'assets/ic_no_photo_blue.png'),
                                          image: AssetImage(
                                              'assets/ic_no_photo_blue.png'),
                                          width: 80.h,
                                          height: 80.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: -10,
                                      child: InkWell(
                                        onTap: () {
                                          _showPicker(context);
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.w),
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: EpregnancyColors.primer,
                                              size: 15.w,
                                            ),
                                          ),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                50,
                                              ),
                                            ),
                                            color: EpregnancyColors.primerSoft2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                    ),
                    Center(
                      child: Text(
                        "Ubah foto profil",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 16.w, top: 16.h, bottom: 8.h),
                      child: Text(
                        "Data Diri dan Keluarga",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nama",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.sp),
                          ),
                          Row(
                            children: [
                              Text(
                                state.user?.name ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: EpregnancyColors.grey,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Umur",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.sp),
                          ),
                          Row(
                            children: [
                              Text(
                                _getAge(state.user?.dob) ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: EpregnancyColors.grey,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ganti Profil Kehamilan",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.sp),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    RouteName.surveyPageBaby,
                                    arguments: {"is_edit": true, "edit_name": false});
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: EpregnancyColors.grey,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
