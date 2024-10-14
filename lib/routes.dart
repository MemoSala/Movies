import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/app_route.dart';
import 'view/pages/All Vedio/all_vedio.dart';
import 'view/pages/Trailer/Trailer.dart';
import 'view/pages/Sing/sing.dart';
import 'bridge.dart';
import 'view/pages/movie/movie.dart';

final List<GetPage<Widget>> routes = <GetPage<Widget>>[
  GetPage(name: AppRoute.bridge, page: () => const Bridge()),
  GetPage(name: AppRoute.trailer, page: () => const Trailer()),
  GetPage(name: AppRoute.movie, page: () => const Movie()),
  GetPage(name: AppRoute.vedios, page: () => const AllVedio()),
  GetPage(name: AppRoute.sing, page: () => const Sing()),
];
