import 'package:estimation_gym/model/InformationModel.dart';
import 'package:flutter/foundation.dart';

class InformationProvide with ChangeNotifier {
  List<InformationModel> informations = [
    InformationModel(Sex: 'male', hight: '134'),
    InformationModel(Sex: 'male', hight: '134')
  ];
  getInormation() {
    return informations;
  }

  addInformation(InformationModel information) {
    informations.add(information);
  }
}
