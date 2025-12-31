import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: "AIzaSyCVYuKvymjoUx8NGWUFzWKTzZQbyzfjIGg",
        authDomain: "ai-tutor-329f1.firebaseapp.com",
        projectId: "ai-tutor-329f1",
        storageBucket: "ai-tutor-329f1.firebasestorage.app",
        messagingSenderId: "392976308948",
        appId: "1:392976308948:web:05d696f2de1715c695f941",
      );
    }
    if (Platform.isWindows) {
      return const FirebaseOptions(
        apiKey: "AIzaSyCVYuKvymjoUx8NGWUFzWKTzZQbyzfjIGg",
        authDomain: "ai-tutor-329f1.firebaseapp.com",
        projectId: "ai-tutor-329f1",
        storageBucket: "ai-tutor-329f1.firebasestorage.app",
        messagingSenderId: "392976308948",
        appId: "1:392976308948:web:05d696f2de1715c695f941",
      );
    }
    // Android uses google-services.json automatically.
    throw UnsupportedError(
      'DefaultFirebaseOptions have not been configured for this platform - '
      'you can reconfigure this by running the FlutterFire CLI again.',
    );
  }
}
