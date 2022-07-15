import 'package:e_letter/Model/surat_umum/model_surat_kuasa.dart';
import 'package:e_letter/helper/ToPdf/surat_biasa/surat_kuasa_pdf.dart';
import 'package:e_letter/helper/pdf_manager.dart';
import 'package:e_letter/Widgets/datePicker.dart';
import 'package:e_letter/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Model/activity/activity_model.dart';
import '../activity/activity_viewModel.dart';

class SuratKuasaScreen extends StatefulWidget {
  const SuratKuasaScreen({Key? key}) : super(key: key);

  @override
  State<SuratKuasaScreen> createState() => _SuratKuasaScreenState();
}

class _SuratKuasaScreenState extends State<SuratKuasaScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  var namaKuasa = TextEditingController();
  var tptLahirKuasa = TextEditingController();
  var tglLahirKuasa = TextEditingController();
  var jKelaminKuasa = TextEditingController();
  var noKtpKuasa = TextEditingController();
  var alamatKuasa = TextEditingController();
  var namaPenerima = TextEditingController();
  var tptLahirPenerima = TextEditingController();
  var tglLahirPenerima = TextEditingController();
  var jKelaminPenerima = TextEditingController();
  var noKtpPenerima = TextEditingController();
  var alamatPenerima = TextEditingController();
  var keperluan = TextEditingController();
  var tptTerbit = TextEditingController();
  var tglTerbit = TextEditingController();

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff261865),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff261865),
          title: const Text('Surat Kuasa'),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: ListView(children: [
                    Stepper(
                        type: StepperType.vertical,
                        currentStep: _currentStep,
                        physics: const ScrollPhysics(),
                        onStepTapped: (step) => tapped(step),
                        onStepContinue: continued,
                        onStepCancel: cancel,
                        steps: <Step>[
                          Step(
                              title: const Text('Pemberi Kuasa'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: namaKuasa,
                                      hintText: 'Parjo',
                                      label: 'Nama Lengkap'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: tptLahirKuasa,
                                      hintText: 'Purbalingga',
                                      label: 'Tempat Lahir'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DatePicker(
                                      controller: tglLahirKuasa,
                                      label: 'Tanggal Lahir',
                                      hintText: 'hh-MM-tttt'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: jKelaminKuasa,
                                      hintText: 'Laki-Laki',
                                      label: 'Jenis Kelamin'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ListTile(
                                    title: TextFormField(
                                        controller: noKtpKuasa,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Nomor KTP',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: '33120123',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Data tidak boleh kosong';
                                          }
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: alamatKuasa,
                                      hintText: 'Jl. Gatot Subroto',
                                      label: 'Alamat'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 1
                                  ? StepState.complete
                                  : StepState.disabled),
                          Step(
                              title: const Text('Penerima Kuasa'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: namaPenerima,
                                      hintText: 'Joko',
                                      label: 'Nama Lengkap'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: tptLahirPenerima,
                                      hintText: 'Purbalingga',
                                      label: 'Tempat Lahir'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DatePicker(
                                      controller: tglLahirPenerima,
                                      label: 'Tanggal Lahir',
                                      hintText: 'hh-MM-tttt'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: jKelaminPenerima,
                                      hintText: 'Laki-Laki',
                                      label: 'Jenis Kelamin'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ListTile(
                                    title: TextFormField(
                                        controller: noKtpPenerima,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Nomor KTP',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: '33120123',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Data tidak boleh kosong';
                                          }
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: alamatPenerima,
                                      hintText: 'Jl. Gatot Subroto',
                                      label: 'Alamat'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 2
                                  ? StepState.complete
                                  : StepState.disabled),
                          Step(
                              title: const Text('Keperluan Surat'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: keperluan,
                                      hintText: 'Pengambilan bantuan',
                                      label: 'Keperluan')
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 3
                                  ? StepState.complete
                                  : StepState.disabled),
                          Step(
                              title: const Text('Tempat dan Tanggal'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: tptTerbit,
                                      hintText: 'Jawa Tengah',
                                      label: 'Tempat Diterbitkan Surat'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DatePicker(
                                    controller: tglTerbit,
                                    label: 'Tanggal Terbit Surat',
                                    hintText: DateTime.now().toString(),
                                  )
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 4
                                  ? StepState.complete
                                  : StepState.disabled),
                        ]),
                    ElevatedButton(
                        onPressed: () async {
                          final data = ModelSuratKuasa(
                              namaPemberi: namaKuasa.text.toString(),
                              tptLahirPemberi: tptLahirKuasa.text.toString(),
                              tglLahirPemberi: tglLahirKuasa.text.toString(),
                              jKelaminPemberi: jKelaminKuasa.text.toString(),
                              noKtpPemberi: noKtpKuasa.text.toString(),
                              alamatPemberi: alamatKuasa.text.toString(),
                              namaPenerima: namaPenerima.text.toString(),
                              tptLahirPenerima:
                                  tptLahirPenerima.text.toString(),
                              tglLahirPenerima:
                                  tglLahirPenerima.text.toString(),
                              jKelaminPenerima:
                                  jKelaminPenerima.text.toString(),
                              noKtpPenerima: noKtpPenerima.text.toString(),
                              alamatPenerima: alamatPenerima.text.toString(),
                              keperluan: keperluan.text.toString(),
                              tempatTerbit: tptTerbit.text.toString(),
                              tglTerbitl: tglTerbit.text.toString());

                          var activity = ActivityModel(
                              title: 'Surat Kuasa',
                              createdDate: DateFormat('dd-MM-yyyy  hh:mm:ss a')
                                  .format(DateTime.now()));
                          if (_formKey.currentState!.validate()) {
                            final pdfFile = await SuratKuasaPdf.generate(data);
                            PdfManager.openFile(pdfFile);
                            //add activity
                            Provider.of<ActivityViewModel>(context,
                                    listen: false)
                                .addActivity(activity);
                          }
                        },
                        child: const Text('Buat Surat')),
                  ]),
                ))));
  }
}
