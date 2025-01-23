<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
=======
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
import 'package:opiny/custom_text.dart';

class OtpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
<<<<<<< HEAD
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
=======
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final Map<String, String> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
=======
    final Map<String, String> arguments = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
    final String phone = arguments['phone']!;
    final String verificationId = arguments['verificationId']!;

    Future<void> verifyOtp(BuildContext context, String otp) async {
      try {
<<<<<<< HEAD
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
=======
        final credential = PhoneAuthProvider.credential(
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
          verificationId: verificationId,
          smsCode: otp,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Phone verification successful!")),
        );

        // Navigate to the next screen after successful verification
        Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error verifying OTP: $e")),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Enter OTP"),
      ),
<<<<<<< HEAD
      body: SingleChildScrollView(
=======
      body: SingleChildScrollView (
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
<<<<<<< HEAD
              const CustomText(
                  text: "Verify Phone",
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              const SizedBox(height: 5),
              CustomText(text: "OTP has been sent to $phone", fontSize: 12),
=======
              const CustomText(text:
                "Verify Phone",
               fontSize: 24, fontWeight: FontWeight.bold),
              const SizedBox(height: 5),
              CustomText(text:
                "OTP has been sent to $phone",
                fontSize: 12
              ),
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
<<<<<<< HEAD
                    (index) => SizedBox(
                      width: 40,
                      height: 40,
=======
                        (index) => SizedBox(
                      width: 40,height: 40,
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
                      child: TextFormField(
                        controller: _controllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
<<<<<<< HEAD
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
=======
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 5) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const CustomText(text: 'Resend OTP in 12 seconds'),
              const SizedBox(height: 100),
<<<<<<< HEAD
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'By continuing, you accept that you are 18 years of age, consent to receiving WhatsApp images, and agree to our ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xff545454,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 140),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    String otp = _controllers
                        .map((controller) => controller.text)
                        .join();
                    verifyOtp(context, otp);
                  }
                },
                child: const CustomText(text: "Verify", color: Colors.white),
=======
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'By continuing, you accept that you are 18 years of age, consent to receiving WhatsApp images, and agree to our ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '.',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
            const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff545454,),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 140),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    String otp = _controllers.map((controller) => controller.text).join();
                    verifyOtp(context, otp);
                  }
                },
                child: const CustomText(text:
                  "Verify",
                  color: Colors.white),
>>>>>>> eb123ae2c621f3d08ef36ca49922754adde646e3
              ),
            ],
          ),
        ),
      ),
    );
  }
}
