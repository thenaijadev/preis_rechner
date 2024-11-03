import 'package:flutter/widgets.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';

class FeatureCard extends StatelessWidget {
  final String? title;
  final String? description;
  final int index;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p73, vertical: Sizes.p60),
      decoration: BoxDecoration(
        color: index == 1 || index == 2 || index == 5
            ? AppColors.lightGrey
            : AppColors.white,
      ),
      child: index == 1 || index == 2 || index == 5
          ? const SizedBox()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "",
                  style: const TextStyle(
                    fontSize: Sizes.p32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                gapH48,
                ContainerWidget(
                  padding: const EdgeInsets.all(Sizes.p18),
                  border: const Border(
                    left: BorderSide(color: AppColors.black, width: 2),
                  ),
                  child: SizedBox(
                    width: 550,
                    child: Text(
                      description ?? "",
                      style: const TextStyle(
                        fontSize: Sizes.p24,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
