import 'package:flutter/material.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/constants/string_constants.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/call_to_action_button.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerWidget(
          padding: const EdgeInsets.symmetric(vertical: Sizes.p60),
          margin: const EdgeInsets.only(top: Sizes.p60, bottom: Sizes.p30),
          key: NavigationUtilities.keys[index],
          color: AppColors.whitishGray,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: StringConstants.contactsTitle,
                    fontSize: Sizes.p32,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              gapH20,
              const SizedBox(
                width: 600,
                child: TextWidget(
                  textAlign: TextAlign.center,
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Vitae neque duis purus egestas odio felis iaculis malesuada.",
                  fontSize: Sizes.p14,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              gapH20,
              CallToActionButton(
                  color: AppColors.blueGrey,
                  label: const TextWidget(
                    text: "Start Your Free Trial",
                    color: AppColors.white,
                  ),
                  onTap: () {}),
            ],
          ),
        ),
        gapH20,
        const ContainerWidget(
            margin: EdgeInsets.symmetric(horizontal: Sizes.p60),
            padding: EdgeInsets.symmetric(vertical: Sizes.p20),
            border: Border(top: BorderSide(color: AppColors.lightGrey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline_rounded,
                          color: AppColors.black,
                        ),
                        gapW8,
                        TextWidget(
                          text: "info@123.com",
                          color: AppColors.black,
                          fontSize: Sizes.p16,
                        )
                      ],
                    ),
                    gapW20,
                    Row(
                      children: [
                        Icon(
                          Icons.phone_outlined,
                          color: AppColors.black,
                        ),
                        gapW8,
                        TextWidget(
                          text: "+1 (555) 123-4567",
                          color: AppColors.black,
                          fontSize: Sizes.p16,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    ContainerWidget(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.p20),
                        border:
                            Border(right: BorderSide(color: AppColors.black)),
                        child: TextWidget(text: "Privacy Policy")),
                    ContainerWidget(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.p20),
                        border:
                            Border(right: BorderSide(color: AppColors.black)),
                        child: TextWidget(text: "Terms & Conditions")),
                    ContainerWidget(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.p20),
                        child: TextWidget(text: "Cookie Policy"))
                  ],
                )
              ],
            ))
      ],
    );
  }
}
