import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constant File/interest_list_container.dart';
import '../animation/fade_animation.dart';
import '../string constant/text_constant.dart';
import 'age_range_show_dilog box.dart';

class ShowDialogContainer extends StatefulWidget {
  const ShowDialogContainer({Key? key}) : super(key: key);

  @override
  State<ShowDialogContainer> createState() => _ShowDialogContainerState();
}

class _ShowDialogContainerState extends State<ShowDialogContainer> {
  var currentIndexlist = 0;

  @override
  void initState() {
    super.initState();
  }

  ///__________________________ select dialog box container class ____________________
  Future<void> _openFilterDialog() async {
    await showDialog<void>(
      barrierColor: Colors.white12,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          insetPadding: EdgeInsets.all(20),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 540.h,
                width: 350.w,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        SizedBox(width: 8.w),
                        const Text(
                          'Interested Users',
                          style: TextStyle(fontSize: 24, color: Colors.black),
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
                        SizedBox(width: 8.w),
                      ],
                    ),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.5,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final user = userList[index];
                          return InkWell(
                            onTap: () {
                              if (userList[index].isSelected) {
                                print("select___${userList[index].name}");
                                userList[index].isSelected = false;
                                selectedUserList.remove(userList[index]);
                              } else if (selectedUserList.length < 3) {
                                // User is not selected and limit not reached, so select
                                userList[index].isSelected = true;
                                selectedUserList.add(userList[index]);
                              }
                              setState(() {});
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: userList[index].isSelected == true
                                    ? Colors.deepOrange.shade100
                                    : Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.r)),
                              ),
                              child: Center(
                                child: FittedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        user.avatar!,
                                        style: TextStyle(fontSize: 18.sp),
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        user.name!,
                                        style: TextStyle(
                                            color: userList[index].isSelected ==
                                                    true
                                                ? Colors.deepOrange
                                                : Colors.black,
                                            fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: userList.length,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        height: 45.h,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Save Changes',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      text: "1",
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
                              fontFamily: "Poppins-Light"),
                        ),
                        TextSpan(
                          text: "2",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Poppins-Light"),
                        ),
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
            SizedBox(height: 8.h),
            FadeAnimation(
              delay: 1.5,
              child: FittedBox(
                child: Text(
                  dialog_text,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontFamily: "Poppins-Bold"),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            FadeAnimation(
              delay: 2,
              child: Text(
                Tittle,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins-SemiBold"),
              ),
            ),
            SizedBox(height: 8.h),
            FadeAnimation(
                delay: 2.5,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      counterText: '',
                      hintText: Tittle_sub,
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true),
                )),
            SizedBox(height: 10.h),
            FadeAnimation(
              delay: 3,
              child: Row(
                children: [
                  Text(
                    Interest,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontFamily: "Poppins-SemiBold"),
                  ),
                  Spacer(),
                  Obx(() {
                    selectedUserList.value;
                    return InkWell(
                      onTap: _openFilterDialog,
                      child: Row(
                        children: [
                          Text(
                            '${selectedUserList.length}/3',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.grey,
                                fontFamily: "Poppins-Bold"),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffff8561),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 8.h),

            ///__________________============ select container ==============____________
            FadeAnimation(
              delay: 3.5,
              child: SizedBox(
                height: 40.h,
                child: Obx(() {
                  selectedUserList.value;
                  return Column(
                    children: <Widget>[
                      if (selectedUserList.isEmpty)
                        const Expanded(
                          child: Center(
                            child: Text(
                              'No user selected',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 35.h,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange.shade100
                                      .withOpacity(0.55),
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      // count.value,
                                      selectedUserList[index].avatar!,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      selectedUserList[index].name!,
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          color: Color(0xffff8561),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Poppins-Regular"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: selectedUserList!.length,
                          ),
                        ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: 8.h),
            FadeAnimation(
              delay: 4,
              child: Text(
                Location,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins-SemiBold"),
              ),
            ),
            SizedBox(height: 8.h),
            FadeAnimation(
              delay: 4.2,
              child: Container(
                height: 75.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                        image: AssetImage("assets/map.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 20.h),
            FadeAnimation(
              delay: 4.5,
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
                          content: AgeRangeShowDilog(),
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
              delay: 4.6,
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
    );
  }
}

///__________________________ select dialog box container code ____________________
/*
class FilterPage extends StatelessWidget {
  FilterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilterListWidget<User>(
        themeData: FilterListThemeData(context),
        hideSelectedTextCount: true,
        listData: userList,
        backgroundColor: Colors.orange,
        selectedListData: selectedUserList,
        onApplyButtonClick: (list) {
          Navigator.pop(context, list);
        },
        choiceChipLabel: (item) {
          return item!.name;
        },
        validateSelectedItem: (list, val) {
          return list!.contains(val);
        },
        onItemSearch: (user, query) {
          return user.name!.toLowerCase().contains(query.toLowerCase());
        },
      ),
    );
  }
}
*/
