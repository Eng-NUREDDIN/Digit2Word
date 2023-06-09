part of 'decimal_converter_bloc.dart';

abstract class DecimalConverterEvent extends Equatable {
  const DecimalConverterEvent();
}

class ConvertDecimalToWords extends DecimalConverterEvent {
  final String decimal;

  const ConvertDecimalToWords(this.decimal);

  @override
  List<Object> get props => [decimal];
}
