import 'package:dashboard/dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation/src/route_configuration.dart';

class AppRouteInformationParser extends RouteInformationParser<RouteConfiguration> {
  bool isStartUp = true;
  Uri? initialUri;

  @override
  Future<RouteConfiguration> parseRouteInformation(RouteInformation routeInformation) {
    Uri? uri;
    if (isStartUp && initialUri != null) {
      uri = initialUri;
      isStartUp = false;
    } else {
      uri = Uri?.tryParse(routeInformation.location.toString());
    }
    late Page<dynamic> page;

    if (uri == null) {
      page = DashboardFeature.page();
    } else {
      final List<String> uriSegments = uri.pathSegments;
      if (uriSegments.isEmpty) {
        page = DashboardFeature.page();
      }
      if (uriSegments.length == 1) {
        if (uriSegments[0] == 'home') {
          page = DashboardFeature.page();
        }
      }
    }

    return SynchronousFuture<RouteConfiguration>(
      RouteConfiguration(page: page),
    );
  }
}
