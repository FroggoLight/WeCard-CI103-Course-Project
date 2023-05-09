import 'package:carde/database/CardInfo.dart';

class CardCollection {
  final int? id;
  List<int> cardList;
  CardCollection({this.id, this.cardList = const []});

  static CardCollection fromJson(Map<String, Object?> json) => CardCollection(
      id: json[CardCollectionFields.id] as int?,
      cardList: json[CardCollectionFields.cardList] as List<int>);

  Map<String, Object?> toJson() => {
        CardCollectionFields.id: id,
        CardCollectionFields.cardList: cardList,
      };

  CardCollection copy({
    int? id,
    List<int>? cardList,
  }) =>
      CardCollection(
        id: id ?? this.id,
        cardList: cardList ?? this.cardList,
      );
}

// Table containing User Info
final String cardCollectionTable = 'cardCollection';

// Class for user info fields
class CardCollectionFields {
  static final List<String> values = [id, cardList];
  static final String id = '_id';
  static String cardList = 'cardList';
}
