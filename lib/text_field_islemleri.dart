import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_input.dart';

class Text_Field_islemleri extends StatefulWidget {
  const Text_Field_islemleri({super.key});

  @override
  State<Text_Field_islemleri> createState() => _Text_Filed_islemleriState();
}

class _Text_Filed_islemleriState extends State<Text_Field_islemleri> {

 late TextEditingController _EmailController;
 late FocusNode _focusNode;
 int maxLengthCount=1;
 
@override
  void initState() {//build ne kadar çalışırsa çalışsın bu sadece bir kere çalışır
    super.initState();
    _EmailController = TextEditingController(text: 'kajek24@gmail.com');
    _focusNode = FocusNode();
    _focusNode.addListener(() { // burda yapılan işlem eger focus  içindeyse maxleght 3 olsun yoksa 1 addlistener ise içindekinleri 
      setState(() {
        if (_focusNode.hasFocus) {
        maxLengthCount =4;
      }else{
        maxLengthCount=1;
      }
      });
    });
  }

  @override
  void dispose() {//başka sayfaya geçince vs yok olacak vveriler buraya yazılıyor
  _EmailController.dispose();
  _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _EmailController.text = 'kewixe@gmail.com';
          });
        },
        child: Icon(Icons.cabin),
      ),
      appBar: AppBar(
        title: Text('Text Fiel'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              focusNode: _focusNode,
              controller: _EmailController,
              keyboardType: TextInputType
                  .phone, //klavye tipini kısıtlıyo sadece numara tarih yazı vs
              textInputAction: TextInputAction
                  .previous, // klavyenin yanındaki onaylama tuşunu degistiriyo
              autofocus: true, // sayfa açıldıgında ilk seçilen textfield
              maxLength: 50, //karakter sayısı
              maxLines: maxLengthCount, //satır sayısı
              onChanged: (String deger) {
                //ifade her degistiginde (her veri girildiginde tetiklenir)
                if (deger.length > 3) {
                  //print(deger);
                  setState(() {
                    _EmailController.value =TextEditingValue(
                      text: deger,
                      selection: TextSelection.collapsed(offset: deger.length),//imleci deger uzunlugundan bir sonrakei yere yaz (en sona)
                    );
                  });
                }
              },
              onSubmitted: (String deger) {
                // on changed dan farkı onaylanıca yazıyo
                debugPrint('Onaylanmiş: ' + deger);
              },
              decoration: const InputDecoration(
                  labelText: 'label Text',
                  hintText: 'Telefon numarasi giriniz',
                  icon: Icon(Icons.add),//label yanındaki icon
                  prefixIcon: Icon(Icons.add_a_photo_sharp),//label içindeki icon
                  suffixIcon: Icon(Icons.delete),//label sonundaki icon
                  filled: true,//içini dolduracam demek
                  fillColor: Colors.amberAccent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black)
                  ),//çevresini border ile kaplıyo
                  ),
                  cursorColor: Colors.red, //imlec rengi
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.previous,
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
          child: Text(_EmailController.text),// kontorlde yazdıgımız maili text e yazdırma
          )
        ],
      ),
    );
  }
}
