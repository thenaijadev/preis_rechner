import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/assets.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/constants/string_constants.dart';
import 'package:pricing_calculator/src/features/calculator/presentation/price_result_popup.dart';
import 'package:pricing_calculator/src/features/calculator/providers/calculator_provider.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/call_to_action_button.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/dialog.dart';
import 'package:pricing_calculator/src/shared/input_field_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class PricingCalculatorWidget extends ConsumerWidget {
  const PricingCalculatorWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calculatorProvider);
    final notifier = ref.read(calculatorProvider.notifier);
    return ContainerWidget(
      key: NavigationUtilities.keys[index],
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.p50,
      ),
      borderRadius: BorderRadius.circular(10),
      margin: const EdgeInsets.symmetric(
          horizontal: Sizes.p38, vertical: Sizes.p50),
      color: AppColors.whitishGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                textAlign: TextAlign.center,
                text: StringConstants.pricingCalculatorHeader,
                fontSize: Sizes.p32,
              ),
              gapW20,
              const Icon(
                Icons.info_outline,
                color: AppColors.black,
              )
            ],
          ),
          ContainerWidget(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.p50, horizontal: Sizes.p24),
            borderRadius: BorderRadius.circular(10),
            margin: const EdgeInsets.symmetric(
                horizontal: Sizes.p38, vertical: Sizes.p50),
            color: AppColors.lightGrey,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextWidget(
                        text: "Kostenart",
                        fontSize: Sizes.p20,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextWidget(
                        text: "Kostenkategorie",
                        fontSize: Sizes.p20,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextWidget(
                        text: "Kosten (€)",
                        fontSize: Sizes.p20,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextWidget(
                        text: "Hinweis",
                        fontSize: Sizes.p20,
                      ),
                    ),
                  ],
                ),
                gapH20,
                ...List.generate(state.costItems.length, (index) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: Sizes.p12,
                            right: Sizes.p12,
                          ),
                          child: InputFieldWidget(
                            fillColor: AppColors.white,
                            enabledBorderRadius: 5,
                            hintColor: const Color.fromARGB(66, 13, 13, 13),
                            hintText: "Kostenart",
                            initialValue: state.costItems[index].label,
                            onChanged: (val) {
                              notifier.updateCostItem(
                                  index: index, field: "label", value: val!);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: Sizes.p12, bottom: Sizes.p12),
                          child: DropdownButtonFormField<String>(
                            value: state.costItems[index].costType,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            dropdownColor: AppColors.white,
                            hint: const TextWidget(
                              text: "Kostenkategorie",
                              color: Color.fromARGB(66, 13, 13, 13),
                            ),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: "General",
                                child: TextWidget(text: "General"),
                              ),
                              DropdownMenuItem(
                                value: "Fixed Costs",
                                child: TextWidget(text: "Fixed Costs"),
                              ),
                              DropdownMenuItem(
                                value: "Variable Costs",
                                child: TextWidget(text: "Variable Costs"),
                              ),
                            ],
                            onChanged: (val) {
                              notifier.updateCostItem(
                                  index: index, field: "costType", value: val!);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: Sizes.p12, bottom: Sizes.p12),
                          child: InputFieldWidget(
                            fillColor: AppColors.white,
                            enabledBorderRadius: 5,
                            hintColor: const Color.fromARGB(66, 13, 13, 13),
                            hintText: "Kosten",
                            initialValue:
                                state.costItems[index].price?.toString(),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            onChanged: (val) {
                              notifier.updateCostItem(
                                  index: index, field: "price", value: val!);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: Sizes.p12),
                          child: InputFieldWidget(
                            fillColor: AppColors.white,
                            enabledBorderRadius: 5,
                            hintColor: const Color.fromARGB(66, 13, 13, 13),
                            hintText: "Hinweis",
                            initialValue: state.costItems[index].comment,
                            suffixIcon: InkWell(
                              onTap: () => notifier.deleteRow(index),
                              child: Padding(
                                padding: const EdgeInsets.all(Sizes.p12),
                                child: Image.asset(
                                  AppAssets.deleteIcon,
                                  width: Sizes.p16,
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              notifier.updateCostItem(
                                  index: index, field: "comment", value: val!);
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(
                  width: double.infinity,
                  child: CallToActionButton(
                    label: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: AppColors.white),
                        TextWidget(text: "Add row", color: AppColors.white),
                      ],
                    ),
                    onTap: notifier.addNewRow,
                  ),
                ),
                gapH24,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Set Your Profit Margin",
                      fontSize: Sizes.p20,
                    ),
                  ],
                ),
                gapH24,
                ContainerWidget(
                    padding: const EdgeInsets.symmetric(
                        vertical: Sizes.p50, horizontal: Sizes.p24),
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    child: Column(
                      children: [
                        TextWidget(
                            fontSize: Sizes.p14,
                            fontWeight: FontWeight.w500,
                            text:
                                "${(state.profitMargin * 100).round().toString()}%"),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: AppColors.black,
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
                              label:
                                  (state.profitMargin * 100).round().toString(),
                              thumbColor: AppColors.black,
                              max: 1,
                              min: 0,
                              value: state.profitMargin,
                              onChanged: (val) {
                                notifier.updateProfitMargin(val);
                              }),
                        ),
                        gapH24,
                        TextWidget(
                          text: StringConstants.sliderLabel,
                          color: AppColors.textGray,
                          fontSize: Sizes.p14,
                        )
                      ],
                    )),
                gapH24,
                CallToActionButton(
                  label: const Center(
                    child: TextWidget(
                      text: "Calculate Price",
                      color: AppColors.white,
                      fontSize: 24,
                    ),
                  ),
                  onTap: () {
                    final totalFixed = notifier.calculateTotalFixedCosts();
                    final totalVariable =
                        notifier.calculateTotalVariableCosts();
                    showWhitePopup(
                      context: context,
                      widget: PriceResultPopup(
                          totalFixed: totalFixed,
                          totalVariable: totalVariable,
                          profitMargin: state.profitMargin),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
