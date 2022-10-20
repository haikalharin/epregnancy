import 'package:PregnancyApp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/services/auth_service.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/date_picker.dart';
import '../../utils/epragnancy_color.dart';
import '../../utils/string_constans.dart';
import '../home_page/bloc/home_page_bloc.dart';
import '../home_page/home_page.dart';
import 'bloc/event_page_bloc.dart';
import 'list_schedule_time.dart';

const _horizontalPadding = 24.0;

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key, this.consulType}) : super(key: key);
  final String? consulType;

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

final _codeController = TextEditingController();
final _userNameController = TextEditingController();
var authService = AuthService();

class _AddEventPageState extends State<AddEventPage> {
  void onRefresh() async {
    Injector.resolve<EventPageBloc>()
        .add(EventInitEvent(widget.consulType ?? ""));
  }

  @override
  void initState() {
    onRefresh();
    super.initState();
  }

  @override
  void dispose() {
    // Injector.resolve<EventPageBloc>().add(EventPageDispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              widget.consulType == StringConstant.visitHospital
                  ? "Kunjugan Rumah Sakit"
                  : widget.consulType == StringConstant.consumeMedicine
                      ? "Konsumsi Obat"
                      : "Lain-lain",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            )),
        leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
          child: BlocListener<EventPageBloc, EventPageState>(
              listener: (context, state) async {
        if (state.submitStatus == FormzStatus.submissionFailure) {
        } else if (state.submitStatus == FormzStatus.submissionSuccess) {
          const snackBar = SnackBar(
              content: Text("Berhasil"),
              backgroundColor: EpregnancyColors.primer);
          Scaffold.of(context).showSnackBar(snackBar);

          await Future.delayed(const Duration(seconds: 1));

          Navigator.of(context).pushNamedAndRemoveUntil(
              RouteName.navBar, (Route<dynamic> route) => false,
              arguments: {'role': state.role, 'initial_index': 0});
        }
      }, child: BlocBuilder<EventPageBloc, EventPageState>(
        builder: (context, state) {
          return Stack(
            children: [
              widget.consulType == StringConstant.consumeMedicine
                  ? _BodyConsumeMedicine(widget.consulType ?? "")
                  : _BodyVisit(widget.consulType ?? ""),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment(0, 1),
                      child: Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        child: RaisedButton(
                          color: state.status.isValidated
                              ? EpregnancyColors.primer
                              : EpregnancyColors.primerSoft,
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Text(
                              "Buat Jadwal",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          onPressed: () async {
                            if (state.status.isValidated) {
                              Injector.resolve<EventPageBloc>()
                                  .add(EventAddSubmitted());
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _Loading(),
            ],
          );
        },
      ))),
    );
  }
}

class _BodyVisit extends StatelessWidget {
  const _BodyVisit(this.consulType);

  final String consulType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<EventPageBloc, EventPageState>(
        builder: (context, state) {
          return ListView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
            ),
            children: [
              SizedBox(height: 10),
              // SizedBox(height: 120),
              //_HeadingText(),
              SizedBox(height: 20),
              _ScheduleNameInput(consulType),
              SizedBox(height: 12),
              _DescInput(),
              SizedBox(height: 20),
              _AddDateStartInput(),
              SizedBox(height: 20),
              _AddTimeInput(),

              SizedBox(height: 50),
              _Notification(),
              SizedBox(height: 10),

              // _PasswordTextField(),
            ],
          );
        },
      ),
    );
  }
}

class _BodyConsumeMedicine extends StatelessWidget {
  const _BodyConsumeMedicine(this.consulType);

  final String consulType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<EventPageBloc, EventPageState>(
        builder: (context, state) {
          return ListView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
            ),
            children: [
              SizedBox(height: 10),
              // SizedBox(height: 120),
              //_HeadingText(),
              SizedBox(height: 20),
              _ScheduleNameInput(consulType),
              SizedBox(height: 20),
              _AddDateStartInput(consulType: consulType),
              SizedBox(height: 20),
              _AddDateEndInput(),
              SizedBox(height: 20),
              _NotificationConsumeMedicine(),
              SizedBox(height: 10),

              // _PasswordTextField(),
            ],
          );
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress) {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}

