# AI English Tutor App

A comprehensive Flutter application designed to provide an interactive English learning experience using Google's Gemini AI. This app features a modern, responsive UI, secure Firebase Authentication, and real-time AI tutoring.

## 🚀 Project Overview

The **AI English Tutor** is strictly context-aware. It acts as a helpful English tutor, correcting grammar, explaining concepts, and practicing conversation. It will politely refuse to discuss unrelated topics (like coding or math), ensuring the user stays focused on language learning.

## ✨ Key Features

### 1. 🔐 Robust Authentication (Firebase)
-   **Security**: Powered by **Firebase Authentication** for secure Email/Password sign-up and sign-in.
-   **Cloud Storage**: User profiles (Name, Email) are stored in **Cloud Firestore** in the `users` collection upon registration.
-   **Session Management**: Keeps users logged in across app restarts.

### 2. 🤖 Advanced AI Tutoring
-   **Model**: Uses Google's **`gemini-2.5-flash`** model for high-speed, low-latency responses.
-   **System Instructions**: The AI is prompted with specific system instructions to strictly adhere to the role of an English Tutor.
-   **Error Handling**: Graceful error messages if the API request fails (e.g., network issues).

### 3. 🎨 Modern & Responsive UI
-   **custom Design System**: Built with a dedicated `AppColors` palette including deep blues (`#4B7BFF`) and purples (`#9C4BFF`) for a premium gradient look.
-   **Chat Interface**:
    -   **AI Messages**: Rendered in light grey bubbles (`#F2F4F7`) with the AI logo.
    -   **User Messages**: Rendered in gradient blue bubbles (`AppColors.userBubble`) with a **Custom User Avatar**.
    -   **Avatar Integration**: The user's custom image (`student_avatar.png`) is displayed in the Login Header, Chat Header, and next to every user message.
-   **Typography**: Uses the **Inter** font family via `google_fonts` for clean, readable text.

### 4. 📱 Multi-Platform Support
-   **Android**: Fully configured with `google-services.json`.
-   **Web**: Configured with custom `firebase_options.dart`.
-   **Windows**: Configured with custom `firebase_options.dart` (Developer Mode required).

---

## 🛠️ Tech Stack & Dependencies

The project is built with **Flutter 3.10+** and relies on the following key packages:

| Package | Purpose |
| :--- | :--- |
| `flutter` | Core framework. |
| `firebase_core` | Initialization for Firebase services. |
| `firebase_auth` | Handling User Sign-Up/Sign-In. |
| `cloud_firestore` | NoSQL Database for storing user details. |
| `google_generative_ai` | Interface for Gemini API. |
| `flutter_dotenv` | Secure management of API Keys (`.env`). |
| `google_fonts` | 'Inter' font family implementation. |
| `cupertino_icons` | iOS-style iconography. |

---

## 📂 Project Structure Explained

```text
lib/
├── main.dart               # Entry Point. Initializes Firebase & dotenv.
├── firebase_options.dart   # Firebase Config (Web/Windows).
├── constants.dart          # Design Tokens (Colors, Gradients).
├── services/
│   ├── auth_service.dart   # Handles Auth & Firestore logic.
│   └── gemini_service.dart # Singleton service for Gemini API.
├── screens/
│   ├── login_screen.dart   # Email/Password Login Form.
│   ├── register_screen.dart# Registration Form + Firestore creation.
│   └── chat_screen.dart    # Main Chat UI + State Management.
└── widgets/
    ├── chat_bubble.dart    # Reusable Message Bubble (User/AI).
    └── custom_text_field.dart # Reusable Input Field.
```

### Detailed Breakdown

#### `lib/services/auth_service.dart`
-   **Responsibilities**:
    -   `signUp()`: Creates a user in Firebase Auth AND writes a document to `users/{uid}` in Firestore.
    -   `signIn()`: Authenticates the user.
    -   Exposes `currentUser` to checking login status.

#### `lib/services/gemini_service.dart` (Singleton)
-   Implemented as a **Singleton** to ensure the API key and Model are initialized only once.
-   **System Prompt**: "You are an helpful English Tutor... If a user asks about topics unrelated to English learning... politely refuse."

#### `lib/widgets/chat_bubble.dart`
-   Determines if a message is from `isUser` or AI.
-   **Avatar Logic**: Checks `isUser`. If true, displays `assests/student_avatar.png`.

---

## 🚀 Installation & Setup

### 1. Prerequisites
-   Flutter SDK installed.
-   A Google Cloud Project with **Gemini API Key**.
-   A **Firebase Project** with Auth and Firestore enabled.

### 2. Assets & Environment
1.  **Clone** the repo.
2.  **API Key**: Create a `.env` file in the root:
    ```env
    GEMINI_API_KEY=your_api_key_here
    ```
3.  **Dependencies**: Run `flutter pub get`.

### 3. Platform Specific Configuration

#### Android 🤖
-   Download `google-services.json` from Firebase Console.
-   Place it in `android/app/google-services.json`.

#### Web 🌐 & Windows 💻
-   Open `lib/firebase_options.dart`.
-   Paste your **Web App Config** keys into the sections for `kIsWeb` and `Platform.isWindows`.
-   **Windows Only**: Enable **Developer Mode** in Windows Settings to allow symlinks for plugins.

### 4. Running the App
```bash
# For Android Emulator or Device
flutter run

# For Web (Chrome)
flutter run -d chrome

# For Windows Desktop
flutter run -d windows
```

---

## ❓ Troubleshooting

### "FirebaseOptions cannot be null"
-   **Cause**: You are running on Web or Windows but haven't configured `lib/firebase_options.dart`.
-   **Fix**: Copy your `apiKey`, `appId`, etc. from Firebase Console > Project Settings > Web App, and paste them into `lib/firebase_options.dart`.

### "Building with plugins requires symlink support" (Windows)
-   **Cause**: Windows limits symbolic link creation by default.
-   **Fix**: Go to **Settings > Privacy & security > For developers** and turn **Developer Mode** ON.

### AI Avatar / User Image Issues
-   **Images**: Stored in `assests/`.
-   **User Avatar**: The file is strictly named `student_avatar.png`. If you replace it, keep the filename exact.
-   **Config**: Ensure `pubspec.yaml` contains:
    ```yaml
    assets:
      - assests/
    ```

---

## 🔮 Future Roadmap (Potential Features)
-   **Voice Chat**: Integration with Speech-to-Text and Text-to-Speech.
-   **Progress Tracking**: Save chat history to Firestore to track learning progress over time.
-   **Quizzes**: AI-generated quizzes based on chat topics.
