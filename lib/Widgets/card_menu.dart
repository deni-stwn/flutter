import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final String desc;
  final String title;
  final IconData leading;

  const CardMenu(
      {required this.desc, required this.leading, required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Color(0xff261865), width: 1.2)),
        //color: color,
        elevation: 5,
        child: Center(
          child: ListTile(
            leading: Icon(
              leading,
              color: const Color(0xff261865),
            ),
            title: Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(desc),
            ),
            trailing: Icon(
              Icons.navigate_next_outlined,
              color: const Color(0xff261865),
              size: size.width * 0.1,
            ),
          ),
        ),
        //
      ),
    );
  }
}
