import 'package:e_letter/Screen/activity/activity_screen.dart';
import 'package:e_letter/Screen/activity/activity_viewModel.dart';
import 'package:e_letter/Screen/home/all_menu.dart';
import 'package:e_letter/Screen/surat_organisasi/izin_kegiatan.dart';

import 'package:e_letter/Screen/surat_organisasi/undangan.dart';
import 'package:e_letter/Screen/surat_pekerjaan/surat_pengunduran.dart';
import 'package:e_letter/Screen/surat_umum/form_izin_ortu.dart';
import 'package:e_letter/Screen/surat_umum/form_surat_kuasa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/home/home_screen.dart';
import 'Screen/content/content_viewModel.dart';
import 'Screen/surat_pekerjaan/surat_izin_kerja.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ContentViewModel()),
      ChangeNotifierProvider(create: (_) => ActivityViewModel())
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: '/',
      routes: {
        //'/': (_) => const HomeScreen(),
        '/form_pengunduran': (_) => const FormPengunduran(),
        '/form_undangan': (_) => const UndanganScreen(),
        '/form_izin': (_) => const ScreenIzinOrtu(),
        '/form_surat_kuasa': (_) => const SuratKuasaScreen(),
        '/form_izin_Kerja': (_) => const SuratIzinKerja(),
        '/form_izin_kegiatan': (_) => const IzinKegiatanOrganisasi()
      },
      debugShowCheckedModeBanner: false,
      title: 'E-Letter',
      theme: ThemeData(
          primaryColor: const Color(0xff261865), primarySwatch: Colors.pink),
      home: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: const Color(0xff261863),
              borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: DefaultTabController(
              length: 1,
              child: TabBar(
                controller: _controller,
                tabs: const [
                  Tab(
                    icon: Icon(Icons.home),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(Icons.history),
                    text: 'Activity',
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
            controller: _controller,
            children: const [HomeScreen(), ActivityScreen()]),
      ),
    );
  }
}
