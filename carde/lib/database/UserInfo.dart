// Class containing individual user info
// Contains: ID, login loginEmail, loginPassword
class UserInfo {
  final int? id;
  final String loginUsername;
  final String loginEmail;
  final String loginPassword;
  UserInfo(
      {this.id,
      required this.loginUsername,
      required this.loginEmail,
      required this.loginPassword});

  Map<String, Object?> toJson() => {
        UserInfoFields.id: id,
        UserInfoFields.loginUsername: loginUsername,
        UserInfoFields.loginEmail: loginEmail,
        UserInfoFields.loginPassword: loginPassword,
      };
}

// Table containing User Info
final String userInfoTable = 'userInfo';

// Class for user info fields
class UserInfoFields {
  static final String id = '_id';
  static String loginUsername = 'loginUsername';
  static String loginEmail = 'loginEmail';
  static String loginPassword = 'loginPassword';
}
