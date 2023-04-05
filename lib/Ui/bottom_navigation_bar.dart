import 'package:circle_social_networking_app_in_flutter/Ui/show_dialogbox.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int current_index = 0;
  // final List<Widget> pages = [const HomeScreen(), const SecondPage(), const ThiredPage()];

  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: Container(
                height: 80,
                width: 210,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25.r)),
                child: CustomNavigationBar(
                  backgroundColor: Colors.black,
                  selectedColor: Colors.white,
                  currentIndex: current_index,
                  onTap: OnTapped,
                  iconSize: 25.sp,
                  items: [
                    CustomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                    ),
                    CustomNavigationBarItem(
                      icon: const Icon(Icons.search),
                    ),
                    CustomNavigationBarItem(
                      icon: const Icon(Icons.email_outlined),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 15.w),
            InkWell(
              onTap: () {
                showDialog(
                  barrierColor: Colors.white70,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      insetPadding: EdgeInsets.all(20),
                      actionsPadding: EdgeInsets.zero,
                      buttonPadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.zero,
                      content: ShowDialogContainer(),
                    );
                  },
                );
              },
              child: Container(
                height: 60.h,
                width: 70.h,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xffee7656),
                        Color(0xffee7656),
                        Color(0xffffa380),
                      ],
                    ),
                    shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                    size: 40.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
