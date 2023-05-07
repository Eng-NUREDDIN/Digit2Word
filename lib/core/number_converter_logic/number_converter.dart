class NumberConverter {
  static const List<String> ones = [
    '',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen'
  ];

  static const List<String> tens = [
    '',
    '',
    'twenty',
    'thirty',
    'forty',
    'fifty',
    'sixty',
    'seventy',
    'eighty',
    'ninety'
  ];

  static const List<String> thousands = [
    '',
    'thousand',
    'million',
    'billion',
    'trillion'
  ];

  static String convert(int number) {
    if (number == 0) {
      return 'zero';
    }
    String words = '';
    for (var i = 0; number > 0; i++) {
      if (number % 1000 != 0) {
        words = '${_convertHundreds(number % 1000)}${thousands[i]} $words';
      }
      number ~/= 1000;
    }
    return words.trim();
  }

  static String _convertHundreds(int number) {
    String word = '';
    if (number >= 100) {
      word = '${ones[number ~/ 100]} hundred ';
      number %= 100;
    }
    if (number >= 20) {
      word += '${tens[number ~/ 10]} ';
      number %= 10;
    }
    if (number > 0) {
      word += '${ones[number]} ';
    }
    return word;
  }
}
