import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/presentation/cubits/lang_cubit/lang_cubit.dart';
import 'package:rigow/l10n/app_localizations.dart';

class ColoredButtonWidget extends StatelessWidget {
  const ColoredButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.grideantColors,
    required this.textColor,
    this.icon,
  });
  final String text;
  final void Function()? onPressed;
  final List<Color> grideantColors;
  final Color textColor;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: grideantColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: const BoxConstraints(minHeight: 50.0),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              icon != null ? const SizedBox(width: 6) : const SizedBox(),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TranceparentButtonWidget extends StatelessWidget {
  const TranceparentButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.borderColor,
    this.icon,
  });
  final String text;
  final void Function()? onPressed;
  final Color textColor;
  final Color borderColor;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(25)),
      color: Colors.transparent,
      elevation: 0,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ?? const SizedBox(),
          icon != null ? const SizedBox(width: 6) : const SizedBox(),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class ArabicButton extends StatelessWidget {
  const ArabicButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final currentLocale =
            context.read<LocaleCubit>().state.locale.languageCode;
        final newLocale = currentLocale == 'en' ? 'ar' : 'en';
        context.read<LocaleCubit>().changeLanguage(newLocale);
      },
      child: Text(
        AppLocalizations.of(context)!.lang,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SocialAuthenticationButton extends StatelessWidget {
  const SocialAuthenticationButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.image,
      required this.textColor});
  final String text;
  final void Function()? onPressed;
  final Color color;
  final Color textColor;
  final String image;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 48,
          ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(image),
                ),
                const SizedBox(width: 8),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
