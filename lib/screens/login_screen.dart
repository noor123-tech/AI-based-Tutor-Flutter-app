import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../widgets/custom_text_field.dart';
import 'register_screen.dart';
import 'chat_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                gradient: primaryGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'AI',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'English Tutor',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Learn English with AI',
                    style: GoogleFonts.inter(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            // Form
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back!',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to continue learning',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.textGrey,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const CustomTextField(
                    label: 'Email',
                    hint: 'your@email.com',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextField(
                    label: 'Password',
                    hint: '••••••••',
                    isPassword: true,
                  ),
                  const SizedBox(height: 40),
                  
                  // Sign Up Link
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.inter(
                            color: AppColors.textGrey,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.inter(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Hidden button to navigate to Chat for demo purposes
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const ChatScreen()),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                       child: const Text(""), // Invisible button area to click through if needed, but user asked for design only. 
                       // Actually, let's make the "Sign in" logic triggered by a button or just make the whole form static?
                       // The user said "make sure i can register and login without saving anything... just the design".
                       // I should probably add a "Sign In" button even if it wasn't explicitly clear in the "Welcome back" screenshot, 
                       // but usually there is one. 
                       // Looking at the screenshot... I don't see a "Sign In" button on the Login screen! 
                       // Wait, let me re-examine the image.
                       // The Login screen (middle) shows Email, Password, and then "Don't have an account? Sign up".
                       // It DOES NOT show a big black "Sign In" button like the "Create Account" button on the right.
                       // This is strange. Maybe it's scrolled down? Or maybe the "Sign up" is the action?
                       // No, "Sign up" is a link.
                       // I will assume there IS a button below the fold or I should add one for usability, 
                       // BUT the user said "same design".
                       // However, without a button, you can't "login".
                       // I will add a "Sign In" button similar to the "Create Account" button but maybe keep it consistent.
                       // OR, I will just make the "Sign up" link work, and maybe add a hidden way or just a visible "Sign In" button 
                       // that matches the style of the "Create Account" button, assuming it's just cut off.
                       // Actually, looking at the "Registration" screen, the button is very prominent.
                       // I'll add a "Sign In" button to the Login screen to make it functional as requested ("make sure i can register and login").
                    ),
                  ),
                   SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const ChatScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign In',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
