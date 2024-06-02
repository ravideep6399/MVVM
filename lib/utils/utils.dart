import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/res/colors.dart';

class Utils {
  static void changeFocus(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushbarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          backgroundColor: ColorsApp.redColor,
          margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding:const EdgeInsets.all(15),
          duration:const Duration(seconds: 2),
          message: message,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 100,
          messageColor: ColorsApp.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          icon:const Icon(Icons.error ,size: 28,color: ColorsApp.whiteColor,),
        )..show(context));
  }
}
