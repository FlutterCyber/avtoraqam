class PinflDetailsModel {
  String fio = "";
  String pinfl = "";
  String phoneNumber = "";

  PinflDetailsModel({
    required this.fio,
    required this.pinfl,
    required this.phoneNumber,
  });

  PinflDetailsModel.fromJson(Map<String, dynamic> map)
      : fio = map['fio'],
        pinfl = map['pinfl'],
        phoneNumber = map['phoneNumber'];

  Map<String, dynamic> toJson() => {
        'fio': fio,
        'pinfl': pinfl,
        'phoneNumber': phoneNumber,
      };
}
