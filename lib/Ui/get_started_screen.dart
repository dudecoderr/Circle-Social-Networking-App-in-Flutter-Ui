import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/fade_animation.dart';
import '../string constant/text_constant.dart';
import 'home_screen.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffffa380),
            Color(0xffff8461),
            Color(0xffee7656),
            Color(0xffee7656),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    FadeAnimation(
                        delay: 1,
                        child: Container(
                          child: Image.asset(
                            "assets/home_img_1.png",
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(height: 40.h),
                    FadeAnimation(
                      delay: 1.5,
                      child: FittedBox(
                        child: Text(tital,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28.sp,
                                color: Colors.white,
                                fontFamily: "Poppins-SemiBold",
                                fontWeight: FontWeight.w600,
                                wordSpacing: 1)),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    FadeAnimation(
                      delay: 2,
                      child: FittedBox(
                        child: Text(titalSub,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: "Poppins-Regular",
                              color: Colors.white70,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FadeAnimation(
              delay: 2.5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: SizedBox(
                    height: 65.h,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      ),
                      child: Text(Get_Started,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontFamily: "Poppins-SemiBold",
                              fontWeight: FontWeight.w600,
                              wordSpacing: 2)),
                    ),
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
