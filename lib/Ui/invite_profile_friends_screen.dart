import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constant File/friend_list_constant.dart';
import '../animation/fade_animation.dart';
import '../string constant/text_constant.dart';

class InviteProfileFriendsScreen extends StatefulWidget {
  const InviteProfileFriendsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<InviteProfileFriendsScreen> createState() =>
      _InviteProfileFriendsScreenState();
}

class _InviteProfileFriendsScreenState
    extends State<InviteProfileFriendsScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: 360.w,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        // color: Colors.red.shade200,
        borderRadius: new BorderRadius.all(new Radius.circular(25.r)),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  delay: 1,
                  child: Row(
                    children: [
                      Text(
                        Invite_Friends,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins-SemiBold"),
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

                SizedBox(height: 15.h),

                ///______________________ text field ___________________
                FadeAnimation(
                  delay: 1.5,
                  child: Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50.r)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        contacts[currentIndex].description,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeAnimation(
            delay: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: contacts.length,
                  scrollDirection: Axis.vertical,
                  physics: PageScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return Container(
                      child: InkWell(
                        onTap: () {
                          print("select___${contacts[index].description}");
                          setState(() {
                            currentIndex = index;

                            contacts[index].isSelected =
                                !contacts[index].isSelected;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(contacts[index].img),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(width: 5.w),
                            FittedBox(
                              child: Text(
                                contacts[index].description,
                                style: TextStyle(
                                    fontFamily: "Poppins-Regular",
                                    color: Colors.grey[600],
                                    fontSize: 13.sp),
                              ),
                            ),
                            Spacer(),
                            FittedBox(
                              child: Container(
                                height: 30.h,
                                width: 55.w,
                                decoration: BoxDecoration(
                                    color: contacts[index].isSelected == true
                                        ? Colors.grey[300]
                                        : Colors.black,
                                    borderRadius: BorderRadius.circular(50.r)),
                                child: Center(
                                  child: Text(
                                    contacts[index].isSelected == true
                                        ? "Added"
                                        : "+ Add",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Regular",
                                        /*   color: index == currentIndex
                                            ? Colors.black
                                            : Colors.white,*/
                                        color:
                                            contacts[index].isSelected == true
                                                ? Colors.black
                                                : Colors.white,
                                        fontSize: 13.sp),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 18.h);
                  },
                ),
              ),
            ),
          ),

          ///__________ btn _______________
          Padding(
            padding: const EdgeInsets.all(2),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FadeAnimation(
                delay: 2.5,
                child: SizedBox(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context, contacts[currentIndex].description);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    child: Text("Save Changes",
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
    );
  }
}
