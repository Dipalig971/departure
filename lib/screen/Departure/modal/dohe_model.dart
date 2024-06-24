class DepartureModel {
  int? id;
  String? dohe, meaning, english, Gujarati;

  DepartureModel(
      {this.id, this.dohe, this.english, this.Gujarati, this.meaning});

  factory DepartureModel.fromJson(Map json) {
    return DepartureModel(
        id: json['id'],
        dohe: json['dohe'],
        english: json['english'],
        Gujarati: json['Gujarati'],
        meaning: json['meaning']);
  }
}
