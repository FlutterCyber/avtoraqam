class PinflDetailsModel {
  String fio = "";
  String pinfl = "";
  String phoneNumber = "";
  String address = "";
  String birthDate = "";
  String sex = "";

  PinflDetailsModel({
    required this.fio,
    required this.pinfl,
    required this.phoneNumber,
    required this.address,
    required this.birthDate,
    required this.sex,
  });

  PinflDetailsModel.fromJson(Map<String, dynamic> map)
      : fio = map['fio'],
        pinfl = map['pinfl'],
        phoneNumber = map['phoneNumber'],
        address = map['address'],
        birthDate = map['birthDate'],
        sex = map['sex'];

  Map<String, dynamic> toJson() => {
        'fio': fio,
        'pinfl': pinfl,
        'phoneNumber': phoneNumber,
        'address': address,
        'birtDate': birthDate,
        'sex': sex,
      };
}
