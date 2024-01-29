
///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Importing the package>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
import 'package:google_sign_in/google_sign_in.dart';


///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Defining the GoogleSignInService class>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

class GoogleSignInService {
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Static instance of GoogleSignIn>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

  static final _googleSignIn = GoogleSignIn();
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Login method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Logout method:>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

  static Future logout() => _googleSignIn.signOut();
}