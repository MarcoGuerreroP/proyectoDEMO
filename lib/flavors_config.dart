import 'package:flutter/material.dart';

class FlavorsConfig {
  String _appbarName;
  Color _primaryColor;
  Color _secundaryColor;
  Icon _iconflavor;

  FlavorsConfig._internal();
  static final FlavorsConfig _intance = FlavorsConfig._internal();
  static FlavorsConfig get instance => _intance;

  String get appbarName => _appbarName;
  Color get primaryColor => _primaryColor;
  Color get secundaryColor => _secundaryColor;
  Icon get iconflavor => _iconflavor;

  void init({
    @required String appbarName,
    @required Color primaryColor,
    @required Color secundaryColor,
    @required Icon iconflavor,
  }) {
    _appbarName = appbarName;
    _primaryColor = primaryColor;
    _secundaryColor = secundaryColor;
    _iconflavor = iconflavor;
  }
}
