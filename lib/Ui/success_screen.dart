import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/fade_animation.dart';
import 'home_screen.dart';

class Success_Screen extends StatefulWidget {
  const Success_Screen({Key? key}) : super(key: key);

  @override
  State<Success_Screen> createState() => _Success_ScreenState();
}

class _Success_ScreenState extends State<Success_Screen> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 540.h,
        width: 355.w,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  FadeAnimation(
                    delay: 1,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: 25.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                      delay: 1,
                      child: Container(
                          height: 200.h,
                          child: Image.asset("assets/success.gif"))),
                  SizedBox(height: 10.h),
                  FadeAnimation(
                    delay: 1.5,
                    child: FittedBox(
                      child: Text(
                        "Creating Circle is Success",
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.black,
                            fontFamily: "Poppins-SemiBold"),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  FadeAnimation(
                    delay: 1.7,
                    child: FittedBox(
                      child: Text(
                        "New Circle \"Design Bareng\" created",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                            fontFamily: "Poppins-Regular"),
                      ),
                    ),
                  ),
                  SizedBox(height: 65.h),
                  FadeAnimation(
                    delay: 2,
                    child: SizedBox(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Copy Link",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                      fontFamily: "Poppins-SemiBold",
                                      fontWeight: FontWeight.w600,
                                      wordSpacing: 2)),
                              SizedBox(width: 8.w),
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.skewY(-0.4),
                                child: const Icon(
                                  Icons.link,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  FadeAnimation(
                    delay: 2.5,
                    child: SizedBox(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xfff1f0ec),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                        child: Text("Back to Home",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontFamily: "Poppins-SemiBold",
                                fontWeight: FontWeight.w600,
                                wordSpacing: 2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
