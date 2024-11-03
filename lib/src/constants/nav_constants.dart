import 'package:pricing_calculator/src/router/routes.dart';

List<Map<String, dynamic>> navOptions = [
  {
    "icon": "assets/images/dashboard_icon.png",
    "label": "Home",
    "route": Routes.home
  },
];

class AppNavigationItemModel {
  final String label;
  final String route;

  AppNavigationItemModel({required this.label, required this.route});
}

List<AppNavigationItemModel> navigationItems = [
  AppNavigationItemModel(
    route: Routes.home,
    label: 'Home',
  ),
  AppNavigationItemModel(
    route: Routes.features,
    label: 'Features',
  ),
  AppNavigationItemModel(
    route: Routes.pricingCalculator,
    label: 'Pricing Calculator',
  ),
  AppNavigationItemModel(
    route: Routes.benefits,
    label: 'Benefits',
  ),
  AppNavigationItemModel(
    route: Routes.testimonials,
    label: 'Testimonials',
  ),
  AppNavigationItemModel(
    route: Routes.faqs,
    label: 'FAQs',
  ),
  AppNavigationItemModel(
    route: Routes.contact,
    label: 'Contact Us',
  ),
];
