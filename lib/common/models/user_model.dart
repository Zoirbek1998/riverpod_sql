
class UserModel {
  final int id;
  final int isVerfied;

  UserModel({
    required this.id,
    required this.isVerfied,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    isVerfied: json["isVerfied"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isVerfied": isVerfied,
  };
}
