import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AuthEnterCodeController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  late TextEditingController textEditingController;
  Rx<Duration> timerInSecond = Duration(seconds: 59).obs;

  RxBool checkBox = true.obs;
  RxString codeNumber = "".obs;
  int namber = 0;

  var receivedCode = "".obs;


  bool checkFullCode(){

    if( receivedCode.value.length>= 4 && receivedCode.value != "5555"){
      return true;
    }
    return false;

  }

  void startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerInSecond.value >= Duration(seconds: 1)) {
        timerInSecond.value = timerInSecond.value - Duration(seconds: 1);
      }
    });
  }

  void listenOtp(){
    SmsAutoFill().listenForCode();

  }

  formatedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min":"$min";
    String second = sec.toString().length <= 1 ? "0$sec":"$sec";
    return "$minute:$second";
  }


  Future<void> submit() async {
  var appSignatureID = await SmsAutoFill().getAppSignature;

  Map sendOtpData = {
    "mobile_number":"+996220250857",
    "app_signature_id": appSignatureID
  };

  print("отправил");
  print(sendOtpData);



  }



  @override
  void onInit() {
    codeNumber.value = "";
    submit();
    listenOtp();

    print("инициалзии");
    startCountDown();
    textEditingController = TextEditingController();
    startListenSms();
    super.onInit();
  }

  Future<void> startListenSms() async {
    await SmsAutoFill().listenForCode;
  }

  String? validateCode(String? value) {
    if (value! != "5555") {
      errorController.add(ErrorAnimationType.shake);
    } else {

    }

  }

  @override
  void dispose() {
    textEditingController.dispose();
    errorController.close();
    // TODO: implement dispose
    super.dispose();
  }
}
