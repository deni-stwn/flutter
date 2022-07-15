import 'dart:io';

import 'package:e_letter/Helper/pdf_manager.dart';
import 'package:e_letter/Model/surat_bisnis/model_absen.dart';
import 'package:path/path.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfIzinKerja {
  static Future<File> generate(ModelIzinKerja izinKerja) async {
    final pdf = Document();
    pdf.addPage(MultiPage(
        pageTheme: const PageTheme(pageFormat: PdfPageFormat.a4),
        build: (context) => [
              buildHeader(izinKerja),
              buildBody(izinKerja),
              buildFooter(izinKerja)
            ]));
    return PdfManager.saveDocument(name: 'Surat_Izin_Kerja', pdf: pdf);
  }

  static Widget buildHeader(ModelIzinKerja izinKerja) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text('${izinKerja.tempatTerbit}, ${izinKerja.tglTerbit}')
            ]),
            Text('Perihal \t\t\t : Permohonan izin tidak masuk kerja'),
            SizedBox(height: 4 * PdfPageFormat.mm),
            Text(
              'Kepada Yth.\n${izinKerja.penerima}\nDi tempat',
              style: const TextStyle(lineSpacing: 4),
            ),
            SizedBox(height: 1 * PdfPageFormat.cm),
          ]);
  static Widget buildBody(ModelIzinKerja izinKerja) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dengan Hormat,'),
            SizedBox(height: 3 * PdfPageFormat.mm),
            Padding(
                padding: const EdgeInsets.only(left: 1 * PdfPageFormat.cm),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Saya yang bertanda tangan di bawah ini :'),
                      SizedBox(height: 3 * PdfPageFormat.mm),
                      Text(
                          'Nama \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${izinKerja.nama}'),
                      SizedBox(height: 2 * PdfPageFormat.mm),
                      Text(
                          'Jabatan \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${izinKerja.jabatan}'),
                      SizedBox(height: 2 * PdfPageFormat.mm),
                      Text(
                          'Alamat \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t: ${izinKerja.alamat}'),
                    ])),
            SizedBox(height: 3 * PdfPageFormat.mm),
            Text(
                '\t\t\t\t\t\t\t\tDengan ini saya ingin memberitahukan bahwa pada tanggal ${izinKerja.tglMulai} sampai tanggal ${izinKerja.tglSelesai} saya tidak bisa masuk bekerja seperti biasanya dikarenakan ${izinKerja.alasan}. Sehubungan dengan hal tersebut, saya bermaksud untuk memohon izin untuk tidak masuk kerja pada tanggal tersebut.',
                style: const TextStyle(lineSpacing: 5),
                textAlign: TextAlign.justify),
            SizedBox(height: 3 * PdfPageFormat.mm),
            Text(
                '\t\t\t\t\t\t\t\tDemikian surat izin saya sampaikan dengan sebenar-benarnya. Atas perhatiannya saya ucapkan terima kasih.',
                style: const TextStyle(lineSpacing: 5),
                textAlign: TextAlign.justify),
            SizedBox(height: 1 * PdfPageFormat.cm)
          ]);
  static Widget buildFooter(ModelIzinKerja izinKerja) => Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                  padding: const EdgeInsets.only(right: 2 * PdfPageFormat.cm),
                  child:
                      Text('${izinKerja.tempatTerbit}, ${izinKerja.tglTerbit}'))
            ]),
            SizedBox(height: 3 * PdfPageFormat.mm),
            Padding(
                padding: const EdgeInsets.only(right: 3.2 * PdfPageFormat.cm),
                child: Text('Hormat Saya')),
            SizedBox(height: 2 * PdfPageFormat.cm),
            Padding(
                padding: const EdgeInsets.only(right: 3.6 * PdfPageFormat.cm),
                child: Text('( ${izinKerja.nama} )',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline))),
          ]);
}
