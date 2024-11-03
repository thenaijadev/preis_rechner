import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/constants/string_constants.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';

class ProfitMarginSlider extends StatelessWidget {
  const ProfitMarginSlider(
      {super.key, required this.value, required this.onChanged});
  final double value;
  final void Function(double) onChanged;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.p50, horizontal: Sizes.p24),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        child: Column(
          children: [
            TextWidget(
                fontSize: Sizes.p14,
                fontWeight: FontWeight.w500,
                text: "${(value * 100).round().toString()}%"),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbColor: Colors.white,
                trackHeight: 8,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 12,
                ),
                activeTrackColor: AppColors.black,
                overlayColor: Colors.black.withAlpha(30),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 16,
                ),
              ),
              child: Slider(
                label: (value * 100).round().toString(),
                thumbColor: AppColors.white,
                max: 1,
                min: 0,
                value: value,
                onChanged: onChanged,
              ),
            ),
            gapH24,
            TextWidget(
              text: StringConstants.sliderLabel,
              color: AppColors.textGray,
              fontSize: Sizes.p14,
            )
          ],
        ));
  }
}
