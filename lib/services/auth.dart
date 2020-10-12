import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      return e.toString();
    } on PlatformException catch (e) {
      return e.toString();
    } catch (e) {
      return e.toString();
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signIn(String email, String password) async {
    try {
      // print("0");
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // print("1");
      return "SIN";
    } on FirebaseAuthException catch (e) {
      // print("2");
      return e.message.toString();
    } on PlatformException catch (e) {
      // print("3");
      return e.message.toString();
    } catch (e) {
      // print("4");
      return e.toString();
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "SUP";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } on PlatformException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
