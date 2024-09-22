import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rigow/core/colors/app_colors.dart';

double appHight(BuildContext context, double h) {
  return MediaQuery.of(context).size.height * h;
}

double appWidth(BuildContext context, double h) {
  return MediaQuery.of(context).size.width * h;
}
//  appHight(context, 1)   to add hight by mediaQuere

void showToastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColors.toastmessage,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    textColor: Colors.black,
    fontSize: 14.0,
  );
}
// showToastMessage(message: "Added successfully");   to call it

void showErrorToastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColors.appBarRed,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}
// showErrorToastMessage(message: state.message);   to call it

TextInputFormatter noSpaceFormatter() {
  return TextInputFormatter.withFunction(
    (oldValue, newValue) {
      if (newValue.text.startsWith(' ')) {
        final newText = newValue.text.trimLeft();
        return newValue.copyWith(
          text: newText,
          selection: TextSelection.fromPosition(
            TextPosition(offset: newText.length),
          ),
        );
      }
      return newValue;
    },
  );
} //  noSpaceFormatter(),   to call it 



// to Navigat to any page

// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => const Navbar()));

//    AppLocalizations.of(context)!.appName,   to localization

// ----------to push without return back----------
  // Navigator.of(context).pushAndRemoveUntil(
  //          MaterialPageRoute(
  //            builder: (context) => const TimelinePage(),),
  //              (Route<dynamic> route) => false, );