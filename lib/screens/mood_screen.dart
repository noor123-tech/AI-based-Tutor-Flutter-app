import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/gemini_service.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  final List<String> moods = [
    'Happy', 'Sad',
    'Excited', 'Curious',
    'Depressed', 'Anxiety',
    'Anger', 'Gratitude',
    'Surprised', 'Fear',
  ];

  String? selectedMood;
  String? advice;
  bool isLoading = false;

  // Custom Colors based on the reference image
  final Color bgPurple = const Color(0xFFC4C4F0); // Light Lilac background
  final Color btnPink = const Color(0xFFFF85C2);  // Bright Pink buttons
  final Color darkText = Colors.black87;

  Future<void> _getAdvice(String mood) async {
    setState(() {
      selectedMood = mood;
      isLoading = true;
      advice = null; // Reset advice while loading
    });

    final result = await GeminiService().getMoodAdvice(mood);

    if (mounted) {
      setState(() {
        advice = result;
        isLoading = false;
      });
    }
  }

  void _reset() {
    setState(() {
      selectedMood = null;
      advice = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPurple, // The lilac background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: selectedMood == null ? _buildSelectionView() : _buildResultView(),
        ),
      ),
    );
  }

  Widget _buildSelectionView() {
    return Column(
      children: [
        const SizedBox(height: 20),
        // Header
        Container(
           margin: const EdgeInsets.only(bottom: 30),
           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
           decoration: BoxDecoration(
             color: Colors.white.withOpacity(0.2),
             borderRadius: BorderRadius.circular(20),
           ),
           child: Text(
            "What's Your Mood\nRight Now ?",
            textAlign: TextAlign.center,
            style: GoogleFonts.libreBaskerville( // Using a serif font like the image might be better, or Inter
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        
        // Grid of Buttons
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: moods.length,
            itemBuilder: (context, index) {
              return _buildMoodButton(moods[index]);
            },
          ),
        ),
        
        Text(
          "Let AI Decide the Best Mood Advice for You",
          style: GoogleFonts.inter(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildResultView() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           IconButton(
             icon: const Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Icon(Icons.arrow_back_ios, size: 20),
                 Text("BACK", style: TextStyle(fontWeight: FontWeight.bold)),
               ],
             ),
             onPressed: _reset,
           ),
           const SizedBox(height: 20),
           
           // Title
           Container(
             width: double.infinity,
             padding: const EdgeInsets.all(12),
             decoration: BoxDecoration(
               color: const Color(0xFF4B0082), // Indigo color
               borderRadius: BorderRadius.circular(20),
             ),
             child: Text(
               "Islamic Mood Advice",
               textAlign: TextAlign.center,
               style: GoogleFonts.libreBaskerville(
                 color: Colors.white,
                 fontStyle: FontStyle.italic,
               ),
             ),
           ),
           const SizedBox(height: 30),
           
           RichText(
             text: TextSpan(
               style: GoogleFonts.inter(fontSize: 16, color: Colors.black87),
               children: [
                 const TextSpan(text: "Your's Selected Mood: "),
                 TextSpan(
                   text: selectedMood,
                   style: const TextStyle(fontWeight: FontWeight.bold),
                 ),
               ],
             ),
           ),
           
           const SizedBox(height: 20),

           // Cute Islamic Cat Image
           Center(
             child: Image.asset(
               'assests/islamic_cat.png',
               height: 120, // Not too big
             ),
           ),
           
           const SizedBox(height: 20),
           
           // Advice Card
           Center(
             child: Container(
               width: double.infinity,
               height: 300, // Fixed height square-ish
               padding: const EdgeInsets.all(24),
               decoration: BoxDecoration(
                 color: btnPink, // The pink color
                 borderRadius: BorderRadius.circular(20),
               ),
               child: Center(
                 child: isLoading 
                 ? const CircularProgressIndicator(color: Colors.white)
                 : Text(
                   advice ?? "",
                   textAlign: TextAlign.center,
                   style: GoogleFonts.libreBaskerville(
                     color: Colors.white,
                     fontSize: 22,
                     height: 1.5,
                   ),
                 ),
               ),
             ),
           ),
        ],
      ),
    );
  }

  Widget _buildMoodButton(String mood) {
    return GestureDetector(
      onTap: () => _getAdvice(mood),
      child: Container(
        decoration: BoxDecoration(
          color: btnPink,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ]
        ),
        child: Center(
          child: Text(
            mood,
            style: GoogleFonts.libreBaskerville(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
