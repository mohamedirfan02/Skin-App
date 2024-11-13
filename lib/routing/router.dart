import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skin_app/views/home_view.dart';
import 'package:skin_app/views/profile_view.dart';
import 'package:skin_app/views/verify.dart';
import '../views/edit_profile_view.dart';
import '../views/new_password_view.dart';
import '../views/resetpass.dart';
import '../views/signin_view.dart';
import '../views/signupview.dart';


final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: '/SignUpScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: '/ResetPasswordScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const ResetPasswordScreen();
      },
    ),
    GoRoute(
      path: '/OtpVerificationScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const OtpVerificationScreen();
      },
    ),
    GoRoute(
      path: '/New Password',
      builder: (BuildContext context, GoRouterState state) {
        return const NewPassword();
      },
    ),
    GoRoute(
      path: '/New Password',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/New Password',
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      },
    ),
    GoRoute(
      path: '/New Password',
      builder: (BuildContext context, GoRouterState state) {
        return const EditProfile();
      },
    ),

  ],
);
