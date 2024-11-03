import 'package:flutter/widgets.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/constants/string_constants.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/call_to_action_button.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      color: AppColors.mainGrey,
      height: 650,
      width: double.infinity,
      key: NavigationUtilities.keys[index],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 890,
              child: TextWidget(
                textAlign: TextAlign.center,
                text: StringConstants.heroTitle,
                fontSize: Sizes.p48,
                color: AppColors.white,
              ),
            ),
            gapH20,
            TextWidget(
                text: StringConstants.herosubTitle,
                textAlign: TextAlign.center,
                fontSize: Sizes.p20,
                color: AppColors.white),
            gapH20,
            CallToActionButton(
                label: const TextWidget(
                  text: "Try Demo",
                  color: AppColors.white,
                ),
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
