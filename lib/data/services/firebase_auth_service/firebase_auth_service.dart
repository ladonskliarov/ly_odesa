import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ly_odesa/data/models/bonus_card.dart';
import 'package:ly_odesa/data/models/my_user.dart';
import 'package:ly_odesa/data/repositories/auth_repository/auth_repository.dart';

class FirebaseAuthService implements AuthRepository{
  @override
  Future createUser({
    required String email, required String password,
    required String fullName, required String city,
    required String phoneNumber, required int numberOfNovaPoshta,
  }) async {
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user!;
      final users = FirebaseFirestore.instance.collection('users').doc(user.uid.toString());
      final firestoreUser = MyUser(
          fullName: fullName,
          city: city,
          email: email,
          password: password,
          numberOfNovaPoshta: numberOfNovaPoshta,
          bonusCard: BonusCard(
              numberOfBonusCard: 1,
              balance: 25
          ),
          phoneNumber: phoneNumber
      );
      final jsonUser = firestoreUser.toJson();
      await users.set(jsonUser);


    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {} else if (error.code == 'email-already-in-use') {} else {}
    } catch (error){
      print(error.toString());
    }
    return user;
  }

  @override
  Future signIn({required String email, required String password}) async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      }on FirebaseAuthException catch (error){
        if(error.code == "user-not-found"){}
      }
  }

  @override
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (error) {}
  }
}