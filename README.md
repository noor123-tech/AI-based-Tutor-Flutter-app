# AI English Tutor App

A Flutter application designed to help users learn English through an AI-powered chat interface. This project focuses on providing a clean, modern, and user-friendly UI for an educational experience, powered by the Google Gemini API.

## Features

*   **Authentication UI**:
    *   **Login Screen**: Clean interface for users to sign in with email and password. Includes navigation to the Registration screen.
    *   **Registration Screen**: Sign-up form for new users to create an account.
*   **AI Chat Interface**:
    *   **Real-time Interaction**: Integrated with Google Gemini API (`gemini-2.5-flash`) for responsive and intelligent tutoring.
    *   **Context Aware**: System instructions ensure the AI stays focused on teaching English, correcting grammar, and providing vocabulary.
    *   **Chat Bubbles**: Distinct visual styles for user messages and AI responses, including error handling displays.
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
*   **Gemini API Key**: You need a valid API key from Google AI Studio.

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

### Configuration (.env)

This project uses `flutter_dotenv` to manage sensitive keys. You must create a `.env` file in the root directory.

1.  Create a file named `.env` in the root of the project (same level as `pubspec.yaml`).
2.  Add your Gemini API key to it:
    ```env
    GEMINI_API_KEY=your_api_key_here
    ```

### Running the App

To run the application on a connected device or emulator:

1.  **Launch an Emulator** (Android/iOS) or connect a physical device.
2.  **Run the command**:
    ```bash
    flutter run
    ```
    *   To run on Chrome (Web): `flutter run -d chrome`

    *> **Note**: You must restart the app completely if you modify the `.env` file.*

    *> **AI Model**: This app is configured to use **`gemini-2.5-flash`**. Ensure your API key has access to this model.*

## File Structure & Description

Here is an overview of the key files and directories in the project:

### `lib/`
The main source code directory.

*   **`main.dart`**: The entry point. Initializes `flutter_dotenv`, sets up the theme, and loads the Login screen.
*   **`constants.dart`**: Contains application-wide constants such as color palettes (`AppColors`) and gradients.

### `lib/services/`
*   **`gemini_service.dart`**: A singleton service class that handles all interactions with the Google Gemini API. It manages the `GenerativeModel`, applies system instructions for the "English Tutor" context, and handles API errors.

### `lib/screens/`
Contains the full-page screens of the application.

*   **`login_screen.dart`**: Handles the user login UI.
*   **`register_screen.dart`**: The registration page for new users.
*   **`chat_screen.dart`**: The core feature screen. Displays the chat history and integrates with `GeminiService` to send user input and display AI responses.

### `lib/widgets/`
Contains reusable UI components.

*   **`custom_text_field.dart`**: A styled text input field used in Login/Register screens.
*   **`chat_bubble.dart`**: A widget to display individual chat messages.

## Dependencies

This project uses the following external packages:

*   **`flutter`**: The core Flutter SDK.
*   **`google_fonts`**: For using the 'Inter' font family.
*   **`google_generative_ai`**: For accessing the Gemini API (specifically using the `gemini-2.5-flash` model).
*   **`flutter_dotenv`**: For loading environment variables from the `.env` file.
*   **`cupertino_icons`**: For iOS-style icons.

## Troubleshooting

*   **Gemini API Error (404)**: Ensure your API key is valid and has access to the model specified in `gemini_service.dart`.
*   **Assets not found (.env)**: If you get a "file not found" error for `.env`, ensuring it is listed in the `assets` section of `pubspec.yaml` (this is already configured).
*   **'flutter' is not recognized**: Ensure the Flutter bin directory is in your PATH.

## Updates

*   **Gemini Integration**: Replaced placeholder chat with real-time AI responses using `gemini-2.5-flash`.
*   **New UI Implementation**: Complete implementation of Auth and Chat flows.

## Implemented Functions

Key functions and methods:

*   **`GeminiService.sendMessage(String)`**: Sends the user's text to the Gemini model and returns the generated response. Handles exceptions gracefully.
*   **`main()`**: Initializes `dotenv` asynchronously before running the app.
*   **`ChatScreen` Logic**: Manages the list of messages state (`_messages`) and updates the UI upon receiving data from the service.

