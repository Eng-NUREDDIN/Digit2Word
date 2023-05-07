part of 'decimal_converter_bloc.dart';

abstract class DecimalConverterState extends Equatable {
  const DecimalConverterState();
}

class DecimalConverter extends DecimalConverterState {
  final String words;
  const DecimalConverter(this.words);
  @override
  List<Object> get props => [ words ];
}
