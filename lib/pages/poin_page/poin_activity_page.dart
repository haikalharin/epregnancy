import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/pages/poin_page/bloc/point_history_bloc.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_icon_widget.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:formz/formz.dart';

class PoinActivityPage extends StatefulWidget {
  const PoinActivityPage({Key? key, this.point}) : super(key: key);
  final int? point;

  @override
  State<PoinActivityPage> createState() => _PoinActivityPageState();
}

class _PoinActivityPageState extends State<PoinActivityPage> {

  @override
  void initState() {
    super.initState();
    Injector.resolve<PointHistoryBloc>().add(const FetchPointHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.poinActivity, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: EpregnancyColors.blackBack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  BlocListener<PointHistoryBloc, PointHistoryState>(
        listener: (context, state) {
          // todo listener pointhistorybloc
        },
        child: BlocBuilder<PointHistoryBloc, PointHistoryState>(
          builder: (context, state) {
            return Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:12.0),
                        child: Row(
                          children: [
                            PoinIconWidget(height: 10, width: 10),
                            SizedBox(width: 10,),
                            Text('Total Poin: ${widget.point ?? 0}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: EpregnancyColors.blueDark),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: EpregnancyColors.borderGrey, width: 1)
                        ),
                        child: state.status == FormzStatus.submissionInProgress ? const Center(
                          child: CircularProgressIndicator()): ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return  ListTile(
                                leading: _buildLeadingIcon(context, state.pointHistories![index].description!),
                                title: Text(state.pointHistories![index].description ?? '', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                subtitle: Text(DateFormatter.dateFormatHistory.format(DateTime.parse(state.pointHistories?[index].createdDate??"0000-00-00")), style: const TextStyle(color: EpregnancyColors.greyText),),
                                trailing: state.pointHistories![index].type == 'earn' ? Text('+${state.pointHistories![index].points}', style: const TextStyle(color: EpregnancyColors.blueDark, fontWeight: FontWeight.w700)) : Text('+${state.pointHistories![index].points}', style: const TextStyle(color: EpregnancyColors.redText, fontWeight: FontWeight.w700)),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(height: 1, color: EpregnancyColors.borderGrey,);
                            }, itemCount: state.pointHistories?.length ?? 0),
                        )
                    ],
                  ),
                )
            );
          }),
        ),
      );
  }

  Widget _buildLeadingIcon(BuildContext context, String description) {
    switch(description){
      case 'Baca Artikel':
        return SvgPicture.asset('assets/icReadArticle.svg');
        break;
      case 'Check-in':
        return const PoinIconWidget(height: 20, width: 20);
        break;
      default:
        return const PoinIconWidget(height: 20, width: 20);
        break;
    }
  }
}
