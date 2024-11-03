import 'package:flutter/widgets.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/constants/string_constants.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class BenefitsSection extends StatelessWidget {
  const BenefitsSection({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      width: double.infinity,
      key: NavigationUtilities.keys[index],
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.p38,
      ),
      borderRadius: BorderRadius.circular(10),
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.p38,
      ), // color: AppColors.whitishGray,
      child: Column(
        children: [
          const TextWidget(
            text: "Benefits for SMEs",
            fontSize: Sizes.p32,
          ),
          SizedBox(
            width: 850,
            child: TextWidget(
              textAlign: TextAlign.center,
              text: StringConstants.featuresubtitle,
              color: AppColors.blueGrey,
              fontSize: Sizes.p18,
            ),
          ),
          gapH32,
          Container(
            color: AppColors.blueGrey,
            margin: const EdgeInsets.symmetric(horizontal: Sizes.p18),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.9,
              ),
              itemCount: StringConstants.benefits.length,
              itemBuilder: (context, index) {
                return ContainerWidget(
                    border: Border(
                        right: index == 0 || index == 2
                            ? const BorderSide(
                                color: AppColors.black, width: 0.2)
                            : BorderSide.none,
                        left: index == 1 || index == 3
                            ? const BorderSide(
                                color: AppColors.black, width: 0.2)
                            : BorderSide.none,
                        bottom: index == 0 || index == 1
                            ? const BorderSide(
                                color: AppColors.black, width: 0.2)
                            : BorderSide.none,
                        top: BorderSide.none),
                    borderRadius: BorderRadius.only(
                      bottomRight: index == 0
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                      bottomLeft: index == 1
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                      topRight: index == 2
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                      topLeft: index == 3
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                    ),
                    color: AppColors.lightGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          StringConstants.benefits[index]["icon"],
                          width: Sizes.p32,
                        ),
                        gapH40,
                        TextWidget(
                          textAlign: TextAlign.center,
                          text: StringConstants.benefits[index]["title"],
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.p24,
                        ),
                        gapH12,
                        SizedBox(
                          width: 600,
                          child: TextWidget(
                            textAlign: TextAlign.center,
                            text: StringConstants.benefits[index]["content"],
                            fontSize: Sizes.p24,
                          ),
                        )
                      ],
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
