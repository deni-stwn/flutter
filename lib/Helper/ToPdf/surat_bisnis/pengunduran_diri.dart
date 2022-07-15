import 'dart:io';

import 'package:e_letter/Model/surat_bisnis/model_resign.dart';

import 'package:e_letter/helper/pdf_manager.dart';
import 'package:pdf/pdf.dart';
//import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfPengunduran {
  static Future<File> generate(ModelPengunduranDiri pengunduran) async {
    final pdf = Document();
    pdf.addPage(MultiPage(
        pageTheme: const PageTheme(pageFormat: PdfPageFormat.a4),
        build: (context) => [
              buildHeader(pengunduran),
              buildBody(pengunduran),
              buildFooter(pengunduran)
            ]));
    return PdfManager.saveDocument(name: 'Surat_pengunduran.pdf', pdf: pdf);
  }

  static Widget buildHeader(ModelPengunduranDiri pengunduran) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
            child: Text('SURAT PENGUNDURAN DIRI',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ))),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text('${pengunduran.tempat}, ${pengunduran.tanggalTerbit}'),
        ]),
        Text('Kepada Yth.'),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Text(pengunduran.penerima),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Text('Di tempat'),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Text('Dengan Hormat,'),
        SizedBox(height: 2 * PdfPageFormat.mm)
      ]);
  static Widget buildBody(ModelPengunduranDiri pengunduran) =>
      Column(children: [
        Text(
            '\t \t \t Melalui surat ini saya ${pengunduran.nama} bermaksud mengundurkan diri sebagai ${pengunduran.jabatan} di ${pengunduran.perusahaan} terhitung sejak ${pengunduran.tanggalPengunduran}.',
            style: const TextStyle(lineSpacing: 5),
            textAlign: TextAlign.justify),
        SizedBox(height: 0.45 * PdfPageFormat.cm),
        Text(
            '\t \t \t Saya sangat berterima kasih atas kesempatan yang telah diberikan kepada saya untuk bekerja di ${pengunduran.perusahaan}. Saya juga meminta maaf kepada seluruh karyawan dan pimpinan apabila terdapat kesalahan yang telah saya lakukan selama bekerja.',
            style: const TextStyle(lineSpacing: 5),
            textAlign: TextAlign.justify),
        SizedBox(height: 0.45 * PdfPageFormat.cm),
        // Text(
        //     'Saya juga meminta maaf kepada seluruh karyawan dan pimpinan apabila terdapat kesalahan yang telah saya lakukan selama bekerja.',
        //     style: const TextStyle(lineSpacing: 5)),
        // SizedBox(height: 0.5 * PdfPageFormat.cm),
        Text(
            'Demikian Surat Pengunduran Diri ini saya tulis dengan sebenar-benarnya dan penuh kesadaran. Saya berharap ${pengunduran.perusahaan} dapat terus berjaya dan memperoleh yang terbaik.',
            style: const TextStyle(lineSpacing: 5),
            textAlign: TextAlign.justify),
        SizedBox(height: 1 * PdfPageFormat.cm)
      ]);
  static Widget buildFooter(ModelPengunduranDiri pengunduran) => Padding(
      padding: const EdgeInsets.only(left: 10 * PdfPageFormat.cm),
      child: Column(children: [
        Text('Hormat Saya'),
        SizedBox(height: 3 * PdfPageFormat.cm),
        Text('( ${pengunduran.nama})',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline))
      ]));
}
