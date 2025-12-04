# AI English Tutor App

A Flutter application designed to help users learn English through an AI-powered chat interface. This project focuses on providing a clean, modern, and user-friendly UI for an educational experience.

## Features

*   **Authentication UI**:
    *   **Login Screen**: Clean interface for users to sign in with email and password. Includes navigation to the Registration screen.
    *   **Registration Screen**: Sign-up form for new users to create an account.
*   **AI Chat Interface**:
    *   **Chat Screen**: A conversational interface where users can interact with the AI tutor.
    *   **Chat Bubbles**: Distinct visual styles for user messages and AI responses.
    *   **Input Field**: Styled text field for typing messages.
*   **Modern Design**:
    *   Custom color palette and gradients.
    *   Use of `Google Fonts` (Inter) for typography.
    *   Responsive layout.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

*   **Flutter SDK**: Ensure you have Flutter installed. You can check by running `flutter --version` in your terminal.
*   **Dart SDK**: Included with Flutter.
*   **IDE**: VS Code, Android Studio, or any editor of your choice with Flutter plugins.

### Installation

1.  **Clone or Download** the repository to your local machine.
2.  **Navigate** to the project directory in your terminal:
    ```bash
    cd AI-based-Tutor-Flutter-app
    ```
3.  **Install Dependencies**:
    Run the following command to fetch the required packages listed in `pubspec.yaml`:
    ```bash
    flutter pub get
    ```

### Running the App

To run the application on a connected device or emulator:

1.  **Launch an Emulator** (Android/iOS) or connect a physical device.
2.  **Run the command**:
    ```bash
    flutter run
    ```
    *   To run on Chrome (Web): `flutter run -d chrome`

## File Structure & Description

Here is an overview of the key files and directories in the project:

### `lib/`
The main source code directory.

*   **`main.dart`**: The entry point of the application. Sets up the theme and loads the initial screen (Login).
*   **`constants.dart`**: Contains application-wide constants such as color palettes (`AppColors`) and gradients (`primaryGradient`) to ensure design consistency.

### `lib/screens/`
Contains the full-page screens of the application.

*   **`login_screen.dart`**: Handles the user login UI. Features a header with the app logo, email/password fields, and navigation to the Chat or Register screens.
*   **`register_screen.dart`**: The registration page for new users. Includes fields for creating an account and a "Create Account" button.
*   **`chat_screen.dart`**: The core feature screen. Displays the chat history between the user and the AI, along with the message input area. *Note: Currently uses placeholder data for demonstration.*

### `lib/widgets/`
Contains reusable UI components.

*   **`custom_text_field.dart`**: A styled text input field used in the Login and Register screens. It supports password obscuring and custom labels/hints.
*   **`chat_bubble.dart`**: A widget to display individual chat messages. It adapts its style (color, alignment) based on whether the message is from the user or the AI.

## Dependencies

This project uses the following external packages:

*   **`flutter`**: The core Flutter SDK.
*   **`google_fonts`**: For using the 'Inter' font family throughout the app.
*   **`cupertino_icons`**: For iOS-style icons.

## Troubleshooting

*   **'flutter' is not recognized**: Ensure the Flutter bin directory is added to your system's PATH environment variable.
*   **Dependencies not found**: Run `flutter pub get` again to ensure all packages are downloaded.
*   **Emulator issues**: If the app doesn't launch, try running `flutter doctor` to diagnose environment issues.

## Updates

*   **New UI Implementation**: Complete implementation of the Login, Register, and Chat screens matching the design mockups.
*   **Navigation**: Added basic navigation flow between Login -> Register and Login -> Chat.
