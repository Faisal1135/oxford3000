import 'package:flutter/material.dart';

class ModalData extends ChangeNotifier {
  double _offAxisFraction = 0;
  double _diameterRatio = 2;
  double _magnification = 1.1;

  get offAxisFraction => _offAxisFraction;
  get diameterRatio => _diameterRatio;
  get magnification => _magnification;

  changeOffAxis(double newValue) {
    _offAxisFraction = newValue;
    notifyListeners();
  }

  changeMagnification(double newValue) {
    _magnification = newValue;
    notifyListeners();
  }

  changeDiameter(double newValue) {
    _diameterRatio = newValue;
    notifyListeners();
  }
}
