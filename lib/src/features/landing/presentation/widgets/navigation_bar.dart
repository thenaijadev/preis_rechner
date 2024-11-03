import 'package:flutter/material.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    required this.destinations,
  });
  final List<Widget> destinations;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p60, vertical: Sizes.p20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: destinations,
        ));
  }
}
