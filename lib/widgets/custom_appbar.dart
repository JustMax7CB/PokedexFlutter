import 'package:compie_assignment/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget pokeAppBar(
    {required BuildContext context, required Function switchTheme}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: const Text("Pokedex App"),
    actions: [
      IconButton(onPressed: () => switchTheme(), icon: const Icon(Icons.light))
    ],
    flexibleSpace: ClipPath(
      clipper: CustomAppBar(),
      child: Container(
          height: 260,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromRGBO(179, 50, 34, 1),
                Color.fromRGBO(217, 76, 56, 1)
              ]))),
    ),
  );
}
