import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get logIn;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @addedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Added successfully'**
  String get addedSuccessfully;

  /// No description provided for @continuee.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuee;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @lang.
  ///
  /// In en, this message translates to:
  /// **'العربيه'**
  String get lang;

  /// No description provided for @continueAsAnUser.
  ///
  /// In en, this message translates to:
  /// **'Continue as an User'**
  String get continueAsAnUser;

  /// No description provided for @continueAsAnExpert.
  ///
  /// In en, this message translates to:
  /// **'Continue as an expert'**
  String get continueAsAnExpert;

  /// No description provided for @exploreTheApp.
  ///
  /// In en, this message translates to:
  /// **'Explore the app'**
  String get exploreTheApp;

  /// No description provided for @onboarding1.
  ///
  /// In en, this message translates to:
  /// **'Share posts, join rooms to ask for experts\' advice, and enjoy communicating with others'**
  String get onboarding1;

  /// No description provided for @onboarding2.
  ///
  /// In en, this message translates to:
  /// **'Boost your wellness and fitness through expert reels, stories, and blogs'**
  String get onboarding2;

  /// No description provided for @onboarding3.
  ///
  /// In en, this message translates to:
  /// **'Learn something new and share your knowledge '**
  String get onboarding3;

  /// No description provided for @welcometoRigow.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Rigow'**
  String get welcometoRigow;

  /// No description provided for @chooseTheWay.
  ///
  /// In en, this message translates to:
  /// **'Choose the way you prefer to create your account'**
  String get chooseTheWay;

  /// No description provided for @signUpByEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign up by Email'**
  String get signUpByEmail;

  /// No description provided for @continuewithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continuewithGoogle;

  /// No description provided for @continueWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get continueWithFacebook;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @exploreAsAguest.
  ///
  /// In en, this message translates to:
  /// **'Explore as a guest'**
  String get exploreAsAguest;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @agreeToOur.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our'**
  String get agreeToOur;

  /// No description provided for @termsOfServices.
  ///
  /// In en, this message translates to:
  /// **'Terms of services'**
  String get termsOfServices;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @logToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Log in to your account'**
  String get logToYourAccount;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget password?'**
  String get forgetPassword;

  /// No description provided for @dontHaveAcc.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get dontHaveAcc;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @resetYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset your Password'**
  String get resetYourPassword;

  /// No description provided for @resetExplian.
  ///
  /// In en, this message translates to:
  /// **'We’ll confirm your account by sending a verification code to your email address.'**
  String get resetExplian;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get sendCode;

  /// No description provided for @verifyYour.
  ///
  /// In en, this message translates to:
  /// **'Verify your'**
  String get verifyYour;

  /// No description provided for @enterVerificationCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Enter the 4-digit verification code sent to your email'**
  String get enterVerificationCodeSent;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @resendCodeIn.
  ///
  /// In en, this message translates to:
  /// **'Resend code in'**
  String get resendCodeIn;

  /// No description provided for @didnotReceiveAnyCodeYet.
  ///
  /// In en, this message translates to:
  /// **'Didn’t receive any code yet ?'**
  String get didnotReceiveAnyCodeYet;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @createYourNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create your new password'**
  String get createYourNewPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @reTypeNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Re-type new password'**
  String get reTypeNewPassword;

  /// No description provided for @errorEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get errorEmail;

  /// No description provided for @confirmPasswordExplian.
  ///
  /// In en, this message translates to:
  /// **'We’ll confirm your account by sending a verification code to your email address.'**
  String get confirmPasswordExplian;

  /// No description provided for @weak.
  ///
  /// In en, this message translates to:
  /// **'Weak, add numbers, letters and symbols'**
  String get weak;

  /// No description provided for @strong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get strong;

  /// No description provided for @matched.
  ///
  /// In en, this message translates to:
  /// **'Matched'**
  String get matched;

  /// No description provided for @equal.
  ///
  /// In en, this message translates to:
  /// **'The two password should be equal'**
  String get equal;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get success;

  /// No description provided for @yourPasswordSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your password has been reset successfully'**
  String get yourPasswordSuccessfully;

  /// No description provided for @completeProfile.
  ///
  /// In en, this message translates to:
  /// **'Complete Profile'**
  String get completeProfile;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mobileNumber;

  /// No description provided for @completeYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Complete your profile'**
  String get completeYourProfile;

  /// No description provided for @completeYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Complete your account'**
  String get completeYourAccount;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal info'**
  String get personalInfo;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @birthdate.
  ///
  /// In en, this message translates to:
  /// **'Birthdate'**
  String get birthdate;

  /// No description provided for @tapToSet.
  ///
  /// In en, this message translates to:
  /// **'Tap to set'**
  String get tapToSet;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome,'**
  String get welcome;

  /// No description provided for @welcomeDescreption.
  ///
  /// In en, this message translates to:
  /// **'Account was successfully created. You can now connect Rigow Community  and share your activities with them, come on to start your journey'**
  String get welcomeDescreption;

  /// No description provided for @signupWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get signupWithGoogle;

  /// No description provided for @signUpWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Email'**
  String get signUpWithEmail;

  /// No description provided for @enterTheRequiredInformation.
  ///
  /// In en, this message translates to:
  /// **'Enter the required information'**
  String get enterTheRequiredInformation;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @selectYourCountry.
  ///
  /// In en, this message translates to:
  /// **'Select your country'**
  String get selectYourCountry;

  /// No description provided for @searchCountry.
  ///
  /// In en, this message translates to:
  /// **'Search country'**
  String get searchCountry;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @emailValidator.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get emailValidator;

  /// No description provided for @exonboarding1.
  ///
  /// In en, this message translates to:
  /// **'Share posts, join rooms, and communicate with others'**
  String get exonboarding1;

  /// No description provided for @exonboarding2.
  ///
  /// In en, this message translates to:
  /// **'Create reels and stories, write blogs, and give answers to community queries as an administrator'**
  String get exonboarding2;

  /// No description provided for @setYourExpertAccount.
  ///
  /// In en, this message translates to:
  /// **'Set your Expert account'**
  String get setYourExpertAccount;

  /// No description provided for @confirmYourQualifications.
  ///
  /// In en, this message translates to:
  /// **'Confirm your qualifications'**
  String get confirmYourQualifications;

  /// No description provided for @expertWelcomeDescreption.
  ///
  /// In en, this message translates to:
  /// **'You will continue as an expert, but you will have limited interactions until receiving a notification with account confirmation then you can  manage all account features'**
  String get expertWelcomeDescreption;

  /// No description provided for @biography.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get biography;

  /// No description provided for @tellAboutYourSelf.
  ///
  /// In en, this message translates to:
  /// **'Tell about your self'**
  String get tellAboutYourSelf;

  /// No description provided for @universityDegree.
  ///
  /// In en, this message translates to:
  /// **'University degree'**
  String get universityDegree;

  /// No description provided for @otherCertifications.
  ///
  /// In en, this message translates to:
  /// **'Other certifications'**
  String get otherCertifications;

  /// No description provided for @governmentPermit.
  ///
  /// In en, this message translates to:
  /// **'Government permit'**
  String get governmentPermit;

  /// No description provided for @nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get nationality;

  /// No description provided for @fullNameInNationalId.
  ///
  /// In en, this message translates to:
  /// **'Full name in national ID'**
  String get fullNameInNationalId;

  /// No description provided for @typeYourFullNationalId.
  ///
  /// In en, this message translates to:
  /// **'Type your full name in your national ID'**
  String get typeYourFullNationalId;

  /// No description provided for @nationalIdNumber.
  ///
  /// In en, this message translates to:
  /// **'National ID number'**
  String get nationalIdNumber;

  /// No description provided for @typeYourNationalIdNumber.
  ///
  /// In en, this message translates to:
  /// **'Type your national ID number'**
  String get typeYourNationalIdNumber;

  /// No description provided for @nationalIdFront.
  ///
  /// In en, this message translates to:
  /// **'National ID (front)'**
  String get nationalIdFront;

  /// No description provided for @nationalIdBack.
  ///
  /// In en, this message translates to:
  /// **'National ID (back)'**
  String get nationalIdBack;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @specialty.
  ///
  /// In en, this message translates to:
  /// **'Specialty'**
  String get specialty;

  /// No description provided for @faculty.
  ///
  /// In en, this message translates to:
  /// **'Faculty'**
  String get faculty;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @typeYourUniversityName.
  ///
  /// In en, this message translates to:
  /// **'Type your university name'**
  String get typeYourUniversityName;

  /// No description provided for @tapToUpload.
  ///
  /// In en, this message translates to:
  /// **'Tap to upload'**
  String get tapToUpload;

  /// No description provided for @addFacultyNameHere.
  ///
  /// In en, this message translates to:
  /// **'Add Faculty name here'**
  String get addFacultyNameHere;

  /// No description provided for @addDepartment.
  ///
  /// In en, this message translates to:
  /// **'Add Department'**
  String get addDepartment;

  /// No description provided for @selectYourFacultyDepartment.
  ///
  /// In en, this message translates to:
  /// **'Select your Faculty department'**
  String get selectYourFacultyDepartment;

  /// No description provided for @searchDepartment.
  ///
  /// In en, this message translates to:
  /// **'Search Department'**
  String get searchDepartment;

  /// No description provided for @noDepartmentsFound.
  ///
  /// In en, this message translates to:
  /// **'No departments found for selected faculty'**
  String get noDepartmentsFound;

  /// No description provided for @selectYourSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Select your specialty'**
  String get selectYourSpecialty;

  /// No description provided for @searchSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Search specialty'**
  String get searchSpecialty;

  /// No description provided for @selectYourFaculty.
  ///
  /// In en, this message translates to:
  /// **'Select your faculty'**
  String get selectYourFaculty;

  /// No description provided for @searchFaculty.
  ///
  /// In en, this message translates to:
  /// **'Search Faculty'**
  String get searchFaculty;

  /// No description provided for @addFaculty.
  ///
  /// In en, this message translates to:
  /// **'Add Faculty'**
  String get addFaculty;

  /// No description provided for @socialLinks.
  ///
  /// In en, this message translates to:
  /// **'Social links'**
  String get socialLinks;

  /// No description provided for @addLink.
  ///
  /// In en, this message translates to:
  /// **'Add link'**
  String get addLink;

  /// No description provided for @expertAccountPolices.
  ///
  /// In en, this message translates to:
  /// **'Expert account Polices'**
  String get expertAccountPolices;

  /// No description provided for @toHaveExpertUserRIGOW.
  ///
  /// In en, this message translates to:
  /// **'To have an expert user account in the RIGOW, the following policies could be implemented:'**
  String get toHaveExpertUserRIGOW;

  /// No description provided for @policesTitle1.
  ///
  /// In en, this message translates to:
  /// **'Certification Requirement: '**
  String get policesTitle1;

  /// No description provided for @policesTitle2.
  ///
  /// In en, this message translates to:
  /// **'Content Quality Standards: '**
  String get policesTitle2;

  /// No description provided for @policesTitle3.
  ///
  /// In en, this message translates to:
  /// **'Engagement Criteria: '**
  String get policesTitle3;

  /// No description provided for @policesTitle4.
  ///
  /// In en, this message translates to:
  /// **'Community Contribution: '**
  String get policesTitle4;

  /// No description provided for @policesTitle5.
  ///
  /// In en, this message translates to:
  /// **'Continuous Education: '**
  String get policesTitle5;

  /// No description provided for @policesTitle6.
  ///
  /// In en, this message translates to:
  /// **'Review Process: '**
  String get policesTitle6;

  /// No description provided for @policesTitle7.
  ///
  /// In en, this message translates to:
  /// **'Code of Conduct: '**
  String get policesTitle7;

  /// No description provided for @policesHintText1.
  ///
  /// In en, this message translates to:
  /// **'You must provide proof of certification or accreditation in a relevant fitness or wellness field to make sure that you have the necessary knowledge and expertise to contribute meaningfully to the community.'**
  String get policesHintText1;

  /// No description provided for @policesHintText2.
  ///
  /// In en, this message translates to:
  /// **'you are required to maintain high-quality standards in your content, including accuracy, relevance, and professionalism. Regular audits or reviews of your posts may be conducted to ensure adherence to these standards.'**
  String get policesHintText2;

  /// No description provided for @policesHintText3.
  ///
  /// In en, this message translates to:
  /// **'you should demonstrate active engagement within the RIGOW community by regularly posting informative and valuable content, interacting with other users, and participating in discussions or challenges related to fitness and wellness.'**
  String get policesHintText3;

  /// No description provided for @policesHintText4.
  ///
  /// In en, this message translates to:
  /// **'Expert users encourage other users to contribute to the community by sharing insights, offering advice, and providing support to them. Their contributions should enrich the overall experience of the app and align with its mission of promoting health and well-being.'**
  String get policesHintText4;

  /// No description provided for @policesHintText5.
  ///
  /// In en, this message translates to:
  /// **'Expert users are expected to stay updated with the latest trends, research, and developments in the fitness and wellness industry. Participation in continuing education programs or workshops may be encouraged to ensure your knowledge remains current and relevant.'**
  String get policesHintText5;

  /// No description provided for @policesHintText6.
  ///
  /// In en, this message translates to:
  /// **'The upgrade to an expert user account may involve a review process conducted by the app administrators or a designated panel. This review assesses the user\'s qualifications, experience, and contributions to determine eligibility for the expert status.'**
  String get policesHintText6;

  /// No description provided for @policesHintText7.
  ///
  /// In en, this message translates to:
  /// **'Expert users must adhere to a strict code of conduct, which prohibits the dissemination of false information, engagement in harmful practices, or any behavior that undermines the integrity of the RIGOW community.'**
  String get policesHintText7;

  /// No description provided for @policesEndText.
  ///
  /// In en, this message translates to:
  /// **'By implementing these policies, RIGOW can ensure that its expert user accounts uphold the highest standards of professionalism, expertise, and contribution to foster a vibrant and supportive community focused on fitness and wellness.'**
  String get policesEndText;

  /// No description provided for @sendTheRequest.
  ///
  /// In en, this message translates to:
  /// **'Send the request'**
  String get sendTheRequest;

  /// No description provided for @yourRequestSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your Request have been sent successfully'**
  String get yourRequestSuccessfully;

  /// No description provided for @firstNameValidator.
  ///
  /// In en, this message translates to:
  /// **'Invalid First Name'**
  String get firstNameValidator;

  /// No description provided for @lastNameValidator.
  ///
  /// In en, this message translates to:
  /// **'Invalid Last Name'**
  String get lastNameValidator;

  /// No description provided for @passwordValidator.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordValidator;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
