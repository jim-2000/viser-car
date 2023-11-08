import 'dart:async';
import 'package:customer/core/utils/my_icons.dart';
import 'package:customer/data/model/general_setting/general_setting_response_model.dart';
import 'package:customer/data/repo/home/home_repo.dart';
import 'package:customer/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  HomeRepo homeRepo;
  HomeController({required this.homeRepo});

  String email = "";
  bool isLoading = true;
  String username = "";
  String siteName = "";
  String imagePath = "";
  String defaultCurrency = "";
  String currentAddress = "Loading...";
  String defaultCurrencySymbol = "";
  Position? currentPosition;

  GeneralSettingResponseModel generalSettingResponseModel = GeneralSettingResponseModel();

  Future<void> initialData({bool shouldLoad = true}) async {
    isLoading = shouldLoad ? true : false;
    update();
    checkPermission();
    // loadData();
    isLoading = false;
    update();
  }

  List<String> serviceName = [
    "Moto",
    "Ride",
    "Intercity",
    "Parcel",
  ];
  List<String> serviceicon = [
    MyIcons.moto,
    MyIcons.car,
    MyIcons.intercityCar,
    MyIcons.parcel,
  ];
  Future<void> loadData() async {
    defaultCurrency = homeRepo.apiClient.getCurrencyOrUsername();
    username = homeRepo.apiClient.getCurrencyOrUsername(isCurrency: false);
    email = homeRepo.apiClient.getUserEmail();
    defaultCurrencySymbol = homeRepo.apiClient.getCurrencyOrUsername(isSymbol: true);
    generalSettingResponseModel = homeRepo.apiClient.getGSData();
    siteName = generalSettingResponseModel.data?.generalSetting?.siteName ?? "";
  }

  String selectedId = "";

  selectService(String id) {
    selectedId = id;
    update();
  }

  Position? position;
  checkPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request().then((value) async {
        getCurrentLocation();
      }).onError((error, stackTrace) {
        CustomSnackBar.error(errorList: ["Please us your location permission"]);
      });
    } else {
      getCurrentLocation();
    }
  }

//changed: access user location before controller initialize
  Future<void> getCurrentLocation() async {
    currentAddress = "";
    update();
    try {
      final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
      currentPosition = await geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
      ));
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition!.latitude,
        currentPosition!.longitude,
      );
      currentAddress = "${placemarks[0].street} ${placemarks[0].subThoroughfare} ${placemarks[0].thoroughfare},${placemarks[0].subLocality},${placemarks[0].locality},${placemarks[0].country}";
      update();
    } catch (e) {
      print("Error>>>>>>>: $e");
      CustomSnackBar.error(errorList: ["Something went wrong while Taking Location"]);
    }
  }
}
//info: Placemark data type
//Name: House -62,
//Street: House -62 Road No. 20,
//ISO Country Code: BD,
//Country: Bangladesh,
//Postal code: 1230,
//Administrative area: Dhaka Division,
//Subadministrative area: Dhaka District,
//Locality: Dhaka,
//Sublocality: Uttara,
//Thoroughfare: Road Number 20,
//Subthoroughfare: House -62
