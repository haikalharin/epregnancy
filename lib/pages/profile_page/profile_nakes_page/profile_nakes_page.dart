import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toast/toast.dart';

import '../../../common/constants/router_constants.dart';
import '../../../data/firebase/g_authentication.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

class ProfileNakesPage extends StatelessWidget {
  const ProfileNakesPage({Key? key, this.name, this.imageUrl}) : super(key: key);
  final String? name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BtnBackIosStyle(),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(name ?? '', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.sp),),
        actions: [Container(
          height: 40.h,
          width: 40.w,
          margin: EdgeInsets.only(right: 10.w),
          decoration: const BoxDecoration(
            shape: BoxShape.circle
          ),
          child: imageUrl == null ? Image.asset('assets/dummies/dummy_avatar.png') : Image.network(imageUrl!),
        )],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Toast.show('Cooming Soon!');
              },
              child: ListTile(
                leading: Text(StringConstant.profileChange, style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                trailing: const Icon(Icons.arrow_forward_ios, color: EpregnancyColors.greyText,),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),child: Divider(color: Colors.grey, height: 1.h,),),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(RouteName.changePasswordPage);
              },
              child: ListTile(
                leading: Text(StringConstant.passwordChange, style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                trailing: const Icon(Icons.arrow_forward_ios, color: EpregnancyColors.greyText,),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 70.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('App Versi 1.01', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12.sp),),
            InkWell(
              onTap: ()async {
                //
                await GAuthentication.signOut(context: context);
                await AppSharedPreference.clear();
                _showMyDialog(context);

              },
              child: Row(children: [
                SvgPicture.asset('assets/icLogoutNakes.svg'),
                SizedBox(width: 5.w,),
                Text(StringConstant.logout, style: TextStyle(color: EpregnancyColors.primer, fontSize: 16.sp, fontWeight: FontWeight.w700),)
              ],),
            )
          ],
        ),
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
              onPressed: () =>  Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteName.login, (Route<dynamic> route) => false),
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }

}
