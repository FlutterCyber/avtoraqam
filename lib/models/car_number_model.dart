class CarNumberModel {
  String? car;

  CarNumberModel({required this.car});

  CarNumberModel.fromJson(Map<String, dynamic> map) : car = map['car'];

  Map<String, dynamic> toJson() => {'car': car};
}
