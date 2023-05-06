// Class containing individual user's card info
// Contains: Name, Number, Email, Bio
class CardInfo {
  final int? id;
  String name;
  String number;
  String email;
  String bio;
  CardInfo(
      {this.id,
      this.name = '',
      this.number = '',
      this.email = '',
      this.bio = ''});

  static CardInfo fromJson(Map<String, Object?> json) => CardInfo(
      id: json[CardInfoFields.id] as int?,
      name: json[CardInfoFields.name] as String,
      number: json[CardInfoFields.number] as String,
      email: json[CardInfoFields.email] as String,
      bio: json[CardInfoFields.bio] as String);

  Map<String, Object?> toJson() => {
        CardInfoFields.id: id,
        CardInfoFields.name: name,
        CardInfoFields.number: number,
        CardInfoFields.email: email,
        CardInfoFields.bio: bio,
      };

  CardInfo copy({
    int? id,
    String? name,
    String? number,
    String? email,
    String? bio,
  }) =>
      CardInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
        email: email ?? this.email,
        bio: bio ?? this.bio,
      );
}

// Table containing Card Info
final String cardInfoTable = 'cardInfo';

// Class for card info fields
class CardInfoFields {
  static final List<String> values = [id, name, number, email, bio];
  static final String id = '_id';
  static String name = 'name';
  static String number = 'number';
  static String email = 'email';
  static String bio = 'bio';
}
