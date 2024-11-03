// ignore_for_file: unused_local_variable

import 'package:go_router/go_router.dart';
import 'package:pricing_calculator/src/features/landing/presentation/screens/landing_screen.dart';
import 'package:pricing_calculator/src/router/route_names.dart';
import 'package:pricing_calculator/src/router/routes.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      name: RouteNames.home,
      builder: (context, state) => const LandingScreen(),
    ),
    // GoRoute(
    //   path: Routes.features,
    //   name: RouteNames.features,
    //   builder: (context, state) {
    //     // Check if we should prevent scrolling
    //     final preventScroll =
    //         (state.extra as Map<String, dynamic>?)?['preventScroll'] ?? false;
    //     return const LandingScreen();
    //   },
    // ),
    // GoRoute(
    //   path: Routes.pricingCalculator,
    //   name: RouteNames.pricingCalculator,
    //   builder: (context, state) {
    //     final preventScroll =
    //         (state.extra as Map<String, dynamic>?)?['preventScroll'] ?? false;
    //     return const LandingScreen();
    //   },
    // ),
    // GoRoute(
    //   path: Routes.benefits,
    //   name: RouteNames.benefits,
    //   builder: (context, state) {
    //     final preventScroll =
    //         (state.extra as Map<String, dynamic>?)?['preventScroll'] ?? false;
    //     return const LandingScreen();
    //   },
    // ),
    // GoRoute(
    //   path: Routes.testimonials,
    //   name: RouteNames.testimonials,
    //   builder: (context, state) {
    //     final preventScroll =
    //         (state.extra as Map<String, dynamic>?)?['preventScroll'] ?? false;
    //     return const LandingScreen();
    //   },
    // ),
    // GoRoute(
    //   path: Routes.faqs,
    //   name: RouteNames.faqs,
    //   builder: (context, state) {
    //     final preventScroll =
    //         (state.extra as Map<String, dynamic>?)?['preventScroll'] ?? false;
    //     return const LandingScreen();
    //   },
    // ),
    // GoRoute(
    //   path: Routes.contact,
    //   name: RouteNames.contact,
    //   builder: (context, state) {
    //     final preventScroll =
    //         (state.extra as Map<String, dynamic>?)?['preventScroll'] ?? false;
    //     return const LandingScreen();
    //   },
    // ),
  ],
);
