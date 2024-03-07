import 'package:flutter/material.dart';

class Gelismis_Stepper_OrnekState extends StatefulWidget {
  const Gelismis_Stepper_OrnekState({super.key});

  @override
  State<Gelismis_Stepper_OrnekState> createState() => Stepper_OrnekStateState();
}

class Stepper_OrnekStateState extends State<Gelismis_Stepper_OrnekState> {
  int _aktifState = 0;
  String isim = '';
  String mail = '';
  String Sifre = '';
  bool hata = false;
  List<Step>? tumSteplerlistesi;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    tumSteplerlistesi = _TumStepler();

    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper örnek'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          //controlbuilder ile tasarımı özelleştirebiliyosun
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: [
                TextButton(onPressed: details.onStepContinue, child: Text('NEXT')),
                TextButton(onPressed: details.onStepCancel, child: Text('CANCEL'))
              ],
            );
          },
          steps: tumSteplerlistesi!,
          currentStep: _aktifState,

          /*onStepTapped: (tiklanilanStep) {//tıklanarak stepler arasında geçiş yapmasını saglıyor
            setState(() {
              _aktifState = tiklanilanStep;
            });
          },
         */
          onStepContinue: () {
            setState(() {
              _ileriButtonKontrol();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifState > 0) {
                _aktifState--;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _TumStepler() {
    List<Step> stepler = [
      Step(
        state: _StateleriAyarla(0), //step in başındaki işaret
        isActive: true,
        subtitle: Text('Subtitle'),
        title: Text('Username giriniz'),
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
              labelText: 'userNameLabel1',
              hintText: 'UserName',
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return 'En az 6 Karakter giriniz';
            }
          },
          onSaved: (girilenDeger) {
            isim = girilenDeger!;
          },
        ),
      ),
      Step(
        state: _StateleriAyarla(1),
        isActive: true,
        subtitle: Text('Subtitle'),
        title: Text('Mail giriniz'),
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
              labelText: 'MailLabel',
              hintText: 'MailHint',
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6 || !girilenDeger.contains("@")) {
              return 'Geçerli mail adresi giriniz';
            }
          },
          onSaved: (girilenDeger) {
            mail = girilenDeger!;
          },
        ),
      ),
      Step(
        state: _StateleriAyarla(2),
        isActive: true,
        subtitle: Text('Subtitle'),
        title: Text('Sifre giriniz'),
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
              labelText: 'Sifrelabel',
              hintText: 'sifre',
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return 'En az 6 Karakter giriniz';
            }
          },
          onSaved: (girilenDeger) {
            Sifre = girilenDeger!;
          },
        ),
      ),
    ];
    return stepler;
  }

  _StateleriAyarla(int OankiStep) {
    if (_aktifState == OankiStep) {
      if (hata == true) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void _ileriButtonKontrol() {
    switch (_aktifState) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifState++;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifState++;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          _aktifState = 2;
          _formTamamlandi();
        } else {
          hata = true;
        }
        break;
      default:
    }
  }

  void _formTamamlandi() {
    debugPrint("Girilen degerler : isim $isim ,mail $mail ,sifre $Sifre");
  }
}
