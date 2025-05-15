import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/pin_checkin/bloc/pin_checkin_bloc.dart';
import 'package:PregnancyApp/pages/poin_page/success_earn_poin_page.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../common/injector/injector.dart';
import 'bloc/home_page_bloc.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  MobileScannerController cameraController = MobileScannerController();

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BtnBackIosStyle(),
          backgroundColor: Colors.white,
          elevation: 0,
          title:  Text('Scan QR Kunjungan', style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w700),),
          actions: [
            IconButton(
              color: EpregnancyColors.primer,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: EpregnancyColors.primer,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: BlocListener<PinCheckInBloc, PinCheckInState>(
          listener: (context, state) {
            if (state.submitStatus == FormzStatus.submissionSuccess) {
              // snackBar("Selamat Anda Berhasil CheckIn!");
              Injector.resolve<HomePageBloc>().add(PointFetchEvent());
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessEarnPoinPage()));
              // Navigator.pop(context);
            } else if (state.submitStatus == FormzStatus.submissionFailure) {
              // snackBar("Terjadi Kesalahan, Silahkan Coba Lagi!");
              snackBar("Failed to scan QR Code");
              Navigator.pop(context);
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [

                MobileScanner(
                  controller: cameraController,
                  fit: BoxFit.cover,
                  onDetect: (barcode) {
                    final rawValue = barcode.raw;
                    if (rawValue == null) {
                      debugPrint('Failed to scan Barcode');
                      return;
                    }

                    debugPrint('Barcode found! $rawValue');

                    final code = rawValue.replaceAll("KomunitAZ-", "");

                    Injector.resolve<PinCheckInBloc>().add(PinSubmitted(code));

                    // Jika ingin langsung close scanner setelah scan, bisa pakai ini:
                    // Navigator.pop(context, rawValue);
                  },
                  onScannerStarted: (value) {
                    debugPrint('Scanner started');
                  },
                  // Kamu bisa aktifkan errorBuilder kalau mau handle error camera:
                  // errorBuilder: (context, error, child) => Center(child: Text('Error: $error')),
                  // placeholderBuilder: (context, child) => Center(child: CircularProgressIndicator()),
                  startDelay: false,
                  // overlay: customWidgetOverlay, // kalau kamu mau overlay scan area custom
                  // scanWindow: Rect.fromLTWH(50, 100, 300, 300), // untuk membatasi area scan
                ),



                Semantics(label: '',
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 300.w,
                        child: Lottie.asset("assets/lottie/qr_scanner_lottie.json", repeat: true)),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
