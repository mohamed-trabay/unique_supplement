import 'package:flutter/material.dart';
import 'package:unique_supplement/core/utiles/service_locator.dart';
import 'package:unique_supplement/my_app.dart';

void main() {
  setupServiceLocator();

  runApp(const UniqueSupplement());
}
