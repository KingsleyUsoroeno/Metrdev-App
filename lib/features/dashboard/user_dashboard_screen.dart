import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metrdev_app/features/dashboard/account_info/account_info_screen.dart';
import 'package:metrdev_app/util/app_colors.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({Key? key}) : super(key: key);

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  final destinations = const <Widget>[
    AccountInfoScreen(),
    SizedBox.shrink(),
    SizedBox.shrink(),
  ];

  int _currentIndex = 0;

  void _setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.blueAccent,
        onTap: _setCurrentIndex,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: AppColors.appYellow,
        items: [
          const BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.incomplete_circle_outlined),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              "assets/images/svg/ic_frequent_activity.svg",
              color: _currentIndex == 1 ? AppColors.appYellow : Colors.white,
            ),
          ),
          const BottomNavigationBarItem(label: "", icon: Icon(Icons.settings)),
        ],
      ),
      body: SafeArea(
        child: destinations[_currentIndex],
      ),
    );
  }
}
