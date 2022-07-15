// ignore_for_file: unnecessary_statements

import 'package:e_letter/Model/surat_bisnis/model_resign.dart';
import 'package:e_letter/helper/pdf_manager.dart';
import 'package:e_letter/Widgets/datePicker.dart';
import 'package:e_letter/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Helper/ToPdf/surat_bisnis/pengunduran_diri.dart';
import '../../Model/activity/activity_model.dart';
import '../activity/activity_viewModel.dart';

class FormPengunduran extends StatefulWidget {
  const FormPengunduran({Key? key}) : super(key: key);

  @override
  State<FormPengunduran> createState() => _FormPengunduranState();
}

class _FormPengunduranState extends State<FormPengunduran> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  var name = TextEditingController();
  var date = TextEditingController();
  var perusahaan = TextEditingController();
  var jabatan = TextEditingController();
  var penerima = TextEditingController();
  var tanggalBuat = TextEditingController();
  var tempat = TextEditingController();

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
        title: const Text('Surat Resign'),
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
            child: ListView(
              children: [
                Stepper(
                    type: StepperType.vertical,
                    currentStep: _currentStep,
                    physics: const ScrollPhysics(),
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    onStepCancel: cancel,
                    steps: <Step>[
                      Step(
                          title: const Text(
                            'Data Diri',
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            children: [
                              TextFieldItem(
                                  controller: name,
                                  hintText: 'Mentari',
                                  label: 'Nama lengkap'),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFieldItem(
                                  controller: perusahaan,
                                  hintText: 'Pt. Maju terus',
                                  label: 'Nama Perusahaan'),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFieldItem(
                                  controller: jabatan,
                                  hintText: 'Manajer IT',
                                  label: 'Jabatan')
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 1
                              ? StepState.complete
                              : StepState.disabled),
                      Step(
                          title: const Text('Tanggal'),
                          content: Column(
                            children: [
                              DatePicker(
                                  controller: date,
                                  label: 'Tanggal Resign',
                                  hintText: DateTime.now().toString())
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 2
                              ? StepState.complete
                              : StepState.disabled),
                      Step(
                          title: const Text('Dikirim ke siapa ?'),
                          content: Column(
                            children: [
                              TextFieldItem(
                                  controller: penerima,
                                  hintText: 'Direktur PT apa aja',
                                  label: 'Penerima Surat')
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 3
                              ? StepState.complete
                              : StepState.disabled),
                      Step(
                          title: const Text('Waktu dan Tempat'),
                          content: Column(
                            children: [
                              TextFieldItem(
                                  controller: tempat,
                                  hintText: 'Jawa Tengah',
                                  label: 'Tempat Diterbitkan Surat'),
                              const SizedBox(
                                height: 5,
                              ),
                              DatePicker(
                                controller: tanggalBuat,
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
                      final data = ModelPengunduranDiri(
                          nama: name.text.toString(),
                          perusahaan: perusahaan.text.toString(),
                          jabatan: jabatan.text.toString(),
                          tanggalPengunduran: date.text.toString(),
                          penerima: penerima.text.toString(),
                          tempat: tempat.text.toString(),
                          tanggalTerbit: tanggalBuat.text.toString());

                      var activity = ActivityModel(
                          title: 'Surat resign',
                          createdDate: DateFormat('dd-MM-yyyy  hh:mm:ss a')
                              .format(DateTime.now()));
                      if (_formKey.currentState!.validate()) {
                        //add to pdf
                        final pdfFile = await PdfPengunduran.generate(data);
                        PdfManager.openFile(pdfFile);
                        //add to database
                        Provider.of<ActivityViewModel>(context, listen: false)
                            .addActivity(activity);
                      }
                    },
                    child: const Text('Buat Surat'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
