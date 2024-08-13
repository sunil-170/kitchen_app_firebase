import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kitchen_app/res/config/App_services/app_services.dart';
import 'package:kitchen_app/res/utils/helper/app_config.dart';
import 'package:kitchen_app/view_model/translations.dart';
import 'package:kitchen_app/views/components/buttons/primary_button.dart';
import 'package:kitchen_app/views/components/textFields/primary_text_field.dart';

import 'package:kitchen_app/views/screens/search/widget/common_txtfilled.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
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

  //-----------------------Controllers-------------------------------//
  final TextEditingController _Housecontrollers = TextEditingController();
  final TextEditingController _Addresstittle = TextEditingController();
  final TextEditingController _Contactname = TextEditingController();
  final TextEditingController _Cantactnum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CommonTextformfilled(
            text: LanguageConsts.Mansftasa.tr,
            icon: Icons.search,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppServices.addHeight(10),
            Container(
              height: AppConfig.screenHeight / 2.2,
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
            AppServices.addHeight(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Column(
                    children: [
                      PrimaryTextField(
                        controller: _Housecontrollers,
                        title: LanguageConsts.HouseNoBN.tr,
                        hintText: LanguageConsts.HouseNoBN.tr,
                      ),
                      AppServices.addHeight(15),
                      PrimaryTextField(
                        controller: _Addresstittle,
                        title: LanguageConsts.AddressT.tr,
                        hintText: LanguageConsts.AddressT.tr,
                      ),
                    ],
                  ),
                  AppServices.addHeight(15),
                  Row(
                    children: [
                      PrimaryTextField(
                        controller: _Contactname,
                        isExpanded: true,
                        title: LanguageConsts.ContactN.tr,
                        hintText: LanguageConsts.ContactN.tr,
                      ),
                      AppServices.addWidth(10),
                      PrimaryTextField(
                        controller: _Cantactnum,
                        isExpanded: true,
                        title: LanguageConsts.ContactNumber.tr,
                        hintText: "91+",
                      ),
                    ],
                  ),
                  AppServices.addHeight(10),
                  Row(
                    children: [
                      Expanded(
                          child: PrimaryButton(
                              title: LanguageConsts.savedA.tr,
                              onPressed: () {})),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
