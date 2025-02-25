import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

initializeServices() {
  WidgetsFlutterBinding.ensureInitialized();
  // when this semantics binding is initialized, it caused issues with the dropdown list
  
  SemanticsBinding.instance.ensureSemantics();
}
