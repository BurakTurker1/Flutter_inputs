import 'package:flutter/material.dart';
import 'package:flutter_inputs/chechbox_slider_radio_switch.dart';
import 'package:flutter_inputs/date_time_picker.dart';
import 'package:flutter_inputs/dropdownbutton_menu.dart';
import 'package:flutter_inputs/gelismis_stepper.dart';
import 'package:flutter_inputs/global_key_kullanimi.dart';
import 'package:flutter_inputs/stepper.dart';
import 'package:flutter_inputs/text_field_islemleri.dart';
import 'package:flutter_inputs/text_form_field.dart';
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  ThemeData(
        colorSchemeSeed: Colors.green.shade800,
        appBarTheme:const AppBarTheme(
          centerTitle: true,
            backgroundColor: Colors.green,
            titleTextStyle: TextStyle(fontSize: 36,),
            shadowColor: Colors.black,
            elevation: 12 ),
      ),
      home: Gelismis_Stepper_OrnekState(),
      //Stepper_OrnekState(),
      //Date_Time_Picker(),
      //DropDownButton_Menu(),
      //FormElemanlari(),
      //GlobalKeyKullanimi(),
      //Text_Form_Field(),
      //Text_Field_islemleri(),
    );
  }
}
