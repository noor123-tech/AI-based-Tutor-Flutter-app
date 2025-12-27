import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  static final GeminiService _instance = GeminiService._internal();
  late final GenerativeModel _model;
  
  // Singleton pattern to ensure we only have one instance of the service
  factory GeminiService() {
    return _instance;
  }

  GeminiService._internal() {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null) {
      throw Exception('GEMINI_API_KEY not found in .env file');
    }

    _model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        temperature: 0.7, // Slightly creative but focused
      ),
      systemInstruction: Content.system('You are an helpful English Tutor. Your goal is to help users improve their English skills. You can explain grammar rules, correct sentences, provide vocabulary examples, and engage in conversation practice. If a user asks about topics unrelated to English learning or casual conversation (e.g., coding, math, illegal activities), politely refuse and guide the conversation back to English learning.'),
    );
  }

  Future<String> sendMessage(String message) async {
    try {
      final content = [Content.text(message)];
      final response = await _model.generateContent(content);
      return response.text ?? "I'm having trouble understanding that. Could you try rephrasing?";
    } catch (e) {
      // ignore: avoid_print
      print('Gemini API Error: $e');
      return "Error: $e"; 
    }
  }
}
