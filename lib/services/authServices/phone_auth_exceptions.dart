import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthExceptionHandler {
  static String handleException(FirebaseAuthException e) {
    String errorMessage = '';
    switch (e.code) {
      case 'invalid-verification-code':
        errorMessage = 'Invalid verification code';
        break;
      case 'session-expired':
        errorMessage = 'Session expired, please try again';
        break;
      case 'invalid-verification-id':
        errorMessage = 'Invalid verification ID';
        break;
      case 'quota-exceeded':
        errorMessage = 'Verification quota exceeded, please try again later';
        break;
      case 'network-request-failed':
        errorMessage =
            'Network request failed, please check your internet connection';
        break;
      default:
        errorMessage = 'An error occurred, please try again';
    }
    return errorMessage;
  }
}
