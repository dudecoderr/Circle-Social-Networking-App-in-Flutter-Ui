import 'package:circle_social_networking_app_in_flutter/Ui/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/fade_animation.dart';
import '../string constant/text_constant.dart';
import 'invite_profile_friends_screen.dart';

class InviteShowDilodScreen extends StatefulWidget {
  final String? description;

  const InviteShowDilodScreen({Key? key, this.description}) : super(key: key);

  @override
  State<InviteShowDilodScreen> createState() => _InviteShowDilodScreenState();
}

class _InviteShowDilodScreenState extends State<InviteShowDilodScreen> {
  int _value = 20;
  String dataBack = " ";
  bool selected = false;

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await showDialog(
      context: context,
      barrierColor: Colors.white12, // set barrier color here
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          insetPadding: EdgeInsets.all(20),
          child: InviteProfileFriendsScreen(),
        );
      },
    );
    if (result != null) {
      setState(() {
        dataBack = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 540.h,
        width: 350.w,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                delay: 1,
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "3",
                        style: TextStyle(
                            color: Color(0xffff8561),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins-Light"),
                        children: <TextSpan>[
                          TextSpan(
                              text: "/",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Poppins-Light")),
                          TextSpan(
                              text: "3",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Poppins-Light")),
                        ],
                      ),
                    ),
                    Spacer(),
                    Align(
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
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              FadeAnimation(
                delay: 1.5,
                child: Text(
                  invite_text,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontFamily: "Poppins-Bold"),
                ),
              ),

              SizedBox(height: 15.h),
              FadeAnimation(
                delay: 2,
                child: Text(
                  Invite_Friends,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins-SemiBold"),
                ),
              ),
              SizedBox(height: 15.h),

              ///______________________ text field ___________________
              FadeAnimation(
                  delay: 2.5,
                  child: InkWell(
                    onTap: () {
                      _navigateAndDisplaySelection(context);
                      selected = true;
                    },
                    child: selected
                        ? Container(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SingleChildScrollView(
                                child: Text(
                                  ("$dataBack"),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.sp),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Add Your Friend",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                  )),

              SizedBox(height: 25.h),
              FadeAnimation(
                delay: 3,
                child: Row(
                  children: [
                    Text(
                      Limit_Circle,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins-SemiBold"),
                    ),
                    Spacer(),
                    Text(
                      _value.toString(),
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins-SemiBold"),
                    ),
                    SizedBox(width: 3),
                    Text(
                      "People",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins-SemiBold"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              FadeAnimation(
                delay: 3.5,
                child: Container(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Slider(
                    value: _value.toDouble(),
                    min: 10.0,
                    max: 200.0,
                    activeColor: Colors.deepOrange,
                    inactiveColor: Colors.deepOrange,
                    thumbColor: Colors.black,
                    onChanged: (double newvalue) {
                      setState(() {
                        _value = newvalue.round();
                      });
                    },
                    semanticFormatterCallback: (double newvalue) {
                      return "${newvalue.round()} dollars";
                    },
                  ),
                ),
              ),

              SizedBox(height: 45.h),

              ///__________ btn

              FadeAnimation(
                delay: 4,
                child: SizedBox(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        barrierColor: Colors.white12,
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
                            content: Success_Screen(),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    child: Text("Continue",
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
              SizedBox(height: 10.h),
              FadeAnimation(
                delay: 4.5,
                child: SizedBox(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xfff1f0ec),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    child: Text("Cancel",
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
      ),
    );
  }
}
