import 'dart:io';

import 'package:e_letter/Model/surat_umum/model_surat_kuasa.dart';
import 'package:e_letter/helper/pdf_manager.dart';

import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';

class SuratKuasaPdf {
  static Future<File> generate(ModelSuratKuasa suratKuasa) async {
    final pdf = Document();
    pdf.addPage(MultiPage(
        pageTheme: const PageTheme(pageFormat: PdfPageFormat.a4),
        build: (context) => [
              buildHeader(suratKuasa),
              buildBody(suratKuasa),
              buildFooter(suratKuasa)
            ]));
    return PdfManager.saveDocument(name: 'Surat_kuasa.pdf', pdf: pdf);
  }

  static Widget buildHeader(ModelSuratKuasa suratKuasa) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
            child: Text('SURAT KUASA',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline))),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Text('Saya yang bertanda tangan dibawah ini :'),
        SizedBox(height: 4 * PdfPageFormat.mm)
      ]);
  static Widget buildBody(ModelSuratKuasa suratKuasa) => Padding(
      padding: const EdgeInsets.only(left: 1 * PdfPageFormat.cm),
      child: Column(children: [
        Row(children: [
          Text('Nama'),
          SizedBox(width: 1.6 * PdfPageFormat.inch),
          Text(':  ${suratKuasa.namaPemberi}')
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Tempat, Tgl Lahir'),
          SizedBox(width: 0.74 * PdfPageFormat.inch),
          Text(
              ':  ${suratKuasa.tptLahirPemberi}, ${suratKuasa.tglLahirPemberi}')
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Jenis Kelamin'),
          SizedBox(width: 1 * PdfPageFormat.inch),
          Text(':  ${suratKuasa.jKelaminPemberi}')
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Nomor KTP'),
          SizedBox(width: 1.17 * PdfPageFormat.inch),
          Text(':  ${suratKuasa.noKtpPemberi}')
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Alamat'),
          SizedBox(width: 1.52 * PdfPageFormat.inch),
          Text(':  ${suratKuasa.alamatPemberi}')
        ]),
        SizedBox(height: 4 * PdfPageFormat.mm),
        Row(children: [
          Text('Selanjutnya disebut sebagai '),
          Text('PIHAK PERTAMA', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(', dengan ini memberikan '),
          Text('KUASA', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(' kepada :')
        ]),
        SizedBox(height: 4 * PdfPageFormat.mm),
        Row(children: [
          Text('Nama'),
          SizedBox(width: 1.6 * PdfPageFormat.inch),
          Text(':  ${suratKuasa.namaPenerima}')
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Tempat, Tgl Lahir'),
          SizedBox(width: 0.74 * PdfPageFormat.inch),
          Text(
              ':  ${suratKuasa.tptLahirPenerima}, ${suratKuasa.tglLahirPenerima}')
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Jenis Kelamin'),
          SizedBox(width: 1 * PdfPageFormat.inch),
          Text(':  ${suratKuasa.jKelaminPenerima}')
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Nomor KTP'),
          SizedBox(width: 1.17 * PdfPageFormat.inch),
          Text(':  ${suratKuasa.noKtpPenerima}')
        ]),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Row(children: [
          Text('Alamat'),
          SizedBox(width: 1.52 * PdfPageFormat.inch),
          Text(':  ${suratKuasa.alamatPenerima}')
        ]),
        SizedBox(height: 4 * PdfPageFormat.mm),
        Row(children: [
          Text('Selanjutnya disebut sebagai '),
          Text('PIHAK KEDUA', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(', untuk keperluan ${suratKuasa.keperluan} ',
              style: const TextStyle(lineSpacing: 5),
              textAlign: TextAlign.justify),
        ]),
        SizedBox(height: 4 * PdfPageFormat.mm),
      ]));
  static Widget buildFooter(ModelSuratKuasa suratKuasa) => Column(children: [
        Text(
            '\t\t\t\t\t\t\t\t Demikian Surat Kuasa ini dibuat dengan sebenar-benarnya untuk digunakan seperlunya. Atas perhatian dan kerjasama Bapak Ibu Saudara kami ucapkan terima kasih',
            style: const TextStyle(lineSpacing: 5),
            textAlign: TextAlign.justify),
        SizedBox(height: 5 * PdfPageFormat.mm),
        Padding(
            padding: const EdgeInsets.only(right: 1 * PdfPageFormat.cm),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text('${suratKuasa.tempatTerbit}, ${suratKuasa.tglTerbitl}')
            ])),
        SizedBox(height: 3 * PdfPageFormat.mm),
        Column(children: [
          Padding(
              padding: const EdgeInsets.only(
                  right: 2 * PdfPageFormat.cm, left: 2 * PdfPageFormat.cm),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Pihak Kedua'), Text('Pihak Pertama')])),
          SizedBox(height: 1.3 * PdfPageFormat.cm),
          Padding(
              padding: const EdgeInsets.only(right: 3 * PdfPageFormat.cm),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('Materai')])),
          SizedBox(height: 0.6 * PdfPageFormat.cm),
          Padding(
              padding: const EdgeInsets.only(
                  right: 2.1 * PdfPageFormat.cm, left: 2 * PdfPageFormat.cm),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('( ${suratKuasa.namaPenerima} )',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                    Text('( ${suratKuasa.namaPemberi} )',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ])),
        ]),
      ]);
}
