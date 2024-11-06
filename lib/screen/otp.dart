import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'hmpage.dart'; // Import the homepage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP Input',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OtpScreen(),
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter OTP number that we sent to your email',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                textStyle: const TextStyle(color: Colors.black),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                  fieldHeight: 60,
                  fieldWidth: 50,
                  activeFillColor: Colors.grey[200],
                  inactiveFillColor: Colors.grey[200],
                  selectedFillColor: Colors.grey[300],
                  activeColor: Colors.grey,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.blue,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.white,
                enableActiveFill: true,
                controller: textEditingController,
                onCompleted: (v) {
                  print("Completed: $v");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
