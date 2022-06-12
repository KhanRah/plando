
import 'package:flutter/material.dart';
import 'package:plando/bloc/base_bloc.dart';

class HomeBloc implements BaseBloc {

  static final HomeBloc _homeBloc = new HomeBloc.internal();

  HomeBloc.internal();

  factory HomeBloc() => _homeBloc;

  GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    scaffoldKey = GlobalKey();
  }

}