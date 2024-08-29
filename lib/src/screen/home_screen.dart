import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_service/src/core/widget/button.dart';
import 'package:permission_service/src/core/widget/gap.dart';
import 'package:permission_service/src/service/image_service.dart';
import 'package:permission_service/src/service/permission_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const GapH(20),
              Button(
                text: 'Image Pick From Camera',
                onPressed: () => _imagePickFromCamera(context),
              ),
              const GapH(20),
              Button(
                text: 'Image Pick From Gallery',
                onPressed: () => _imagePickFromGallery(context),
              ),
              const GapH(20),
              Button(
                text: 'Location Permission',
                onPressed: () => _locationPermission(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _imagePickFromCamera(BuildContext context) {
    ImageService.pickImage(context: context, source: ImageSource.camera);
  }

  void _imagePickFromGallery(BuildContext context) {
    ImageService.pickImage(context: context, source: ImageSource.gallery);
  }

  void _locationPermission(BuildContext context) async {
    bool isLocationPermission =
        await PermissionService.requestLocationPermission(context);
    if (isLocationPermission) {
      try {
        final isServiceEnable = await Geolocator.isLocationServiceEnabled();
        log(isServiceEnable.toString(), name: 'isServiceEnabled');
        final latlng = await Geolocator.getCurrentPosition();
        log(latlng.toString(), name: 'Latlng');
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
