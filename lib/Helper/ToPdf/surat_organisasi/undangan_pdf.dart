import 'dart:io';

import 'package:e_letter/Model/surat_organisasi/model_undangan.dart';

import 'package:e_letter/helper/pdf_manager.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfUndangan {
  static Future<File> generate(ModelUndangan undangan) async {
    final pdf = Document();
    pdf.addPage(MultiPage(
        pageTheme: const PageTheme(pageFormat: PdfPageFormat.a4),
        build: (context) => [
              buildHeader(undangan),
              buildBody(undangan),
              buildFooter(undangan)
            ]));
    return PdfManager.saveDocument(name: 'Surat_undangan_resmi.pdf', pdf: pdf);
  }

  static Widget buildHeader(ModelUndangan undangan) => Center(
          child: Column(children: [
        Text('${undangan.jenisInstansi}', style: const TextStyle(fontSize: 14)),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Text('${undangan.namaInstansi}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Text(
            'Alamat:${undangan.alamat} Telp/Hp:${undangan.noTlp} Email:${undangan.email} ',
            textAlign: TextAlign.justify),
        Text('Website:${undangan.website}'),
        //SizedBox(height: 1 * PdfPageFormat.mm),
        Divider(thickness: 3, borderStyle: BorderStyle.solid),
      ]));
  static Widget buildBody(ModelUndangan undangan) =>
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Nomor       : ${undangan.noSurat}'),
          Text('${undangan.tempatTerbit}, ${undangan.tglTerbit}'),
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          Text('Lampiran  \t: ${undangan.lampiran} Lembar'),
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          Text('Perihal     \t\t: ${undangan.perihal}'),
        ]),
        SizedBox(height: 0.6 * PdfPageFormat.cm),
        Row(children: [
          Text('Kepada Yth.'),
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          Text('${undangan.penerima}'),
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          Text('Di tempat'),
        ]),
        SizedBox(height: 0.6 * PdfPageFormat.cm),
        Row(children: [
          Text('Dengan hormat,'),
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Text(
            '       Sehubungan dengan akan diselenggarakannya acara ${undangan.namaAcara}, kami bermaksud mengundang Bapak/Ibu untuk menghadiri acara tersebut yang akan dilaksanakan pada :',
            textAlign: TextAlign.justify,
            style: const TextStyle(lineSpacing: 4)),
        SizedBox(height: 3 * PdfPageFormat.mm),
        Row(children: [
          Text('      Tanggal                     : ${undangan.tglAcara}'),
        ]),
        SizedBox(height: 1.5 * PdfPageFormat.mm),
        Row(children: [
          Text(
              '      Waktu                       \t: Pukul ${undangan.waktu} s.d Selesai'),
        ]),
        SizedBox(height: 1.5 * PdfPageFormat.mm),
        Row(children: [
          Text('      Tempat                     \t: ${undangan.tempat}'),
        ]),
        SizedBox(height: 1.5 * PdfPageFormat.mm),
        Row(children: [
          Text('      Acara                       \t\t: ${undangan.namaAcara}'),
        ]),
        SizedBox(height: 3 * PdfPageFormat.mm),
        Text(
            'Demikian surat undangan ini kami sampaikan, atas perhatian dan kehadiran Bapak/Ibu kami ucapkan terima kasih.',
            textAlign: TextAlign.justify,
            style: const TextStyle(lineSpacing: 4)),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Padding(
            padding: const EdgeInsets.only(right: 3 * PdfPageFormat.cm),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text('${undangan.tempatTerbit}, ${undangan.tglTerbit}')
            ])),
        SizedBox(height: 2 * PdfPageFormat.mm)
      ]);
  static Widget buildFooter(ModelUndangan undangan) => Column(children: [
        Padding(
            padding: const EdgeInsets.only(
                left: 2.5 * PdfPageFormat.cm, right: 4 * PdfPageFormat.cm),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Sekretaris'), Text('Ketua Panitia')])),
        SizedBox(height: 2.5 * PdfPageFormat.cm),
        Padding(
            padding: const EdgeInsets.only(
                left: 2.5 * PdfPageFormat.cm, right: 4.2 * PdfPageFormat.cm),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('( ${undangan.sekretaris} )',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                  Text('( ${undangan.ketua} )',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline))
                ]))
      ]);
}
