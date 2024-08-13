import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kitchen_app/main.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/divider/gradient_divider.dart';
import 'package:kitchen_app/views/components/widgets/primary_appbar.dart';
import 'package:kitchen_app/views/components/widgets/primary_container.dart';

class Manageaddress extends StatefulWidget {
  const Manageaddress({super.key});

  @override
  State<Manageaddress> createState() => _ManageaddressState();
}

class _ManageaddressState extends State<Manageaddress> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(29.1492, 75.7217);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  // ignore: unused_element
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  // ignore: unused_element
  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    ///Helpers
    var data = alldataManager;
    return Scaffold(
      appBar: PrimaryAppBar(
        titleText: LanguageConsts.manageA.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PrimaryContainer(
                  shadow: true,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.toNamed(Routesname.AddAddress);
                        },
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 10,
                        leading: Image.asset(
                          data.geticons.plus,
                          width: 30,
                        ),
                        title: Text(
                          LanguageConsts.addA.tr,
                          style: data.gettexttheme.fs16_regular
                              .copyWith(color: data.getcolor.primaryColor),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                      GradientDivider(
                        data: data,
                        middleGradient: true,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 10,
                        leading: Image.asset(
                          data.geticons.address,
                          width: 25,
                        ),
                        title: Text(
                          LanguageConsts.addA.tr,
                          style: data.gettexttheme.fs16_regular
                              .copyWith(color: data.getcolor.primaryColor),
                        ),
                        subtitle: Text(
                          "Rishi Nagar, Hisar",
                          style: data.gettexttheme.fs14_regular,
                        ),
                      ),
                    ],
                  )),
              AppServices.addHeight(20),
              Row(
                children: [
                  Expanded(child: GradientDivider(data: data)),
                  Text(
                    LanguageConsts.savedA.tr,
                    style: data.gettexttheme.fs12_regular,
                  ),
                  Expanded(child: GradientDivider(data: data))
                ],
              ),
              AppServices.addHeight(20),
              PrimaryContainer(
                  shadow: true,
                  child: Column(
                    children: [
                      Container(
                        height: 110,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: _center,
                              zoom: 18.0,
                            ),
                            mapType: _currentMapType,
                            markers: _markers,
                            onCameraMove: _onCameraMove,
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 10,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.home_outlined,
                              size: 30,
                            ),
                          ],
                        ),
                        title: Text("Kitchen",
                            style: data.gettexttheme.fs16_regular),
                        subtitle: Text(
                          "House number 42, Sharma gali, Shastri Nagar, Hisar",
                          style: data.gettexttheme.fs14_regular,
                        ),
                        trailing: Icon(
                          Icons.edit,
                          color: data.getcolor.primaryColor,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
