import 'package:flutter/widgets.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';

class CallToActionButton extends StatelessWidget {
  const CallToActionButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.color = AppColors.black});

  final VoidCallback onTap;
  final Widget label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p40, vertical: Sizes.p18),
        color: color,
        child: label);
  }
}
