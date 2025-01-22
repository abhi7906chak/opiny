import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../custom_text.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  LoginScreen({super.key});

  Future<void> sendOtp(BuildContext context) async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty || phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: CustomText(text: "Enter a valid phone number")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$phone',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto verification (for some devices)
          await FirebaseAuth.instance.signInWithCredential(credential);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Phone verified successfully!")),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Verification failed: ${e.message}")),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.pushNamed(context, '/otp', arguments: {
            'phone': phone,
            'verificationId': verificationId,
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("Timeout for verification ID: $verificationId");
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Image taking 3/4 of the screen
          SizedBox(
            height: screenHeight * 0.75,
            width: screenWidth,
            child: Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(top: 250,left: 100,
              child: Image.asset('assets/images/cup.png',height: 350,)),
          const Positioned(top: 100,left: 130,
              child: Text('     300 CRORE +\n TOTAL WINNINGS',style:TextStyle(fontFamily: 'ITC',fontSize: 24,fontWeight:FontWeight.bold,color: Color(
                  0xffFFB202)),),),
          const Positioned(top: 170,left: 130,
              child: Text('  3 CRORE +\n TRUSTED USERS',style:TextStyle(fontFamily:'Roboto',fontSize: 12,color: Colors.white
                  )),),
          const Positioned(top: 170,left: 250,
              child: CustomText(text:'  4.5⭐ \n RATED APP',fontSize: 12,color: Colors.white
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.30,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CustomText(text:
                        'Login or Sign Up',
                        fontSize: 15,
                          fontWeight: FontWeight.bold,

                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 12, right: 8),
                          child: CustomText(text:
                            '+91',
                              color: Colors.black,
                              fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                        hintText: 'Enter Your Mobile Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () => sendOtp(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        minimumSize: const Size(double.infinity, 48),
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rectangle shape
                        ),
                      ),
                      child: const CustomText(text:'Continue',color: Colors.white,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
