import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class Text_Form_Field extends StatefulWidget {
  const Text_Form_Field({super.key});

  @override
  State<Text_Form_Field> createState() => _Text_Form_FieldState();
}

class _Text_Form_FieldState extends State<Text_Form_Field> {
  String _Email = ' ';
  String _Username = ' ';
  String _Password = ' ';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Text Form Field'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            // autovalidateMode:
            //     AutovalidateMode.always, //alttaki validate i aktif ediyo
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: 'Burak Turker',
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(
                          //hataların tasaarımını ayarlıyosun
                          color: Colors.red,
                        ),
                        labelText: 'username',
                        hintText: 'username',
                        border: OutlineInputBorder()),
                    onSaved: (deger) {
                      //
                      _Username = deger!;
                    },
                    validator: (deger) {
                      //burada username 4 karakterden az ise uyarı mesajı veriyor
                      if (deger!.length < 5) {
                        return 'username en az 5 karakter olmalidir';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10, //boxlar arasında boşluk bırakır
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    initialValue: 'bt212519@gmail.com',
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(
                          //hataların tasaarımını ayarlıyosun
                          color: Colors.red,
                        ),
                        labelText: 'Email',
                        hintText: 'Email',
                        border: OutlineInputBorder()),
                    onSaved: (deger) {
                      _Email = deger!;
                    },
                    validator: (deger) {
                      if (deger!.isEmpty) {
                        return 'Email boş olamaz';
                      } else if (!EmailValidator.validate(deger!)) {
                        return 'Geçerli Bir mail giriniz.';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10, //boxlar arasında boşluk bırakır
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    initialValue: '',
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(
                          //hataların tasaarımını ayarlıyosun
                          color: Colors.red,
                        ),
                        labelText: 'Password',
                        hintText: 'Password',
                        border: OutlineInputBorder()),
                    onSaved: (deger) {
                      _Password = deger!;
                    },
                    validator: (deger) {
                      if (deger!.length < 6) {
                        return 'sifre en az 6 karakter olmalidir';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bool _validate = _formKey.currentState!.validate();
                        if (_validate) {
                          _formKey.currentState!
                              .save(); // burada save dedigimizde onsaved metotları tetikleniyo ve deyişkenlere veriler aktarılıyo
                          String result =
                              'Username: $_Username \nEmail: $_Email \nPassword: $_Password';
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                result,
                                style: TextStyle(fontSize: 25),
                              )));
                          _formKey.currentState!.reset();
                        }
                      },
                      child: Text('Onayla')),
                ],
              ),
            ),
          ),
        ));
  }
}
