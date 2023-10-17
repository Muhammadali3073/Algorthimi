import 'package:google_maps_flutter/google_maps_flutter.dart';

class DataFile {
  static List<LanguageModel> languageList = [
    LanguageModel(
      "English",
    ),
    LanguageModel(
      "Arabic",
    ),
    LanguageModel(
      "French",
    ),
    LanguageModel(
      "German",
    ),
    LanguageModel(
      "Urdu",
    ),
    LanguageModel(
      "Hindi",
    ),
    LanguageModel(
      "Malayalam",
    ),
    LanguageModel(
      "Bengali",
    ),
    LanguageModel(
      "Nepali",
    ),
  ];
  static List<QuestionsModel> questionsModel = [
    QuestionsModel(
      "1",
      "1",
      "Does the location have a POS system?",
    ),
    QuestionsModel(
      "2",
      "1",
      "Total Numbers of cash counters?",
    ),
    QuestionsModel(
      "3",
      "2",
      "Do they sale tobacco?",
    ),
    QuestionsModel(
      "4",
      "3",
      "Attach image of tobacco shelf.",
    ),
    QuestionsModel(
      "5",
      "4",
      "Ask shopkeeper top selling brands?",
    ),
  ];
  static List<CitiesLatLongModel> citiesLatLongModel = [
    CitiesLatLongModel(
        BitmapDescriptor.hueCyan, "gulberg", "Gulberg", 31.5102, 74.3441),
    CitiesLatLongModel(
        BitmapDescriptor.hueBlue, "model-town", "Model Town", 31.4805, 74.3239),
    CitiesLatLongModel(
        BitmapDescriptor.hueAzure, "township", "Township", 31.4475, 74.3081),
  ];

  static List<BankMethodModel> bankMethodModel = [
    BankMethodModel("First Abu Dhabi Bank"),
    BankMethodModel("Dubai Islamic Bank"),
    BankMethodModel("Etisalat Wallet"),
    BankMethodModel("Magnati"),
  ];

}

///// Models

class LanguageModel {
  String? name;

  LanguageModel(this.name);
}

/// Bank Method
class BankMethodModel {
  String? nameBank;

  BankMethodModel(this.nameBank);
}

class CitiesLatLongModel {
  double markerColor;
  String? markerID;
  String? cityName;
  double cityLat;
  double cityLong;

  CitiesLatLongModel(this.markerColor, this.markerID, this.cityName,
      this.cityLat, this.cityLong);
}

class QuestionsModel {
  String? questionNo;
  String? questionType;
  String? questionTitle;

  QuestionsModel(this.questionNo, this.questionType, this.questionTitle);
}
