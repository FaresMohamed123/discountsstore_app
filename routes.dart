import 'package:discountsstore_app/core/constant/routes.dart';
import 'package:discountsstore_app/core/middleware/mymiddleware.dart';
import 'package:discountsstore_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:discountsstore_app/view/screen/auth/login.dart';
import 'package:discountsstore_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:discountsstore_app/view/screen/auth/signup.dart';
import 'package:discountsstore_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:discountsstore_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:discountsstore_app/view/screen/home.dart';
import 'package:discountsstore_app/view/screen/language.dart';
import 'package:discountsstore_app/view/screen/onboarding.dart';
import 'package:get/get.dart';

import 'view/screen/auth/forgetpassword/verfiycodesaginup.dart';

 List<GetPage<dynamic>>? routes = [
  GetPage(
  name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  //GetPage(name: "/", page: () => const TestView()),
  //  Auth
  GetPage(name: AppRoute.language, page: () => const Language()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forGetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassWord()),
  GetPage(name: AppRoute.successResetPassword,page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignlUp()),
  GetPage(name: AppRoute.homepage, page: () =>  const HomePage()),
];