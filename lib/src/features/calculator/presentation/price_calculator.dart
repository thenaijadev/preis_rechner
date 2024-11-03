import 'package:flutter/material.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/assets.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/constants/string_constants.dart';
import 'package:pricing_calculator/src/features/calculator/domain/cost_item.dart';
import 'package:pricing_calculator/src/features/calculator/presentation/price_result_popup.dart';
import 'package:pricing_calculator/src/features/landing/presentation/widgets/call_to_action_button.dart';
import 'package:pricing_calculator/src/shared/container_widget.dart';
import 'package:pricing_calculator/src/shared/dialog.dart';
import 'package:pricing_calculator/src/shared/input_field_widget.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';
import 'package:pricing_calculator/src/utilities/navigator_utils.dart';

class PricingCalculatorWidget extends StatefulWidget {
  const PricingCalculatorWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<PricingCalculatorWidget> createState() =>
      _PricingCalculatorWidgetState();
}

class _PricingCalculatorWidgetState extends State<PricingCalculatorWidget> {
  double sliderValue = 0;
  List<CostItem> costItems = [];

  void addNewRow() {
    setState(() {
      costItems.add(CostItem());
    });
  }

  void deleteRow(int index) {
    setState(() {
      costItems.removeAt(index);
    });
  }

  void updateCostItem(int index, String field, dynamic value) {
    setState(() {
      final item = costItems[index];
      switch (field) {
        case 'label':
          item.label = value;
          break;
        case 'costType':
          item.costType = value;
          break;
        case 'price':
          item.price = double.tryParse(value) ?? 0;
          break;
        case 'comment':
          item.comment = value;
          break;
      }
    });
  }

  double calculateTotalFixedCosts() {
    return costItems
        .where((item) => item.costType == 'Fixed Costs')
        .map((item) => item.price ?? 0)
        .fold(0, (sum, price) => sum + price);
  }

  double calculateTotalVariableCosts() {
    return costItems
        .where((item) => item.costType == 'Variable Costs')
        .map((item) => item.price ?? 0)
        .fold(0, (sum, price) => sum + price);
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      key: NavigationUtilities.keys[widget.index],
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
                ...List.generate(costItems.length, (index) {
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
                            hintColor: AppColors.black,
                            hintText: "",
                            initialValue: costItems[index].label,
                            onChanged: (val) =>
                                updateCostItem(index, 'label', val),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: Sizes.p12, bottom: Sizes.p12),
                          child: DropdownButtonFormField<String>(
                            value: costItems[index].costType,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            dropdownColor: AppColors.white,
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
                            onChanged: (val) =>
                                updateCostItem(index, 'costType', val),
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
                            hintColor: AppColors.black,
                            hintText: "",
                            initialValue: costItems[index].price?.toString(),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            onChanged: (val) =>
                                updateCostItem(index, 'price', val),
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
                            hintColor: AppColors.black,
                            hintText: "",
                            initialValue: costItems[index].comment,
                            suffixIcon: InkWell(
                              onTap: () => deleteRow(index),
                              child: Padding(
                                padding: const EdgeInsets.all(Sizes.p12),
                                child: Image.asset(
                                  AppAssets.deleteIcon,
                                  width: Sizes.p16,
                                ),
                              ),
                            ),
                            onChanged: (val) =>
                                updateCostItem(index, 'comment', val),
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
                    onTap: addNewRow,
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
                            text: "${(sliderValue * 100).round().toString()}%"),
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
                            label: (sliderValue * 100).round().toString(),
                            thumbColor: AppColors.white,
                            max: 1,
                            min: 0,
                            value: sliderValue,
                            onChanged: (val) {
                              setState(() {
                                sliderValue = val;
                              });
                            },
                          ),
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
                    final totalFixed = calculateTotalFixedCosts();
                    final totalVariable = calculateTotalVariableCosts();
                    final profitMargin = sliderValue;

                    showWhitePopup(
                      context: context,
                      widget: PriceResultPopup(
                          totalFixed: totalFixed,
                          totalVariable: totalVariable,
                          profitMargin: profitMargin),
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
