import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanal_ev_kutuphanesi/cubit/anasayfa_cubit.dart';
import 'package:sanal_ev_kutuphanesi/cubit/kitap_bilgi_cubit.dart';
import 'package:sanal_ev_kutuphanesi/cubit/kitap_ekle_cubit.dart';
import 'package:sanal_ev_kutuphanesi/sayfalar/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> KitapEkleCubit()),
        BlocProvider(create: (context)=> KitapBilgiCubit()),
        BlocProvider(create: (context)=> AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Anasayfa()
      ),
    );
  }
}

