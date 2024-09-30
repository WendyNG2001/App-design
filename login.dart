import 'package:flutter/material.dart';
import 'register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return const EnterEmail(); // Main screen is now the email screen
  }
}

class EnterEmail extends StatefulWidget {
  const EnterEmail({super.key});

  @override
  EnterEmailState createState() => EnterEmailState();  // Fixing the createState method
}

class EnterEmailState extends State<EnterEmail> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorText;  // To hold error message if the email is invalid

  // Function to validate email format using regex
  bool _validateEmail(String email) {
    const String emailPattern =
        r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$';
    final RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  // Sign-in action: validate email and display error if invalid
  void _signIn() {
    setState(() {
      if (_validateEmail(_emailController.text)) {
        _errorText = null;  // Valid email
        // Proceed with sign-in logic here
      } else {
        _errorText = 'Invalid email address';  // Show error message if email is invalid
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // App name "FREE."
                const Text(
                  'FREE.',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // Email Input Field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    border: const OutlineInputBorder(),
                    errorText: _errorText,  // Display error if any
                  ),
                ),
                const SizedBox(height: 20),

                // Password Input Field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Enter your password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // "Keep Me Signed In" Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {
                        // Add "Keep me signed in" functionality here
                      },
                    ),
                    const Text('Keep Me Signed In'),
                  ],
                ),
                const SizedBox(height: 20),

                // Sign In Button
                ElevatedButton(
                  onPressed: _signIn,  // Call _signIn function on button press
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text('SIGN IN'),
                ),
                const SizedBox(height: 20),

                // Register & Forgot Password Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigate to the RegisterScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: const Text('Register'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add forgot password functionality here
                      },
                      child: const Text('Forgot Password'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
