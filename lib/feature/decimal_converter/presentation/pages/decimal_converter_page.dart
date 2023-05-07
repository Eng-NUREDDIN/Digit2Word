import 'package:digit_words/core/golbal_widget/app_button.dart';
import 'package:digit_words/core/localization/localization.dart';

import 'package:digit_words/core/utils/app_colors.dart';
import 'package:digit_words/core/utils/app_string.dart';
import 'package:digit_words/core/utils/validator.dart';
import 'package:digit_words/feature/decimal_converter/presentation/manager/decimal_converter_bloc.dart';
import 'package:digit_words/feature/decimal_converter/presentation/widgets/input_tex_field.dart';
import 'package:digit_words/feature/decimal_converter/presentation/widgets/text_box.dart';
import 'package:digit_words/feature/decimal_converter/presentation/widgets/word_output_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecimalConverterPage extends StatelessWidget {
  DecimalConverterPage({Key? key}) : super(key: key);
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const Drawer(),
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          title: const Text(AppString.appName),
          backgroundColor: AppColors.primaryColor),
      body: BlocBuilder<DecimalConverterBloc, DecimalConverterState>(
        builder: (context, state) {
          return Column(
            children: [
              AppTextBox(
                  text: AppLocalization.of(context).translate('introduction')),
              InputTextField(
                validator: (value) => Validator.notNumberValidator(value),
                controller: inputController,
                hintText: AppLocalization.of(context).translate('enterNumber'),
                labelText: AppLocalization.of(context).translate('input'),
                keyboardType: TextInputType.number,
              ),
              WordOutputTextField(
                  text: state is DecimalConverter ? state.words : '',
                  textLabel: AppLocalization.of(context).translate('output')),
              AppButton(
                  text: AppLocalization.of(context).translate('convert'),
                  onPressed: () {
                    context
                        .read<DecimalConverterBloc>()
                        .add(ConvertDecimalToWords(inputController.text));
                  })
            ],
          );
        },
      ),
    );
  }
}
