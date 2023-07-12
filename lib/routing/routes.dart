import 'package:flutter/cupertino.dart';
import 'package:metrdev_app/features/authentication/login/login_screen.dart';
import 'package:metrdev_app/features/dashboard/user_dashboard_screen.dart';

const String loginRoute = "/login";
const String dashboardRoute = "/dashboard";

final Map<String, WidgetBuilder> routes = {
  loginRoute: (context) => const LoginScreen(),
  dashboardRoute: (context) => const UserDashboardScreen()
};
