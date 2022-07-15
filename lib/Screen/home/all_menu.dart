import 'package:e_letter/Widgets/menu_surat.dart';
import 'package:flutter/material.dart';

class AllMenu extends StatelessWidget {
  const AllMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Semua Surat'),
          centerTitle: true,
          backgroundColor: const Color(0xff261865),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: <Widget>[
                  MenuSurat(
                      size: size,
                      onTap: () {
                        Navigator.pushNamed(context, '/form_izin_Kerja');
                      },
                      image: 'assets/icons/absent.png',
                      text: 'Surat Izin Kerja'),
                  MenuSurat(
                      size: size,
                      onTap: () {
                        Navigator.pushNamed(context, '/form_pengunduran');
                      },
                      image: 'assets/icons/resign.png',
                      text: 'Surat Resign'),
                  MenuSurat(
                      size: size,
                      onTap: () {
                        Navigator.pushNamed(context, '/form_undangan');
                      },
                      image: 'assets/icons/invitation.png',
                      text: 'Surat Undangan'),
                  MenuSurat(
                      size: size,
                      onTap: () {
                        Navigator.pushNamed(context, '/form_izin_kegiatan');
                      },
                      image: 'assets/icons/permis.png',
                      text: 'Surat Izin Kegiatan'),
                  MenuSurat(
                      size: size,
                      onTap: () {
                        Navigator.pushNamed(context, '/form_surat_kuasa');
                      },
                      image: 'assets/icons/permission.png',
                      text: 'Surat Kuasa'),
                  MenuSurat(
                      size: size,
                      onTap: () {
                        Navigator.pushNamed(context, '/form_izin');
                      },
                      image: 'assets/icons/izin.png',
                      text: 'Surat Izin Orang Tua'),
                ],
              ),
            )));
  }
}
