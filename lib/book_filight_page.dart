
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; //phone  

import 'package:flutter/services.dart';

//phone for digit

class BookFlightPage extends StatefulWidget {
  const BookFlightPage({super.key});

  @override
  State<BookFlightPage> createState() => _BookFlightPageState();
}

class _BookFlightPageState extends State<BookFlightPage> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _selectedDate = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _guestsController = TextEditingController();
  late TextEditingController _arrivalController= TextEditingController();

bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
  @override
  void initState() {
    super.initState();
    _arrivalController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
       leading: IconButton(icon: const Icon(Icons.arrow_back), 
       onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        
       ),
      ),
      
      body: Column(
        children: [
          const SizedBox(
            height: 0,
          ),
          SizedBox(
            height: 80,
            
            child: Center(child: Image.asset("images/airplane.png")),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Book Your Package",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 580,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Name:"),
                      const SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "What is your name",
                            border: OutlineInputBorder(),
                            fillColor: Colors.blue,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                          ),
                        ),
                      ),
                     const SizedBox(
        height: 10,
      ),
      const Text("Email:"),
      const SizedBox(
        height: 2,
      ),
      SizedBox(
        height: 45,
        child: TextFormField(
          controller: _emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
      return 'Please enter your email';
            } else if (!validateEmail(value)) {
      return 'Please enter a valid email';
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: "What is your email",
            border: OutlineInputBorder(),
            fillColor: Colors.blue,
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
          ),
        ),
      ),
      
      
        const SizedBox(
        height: 10,
      ),
      const Text("Phone:"),
      Column(
        children: [
          const SizedBox(height: 2),
          SizedBox(
            height: 65,
            child: Row(
      children: [
        Expanded(
          child: IntlPhoneField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.blue,
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (phone) {
              if (phone?.number.isEmpty ?? true) {
                return 'Please enter a phone number';
              }
              return null;
            },
            initialCountryCode: 'IN',
            onChanged: (phone) {
              
              // Additional actions if needed
            },
          ),
        ),
      ],
            ),
          ),
        ],
      ),
      
      
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Where To:"),
                      const SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: _locationController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your destination';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Where do you want to go",
                            border: OutlineInputBorder(),
                            fillColor: Colors.blue,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("How Many:"),
                      const SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: _guestsController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the number of guests';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly, // Allow only digits
                          ],
                          decoration: const InputDecoration(
                            hintText: "How many guests",
                            border: OutlineInputBorder(),
                            fillColor: Colors.blue,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      
                      const Text("Arrival:"),
                      const SizedBox(height: 2),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          readOnly: true,
                          onTap: _selectDate,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            fillColor: Colors.blue,
                            filled: true,
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          controller: _arrivalController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '   Please select an arrival date';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                   child:ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            
            // All fields are valid, you can proceed with submission.
            print("Form is valid");
          } else {
            // Form is not valid, show an error message.
            print("Form is not valid");
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Change the background color of the button
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Change the text color of the button
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 15, horizontal: 100)), // Change the padding of the button
          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), // Change the shape of the button
        ),
        
        child: const Text(
          'Submit',
          style: TextStyle(fontSize: 18), // Change the font size of the button text
        ),
      ),
                      ),
      
      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _arrivalController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }
}
