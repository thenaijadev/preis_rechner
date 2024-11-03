// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/constants/string_constants.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/features_grid.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      color: AppColors.white,
      key: NavigationUtilities.keys[index],
      child: Column(
        children: [
          gapH64,
          TextWidget(
            text: StringConstants.featuresTitle,
            fontSize: Sizes.p32,
            fontWeight: FontWeight.w500,
          ),
          gapH8,
          SizedBox(
            width: 850,
            child: TextWidget(
              textAlign: TextAlign.center,
              text: StringConstants.featuresubtitle,
              color: AppColors.blueGrey,
              fontSize: Sizes.p18,
            ),
          ),
          gapH40,
          const FeatureGrid()
        ],
      ),
    );
  }
}