class _HeadingText extends StatelessWidget {
  const _HeadingText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: const <Widget>[
                Text(
                  "Masuk dengan email",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Masuk dengan akun email yang terdaftar",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Notification extends StatelessWidget {
  const _Notification();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<EventPageBloc, EventPageState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: EpregnancyColors.grey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          // color: Colors.greenAccent,
          margin: EdgeInsets.only(left: 0, right: 0, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Atur Notifikasi",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: 'Ingatkan saya  ',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 16)),
                    WidgetSpan(
                      child: InkWell(
                        onTap: () async {
                          TimeOfDay initialTime = state.timeNotfication ??
                              TimeOfDay(hour: 0, minute: 30);
                          var pickedTime = await showTimePicker(
                            context: context,
                            initialTime: initialTime,
                            initialEntryMode: TimePickerEntryMode.input,
                            builder: (context, child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: true),
                                child: child ?? Container(),
                              );
                            },
                          );

                          Injector.resolve<EventPageBloc>().add(
                              EventTimeNotificationChanged(
                                  pickedTime ?? initialTime));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 12, right: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: EpregnancyColors.primer),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.timeNotficationString.value,
                                style: TextStyle(
                                    color: EpregnancyColors.white,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.access_time_outlined,
                                size: 20,
                                color: EpregnancyColors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextSpan(
                        text: ' Sebelum jadwal dimulai',
                        style: TextStyle(
                            height: 1.2,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NotificationConsumeMedicine extends StatelessWidget {
  const _NotificationConsumeMedicine();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<EventPageBloc, EventPageState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: EpregnancyColors.grey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          // color: Colors.greenAccent,
          margin: EdgeInsets.only(left: 0, right: 0, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Atur Notifikasi",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: 'Obat saya harus diminum  ',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 12)),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                            width: 25,
                            height: 25,
                            child: TextField(
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(fontSize: 12),
                              onChanged: (value) {
                                Injector.resolve<EventPageBloc>()
                                    .add(EventTotalConsumeChanged(value));
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 0, left: 9),
                                fillColor: EpregnancyColors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 10, color: Colors.black45),
                                errorStyle:
                                    const TextStyle(color: Colors.redAccent),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: EpregnancyColors.primer),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: EpregnancyColors.primer),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: EpregnancyColors.primer),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: '',
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                // errorText: state.date.invalid ? 'Mohon lengkapi Data' : null,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                            text: ' kali',
                            style: TextStyle(
                                height: 1.2,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 12)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: 'Setiap ',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 12)),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                            width: 25,
                            height: 25,
                            child: TextField(
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(fontSize: 12),
                              onChanged: (value) {
                                Injector.resolve<EventPageBloc>()
                                    .add(EventDaysChanged(value));
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 0, left: 9),
                                fillColor: EpregnancyColors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 10, color: Colors.black45),
                                errorStyle:
                                    const TextStyle(color: Colors.redAccent),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: EpregnancyColors.primer),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: EpregnancyColors.primer),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: EpregnancyColors.primer),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: '',
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                // errorText: state.date.invalid ? 'Mohon lengkapi Data' : null,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                            text: ' hari',
                            style: TextStyle(
                                height: 1.2,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 12)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  state.listScheduleTime.isNotEmpty &&
                          state.totalConsume.value != ""
                      ? RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: [
                              const TextSpan(
                                  text:
                                      'Karena itu, ingatkan saya setiap pukul  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 12)),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: ListScheduleTime(
                                      listScheduleTime: state.listScheduleTime),
                                ),
                              ),
                              const TextSpan(
                                  text: ' untuk meminum obat',
                                  style: TextStyle(
                                      height: 1.2,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 12)),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ScheduleNameInput extends StatelessWidget {
  const _ScheduleNameInput(this.consulType);

  final String consulType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      buildWhen: (previous, current) =>
          previous.scheduleName != current.scheduleName,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (value) => Injector.resolve<EventPageBloc>()
              .add(EventScheduleNameChanged(value)),
          decoration: InputDecoration(
            hintStyle: const TextStyle(
                // or whatever
                height: 1,
                fontSize: 16,
                fontWeight: FontWeight.w700),
            prefixIcon: consulType == StringConstant.visitHospital
                ? state.scheduleName.valid
                    ? Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: SvgPicture.asset(
                          'assets/ic_health.svg',
                          fit: BoxFit.fitHeight,
                        ))
                    : Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: SvgPicture.asset(
                          'assets/ic_health_unselected.svg',
                          fit: BoxFit.fitHeight,
                        ))
                : consulType == StringConstant.consumeMedicine
                    ? state.scheduleName.valid
                        ? Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: SvgPicture.asset(
                              'assets/ic_pills.svg',
                              fit: BoxFit.fitHeight,
                            ))
                        : Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: SvgPicture.asset(
                              'assets/ic_pills_unselected.svg',
                              fit: BoxFit.fitHeight,
                            ))
                    : Icon(Icons.add),
            hintText: 'Nama Jadwal',
            errorText: state.scheduleName.invalid ? 'Tidak boleh kososng' : null,
          ),
        );
      },
    );
  }
}

