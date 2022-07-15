import 'package:flutter/material.dart';

class MenuSurat extends StatelessWidget {
  void Function() onTap;
  final String image;
  final String text;
  MenuSurat(
      {Key? key,
      required this.size,
      required this.onTap,
      required this.image,
      required this.text})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.redAccent),
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Color(0xFFE6E6E6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            focusColor: Colors.redAccent,
            hoverColor: Colors.redAccent,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  SizedBox(
                    child: Image.asset(
                      image,
                      width: size.width * 0.2,
                      height: size.height * 0.08,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
