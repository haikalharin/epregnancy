import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/home_page_bloc.dart';

class ListEventWidget extends StatefulWidget {
  ListEventWidget({Key? key, this.tipeAcara}) : super(key: key);
  final String? tipeAcara;

  @override
  State<ListEventWidget> createState() => _ListEventWidgetState();
}

class _ListEventWidgetState extends State<ListEventWidget> {
  @override
  void initState() {
    Injector.resolve<HomePageBloc>().add(EventFetchEvent(
        widget.tipeAcara == StringConstant.typeEventJadwalUmum
            ? StringConstant.typePublic
            : StringConstant.typePersonal));
    super.initState();
  }

  // final String nextMenu, content;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
              height: 100,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(color: Colors.white),
              child: state.listArticle == null
                  ? Stack(children: [
                Container(margin: EdgeInsets.only(), child: Container())
              ])
                  : Stack(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      String outputDate = "";
                      var outputFormat = DateFormat.yMMMMd('id');
                      outputDate = outputFormat.format(
                          DateTime.parse(state.listEvent != null &&
                              state.listEvent![index].eventStartDate != null
                              ? state.listEvent![index].eventStartDate!: ""));
                      return Container(
                        height: 180,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: EpregnancyColors.primer,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // color: Colors.greenAccent,
                        margin: EdgeInsets.only(
                            left: 20, right: 20, bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // width: 62,

                                      child: Text(
                                          outputDate
                                      )),
                                  Container(
                                    // width: 62,

                                      child: Text(
                                        widget.tipeAcara ?? '',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: EpregnancyColors.primer),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 230,
                                            margin: EdgeInsets.only(
                                                bottom: 10),
                                            child: Text(
                                              state.listEvent != null &&
                                                  state.listEvent![index].title != null
                                                  ? state.listEvent![index].title!: "",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            )),
                                        Container(
                                            width: 230,
                                            margin: EdgeInsets.only(),
                                            child: Text(
                                              state.listEvent != null &&
                                                  state.listEvent![index].description != null
                                                  ? state.listEvent![index].description!: "")),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration:state.listEvent![index].imageURL != null &&
                                        state.listEvent![index].imageURL != ""
                                        ? BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              state.listEvent![index].imageURL!),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: EpregnancyColors.primer)
                                        : BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        color: EpregnancyColors.primer),
                                    height: 80,
                                    width: 80,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: state.listEvent != null ? state.listEvent!.length: 0,
                  ),
                ],
              ));
        },
      ),
    );
  }
}
