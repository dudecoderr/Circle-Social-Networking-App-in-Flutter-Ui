import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/fade_animation.dart';
import '../string constant/text_constant.dart';
import 'invite_show_dilog_box.dart';

class AgeRangeShowDilog extends StatefulWidget {
  const AgeRangeShowDilog({Key? key}) : super(key: key);

  @override
  State<AgeRangeShowDilog> createState() => _AgeRangeShowDilogState();
}

class _AgeRangeShowDilogState extends State<AgeRangeShowDilog> {
  int timeIndexSelected = 1;

  final List<String> time = [
    "16-18",
    "18-25",
    "25-40",
    "40+",
  ];

  int _value = 31;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 540.h,
        width: 350.w,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          // color: Colors.red.shade200,
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
                        text: "2",
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
                    const Spacer(),
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
              SizedBox(height: 20.h),
              FadeAnimation(
                delay: 1.5,
                child: Text(
                  age_tital,
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
                  Age_Range,
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins-SemiBold"),
                ),
              ),
              SizedBox(height: 15.h),

              ///______________________ select container  ___________________
              FadeAnimation(
                delay: 2.5,
                child: SizedBox(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: time.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            timeIndexSelected = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Container(
                            height: 35.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.sp),
                                border: Border.all(
                                  color: index == timeIndexSelected
                                      ? Colors.white
                                      : Colors.grey.shade300,
                                ),
                                color: timeIndexSelected == index
                                    ? Colors.deepOrange.withOpacity(0.6)
                                    : Colors.white),
                            child: Center(
                                child: Text(time[index],
                                    style: TextStyle(
                                        color: index == timeIndexSelected
                                            ? Colors.white
                                            : Colors.grey,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700))),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              FadeAnimation(
                delay: 3,
                child: Row(
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      Circle_Distance,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins-SemiBold"),
                    ),
                    const Spacer(),

                    ///___________________ km change in slider scroll
                    Text(
                      _value.toString(),
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins-SemiBold"),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      "Km",
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
                    min: 1.0,
                    max: 200.0,
                    activeColor: Colors.deepOrange,
                    inactiveColor: Colors.deepOrange,
                    thumbColor: Colors.black,
                    onChanged: (double newvalue) {
                      print(newvalue);
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

              SizedBox(height: 60.h),

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
                            content: InviteShowDilodScreen(),
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

              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
