class CarDetailsModel {
  String fio;
  String pinfl;
  String plateNumber;
  String model;
  List<String> listDriverPinfl;

  CarDetailsModel({
    required this.fio,
    required this.pinfl,
    required this.plateNumber,
    required this.model,
    required this.listDriverPinfl,
  });

  CarDetailsModel.fromJson(Map<String, dynamic> json)
      : fio = json["fio"],
        pinfl = json["pinfl"],
        plateNumber = json["plateNumber"],
        model = json["model"],
        listDriverPinfl =
            List<String>.from(json["listDriverPinfl"].map((x) => x));

  Map<String, dynamic> toJson() => {
        "fio": fio,
        "pinfl": pinfl,
        "plateNumber": plateNumber,
        "model": model,
        "listDriverPinfl": List<dynamic>.from(listDriverPinfl.map((x) => x))
      };
}
