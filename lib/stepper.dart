import 'package:flutter/material.dart';

class Stepper_OrnekState extends StatefulWidget {
  const Stepper_OrnekState({super.key});

  @override
  State<Stepper_OrnekState> createState() => Stepper_OrnekStateState();
}

class Stepper_OrnekStateState extends State<Stepper_OrnekState> {
  int _aktifState = 0;
  String isim = '';
  String mail = '';
  String Sifre = '';
  List<Step>? tumSteplerlistesi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumSteplerlistesi = _TumStepler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper örnek'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: tumSteplerlistesi!,
          currentStep: _aktifState,
          onStepTapped: (tiklanilanStep) {
            setState(() {
              _aktifState = tiklanilanStep;
            });
          },
          onStepContinue: () {
            setState(() {
              if (_aktifState < tumSteplerlistesi!.length - 1) {
                _aktifState++;
              }
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
        state: StepState.indexed, //step in başındaki işaret
        isActive: true,
        subtitle: Text('Subtitle'),
        title: Text('Username giriniz'),
        content: TextFormField(
          decoration: InputDecoration(
              labelText: 'userNameLabel1',
              hintText: 'UserName',
              border: OutlineInputBorder()),
        ),
      ),
      Step(
        state: StepState.indexed,
        isActive: true,
        subtitle: Text('Subtitle'),
        title: Text('Mail giriniz'),
        content: TextFormField(
          decoration: InputDecoration(
              labelText: 'MailLabel',
              hintText: 'MailHint',
              border: OutlineInputBorder()),
        ),
      ),
      Step(
        state: StepState.indexed,
        isActive: true,
        subtitle: Text('Subtitle'),
        title: Text('Sifre giriniz'),
        content: TextFormField(
          decoration: InputDecoration(
              labelText: 'Sifrelabel',
              hintText: 'sifre',
              border: OutlineInputBorder()),
        ),
      ),
    ];
    return stepler;
  }
}
