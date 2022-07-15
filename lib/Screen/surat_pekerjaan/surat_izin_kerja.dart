import 'package:e_letter/Helper/ToPdf/surat_bisnis/izin_kerja_pdf.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Helper/pdf_manager.dart';
import '../../Model/activity/activity_model.dart';
import '../../Model/surat_bisnis/model_absen.dart';
import '../../Widgets/datePicker.dart';
import '../../Widgets/textfield.dart';
import '../activity/activity_viewModel.dart';

class SuratIzinKerja extends StatefulWidget {
  const SuratIzinKerja({Key? key}) : super(key: key);

  @override
  State<SuratIzinKerja> createState() => _SuratIzinKerjaState();
}

class _SuratIzinKerjaState extends State<SuratIzinKerja> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  var name = TextEditingController();
  var jabatan = TextEditingController();
  var alamat = TextEditingController();
  var tglMulai = TextEditingController();
  var tglSelesai = TextEditingController();
  var alasan = TextEditingController();
  var penerima = TextEditingController();
  var tempatTerbit = TextEditingController();
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
        title: const Text('Surat Izin Kerja'),
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
                                  controller: jabatan,
                                  hintText: 'Manajer IT',
                                  label: 'Jabatan'),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFieldItem(
                                  controller: alamat,
                                  hintText: 'Jl. Mawar No.19',
                                  label: 'Alamat')
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 1
                              ? StepState.complete
                              : StepState.disabled),
                      Step(
                          title: const Text('Tanggal Izin'),
                          content: Column(
                            children: [
                              DatePicker(
                                  controller: tglMulai,
                                  label: 'Mulai Tanggal',
                                  hintText: DateTime.now().toString()),
                              DatePicker(
                                  controller: tglSelesai,
                                  label: 'Sampai Tanggal',
                                  hintText: DateTime.now().toString())
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 2
                              ? StepState.complete
                              : StepState.disabled),
                      Step(
                          title: const Text('Apa alasan Izinnya?'),
                          content: Column(
                            children: [
                              TextFieldItem(
                                  controller: alasan,
                                  hintText: 'Kondisi kesehatan kurang baik',
                                  label: 'Alasan Izin')
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 3
                              ? StepState.complete
                              : StepState.disabled),
                      Step(
                          title: const Text('Dikirim ke siapa ?'),
                          content: Column(
                            children: [
                              TextFieldItem(
                                  controller: penerima,
                                  hintText: 'Bapak/Ibu Personalia PT.Maju',
                                  label: 'Penerima Surat')
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
                                  controller: tempatTerbit,
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
                      //add to pdf
                      final data = ModelIzinKerja(
                          nama: name.text.toString(),
                          jabatan: jabatan.text.toString(),
                          alamat: alamat.text.toString(),
                          tglMulai: tglMulai.text.toString(),
                          tglSelesai: tglSelesai.text.toString(),
                          alasan: alasan.text.toString(),
                          penerima: penerima.text.toString(),
                          tempatTerbit: tempatTerbit.text.toString(),
                          tglTerbit: tglTerbit.text.toString());

                      var activity = ActivityModel(
                          title: 'Surat Izin Kerja',
                          createdDate: DateFormat('dd-MM-yyyy  hh:mm:ss a')
                              .format(DateTime.now()));
                      if (_formKey.currentState!.validate()) {
                        final pdfFile = await PdfIzinKerja.generate(data);
                        PdfManager.openFile(pdfFile);
                        //add to database activity
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
