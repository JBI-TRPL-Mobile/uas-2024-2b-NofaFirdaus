import 'package:flutter/material.dart';
import 'package:template_project/controller/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = RegisterController();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputField("Name", _nameController),
              const SizedBox(height: 16),

              inputField("Email", _emailController, keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),

              inputField("Password", _passwordController, obscureText: true),
              const SizedBox(height: 16),

              inputField("Confirm Password", _confirmPasswordController, obscureText: true),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: _onSignUpPressed,
                child: const Text("Sign Up"),
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text("Sign In"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputField(String label, TextEditingController controller,
      {bool obscureText = false, TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration:  InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter $label",
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  void _onSignUpPressed() {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match!")),
        );
        return;
      }

      final newUser = {
        "name": _nameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
      };

      _controller.addUser(newUser).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User registered successfully!")),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $error")),
        );
      });
    }
  }
}
