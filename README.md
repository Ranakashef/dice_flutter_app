# Dice Challenge — Flutter

A simple Flutter app that rolls two dice and shows a happy result when the total is **10 or more**. Otherwise, it shows the sad result.

## Features
- Two dice with values from 1 to 6.
- **Roll** generates two random values and updates the total.
- **Reset** returns both dice to 1, the total to 2, and the result to “You Lose”.
- Separate `Dice` widget in `lib/dice.dart`.
- Dark theme, result text, and happy/sad image assets.

## Run the project
1. Install Flutter and make sure `flutter doctor` passes.
2. Extract this project folder.
3. Open a terminal in the project directory.
4. Run:
   ```bash
   flutter pub get
   flutter run
   ```

## Project structure
```text
dice_flutter_app/
├── assets/
│   ├── happy.png
│   └── sad.png
├── lib/
│   ├── main.dart
│   └── dice.dart
├── pubspec.yaml
└── README.md
```

## Submission
Upload the complete project folder (or a ZIP of it, if your classroom accepts ZIP submissions) to the classroom. If your instructor specifically asks for a repository link, push this folder to GitHub and submit the repository URL.
