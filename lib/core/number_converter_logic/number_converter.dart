//
//
//
//
// class Ones {
//   static const List<String> words = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
// }
//
// class Tens {
//   static const List<String> words = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
// }
//
// class Hundreds {
//   static const String word = 'hundred';
// }
//
// class Thousands {
//   final int value;
//   Thousands(this.value);
//
//   @override
//   String toString() {
//     return '${NumberConverter.convert(value)} thousand';
//   }
// }
//
// class NumberConverter {
//   static String convert(int number) {
//     if (number == 0) {
//       return 'zero';
//     }
//
//     List<String> words = [];
//     if (number < 0) {
//       words.add('negative');
//       number = -number;
//     }
//
//     int thousands = number ~/ 1000;
//     if (thousands > 0) {
//       words.add(Thousands(thousands).toString());
//       number %= 1000;
//     }
//
//     if (number > 0) {
//       int hundreds = number ~/ 100;
//       if (hundreds > 0) {
//         words.add('${Ones.words[hundreds]} ${Hundreds.word}');
//         number %= 100;
//       }
//
//       if (number > 0) {
//         if (words.isNotEmpty) {
//           words.add('and');
//         }
//
//         if (number < 20) {
//           words.add(Ones.words[number]);
//         } else {
//           int tens = number ~/ 10;
//           words.add(Tens.words[tens]);
//           number %= 10;
//
//           if (number > 0) {
//             words.add(Ones.words[number]);
//           }
//         }
//       }
//     }
//
//     return words.join(' ');
//   }
// }
class NumberConverter {
  static const List<String> ones = [
    '', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
    'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen',
    'eighteen', 'nineteen'
  ];

  static const List<String> tens = [
    '', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'
  ];

  static const List<String> thousands = ['', 'thousand', 'million', 'billion', 'trillion'];

  static String convert(int number) {
    if (number == 0) {
      return 'zero';
    }
    String words = '';
    for (var i = 0; number > 0; i++) {
      if (number % 1000 != 0) {
        words = _convertHundreds(number % 1000) + thousands[i] + ' ' + words;
      }
      number ~/= 1000;
    }
    return words.trim();
  }

  static String _convertHundreds(int number) {
    String word = '';
    if (number >= 100) {
      word = ones[number ~/ 100] + ' hundred ';
      number %= 100;
    }
    if (number >= 20) {
      word += tens[number ~/ 10] + ' ';
      number %= 10;
    }
    if (number > 0) {
      word += ones[number] + ' ';
    }
    return word;
  }
}
