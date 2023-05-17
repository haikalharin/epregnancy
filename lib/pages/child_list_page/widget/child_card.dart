import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/pages/child_list_page/growth_tracker_form.dart';
import 'package:PregnancyApp/pages/new_born_page/bloc/new_born_page_bloc.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/style/custom_text_style.dart';
import '../../../data/model/child_model/child_list_response.dart';
import '../../home_page/bloc/home_page_bloc.dart';
import '../../new_born_page/baby_born_form_page.dart';
import '../bloc/child_list_bloc.dart';

class ChildCard extends StatefulWidget {
  const ChildCard({Key? key, required this.child}) : super(key: key);

  final ChildListResponse child;

  @override
  State<ChildCard> createState() => _ChildCardState();
}

class _ChildCardState extends State<ChildCard> {
  bool edit = false;
  bool delete = false;

  void setMenuPopUp(int value) {
    // todo edit & delete child data
    if (value == 1) {
      if (delete) delete = false;
      setState(() {
        edit = !edit;
        delete = delete;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        String? firstName;
        String? lastName;

        if (widget.child.name != null && widget.child.name!.contains(" ")) {
          List names = widget.child.name!.split(" ");
          firstName = names[0];
          lastName = names[1];
        } else {
          firstName = widget.child.name;
        }

        return BabyBornFromPage(
          babyId: widget.child.id!,
          bornDate: widget.child.dob,
          firstName: firstName,
          lastName: lastName,
          gender: widget.child.gender,
          isEdit: true,
        );
      }));
    } else {
      if (edit) edit = false;
      setState(() {
        delete = !delete;
        edit = edit;
      });
      Injector.resolve<NewBornPageBloc>()
          .add(DeleteChildEvent(widget.child.id!));
      Injector.resolve<HomePageBloc>().add(const HomeFetchDataEvent());
      Injector.resolve<HomePageBloc>().add(const HomeFetchBabyChildsEvent());
      Injector.resolve<HomePageBloc>().add(HomeFetchChildForDashboardEvent(widget.child.id!));
    }
  }

  Widget _simplePopup(BuildContext context) => PopupMenuButton<int>(
        offset: Offset(0, 30),
        elevation: 10,
        child: Container(
          margin: EdgeInsets.only(right: 0),
          width: 50,
          /*decoration: BoxDecoration(
            color: HexToColor("#ffffff"),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            boxShadow: [
              new BoxShadow(
                color: Colors.black87,
                offset: Offset(0.0, 1.0),
                blurRadius: 2.0,
              ),
            ],
          ),*/
          child: Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)),
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
              value: 1,
              height: 30.h,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.h, color: EpregnancyColors.greyText))),
                child: Center(child: blackText12W500("Ubah data")),
              )),
          PopupMenuItem(
              height: 30.h,
              value: 2,
              child: Container(
                child: Center(child: blackText12W500("Hapus data")),
              )),
        ],
        onCanceled: () {
          print("You have canceled the menu.");
        },
        onSelected: (value) {
          setMenuPopUp(value);
        },
      );

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal :16.w, vertical: 10.h),
          child: _column(),
        ));
  }

  Widget _column(){
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: SvgPicture.asset(
                "assets/ic_baby_appbar.svg",
                width: 48.w,
                height: 48.w,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _childName(),
                      _simplePopup(context),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  _ageChild(),
                ],
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return GrowthTrackerForm(
                    babyId: widget.child.id!
                  );
                }));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.h,
            margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.w),
              border: Border.all(color: EpregnancyColors.primer, width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tambah Data Pertumbuhan", style: TextStyle(color: EpregnancyColors.primer, fontWeight: FontWeight.w700, fontSize: 12.sp),),
                Icon(
                  Icons.add,
                  color: EpregnancyColors.primer,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _childName() {
    if (widget.child.gender == "L") {
      return blackText16("${widget.child.name} ♂");
    } else {
      return blackText16("${widget.child.name} ♀");
    }
  }

  Widget _ageChild() {
    if ((widget.child.age?.year ?? 0) < 1 &&
        (widget.child.age?.month ?? 0) < 1) {
      return blackText12W500("${widget.child.age?.day ?? 0} Hari");
    } else if ((widget.child.age?.year ?? 0) < 1 &&
        (widget.child.age?.month ?? 0) >= 1) {
      return blackText12W500(
          "${widget.child.age?.month ?? 0} Bulan ${widget.child.age?.day ?? 0} Hari");
    } else {
      return blackText12W500(
          "${widget.child.age?.year ?? 0} Tahun ${widget.child.age?.month ?? 0} Bulan ${widget.child.age?.day ?? 0} Hari");
    }
  }
}
