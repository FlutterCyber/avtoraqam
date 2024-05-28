class PinflModel {
  String? pinfl;

  PinflModel({required this.pinfl});

  PinflModel.fromJson(Map<String, dynamic> map) : pinfl = map['pinfl'];

  Map<String, dynamic> toJson() => {'pinfl': pinfl};
}
