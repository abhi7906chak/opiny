import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  Future<void> sendOtp(BuildContext context, String phone) async {
    if (phone.isEmpty || phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter a valid phone number")),
      );
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91$phone',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // await _auth.signInWithCredential(credential);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text("Phone verified successfully!")),
          // );
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
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
