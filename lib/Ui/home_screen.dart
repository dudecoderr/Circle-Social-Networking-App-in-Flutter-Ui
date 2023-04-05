import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Constant File/categorys_container_constant.dart';
import '../animation/fade_animation.dart';
import '../string constant/text_constant.dart';
import 'bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 11.0;

  ///_______________ bottom ___________________
  List<IconData> listOfIcons = [
    Icons.home_outlined,
    Icons.search,
    Icons.email_outlined,
  ];

  var currentIndex = 0;
  var currentbottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: Stack(
          children: <Widget>[
            _buildGoogleMap(context),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45, right: 20, left: 20),
                  child: Column(
                    children: [
                      FadeAnimation(
                        delay: 1,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 250.w,
                              height: 50.h,
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.location_on,
                                    color: Color(0xffee7656),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.black,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(50.r)),
                                  hintText: search,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                height: 50.h,
                                width: 50.h,
                                child: const Icon(
                                  Icons.menu,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),

                /// ______________ category list ________________
                FadeAnimation(
                  delay: 1.5,
                  child: Container(
                    height: 55,
                    child: ListView.builder(
                      itemCount: categoryList.length,
                      scrollDirection: Axis.horizontal,
                      // padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: index == currentIndex
                                          ? Color(0xffee7656)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          categoryList[index].emoji!,
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          categoryList[index].titles!,
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: index == currentIndex
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins-Regular"),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            _buildContainer(),

            ///_____________ bottom code ________________
            SizedBox(height: 10),
            BottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 100.0),
        height: 100.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  Icons.location_on, 18.922370, 72.834504, "UXID Santuy"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  _boxes(Icons.location_on, 18.982990, 72.808954, "UI Meetup"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  Icons.location_on, 19.017049, 72.830228, "UXID Santuy"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  _boxes(Icons.location_on, 19.099074, 72.826454, "UI Meetup"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  Icons.location_on, 18.941693, 72.823619, "UXID Santuy"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  _boxes(Icons.location_on, 19.099095, 72.826459, "UI Meetup"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(
      IconData? icon, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: FadeAnimation(
        delay: 1.5,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50.r)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "🎨",
                  style: TextStyle(fontSize: 25.sp),
                ),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      restaurantName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins-Regular"),
                    ),
                    Text(
                      "6/10 joined",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 5.w),
                Container(
                  height: 50.h,
                  width: 50.h,
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
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(18.922370, 72.834504), zoom: 11),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          UXID_Santuy1Marker,
          UI_Meetup1Marker,
          UXID_Santuy2Marker,
          UI_Meetup2Marker,
          UXID_Santuy3Marker,
          UI_Meetup3Marker,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker UXID_Santuy1Marker = Marker(
  markerId: MarkerId('UXID Santuy'),
  position: LatLng(18.922370, 72.834504),
  infoWindow: InfoWindow(title: 'UXID Santuy'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker UI_Meetup1Marker = Marker(
  markerId: MarkerId('UI Meetup'),
  position: LatLng(18.982990, 72.808954),
  infoWindow: InfoWindow(title: 'UI Meetup'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);
Marker UXID_Santuy2Marker = Marker(
  markerId: MarkerId('UXID Santuy'),
  position: LatLng(19.017049, 72.830228),
  infoWindow: InfoWindow(title: 'UXID Santuy'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker UI_Meetup2Marker = Marker(
  markerId: MarkerId('UI Meetup'),
  position: LatLng(19.099074, 72.826454),
  infoWindow: InfoWindow(title: 'UI Meetup'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);
Marker UXID_Santuy3Marker = Marker(
  markerId: MarkerId('UXID Santuy'),
  position: LatLng(18.941693, 72.823619),
  infoWindow: InfoWindow(title: 'UXID_Santuy'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Marker UI_Meetup3Marker = Marker(
  markerId: MarkerId('UI Meetup'),
  position: LatLng(19.099095, 72.826459),
  infoWindow: InfoWindow(title: 'UI Meetup'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueOrange,
  ),
);

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you want to exit?",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('yes selected');
                          exit(0);
                        },
                        child: const Text("Yes",
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffee7656)),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        print('no selected');
                        Navigator.of(context).pop();
                      },
                      child: const Text("No",
                          style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
