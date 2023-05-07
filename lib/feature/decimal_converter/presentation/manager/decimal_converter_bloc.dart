import 'package:bloc/bloc.dart';
import 'package:digit_words/core/number_converter_logic/number_converter.dart';
import 'package:equatable/equatable.dart';

part 'decimal_converter_event.dart';

part 'decimal_converter_state.dart';

class DecimalConverterBloc
    extends Bloc<DecimalConverterEvent, DecimalConverterState> {
  DecimalConverterBloc() : super(const DecimalConverter('')) {
    on<DecimalConverterEvent>((event, emit) {
      if (event is ConvertDecimalToWords) {
        final decimal = event.decimal;
        try {
          final words = NumberConverter.convert(int.parse(decimal));
          final state = DecimalConverter(words);
          emit(state);
        } catch (error) {
          const state = DecimalConverter("Please enter a valid number");
          emit(state);
        }
      }
    });
  }
}
