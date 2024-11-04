import 'package:flutter/material.dart';
import 'package:pricing_calculator/src/constants/assets.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/constants/nav_constants.dart';
import 'package:pricing_calculator/src/features/calculator/presentation/price_calculator.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/benefits_section.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/call_to_action_button.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/contact_section.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/faq_section.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/features_section.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/hero_section.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/navigation_bar.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/testimonial_section.dart';
import 'package:pricing_calculator/src/router/routes.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({
    super.key,
  });

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: NavigationUtilities.key,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: NavigationBarWidget(
              destinations: [
                InkWell(
                  onTap: () {
                    NavigationUtilities.updateUrlWithoutNavigation(Routes.home);
                    Scrollable.ensureVisible(
                        NavigationUtilities.heroKey.currentContext!,
                        duration: const Duration(seconds: 1));
                  },
                  child: Image.asset(
                    AppAssets.homeIcon,
                    width: 200,
                  ),
                ),
                SizedBox(
                  width: 700,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(navigationItems.length, (index) {
                      return TextWidget(
                        onTap: () {
                          Scrollable.ensureVisible(
                              NavigationUtilities.keys[index].currentContext!,
                              duration: const Duration(seconds: 1));
                          Future.delayed(const Duration(seconds: 2), () {
                            NavigationUtilities.updateUrlWithoutNavigation(
                                navigationItems[index].route);
                          });

                          setState(() {
                            currentIndex = index;
                          });
                        },
                        color: currentIndex == index
                            ? AppColors.selectedNavItem
                            : AppColors.textSecondary,
                        text: navigationItems[index].label,
                        fontWeight: currentIndex == index
                            ? FontWeight.bold
                            : FontWeight.w500,
                      );
                    }),
                  ),
                ),
                CallToActionButton(
                    label: const TextWidget(
                      text: "Zum Rechner",
                      color: AppColors.white,
                    ),
                    onTap: () {
                      NavigationUtilities.updateUrlWithoutNavigation(
                          Routes.pricingCalculator);
                      Scrollable.ensureVisible(
                          NavigationUtilities
                              .pricingCalculatorKey.currentContext!,
                          duration: const Duration(seconds: 1));
                    })
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  ...List.generate(NavigationUtilities.keys.length, (index) {
                    return VisibilityDetector(
                      key: Key('section-$index'),
                      onVisibilityChanged: (visibilityInfo) {
                        if (visibilityInfo.visibleFraction > 0.8) {
                          setState(() {
                            currentIndex = index;
                            final route =
                                index == 0 ? '/' : navigationItems[index].route;
                            Future.delayed(const Duration(seconds: 1), () {
                              NavigationUtilities.updateUrlWithoutNavigation(
                                  route);
                            });
                          });
                        }
                      },
                      child: index == 0
                          ? HeroSectionWidget(index: index)
                          : index == 1
                              ? FeaturesSection(index: index)
                              : index == 2
                                  ? PricingCalculatorWidget(
                                      index: index,
                                    )
                                  : index == 3
                                      ? BenefitsSection(
                                          index: index,
                                        )
                                      : index == 4
                                          ? TestimonialSection(
                                              index: index,
                                            )
                                          : index == 5
                                              ? FaqSection(
                                                  index: index,
                                                )
                                              : ContactUsSection(
                                                  index: index,
                                                ),
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
