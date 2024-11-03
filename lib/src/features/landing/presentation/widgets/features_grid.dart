import 'package:flutter/widgets.dart';
import 'package:pricing_calculator/src/constants/string_constants.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/feature_card.dart';

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if we should use grid or column based on width
        bool useGrid = constraints.maxWidth > 800;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),
          itemCount: StringConstants.features.length,
          itemBuilder: (context, index) {
            return FeatureCard(
              index: index,
              title: index == 1 || index == 2 || index == 5
                  ? null
                  : StringConstants.features[index]['title']!,
              description: index == 1 || index == 2 || index == 5
                  ? null
                  : StringConstants.features[index]['description']!,
            );
          },
        );
      },
    );
  }
}
