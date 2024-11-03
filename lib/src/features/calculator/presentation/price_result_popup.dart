import 'package:flutter/widgets.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';

class PriceResultPopup extends StatelessWidget {
  const PriceResultPopup({
    super.key,
    required this.totalFixed,
    required this.totalVariable,
    required this.profitMargin,
  });

  final double totalFixed;
  final double totalVariable;
  final double profitMargin;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.whitishGray,
      padding: const EdgeInsets.all(Sizes.p60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextWidget(
            text: "Your Price Suggestion",
            fontSize: Sizes.p32,
          ),
          gapH20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerWidget(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                padding: const EdgeInsets.all(Sizes.p20),
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text:
                          "€${((totalFixed + totalVariable) * (1 + profitMargin)).round()}",
                      fontSize: Sizes.p32,
                    ),
                    const TextWidget(
                      text: "per unit",
                      fontSize: Sizes.p16,
                    ),
                  ],
                ),
              ),
              gapH20,
              ContainerWidget(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                padding: const EdgeInsets.all(Sizes.p20),
                width: 500,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          text: "Fixed Costs",
                          fontSize: Sizes.p16,
                        ),
                        TextWidget(
                          text: "€$totalFixed",
                          fontSize: Sizes.p16,
                        ),
                      ],
                    ),
                    gapH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          text: "Variable Costs",
                          fontSize: Sizes.p16,
                        ),
                        TextWidget(
                          text: "€$totalVariable",
                          fontSize: Sizes.p16,
                        ),
                      ],
                    ),
                    gapH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          text: "Profit Margin",
                          fontSize: Sizes.p16,
                        ),
                        TextWidget(
                          text: "${(profitMargin * 100).round()}%",
                          fontSize: Sizes.p16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
