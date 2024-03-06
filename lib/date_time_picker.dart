import 'package:flutter/material.dart';

class Date_Time_Picker extends StatefulWidget {
  const Date_Time_Picker({super.key});

  @override
  State<Date_Time_Picker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<Date_Time_Picker> {
  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now();
    DateTime UcAySonrasi =
        DateTime(2024, suan.month + 3); //sunaki tarih e 3 ay ekle

    TimeOfDay suankiSaat = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(
        title: Text('Date Time Picker'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  showDatePicker(
                          context: context,
                          firstDate: suan,
                          lastDate: UcAySonrasi)
                      .then((secilenTarih) {
                    debugPrint(secilenTarih.toString());
                    debugPrint("microsecond: " +
                        secilenTarih!.microsecondsSinceEpoch.toString());
                    debugPrint("utc:" + secilenTarih!.toUtc().toString());
                    debugPrint("utc:" +
                        secilenTarih
                            .add(Duration(days: 20))
                            .toString()); //SECİLEN GÜNE 20 GÜN EKLER
                  });
                },
                child: Text("Tarih Sec"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange))),
            TextButton(
                onPressed: () {
                  showTimePicker(context: context, initialTime: suankiSaat).then((secilenSaat){
                    debugPrint(secilenSaat.toString());
                  });
                },
                child: Text("Saat sec"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                )),
          ],
        ),
      ),
    );
  }
}
