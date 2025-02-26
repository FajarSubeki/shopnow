import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopnow/presentation/pages/home_page.dart';
import 'package:shopnow/resources/app_asset.dart';
import 'package:shopnow/resources/app_color.dart';
import 'package:shopnow/resources/app_string.dart';
import 'package:shopnow/utils/util.dart';

import 'resources/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    HomePage(),
    // HomePage(),
    // HomePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black, // Black background
        statusBarIconBrightness: Brightness.light, // White icons
      ),
      child: Scaffold(
        body: _screens[_currentIndex],
        appBar: AppBar(
            title: Text(
            AppString.logo, style: textStyle.copyWith(
            color: AppColor.primary,
            fontWeight: bold,
            fontSize: 24)
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(2), // Divider thickness
            child: Divider(
              color: AppColor.grey06, // Line color
              thickness: 1, // Line thickness
              height: 1, // Adjust spacing if needed
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the bar
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), // Top-left radius
              topRight: Radius.circular(20), // Top-right radius
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Shadow color
                blurRadius: 10, // Blur intensity
                spreadRadius: 2, // Spread radius
                offset: Offset(0, -3), // Moves shadow up
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColor.black02,
              unselectedItemColor: AppColor.grey07,
              selectedLabelStyle: textStyle,
              unselectedLabelStyle: textStyle,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8), // Adds space above icon
                    child: Util.buildSvgIcon(
                      AppAsset.icHome,
                      0,
                      _currentIndex,
                      selectedColor: AppColor.grey05,
                      unselectedColor: AppColor.grey06,
                    ),
                  ),
                  label: AppString.home,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8), // Adds space above icon
                    child: Util.buildSvgIcon(
                      AppAsset.icCategory,
                      1,
                      _currentIndex,
                      selectedColor: AppColor.grey05,
                      unselectedColor: AppColor.grey06,
                    ),
                  ),
                  label: AppString.category,
                ),
                // BottomNavigationBarItem(
                //   icon: Padding(
                //     padding: EdgeInsets.only(top: 8), // Adds space above icon
                //     child: Util.buildSvgIcon(
                //       AppAsset.icCommunity,
                //       2,
                //       _currentIndex,
                //       selectedColor: AppColor.grey05,
                //       unselectedColor: AppColor.grey06,
                //     ),
                //   ),
                //   label: AppString.community,
                // ),
                // BottomNavigationBarItem(
                //   icon: Padding(
                //     padding: EdgeInsets.only(top: 8), // Adds space above icon
                //     child: Util.buildSvgIcon(
                //       AppAsset.icProfile,
                //       3,
                //       _currentIndex,
                //       selectedColor: AppColor.grey05,
                //       unselectedColor: AppColor.grey06,
                //     ),
                //   ),
                //   label: AppString.profile,
                // ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