class _DescInput extends StatelessWidget {
  const _DescInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          style: TextStyle(fontSize: 12),
          onChanged: (value) => Injector.resolve<EventPageBloc>()
              .add(EventDescriptionChanged(value)),
          decoration: InputDecoration(
            hintStyle: TextStyle(
                // or whatever
                height: 1.5,
                fontSize:
                    12 //                                <----- this was the key
                ),
            prefixIcon: state.description.valid
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SvgPicture.asset(
                      'assets/ic_desc.svg',
                      fit: BoxFit.fitHeight,
                    ))
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SvgPicture.asset(
                      'assets/ic_desc_unselected.svg',
                      fit: BoxFit.fitHeight,
                    )),
            hintText: 'Deskripsi',
            errorText: state.description.invalid ? 'Tidak boleh kososng' : null,
          ),
        );
      },
    );
  }
}

class _AddDateStartInput extends StatelessWidget {
  const _AddDateStartInput({this.consulType = ""});

  final String consulType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      buildWhen: (previous, current) =>
          (previous.dateEndString != current.dateEndString) ||
          (previous.dateStartString != current.dateStartString),
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            var dateTime = await DatePickerUtils.getDate(
                    context, state.dateStart ?? DateTime.now(),
                    fieldLabelText: "Date",
                    endDate: state.dateEnd) ??
                DateTime.now();
            Injector.resolve<EventPageBloc>()
                .add(EventDateStartChanged(dateTime));
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.event),
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              consulType == StringConstant.consumeMedicine
                                  ? "Tanggal Mulai"
                                  : "Jadwal Kunjungan",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 8),
                            Text(
                                state.dateStartString.value != ""
                                    ? state.dateStartString.value
                                    : "Pilih tanggal",
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AddDateEndInput extends StatelessWidget {
  const _AddDateEndInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      buildWhen: (previous, current) =>
          (previous.dateEndString != current.dateEndString) ||
          (previous.dateStartString != current.dateStartString),
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            var dateTime = await DatePickerUtils.getDate(
                    context, state.dateStart ?? DateTime.now(),
                    firstDate: state.dateStart) ?? DateTime.now();
            Injector.resolve<EventPageBloc>()
                .add(EventDateEndChanged(dateTime));
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.event),
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Akhir",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 8),
                            Text(
                                state.dateEndString.value != ""
                                    ? state.dateEndString.value
                                    : "Pilih tanggal",
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AddTimeInput extends StatelessWidget {
  const _AddTimeInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      buildWhen: (previous, current) => previous.time != current.time,
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            TimeOfDay initialTime = state.time ?? TimeOfDay.now();
            var pickedTime = await showTimePicker(
              context: context,
              initialTime: initialTime,
            );
            Injector.resolve<EventPageBloc>()
                .add(EventTimeChanged(pickedTime ?? initialTime));
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.access_time_outlined),
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jam Kunjungan",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 8),
                            Text(
                                state.timeString.value != ""
                                    ? state.timeString.value
                                    : "Pilih tanggal",
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            child: Column(
              children: <Widget>[
                TextButton(
                  child: Text(
                    'Lupa kata sandi?',
                    style: TextStyle(color: EpregnancyColors.primer),
                  ),
                  onPressed: () {
                    print('Pressed');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
