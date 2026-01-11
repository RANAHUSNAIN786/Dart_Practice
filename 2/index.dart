import 'dart:io';
import 'dart:math';

void main() {
  Map<String, int> moodStats = {
    'Happy ': 0,
    'Sad ': 0,
    'Excited ': 0,
    'Angry ': 0,
    'Neutral ': 0,
  };

  print('\x1B[35mWelcome to the VIP Daily Mood Tracker!\x1B[0m');

  bool keepRunning = true;

  while (keepRunning) {
    print('\n\x1B[36mHow do you feel today?\x1B[0m');
    int i = 1;
    moodStats.keys.forEach((mood) {
      print('\x1B[33m$i. $mood\x1B[0m');
      i++;
    });

    stdout.write('\nEnter the number of your mood: ');
    String? input = stdin.readLineSync();

    int? choice = int.tryParse(input ?? '');
    if (choice != null && choice > 0 && choice <= moodStats.length) {
      String selectedMood = moodStats.keys.elementAt(choice - 1);
      moodStats[selectedMood] = moodStats[selectedMood]! + 1;
      print('\x1B[32mMood recorded: $selectedMood\x1B[0m');
    } else {
      print('\x1B[31mInvalid choice! Try again.\x1B[0m');
      continue;
    }

    stdout.write('\nDo you want to add another mood? (yes/no): ');
    String? again = stdin.readLineSync();
    if (again == null || again.toLowerCase() != 'yes') {
      keepRunning = false;
    }
  }

  // VIP Summary
  print('\n\x1B[35m--- Mood Summary ---\x1B[0m');
  moodStats.forEach((mood, count) {
    print('\x1B[36m$mood: \x1B[33m$count\x1B[0m');
  });

  String mostFrequentMood =
      moodStats.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  print('\n\x1B[32mYour most frequent mood: $mostFrequentMood\x1B[0m');
  print('\x1B[35mThank you for using the VIP Mood Tracker! 🌟\x1B[0m');



  final random = Random();
  int secretNumber = random.nextInt(100) + 1; // 1 se 100 tak
  int attempts = 0;
  bool guessed = false;

  print('\x1B[35mWelcome to the VIP Secret Number Game! 🌟\x1B[0m');
  print('I have chosen a number between 1 and 100. Can you guess it?');

  while (!guessed) {
    stdout.write('\nEnter your guess: ');
    String? input = stdin.readLineSync();
    int? guess = int.tryParse(input ?? '');

    if (guess == null || guess < 1 || guess > 100) {
      print('\x1B[31mPlease enter a valid number between 1 and 100!\x1B[0m');
      continue;
    }

    attempts++;

    if (guess == secretNumber) {
      guessed = true;
      print('\x1B[32m🎉 Correct! You guessed the number $secretNumber in $attempts attempts! 🎉\x1B[0m');
    } else if (guess < secretNumber) {
      print('\x1B[33m⬆️ Too low! Try a bigger number.\x1B[0m');
    } else {
      print('\x1B[33m⬇️ Too high! Try a smaller number.\x1B[0m');
    }
  }

  print('\x1B[35mThanks for playing the VIP Secret Number Game! 🌟\x1B[0m');
}
