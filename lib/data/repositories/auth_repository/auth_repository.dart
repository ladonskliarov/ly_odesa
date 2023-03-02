abstract class AuthRepository {
  Future createUser({
    required String email,
    required String password,
    required String fullName,
    required String city,
    required String phoneNumber,
    required String numberOfNovaPoshta,
  });
  Future signIn({
    required String email,
    required String password,
  });
  Future signOut();
  Future resetPassword(String email);
  Future sendVerificationEmail();
}