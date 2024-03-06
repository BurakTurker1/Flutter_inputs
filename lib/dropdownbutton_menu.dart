// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_inputs/main.dart';

class DropDownButton_Menu extends StatefulWidget {
  DropDownButton_Menu({super.key});

  @override
  State<DropDownButton_Menu> createState() => _DropDownButton_MenuState();
}

class _DropDownButton_MenuState extends State<DropDownButton_Menu> {
  List<String> sehirler = <String>['İzmir', 'İstanbul', 'Denizli', 'Zonguldak'];
  String secilenSehir = 'İzmir';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DropDownButtom && DropDownMenu',
          style: TextStyle(fontSize: 21),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(children: [
          DropdownButton<String>(
            //Onaki sehiri alıyor ve map yapısı ile dropdownitem a çeviriyo
            items: sehirler.map((oankiSehir) {
              return DropdownMenuItem(
                child: Text(oankiSehir),
                value: oankiSehir,
              );
            }).toList(),
            onChanged: (deger) {
              setState(() {
                secilenSehir = deger!;
              });
            }, hint: Text(secilenSehir),
            value: secilenSehir,
          ),
        ]),
      ),
    );
  }
}
