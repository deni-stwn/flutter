import 'dart:io';

import 'package:e_letter/Helper/pdf_manager.dart';
import 'package:e_letter/Model/surat_organisasi/model_izin_organisasi.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfIzinKegiatan {
  static Future<File> generate(ModelIzinKegiatan izinKegiatan) async {
    final pdf = Document();
    pdf.addPage(MultiPage(
        pageTheme: const PageTheme(pageFormat: PdfPageFormat.a4),
        build: (context) => [
              buildHeader(izinKegiatan),
              buildBody(izinKegiatan),
              buildFooter(izinKegiatan)
            ]));
    return PdfManager.saveDocument(name: 'Surat_izin_kegiatan.pdf', pdf: pdf);
  }

  static Widget buildHeader(ModelIzinKegiatan izinKegiatan) => Center(
          child: Column(children: [
        Text('${izinKegiatan.jenisInstansi}',
            style: const TextStyle(fontSize: 14)),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Text('${izinKegiatan.namaInstansi}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Text('Alamat:${izinKegiatan.alamat} Telp/Hp:${izinKegiatan.noTlp}',
            textAlign: TextAlign.justify),
        Text('Website:${izinKegiatan.website}'),
        //SizedBox(height: 1 * PdfPageFormat.mm),
        Divider(thickness: 3, borderStyle: BorderStyle.solid),
      ]));
  static Widget buildBody(ModelIzinKegiatan izinKegiatan) =>
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Nomor       : ${izinKegiatan.noSurat}'),
          Text('${izinKegiatan.tempatTerbit}, ${izinKegiatan.tglTerbit}'),
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          Text('Lampiran  \t: ${izinKegiatan.lampiran} Lembar'),
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          Text('Perihal     \t\t: ${izinKegiatan.perihal}'),
        ]),
        SizedBox(height: 0.6 * PdfPageFormat.cm),
        Row(children: [
          Text('Kepada Yth.'),
        ]),
        SizedBox(height: 1 * PdfPageFormat.mm),
        Row(children: [
          Text('${izinKegiatan.penerima}'),
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
            '       Sehubungan dengan akan diselenggarakannya kegiatan ${izinKegiatan.namaAcara},  yang akan dilaksanakan pada :',
            textAlign: TextAlign.justify,
            style: const TextStyle(lineSpacing: 4)),
        SizedBox(height: 3 * PdfPageFormat.mm),
        Row(children: [
          Text('      Tanggal                     : ${izinKegiatan.tglAcara}'),
        ]),
        SizedBox(height: 1.5 * PdfPageFormat.mm),
        Row(children: [
          Text(
              '      Waktu                       \t: Pukul ${izinKegiatan.waktu} s.d Selesai'),
        ]),
        SizedBox(height: 1.5 * PdfPageFormat.mm),
        Row(children: [
          Text('      Tempat                     \t: ${izinKegiatan.tempat}'),
        ]),
        SizedBox(height: 3 * PdfPageFormat.mm),
        Text(
            'Demi lancarnya kegiatan tersebut, maka kami selaku panitia meminta persetujuan dan izin terselenggaranya ${izinKegiatan.namaAcara}.',
            textAlign: TextAlign.justify,
            style: const TextStyle(lineSpacing: 4)),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Text(
            'Demikian surat ini kami buat. Atas perhatian dan izin yang diberikan kami ucapkan terima kasih.',
            textAlign: TextAlign.justify,
            style: const TextStyle(lineSpacing: 4)),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Padding(
            padding: const EdgeInsets.only(right: 3 * PdfPageFormat.cm),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text('${izinKegiatan.tempatTerbit}, ${izinKegiatan.tglTerbit}')
            ])),
        SizedBox(height: 2 * PdfPageFormat.mm)
      ]);
  static Widget buildFooter(ModelIzinKegiatan izinKegiatan) => Padding(
      padding: const EdgeInsets.only(left: 9.4 * PdfPageFormat.cm),
      child: Column(children: [
        Text('Ketua Panitia Kegiatan'),
        SizedBox(height: 3 * PdfPageFormat.cm),
        Text('( ${izinKegiatan.ketua})',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline))
      ]));
}
