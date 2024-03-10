import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanal_ev_kutuphanesi/cubit/kitap_ekle_cubit.dart';

class KitapEkle extends StatefulWidget {
  const KitapEkle({super.key});

  @override
  State<KitapEkle> createState() => _KitapEkleState();
}

class _KitapEkleState extends State<KitapEkle> {
  var tfKitapAd = TextEditingController();
  var tfYazarAd = TextEditingController();
  var tfCevirmenAd = TextEditingController();
  var tfTur= TextEditingController();
  var tfBaskiNo = TextEditingController();
  var tfAlinmaTarihi = TextEditingController();
  var tfOkunmaTarihi = TextEditingController();
  var tfYorum= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kitap Ekle "),
      backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKitapAd, decoration: const InputDecoration(hintText: "Kitap Adı"),),
              TextField(controller: tfYazarAd, decoration: const InputDecoration(hintText: "Yazar Adı"),),
              TextField(controller: tfCevirmenAd, decoration: const InputDecoration(hintText: "Çevirmen Adı"),),
              TextField(controller: tfTur, decoration: const InputDecoration(hintText: "Tür"),),
              TextField(controller: tfBaskiNo,keyboardType: TextInputType.number, decoration: const InputDecoration(hintText: "Baskı No"),),
              TextField(controller: tfAlinmaTarihi,keyboardType: TextInputType.datetime, decoration: const InputDecoration(hintText: "Alınma Tarihi"),),
              TextField(controller: tfOkunmaTarihi,keyboardType: TextInputType.datetime, decoration: const InputDecoration(hintText: "Okunma Tarihi"),),
              TextField(controller: tfYorum, decoration: const InputDecoration(hintText: "Yorum"),),
              ElevatedButton(onPressed: (){
                context..read<KitapEkleCubit>().kitapEkle(tfKitapAd.text, tfYazarAd.text,tfCevirmenAd.text, tfTur.text, tfBaskiNo.text, tfAlinmaTarihi.text,
                    tfOkunmaTarihi.text, tfYorum.text);
                print ("kitap eklendi");

              },
                  child: const Text("KAYDET",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              )

        ],
          ),
        ),
      ),
    );
  }
}
