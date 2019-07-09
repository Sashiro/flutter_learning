import 'package:english_words/english_words.dart';

class EnglishWordsUtils {
  static String getRandomString() => WordPair.random().toString();
}
