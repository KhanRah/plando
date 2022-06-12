
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plando/modals/service_requests_modal.dart';
import 'package:plando/repos/remote_repo/list_view_remote_repo.dart';
import 'package:plando/utilities/http_manager.dart';
import 'package:plando/utilities/url_provider.dart';

class ListViewRemoteRepoImplementation implements ListViewRemoteRepo {


  @override
  Future getServiceRequests() async{
    try {
      String data = await rootBundle.loadString("jsons/service_requests.json");
      final jsonResult = jsonDecode(data);
      final serviceRequests = serviceRequestsFromMap(jsonEncode(jsonResult['result']));
      return serviceRequests;
    } catch(exception) {
      debugPrint("Exception: $exception");
      return exception;
    }
  }

}