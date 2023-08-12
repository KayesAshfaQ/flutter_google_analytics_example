import 'dart:math';

class Helper {
  static String randomText(int length) {
    final random = Random();
    const alphabet = 'abcdefghijklmnopqrstuvwxyz';
    var result = '';

    for (var i = 0; i < length; i++) {
      final index = random.nextInt(alphabet.length);
      final letter = alphabet[index];
      result += letter;
    }

    print('randomText ::: $result');
    return result;
  }

  static int randomNumber() {
    final random = Random();
    final number = random.nextInt(90) + 10;
    print('randomText ::: $number');
    return number;
  }
}
