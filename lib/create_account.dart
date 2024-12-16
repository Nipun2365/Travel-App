import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _newUsernameController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool _isPasswordStrong(String password) {
    final passwordPattern = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordPattern.hasMatch(password);
  }

  void _createAccount() {
    String newUsername = _newUsernameController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (newUsername.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      // Show an error message if any field is empty
      _showErrorDialog('Error', 'Please fill in all fields.');
    } else if (!_isPasswordStrong(newPassword)) {
      // Show an error message if the password is not strong enough
      _showErrorDialog('Weak Password', 'Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character.');
    } else if (newPassword != confirmPassword) {
      // Show an error message if passwords don't match
      _showErrorDialog('Passwords Mismatch', 'Passwords do not match.');
    } else {
      // Here you can add code to save the new account details
      _showSuccessDialog();
    }
  }

  void _showErrorDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Account Created'),
        content: const Text('Your account has been successfully created.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); // Navigate back to the previous screen
        },
      ),
    ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 100),
                TextField(
                  controller: _newUsernameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_add),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'New Username',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isNewPasswordVisible = !_isNewPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'New Password',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  obscureText: !_isNewPasswordVisible,
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Confirm Password',
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  obscureText: !_isConfirmPasswordVisible,
                ),
               const SizedBox(height: 50),
ElevatedButton(
  onPressed: _createAccount,
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      horizontal: 40,
      vertical: 15,
    ), backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: Colors.black), // Add a border color
    ), // Set button color to black
  ),
  child: const Text(
    'Create Account',
    style: TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
  ),
),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
