import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ly_odesa/data/models/bonus_card.dart';
import 'package:ly_odesa/data/models/my_user.dart';
import 'package:ly_odesa/data/repositories/auth_repository/auth_repository.dart';

class FirebaseAuthService implements AuthRepository {
  @override
  Future createUser({
    required String email,
    required String password,
    required String fullName,
    required String city,
    required String phoneNumber,
    required String numberOfNovaPoshta,
  }) async {
    User? userFirebaseAuth;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      userFirebaseAuth = userCredential.user!;
      final usersFirestore = FirebaseFirestore.instance.collection('users');
      final newUserFirestore = usersFirestore.doc(userFirebaseAuth.uid.toString());
      final sortedUsersFirestore = await usersFirestore.orderBy('bonusCard', descending: true).get();

      int _bonusCardNumber = 100000001000;
      if(sortedUsersFirestore.docs.isEmpty){
        return;
      } else {
        final lastCreatedUserFirestore = sortedUsersFirestore.docs.first.data();
        _bonusCardNumber = MyUser.fromJson(lastCreatedUserFirestore).bonusCard.numberOfBonusCard + 1;
      }

      final firestoreUser = MyUser(
          fullName: fullName,
          city: city,
          email: email,
          password: password,
          numberOfNovaPoshta: numberOfNovaPoshta,
          bonusCard: BonusCard(
              numberOfBonusCard: _bonusCardNumber,
              balance: 25
          ),
          phoneNumber: phoneNumber);

      final jsonUser = firestoreUser.toJson();
      await newUserFirestore.set(jsonUser);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
      } else if (error.code == 'email-already-in-use') {
      } else {}
    } catch (error) {
      print(error.toString());
    }
    return userFirebaseAuth;
  }

  @override
  Future signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {}
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
