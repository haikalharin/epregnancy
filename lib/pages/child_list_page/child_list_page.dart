import 'package:PregnancyApp/common/style/custom_text_style.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/child_list_page/bloc/child_list_bloc.dart';
import 'package:PregnancyApp/pages/child_list_page/widget/add_child_button.dart';
import 'package:PregnancyApp/pages/child_list_page/widget/child_card.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../utils/string_constans.dart';

class ChildListPage extends StatefulWidget {
  const ChildListPage({Key? key}) : super(key: key);

  @override
  State<ChildListPage> createState() => _ChildListPageState();
}

class _ChildListPageState extends State<ChildListPage> {
  @override
  void initState() {
    super.initState();
    Injector.resolve<ChildListBloc>().add(const FetchChildListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushNamedAndRemoveUntil(
          RouteName.navBar,
              (Route<dynamic> route) => false,
          arguments: {'role': StringConstant.patient, 'initial_index': 0},
        );
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          // todo back to home
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteName.navBar,
                (Route<dynamic> route) => false,
                arguments: {'role': StringConstant.patient, 'initial_index': 0},
              );
            },
          ),
          title: blackText16("Profil Anak"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
            child: BlocBuilder<ChildListBloc, ChildListBlocState>(
              builder: (context, state) {
                if (state.submitStatus == FormzStatus.submissionSuccess) {
                  if (state.childs?.length != 0) {
                    return ListView.builder(
                        itemCount: (state.childs?.length ?? 0) + 1,
                        itemBuilder: (context, index) {
                          if (index == state.childs?.length) {
                            return const AddChildButton();
                          } else {
                            return ChildCard(child: state.childs![index]);
                          }
                        });
                  } else {
                    return Center(
                      child: blackText24("Data Anak Masih Kosong"),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
      ),
    );
  }
}
