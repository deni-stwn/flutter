import 'package:e_letter/Model/surat_umum/model_izinOrangTua.dart';
import 'package:e_letter/helper/ToPdf/surat_biasa/surat_izin.dart';
import 'package:e_letter/helper/pdf_manager.dart';
import 'package:e_letter/Widgets/datePicker.dart';
import 'package:e_letter/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Model/activity/activity_model.dart';
import '../activity/activity_viewModel.dart';

class ScreenIzinOrtu extends StatefulWidget {
  const ScreenIzinOrtu({Key? key}) : super(key: key);

  @override
  State<ScreenIzinOrtu> createState() => _ScreenIzinOrtuState();
}

class _ScreenIzinOrtuState extends State<ScreenIzinOrtu> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  var namaOrtu = TextEditingController();
  var tptLahirOrtu = TextEditingController();
  var tglLahirOrtu = TextEditingController();
  var pekerjaan = TextEditingController();
  var alamatOrtu = TextEditingController();
  var namaAnak = TextEditingController();
  var tptLahirAnak = TextEditingController();
  var tglLahirAnak = TextEditingController();
  var jKelaminAnak = TextEditingController();
  var alamatAnak = TextEditingController();
  var perihal = TextEditingController();
  var status = TextEditingController();
  var tmptTerbit = TextEditingController();
  var tglTerbit = TextEditingController();

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 4 ? setState(() => _currentStep += 1) : null;
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
          title: const Text('Surat Izin Orang Tua'),
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
                              title: const Text('Data Orang Tua'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: namaOrtu,
                                      hintText: 'Joko',
                                      label: 'Nama Lengkap'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: tptLahirOrtu,
                                      hintText: 'Purbalingga',
                                      label: 'Tempat Lahir'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DatePicker(
                                      controller: tglLahirOrtu,
                                      label: 'Tanggal Lahir',
                                      hintText: 'hh-BB-tttt'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: pekerjaan,
                                      hintText: 'Pedagang',
                                      label: 'Pekerjaan'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: alamatOrtu,
                                      hintText: 'Jl. Karangreja no.17',
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
                              title: const Text('Data Anak'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: namaAnak,
                                      hintText: 'Melati',
                                      label: 'Nama Lengkap'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: tptLahirAnak,
                                      hintText: 'Purbalingga',
                                      label: 'Tempat Lahir'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DatePicker(
                                      controller: tglLahirAnak,
                                      label: 'Tanggal Lahir',
                                      hintText: 'hh-BB-tttt'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: jKelaminAnak,
                                      hintText: 'Perempuan',
                                      label: 'Jenis Kelamin'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: alamatAnak,
                                      hintText: 'Jl. Karangreja no.17',
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
                              title: const Text('Perihal Izin'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: perihal,
                                      hintText: 'Mengikuti Persami',
                                      label: 'Perihal Izin')
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 3
                                  ? StepState.complete
                                  : StepState.disabled),
                          Step(
                              title: const Text('Status'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: perihal,
                                      hintText: 'Mengikuti Persami',
                                      label: 'Perihal Izin')
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 4
                                  ? StepState.complete
                                  : StepState.disabled),
                          Step(
                              title: const Text('Waktu dan Tempat'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: tmptTerbit,
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
                              state: _currentStep >= 5
                                  ? StepState.complete
                                  : StepState.disabled),
                        ]),
                    ElevatedButton(
                        onPressed: () async {
                          final data = ModelIzinOrangTua(
                              namaOrtu: namaOrtu.text.toString(),
                              tptLahirOrtu: tptLahirOrtu.text.toString(),
                              tglLahirOrtu: tglLahirOrtu.text.toString(),
                              pekerjaan: pekerjaan.text.toString(),
                              alamatOrtu: alamatOrtu.text.toString(),
                              namaAnak: namaAnak.text.toString(),
                              tptLahirAnak: tptLahirAnak.text.toString(),
                              tglLahirAnak: tglLahirAnak.text.toString(),
                              jKelamin: jKelaminAnak.text.toString(),
                              alamatAnak: alamatAnak.text.toString(),
                              perihal: perihal.text.toString(),
                              status: status.text.toString(),
                              tempatTerbit: tmptTerbit.text.toString(),
                              tglTerbit: tglTerbit.text.toString());

                          var activity = ActivityModel(
                              title: 'Surat undangan',
                              createdDate: DateFormat('dd-MM-yyyy  hh:mm:ss a')
                                  .format(DateTime.now()));
                          if (_formKey.currentState!.validate()) {
                            final pdfFile = await PdfSuratIzin.generate(data);
                            PdfManager.openFile(pdfFile);
                            //add activity
                            Provider.of<ActivityViewModel>(context,
                                    listen: false)
                                .addActivity(activity);
                          }
                        },
                        child: const Text('Buat Surat'))
                  ]),
                ))));
  }
}
