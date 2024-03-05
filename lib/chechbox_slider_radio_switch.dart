import 'dart:ffi';

import 'package:flutter/material.dart';

class FormElemanlari extends StatefulWidget {
  const FormElemanlari({super.key});

  @override
  State<FormElemanlari> createState() => _formElemanlariState();
}

class _formElemanlariState extends State<FormElemanlari> {
  bool CheckboxState = false;
  bool radioState1 = false;
  String sehir = "Isparta";
  bool switchState = false;
  double sliderState = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Elemanlari'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            CheckboxListTile(
              value: CheckboxState,
              onChanged: (secildi) {
                setState(() {
                  CheckboxState = secildi!;
                });
              },
              activeColor: Colors.black,
              title: Text('Checkbox title'),
              subtitle: Text('Subtitle '),
              secondary: Icon(Icons.ad_units),
            ),
            RadioListTile<String>(
                value: 'Malatya',
                groupValue: sehir,
                title: Text('Malatya'),
                onChanged: (deger) {
                  setState(() {
                    sehir = deger!;
                    debugPrint("Secilen deger $deger");
                  });
                }),
            RadioListTile<String>(
                value: 'İzmir',
                groupValue: sehir,
                title: Text('İzmir'),
                onChanged: (deger) {
                  setState(() {
                    sehir = deger!;
                    debugPrint("Secilen deger $deger");
                  });
                }),
            RadioListTile<String>(
                value: 'Isparta',
                groupValue: sehir,
                title: Text('Isparta'),
                onChanged: (deger) {
                  setState(() {
                    sehir = deger!;
                    debugPrint("Secilen deger $deger");
                  });
                }),
            SwitchListTile(
                value: switchState,
                secondary: Icon(Icons.refresh),
                title: Text('switch title'),
                onChanged: (deger) {
                  setState(() {
                    debugPrint('Anlaşma Onaylandi: $deger');
                    switchState = deger;
                  });
                }),
                Slider(value: sliderState, onChanged: (deger){
                  setState(() {
                    sliderState = deger;
                    debugPrint('slider deger: $deger');
                  });
                },min: 10,max: 20,divisions: 10,label: sliderState.toString(),),//10 ile 20 arasını 10 parcaya böl demek
          ],
        ),
      ),
    );
  }
}
