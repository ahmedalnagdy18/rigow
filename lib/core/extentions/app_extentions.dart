import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

void launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

String addBaseUrls(String url) {
  return "https://beta-api.rigow.com/$url";
}

getIconForLink(String link) {
  if (link.contains("www.facebook.com")) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Image.asset(
        "assets/images/facebook.png",
        fit: BoxFit.cover,
      ),
    );
  } else if (link.contains("www.instagram.com")) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Image.asset(
        "assets/images/instagram.png",
        fit: BoxFit.cover,
      ),
    );
  } else if (link.contains("www.youtube.com")) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Image.asset(
        "assets/images/youtube.png",
        fit: BoxFit.cover,
      ),
    );
  } else if (link.contains("x.com")) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Image.asset(
        "assets/images/twitter.png",
        fit: BoxFit.cover,
      ),
    );
  } else {
    return const Icon(
      Icons.link,
      size: 20,
      color: Colors.grey,
    );
  }
}

// to Navigat to any page

// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => const Navbar()));

//    AppLocalizations.of(context)!.appName,   to localization

// ----------to push without return back----------
// Navigator.of(context).pushAndRemoveUntil(
//          MaterialPageRoute(
//            builder: (context) => const TimelinePage(),),
//              (Route<dynamic> route) => false, );
