import 'package:amazon_cognito_identity_dart_2/cognito.dart';



class User{
  String emailId;
  String password;
  String name;
  User({required this.emailId,required this.password,required this.name});
  final userPool =
  new CognitoUserPool('ap-south-1_tDGvOIUiG', '5olhj4b8jufbf38unu4c5co8hm');
  Future<bool> signUp()async{
    // final userAttributes = [
    //   new AttributeArg(name :'first_name',value: name),
    // ];
    var data;
    try{
      data = await userPool.signUp(emailId, password);
      print("User registered");
      return true;
    }
    catch(e){
      print(data);
      print("error in signing Up - ${e}");
      return false;
    }
  }
   Future<bool> verifyUser(String email,String code)async{

    final cognitoUser = new CognitoUser(email, userPool);
    bool isVerified = false;
    try{
      isVerified = await cognitoUser.confirmRegistration(code);
    }catch(e){
           print("Error in verifying user - $e");
           isVerified = false;
    }
    return isVerified;
  }
  Future<bool> resendCode(String email)async{
    final cognitoUser = new CognitoUser(email, userPool);
    final String status;
    try{
      await cognitoUser.resendConfirmationCode();

    }catch(e){
      print("Error in resending Code -$e");
      return false;
    }
    return true;

  }
  Future<bool> authenticateUser(String email,String password)async{
    final cognitoUser = new CognitoUser(email, userPool);
    final authDetails = AuthenticationDetails(
      username: email,password: password,
    );
    final session;
    bool authenticated = false;
    try{
      session = await cognitoUser.authenticateUser(authDetails);
      authenticated = true;
      print(session);
    } on CognitoUserNewPasswordRequiredException catch (e) {
      print('ERROR - $e');
      // handle New Password challenge
    } on CognitoUserMfaRequiredException catch (e) {
      print('ERROR - $e');
      // handle SMS_MFA challenge
    } on CognitoUserSelectMfaTypeException catch (e) {print('ERROR - $e');
      // handle SELECT_MFA_TYPE challenge
    } on CognitoUserMfaSetupException catch (e) {print('ERROR - $e');
      // handle MFA_SETUP challenge
    } on CognitoUserTotpRequiredException catch (e) {print('ERROR - $e');
      // handle SOFTWARE_TOKEN_MFA challenge
    } on CognitoUserCustomChallengeException catch (e) {print('ERROR - $e');
      // handle CUSTOM_CHALLENGE challenge
    } on CognitoUserConfirmationNecessaryException catch (e) {print('ERROR - $e');
      // handle User Confirmation Necessary
    } on CognitoClientException catch (e) {print('ERROR - $e');
      // handle Wrong Username and Password and Cognito Client

    }catch(e){
      print("Error in authenticating user - $e");
      authenticated = false;
    }
    print(authenticated);

    return authenticated;
  }

  Future<bool> forgotPassword(String email)async{
    final cognitoUser = new CognitoUser(email, userPool);
    var data;
    bool isSent = false;
    try{
      data = await cognitoUser.forgotPassword();
      isSent = true;
    }catch(e){
      print("Error in sending forgot password - $e");
      isSent = false;
    }
    return isSent;

  }
 Future<bool> retrievePassword(String email,String code,String newPassword)async{
    final cognitoUser = new CognitoUser(email, userPool);

    bool passwordChanged = false;
    try{
      passwordChanged = await cognitoUser.confirmPassword(code, newPassword);
    }catch(e){
        print("Error in changing passwrod - $e");
        passwordChanged = false;
    }
    return passwordChanged;


  }

  signOut(String email)async{
    final cognitoUser = new CognitoUser(email, userPool);
    try{
      await cognitoUser.signOut();
    }catch(e){
      print("Error in signing out - $e");
    }


  }


}
