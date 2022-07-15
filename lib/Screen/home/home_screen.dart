import 'package:e_letter/Screen/home/all_menu.dart';
import 'package:e_letter/Screen/surat_umum/form_surat_kuasa.dart';
import 'package:e_letter/Widgets/header_carousel.dart';
// import 'package:e_letter/Screen/home/home_screen_viewModel.dart';
import 'package:e_letter/Widgets/card_menu.dart';
import 'package:e_letter/Screen/content/content_list.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff261865),
      body: Stack(children: [
        SafeArea(
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: CarouselWithIndicator()
                  //
                  ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  //height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    // padding: const EdgeInsets.only(
                    //   top: 10,
                    // ),
                    children: [
                      ListTile(
                        title: const Text(
                          'Daftar Surat',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, scdAnimation) {
                              return const AllMenu();
                            }, transitionsBuilder:
                                    (context, animation, scdAnimation, child) {
                              final tween = Tween(
                                  begin: const Offset(0, 0.6),
                                  end: Offset.zero);
                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            }));
                          },
                          child: const Text(
                            'Show All',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InkWell(
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => CupertinoActionSheet(
                                    title: const Text('Daftar Surat'),
                                    message:
                                        const Text('Silahkan Pilih Salah Satu'),
                                    actions: <Widget>[
                                      CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pushNamed(
                                                context, '/form_izin_Kerja');
                                          },
                                          child: const Text(
                                            'Surat Izin Kerja',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          )),
                                      CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pushNamed(
                                                context, '/form_pengunduran');
                                          },
                                          child: const Text(
                                            'Surat Resign',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          )),
                                    ],
                                    cancelButton: CupertinoActionSheetAction(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                  ),
                                );
                              },
                              child: const CardMenu(
                                title: 'Surat Bisnis',
                                desc:
                                    'Surat untuk keperluan perusahaan dan bisnis',
                                leading: Icons.home,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => CupertinoActionSheet(
                                    title: const Text('Daftar Surat'),
                                    message:
                                        const Text('Silahkan Pilih Salah Satu'),
                                    actions: <Widget>[
                                      CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pushNamed(
                                                context, '/form_undangan');
                                          },
                                          child: const Text(
                                            'Surat Undangan Resmi',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          )),
                                      CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pushNamed(
                                                context, '/form_izin_kegiatan');
                                          },
                                          child: const Text(
                                            'Surat Izin Kegiatan',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          )),
                                    ],
                                    cancelButton: CupertinoActionSheetAction(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                  ),
                                );
                              },
                              child: const CardMenu(
                                title: 'Surat Organisasi',
                                desc: 'Surat untuk kepentingan Organisasi',
                                leading: Icons.cached,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) => CupertinoActionSheet(
                                      title: const Text('Daftar Surat'),
                                      message: const Text(
                                          'Silahkan Pilih Salah Satu'),
                                      actions: <Widget>[
                                        CupertinoActionSheetAction(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushNamed(
                                                  context, '/form_surat_kuasa');
                                            },
                                            child: const Text(
                                              'Surat Kuasa',
                                              style: TextStyle(
                                                  color: Colors.blueAccent),
                                            )),
                                        CupertinoActionSheetAction(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushNamed(
                                                  context, '/form_izin');
                                            },
                                            child: const Text(
                                              'Surat Izin Orang Tua',
                                              style: TextStyle(
                                                  color: Colors.blueAccent),
                                            )),
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                    ),
                                  );
                                },
                                child: const CardMenu(
                                    desc: 'Surat untuk keperluan umum',
                                    leading: Icons.dashboard,
                                    title: 'Surat Umum '))
                          ],
                        ),
                      ),
                      const ListTile(
                        title: Text('Konten blog',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const ContentList(),
                    ],
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
