import 'package:pricing_calculator/src/constants/assets.dart';

class StringConstants {
  static String heroTitle =
      "Simplify Your Pricing Strategy – An App Tailored for SMEs";

  static String herosubTitle =
      "Optimize your prices and boost your profits with automated calculations.";
  static String featuresTitle = "Our Key Features";
  static String featuresubtitle =
      "Explore how we help businesses across various industries achieve growth, optimize operations, and navigate challenges with our expert consulting services.";

  static List<Map<String, dynamic>> features = [
    {
      'title': 'Instant Price Calculations',
      'description':
          'Input your costs and instantly receive an accurate price based on your desired profit margin. No complex calculations needed!'
    },
    {},
    {},
    {
      'title': 'Real-Time Price Simulations',
      'description':
          'Adjust costs or profit margins and instantly see the updated price, helping you explore different scenarios.'
    },
    {
      'title': 'Clear & Simple Dashboard',
      'description':
          'View all key metrics at a glance, enabling you to make informed pricing decisions quickly.'
    },
    {},
  ];

  static String pricingCalculatorHeader = "Instant Pricing Calculator";
  static String benefitsSubTitle =
      "Explore how we help businesses across various industries achieve growth, optimize operations, and navigate challenges with our expert consulting services.";
  static String benefitsTitle = "Benefits for SMEs";
  static String sliderLabel =
      "The percentage of profit you want to add to cover costs and earn profit";

  static List<Map<String, dynamic>> benefits = [
    {
      "icon": AppAssets.chip,
      "title": "Automated Price Calculations",
      "content":
          "Input your costs and instantly receive an accurate price based on your desired profit margin. No complex calculations needed!"
    },
    {
      "icon": AppAssets.library,
      "title": "Save Time",
      "content":
          "Automated calculations save you up to 30 minutes per pricing task"
    },
    {
      "icon": AppAssets.cart,
      "title": "Cost-effective",
      "content": "Affordable for SMEs with no need for additional tools."
    },
    {
      "icon": AppAssets.medicalSheild,
      "title": "Simplicity",
      "content": "No complex IT needed; easy to use for everyone"
    }
  ];
  static String testimonialTitle = "Our Satisfied Clients";
  static String faqTitle = "Frequently Asked Questions";
  static String contactsTitle = " Ready to Transform Your Business?";
}
