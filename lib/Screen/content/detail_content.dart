// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DetailContent extends StatelessWidget {
  String gambar, header, body, paragraf1, paragraf2, paragraf3;
  DetailContent(
      {Key? key,
      required this.gambar,
      required this.header,
      required this.body,
      required this.paragraf1,
      required this.paragraf2,
      required this.paragraf3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff261865),
      appBar: AppBar(
        title: const Text('Detail'),
        elevation: 0,
        backgroundColor: const Color(0xff261865),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                header,
                style: const TextStyle(fontSize: 32, color: Colors.black),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(gambar),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(body,
                  style: const TextStyle(
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.justify),
              const SizedBox(
                height: 15,
              ),
              Text(paragraf1,
                  style: const TextStyle(
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.justify),
              const SizedBox(
                height: 10,
              ),
              Text(paragraf2,
                  style: const TextStyle(
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.justify),
              const SizedBox(
                height: 10,
              ),
              Text(paragraf3,
                  style: const TextStyle(
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.justify)
            ],
          ),
        ),
      ),
    );
  }
}
