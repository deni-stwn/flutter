import 'dart:io';

import 'package:e_letter/Model/surat_umum/model_izinOrangTua.dart';

import 'package:e_letter/helper/pdf_manager.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfSuratIzin {
  static Future<File> generate(ModelIzinOrangTua izinOrangTua) async {
    final pdf = Document();
    pdf.addPage(MultiPage(
        pageTheme: const PageTheme(pageFormat: PdfPageFormat.a4),
        build: (context) => [
              buildHeader(izinOrangTua),
              buildBody(izinOrangTua),
              buildFooter(izinOrangTua)
            ]));
    return PdfManager.saveDocument(name: 'Surat_izin_orang_tua.pdf', pdf: pdf);
  }

  static Widget buildHeader(ModelIzinOrangTua izinOrangTua) =>
      Column(children: [
        Center(
          child: Text(
            'SURAT IZIN ORANG TUA',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        ),
        SizedBox(height: 1 * PdfPageFormat.cm)
      ]);
  static Widget buildBody(ModelIzinOrangTua izinOrangTua) => Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text('Saya yang bertanda tangan di bawah ini :'),
        ]),
        SizedBox(height: 4 * PdfPageFormat.mm),
        Row(children: [
          Text('Nama'),
          SizedBox(width: 1.6 * PdfPageFormat.inch),
          Text(':  ${izinOrangTua.namaOrtu}'),
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Tempat, Tgl Lahir'),
          SizedBox(width: 0.74 * PdfPageFormat.inch),
          Text(':  ${izinOrangTua.tptLahirOrtu}, ${izinOrangTua.tglLahirOrtu}')
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Pekerjaan'),
          SizedBox(width: 1.3 * PdfPageFormat.inch),
          Text(':  ${izinOrangTua.pekerjaan}'),
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Alamat'),
          SizedBox(width: 1.53 * PdfPageFormat.inch),
          Text(':  ${izinOrangTua.alamatOrtu}'),
        ]),
        SizedBox(height: 5 * PdfPageFormat.mm),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text('Selaku orang tua wali dari anak saya :'),
        ]),
        SizedBox(height: 5 * PdfPageFormat.mm),
        Row(children: [
          Text('Nama'),
          SizedBox(width: 1.6 * PdfPageFormat.inch),
          Text(':  ${izinOrangTua.namaAnak}'),
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Tempat, Tgl Lahir'),
          SizedBox(width: 0.74 * PdfPageFormat.inch),
          Text(':  ${izinOrangTua.tptLahirAnak}, ${izinOrangTua.tglLahirAnak}')
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Jenis Kelamin'),
          SizedBox(width: 1.01 * PdfPageFormat.inch),
          Text(':  ${izinOrangTua.jKelamin}'),
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Alamat'),
          SizedBox(width: 1.53 * PdfPageFormat.inch),
          Text(':  ${izinOrangTua.alamatAnak}'),
        ]),
        SizedBox(height: 5 * PdfPageFormat.mm),
        Text(
            'Dengan ini memberikan izin kepada anak saya untuk mengikuti ${izinOrangTua.perihal}.'),
        SizedBox(height: 3 * PdfPageFormat.mm),
        Text(
            'Demikian surat izin ini saya buat dengan sebenar-benarnya untuk digunakan seperlunya.'),
        SizedBox(height: 5 * PdfPageFormat.mm),
        Padding(
            padding: const EdgeInsets.only(right: 2.35 * PdfPageFormat.cm),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text('${izinOrangTua.tempatTerbit}, ${izinOrangTua.tglTerbit}')
            ])),
        SizedBox(height: 3 * PdfPageFormat.mm)
      ]);
  static Widget buildFooter(ModelIzinOrangTua izinOrangTua) => Padding(
      padding: const EdgeInsets.only(left: 10 * PdfPageFormat.cm),
      child: Column(children: [
        Text('Hormat Saya'),
        SizedBox(height: 3 * PdfPageFormat.cm),
        Text('( ${izinOrangTua.namaOrtu})',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline))
      ]));
}
