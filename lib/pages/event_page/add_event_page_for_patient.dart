import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/main.dart';
import 'package:PregnancyApp/pages/event_page/patient_select_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class AddEventPageForPatient extends StatefulWidget {
  const AddEventPageForPatient({Key? key, this.consulType}) : super(key: key);
  final String? consulType;

  @override
  _AddEventPageForPatientState createState() => _AddEventPageForPatientState();
}

final _codeController = TextEditingController();
final _userNameController = TextEditingController();
var authService = AuthService();

class _AddEventPageForPatientState extends State<AddEventPageForPatient> {
  void onRefresh() async {
    Injector.resolve<EventPageBloc>()
        .add(EventInitEvent(widget.consulType ?? ""));
  }

  String? consulForPatientType;
  UserModel? selectedUser;


  @override
  void initState() {
    setState(() {
      consulForPatientType = widget.consulType;
    });

    onRefresh();
    super.initState();
  }

  @override
  void dispose() {
    // Injector.resolve<EventPageBloc>().add(EventPageDispose());
    super.dispose();
  }

  void _showEventOption(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:  Center(child: Text("Tipe Jadwal", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.sp),),),
                  ),
                  ListTile(
                      leading: SvgPicture.asset(
                        'assets/ic_health.svg',
                        fit: BoxFit.fitHeight,
                      ),
                      title: Text('Kunjungan Puskesmas'),
                      onTap: () async {
                        // pickAndCropImageGallery();
                        setState(() {
                          consulForPatientType = StringConstant.visitHospital;
                          Injector.resolve<EventPageBloc>().add(EventInitEvent(consulForPatientType ?? ""));
                        });
                        Navigator.pop(context);
                      }),
                  ListTile(
                    leading: SvgPicture.asset('assets/ic_pills.svg'),
                    title: Text('Konsumsi Obat'),
                    onTap: () async {
                      // pickAndCropImageCamera();
                      setState(() {
                        consulForPatientType = StringConstant.consumeMedicine;
                        Injector.resolve<EventPageBloc>().add(EventInitEvent(consulForPatientType ?? ""));
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
          );
        });
  }

  Widget patientSelection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      padding: EdgeInsets.only(left: 8.w, bottom: 8.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1))
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PatientSelectPage())).then((_selectedUser) {
            if(_selectedUser != null){
              setState(() {
                selectedUser = _selectedUser;
              });
              print('selected user : ${selectedUser?.id}');
            }
          });
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icCommunity.svg", color: Colors.black,),
                  SizedBox(width: 10.w,),
                  Text(selectedUser != null ? selectedUser!.name!  :"Nama peserta", style: TextStyle(color: EpregnancyColors.primer, fontSize: 12.sp),)
                ],
              ),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PatientSelectPage())).then((_selectedUser) {
                  if(_selectedUser != null){
                    setState(() {
                      selectedUser = _selectedUser;
                    });
                    print('selected user : ${selectedUser?.id}');
                  }
                });
              }, icon: const Icon(Icons.arrow_forward_ios_rounded, color: EpregnancyColors.primer,))
            ],
          ),
        ),
      ),
    );
  }

  Widget eventTypeSelection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      child: InkWell(
        onTap: () async {
          _showEventOption(context);
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 10.h),
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
                            "Tipe Jadwal",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 8),
                          Text(
                              consulForPatientType == StringConstant.visitHospital ? "Kunjungan Puskesmas" : "Konsumsi Obat",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: EpregnancyColors.primer)),
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
      ),
    );

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
              "Jadwal Untuk Peserta",
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
        actions: [
          Container(
            width: 50,
            height: 20,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              iconSize: 30,
              color: EpregnancyColors.greyText,
            ),
          )
        ],
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

          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     RouteName.navBar, (Route<dynamic> route) => false,
          //     arguments: {'role': state.role, 'initial_index': 0});
          Navigator.pop(context);
          Navigator.pop(context);
        }
      }, child: BlocBuilder<EventPageBloc, EventPageState>(
        builder: (context, state) {
          return Stack(
            children: [
              ListView(
                children: [
                  patientSelection(context),
                  eventTypeSelection(context),
                  consulForPatientType == StringConstant.consumeMedicine
                      ? _BodyConsumeMedicine(consulForPatientType ?? "")
                      : _BodyVisit(consulForPatientType ?? ""),
                ],
              ),
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
                          color: state.status.isValidated && selectedUser != null
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
                            if (state.status.isValidated && selectedUser != null) {
                              Injector.resolve<EventPageBloc>()
                                  .add(EventAddSubmittedFromMidwife(selectedUser!));
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
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
            ),
            children: [
              // SizedBox(height: 120),
              //_HeadingText(),
              SizedBox(height: 10),
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
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
            ),
            children: [
              // SizedBox(height: 120),
              //_HeadingText(),
              SizedBox(height: 10),
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
            errorText: state.scheduleName.invalid ? 'Tidak boleh kosong' : null,
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
            errorText: state.description.invalid ? 'Tidak boleh kosong' : null,
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
                    fieldLabelText: "Date", endDate: state.dateEnd, firstDate: DateTime.now()) ??
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
                                  : "Tanggal Penjadwalan",
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
                                    color: EpregnancyColors.primer)),
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
                    firstDate: state.dateStart) ??
                DateTime.now();
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
                                  color: EpregnancyColors.primer,
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
                            const Text(
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
                                    color: EpregnancyColors.primer)),
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
