import 'package:digit_words/core/golbal_widget/text_with_padding.dart';
import 'package:digit_words/core/utils/app_colors.dart';
import 'package:digit_words/core/utils/assets.dart';
import 'package:flutter/material.dart';

import 'tool_tip_custom_shape.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  String? errorText;
  final String? Function(String?)? validator;

  InputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.keyboardType,
    this.errorText,
    this.validator,
  });
  bool showTooltip = false;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          opacity: 0.1,
          image: AssetImage(AppAssets.inputTextBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWithPadding(labelText: labelText),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              onChanged: (val) {
                errorText = validator!(controller.text);
                tooltipkey.currentState?.deactivate();
                showTooltip = false;
              },
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: AppColors.primaryColorDark,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.errorColor,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.input,
                  color: AppColors.primaryColorDark,
                ),
                suffixIcon: ValueListenableBuilder(
                  builder: (context, value, child) {
                    return Tooltip(
                      textStyle: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: ShapeDecoration(
                        color: errorText == null
                            ? AppColors.checkCircleColor
                            : AppColors.errorColor,
                        shape: const ToolTipCustomShape(),
                      ),
                      triggerMode: TooltipTriggerMode.manual,
                      key: tooltipkey,
                      showDuration: const Duration(seconds: 1),
                      message: errorText ??
                          (controller.text.isEmpty
                              ? "please enter some numbers"
                              : "Great Looks good!"),
                      preferBelow: false,
                      child: IconButton(
                        icon: errorText == null
                            ? Icon(
                                Icons.check_circle_outline,
                                color: controller.text.isEmpty
                                    ? Colors.grey
                                    : AppColors.checkCircleColor,
                              )
                            : const Icon(
                                Icons.error_outline,
                                color: AppColors.errorColor,
                              ),
                        onPressed: () {
                          showTooltip = !showTooltip;
                          if (showTooltip) {
                            tooltipkey.currentState?.ensureTooltipVisible();
                          } else {
                            tooltipkey.currentState?.deactivate();
                          }
                        },
                      ),
                    );
                  },
                  valueListenable: controller,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColorDark,
                  ),
                ),
              ),
              style: const TextStyle(
                color: AppColors.primaryColorDark,
              ),
              keyboardType: keyboardType,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ],
      ),
    );
  }
}
