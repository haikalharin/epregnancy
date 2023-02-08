import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository_impl.dart';
import 'package:PregnancyApp/pages/games_page/bloc/games_bloc.dart';
import 'package:PregnancyApp/utils/basic_loading_dialog.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:toast/toast.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {

  @override
  void initState() {
    Injector.resolve<GamesBloc>().add(const FetchGamesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BtnBackIosStyle(),
        title: Text(StringConstant.games, style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700),),
      ),
      body: BlocListener<GamesBloc, GamesState>(
        listener: (context, state) {
          if(state.type == 'play-game-success'){
            Navigator.pop(context);
            Navigator.pushNamed(context, RouteName.webViewPage, arguments: {'game_url': state.playGameResponse?.url, 'game_name': state.playGameResponse?.name});
          } else if (state.type == 'play-game-failed'){
            Navigator.pop(context);
            Toast.show("Game Gagal Dibuka, Mohon Coba Lagi!");
          }
        },
        child: BlocBuilder<GamesBloc, GamesState>(
          builder: (context, state) {
            if(state.type == 'Load Data Success' || state.type == 'play-game-success' || state.type == 'play-game-failed') {
              return Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: state.gamesResponse?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            basicLoadinDialog(context);
                            showAlertDialog(context);
                            // Injector.resolve<GamesBloc>().add(PlayGameEvent(state.gamesResponse?[index].id));
                          },
                          child: Container(
                            height: 100.h,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(state.gamesResponse![index].coverUrl!),
                                    fit: BoxFit.fill
                                )
                            ),
                            child: Column(
                              children: [
                                Text(state.gamesResponse![index].name ?? '', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), )
                              ],
                            ),
                          ),
                        );
                      })
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      ),
      );
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

