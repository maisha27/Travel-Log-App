import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient and Image
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2E8B8B), Color(0xFFE3F1F1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Bottom Image overlay

          // Login Form
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 36),

                    // Language dropdown on top-right
                    Align(
                      alignment: Alignment.topRight,
                      child: DropdownButton<String>(
                        value: 'English',
                        items: const [
                          DropdownMenuItem(value: 'English', child: Text('English')),
                        ],
                        onChanged: (value) {},
                        underline: const SizedBox(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // White Card
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Let's ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextSpan(
                                  text: "Travel you in.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Color(0xFF2E8B8B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Discover the World with Every Sign In",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          const SizedBox(height: 20),

                          // Email Field
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Email or Phone Number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Password Field
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot password?",
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Sign In Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {Navigator.pushNamed(context, '/home');},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2E8B8B),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(fontSize: 16, color: Colors.white),
                                
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          const Center(child: Text("or connect with")),

                          const SizedBox(height: 16),

                          // Social Icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              socialLoginIcon('assets/google.png'),
                              socialLoginIcon('assets/apple.png'),
                              socialLoginIcon('assets/facebook.png'),
                            ],
                          ),

                          const SizedBox(height: 16),

                          const Center(child: Text("Don’t have an account?")),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Sign Up Button
                   SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/registration');
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(color: Colors.white),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xFF2E8B8B),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Reusable social login icon
  Widget socialLoginIcon(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Image.asset(
        assetPath,
        width: 28,
        height: 28,
      ),
    );
  }
}
