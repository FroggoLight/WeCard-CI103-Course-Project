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

  static UserInfo fromJson(Map<String, Object?> json) => UserInfo(
      id: json[UserInfoFields.id] as int?,
      loginUsername: json[UserInfoFields.loginUsername] as String,
      loginEmail: json[UserInfoFields.loginEmail] as String,
      loginPassword: json[UserInfoFields.loginPassword] as String);

  Map<String, Object?> toJson() => {
        UserInfoFields.id: id,
        UserInfoFields.loginUsername: loginUsername,
        UserInfoFields.loginEmail: loginEmail,
        UserInfoFields.loginPassword: loginPassword,
      };

  UserInfo copy({
    int? id,
    String? loginUsername,
    String? loginEmail,
    String? loginPassword,
  }) =>
      UserInfo(
        id: id ?? this.id,
        loginUsername: loginUsername ?? this.loginUsername,
        loginEmail: loginEmail ?? this.loginPassword,
        loginPassword: loginPassword ?? this.loginPassword,
      );
}

// Table containing User Info
final String userInfoTable = 'userInfo';

// Class for user info fields
class UserInfoFields {
  static final List<String> values = [
    id,
    loginUsername,
    loginEmail,
    loginPassword
  ];
  static final String id = '_id';
  static String loginUsername = 'loginUsername';
  static String loginEmail = 'loginEmail';
  static String loginPassword = 'loginPassword';
}
