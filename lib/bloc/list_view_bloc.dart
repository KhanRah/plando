
import 'package:flutter/material.dart';
import 'package:plando/bloc/base_bloc.dart';
import 'package:plando/modals/service_requests_modal.dart';
import 'package:plando/repos/remote_repo/list_view_remote_repo.dart';
import 'package:plando/repos/remote_repo/listview_remote_repo_implementation.dart';
import 'package:plando/utilities/http_manager.dart';
import 'package:rxdart/rxdart.dart';

class ServiceRequestsBloc implements BaseBloc{

  static final ServiceRequestsBloc _requestsBloc = ServiceRequestsBloc.internal();

  ServiceRequestsBloc.internal();

  factory ServiceRequestsBloc() => _requestsBloc;

  late ListViewRemoteRepo _remoteRepo;

  late BehaviorSubject<List<ServiceRequests>> requestsController;
  Stream<List<ServiceRequests>> get streamRequests => requestsController.stream;

  late BehaviorSubject<List<ServiceRequests>?> filteredSearch;
  Stream<List<ServiceRequests>?> get streamFiltered => filteredSearch.stream;

  late BehaviorSubject<String> exceptionStreamer;
  Stream<String> get streamException => exceptionStreamer.stream;

  TextEditingController? searchPeople;

  @override
  void dispose() {
    requestsController.close();
    filteredSearch.close();
    exceptionStreamer.close();
    searchPeople!.dispose();
  }

  @override
  void init() {
    _remoteRepo = ListViewRemoteRepoImplementation();
    requestsController = BehaviorSubject();
    exceptionStreamer = BehaviorSubject();
    filteredSearch = BehaviorSubject();
    searchPeople = TextEditingController();
    getEmployeesData();
  }

  getEmployeesData() async
  {
    List<ServiceRequests> employees = [];
    var data = await _remoteRepo.getServiceRequests();
    if(data.runtimeType == UnauthorisedException)
    {
      // logoutUser(context);
      debugPrint("Should be Logged Out");
    }
    else if(data.runtimeType == employees.runtimeType)
    {
      requestsController.sink.add(data);
    }
    else
    {
      exceptionStreamer.sink.add("Something went wrong, " + data.toString());
    }
  }

  searchMember(String value,List<ServiceRequests>? employees) {
    debugPrint("Value $value and list $employees");
    List<ServiceRequests>? list = employees;
    if(value != null  ||  value.isNotEmpty) {
      List<ServiceRequests> filteredList = list!.where((ServiceRequests person) => person.title!.toLowerCase().contains(value.toLowerCase())).toList();
      filteredSearch.sink.add(filteredList);
    } else {
      debugPrint("Hmm");
      filteredSearch.sink.add(list);
    }
  }

}