## UI Components Used

*   **`Scaffold`, `Column`, `Row`, `Container`, `Stack`**: Basic layout structure.
*   **`ListView.builder`**: Efficiently scrolls through the chat history.
*   **`TextField`**: Handles user input with a controller.
*   **`LinearGradient`**: Provides the UI with a modern aesthetic.

# Project Code Deep Dive & Architecture Explained

This section provides a detailed explanation of the project structure, code logic, and architectural decisions, specifically regarding State management and Widget usage.

## 1. Folder Structure & Organization

The codebase is organized into logical directories inside `lib/` to separate concerns:

*   **`lib/screens/`**: Contains the full-page views (`LoginScreen`, `RegisterScreen`, `ChatScreen`). Each file represents a complete screen the user navigates to.
*   **`lib/widgets/`**: Contains reusable UI components (`ChatBubble`, `CustomTextField`). These are smaller building blocks used within screens to ensure consistency and reusability.
*   **`lib/services/`**: Contains business logic and external data handling (`GeminiService`), separating data fetching from UI code for better maintainability.

## 2. File Implementation Details & Design Choices

### `lib/screens/chat_screen.dart` (StatefulWidget)
**Why StatefulWidget?**
We chose `StatefulWidget` for the Chat Screen because it involves **interactive and dynamic data** that changes over time during the *same* screen view:
1.  **Message History (`_messages`)**: The list of messages grows as you and the AI chat. We need `setState()` to tell Flutter to rebuild the UI whenever a new message is added to this list.
2.  **Loading State (`_isLoading`)**: We need to toggle a loading indicator (spinner) ON when the request starts and OFF when the response arrives. This is a state change.
3.  **Scroll Position (`_scrollController`)**: The chat view needs to programmatically scroll to the bottom when new messages arrive so the user sees the latest text.
4.  **Text Input (`_controller`)**: We need to read the text field's value and clear it after sending.

**Key Function Logic:**
*   **`_sendMessage()`**: This is the core logic function.
    1.  It first checks if the input is empty.
    2.  It uses `setState` to immediately add the user's message to `_messages` so it appears on screen.
    3.  It calls `GeminiService.sendMessage()` (asynchronous operation).
    4.  While waiting, `_isLoading` is true, showing a visual indicator.
    5.  When the result returns, it calls `setState` again to add the AI's response to `_messages` and turn off loading.

### `lib/screens/login_screen.dart` & `register_screen.dart` (StatelessWidget)
**Why StatelessWidget?**
These screens are currently implemented as `StatelessWidget`.
*   **Reasoning**: Their primary purpose is to display a form and navigate. In this specific implementation, they don't hold internal mutable state that requires a *local* redraw.
*   **Navigation**: When you click "Sign In" or "Register", the app pushes a completely *new* screen (`ChatScreen`) onto the stack. It doesn't need to update the *current* screen's pixels.
*   **Efficiency**: Stateless widgets are slightly lighter weight. Since we aren't validating fields in real-time with error messages that appear/disappear on *this* screen (in this version), `StatelessWidget` is the optimal choice.

### `lib/widgets/chat_bubble.dart` (StatelessWidget)
**Why Stateless?**
This is a "pure" presentation component.
*   **Logic**: It receives data (`message`, `isUser`, `time`) through its constructor and simply paints it on the screen.
*   **Immutability**: The bubble itself doesn't change once drawn. If the data changes, the parent (`ChatScreen`) rebuilds and creates a *new* bubble with new data. This separation makes the component reusable and easy to test.

### `lib/services/gemini_service.dart` (Singleton)
**Why Singleton?**
We used the Singleton pattern (`factory GeminiService() { return _instance; }`).
*   **Purpose**: This ensures that only **one single instance** of the `GeminiService` class exists in the entire application lifecycle.
*   **Benefit**: We don't want to re-load the API key from the `.env` file or re-initialize the `GenerativeModel` configuration every single time you tap the "Send" button. The Singleton initializes once and is reused, which is more efficient for resource management.
