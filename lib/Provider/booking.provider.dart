import 'dart:convert';
import 'package:audio_probe/Dio/api_response.dart';
import 'package:audio_probe/Dio/dio_client.dart';
import 'package:audio_probe/Models/clients.model.dart';
import 'package:audio_probe/Navigation/nav.dart';
import 'package:audio_probe/Values/values.dart';
import 'package:audio_probe/repo.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingProvider with ChangeNotifier {
  final Repo repo;
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  final NavigationService ns;
  BookingProvider({
    required this.dioClient,
    required this.repo,
    required this.sharedPreferences,
    required this.ns,
  });
  int _page = 1;
  late int totalPages;
  final int _limit = 15;
  late List<Datum> patientdata = [];
  final RefreshController refreshCntrlr =
      RefreshController(initialRefresh: true);
  final TextEditingController searchController = TextEditingController();
  final TextEditingController fNController = TextEditingController();
  final TextEditingController lNController = TextEditingController();
  final TextEditingController aDController = TextEditingController();
  final TextEditingController aGController = TextEditingController();

  Future getlistofAppointments({
    bool isRefresh = false,
    required BuildContext context,
  }) async {
    var search = searchController.text;
    if (isRefresh) {
      _page = 1;
    } else {
      if (_page >= totalPages) {
        refreshCntrlr.loadNoData();
        return false;
      }
    }
    ApiResponse? res = await repo.getData(
        "${StringConst.LIST_OF_CLIENTS}?page=$_page&size=$_limit&name=$search");
    if (res.response?.data != null && res.response!.statusCode == 200) {
      final clientsModel = ClientsModel.fromJson(res.response?.data);
      if (isRefresh) {
        patientdata = clientsModel.data!;
      } else {
        patientdata.addAll(clientsModel.data!);
      }
      _page++;
      totalPages = clientsModel.totalPages!;
      notifyListeners();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<void> addAppointments(
      {required BuildContext context,
      required int userId,
      required String firstname,
      required String lastname,
      required String gender,
      required String age,
      required String mobile,
      required String address,
      required int eventid}) async {
    final Map<String, dynamic> data = {
      "firstName": firstname,
      "lastName": lastname,
      "gender": gender,
      "age": age,
      "mobile": mobile,
      "address": address,
      "userId": userId
    };
    ApiResponse? res =
        await repo.postData(StringConst.ADD_CLIENT, data: jsonEncode(data));
    if (res.response?.data["response"] == "success" &&
        res.response?.statusCode == 200) {
      Alerts.showSuccess(res.response?.data["message"]);
      Navigator.pop(context, true);
    } else if (res.error != "401") {
      Alerts.showError(res.error);
    }
  }
}
