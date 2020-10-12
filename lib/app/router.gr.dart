// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/home/home_v.dart';
import '../screens/sign_in/sign_in_view.dart';

class Routes {
  static const String homePageView = '/homePageViewRoute';
  static const String signPageView = 'signUpViewRoute';
  static const all = <String>{
    homePageView,
    signPageView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePageView, page: HomePageView),
    RouteDef(Routes.signPageView, page: SignPageView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePageView(),
        settings: data,
      );
    },
    SignPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignPageView(),
        settings: data,
      );
    },
  };
}
