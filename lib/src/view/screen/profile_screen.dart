import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_asset.dart';
import 'package:hungry_hund/core/app_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAsset.profilePic,
                  width: 350, // Cambia este valor al tamaño deseado
                  height: 350, // Cambia este valor al tamaño deseado
                ),
                const SizedBox(height: 20), // Espacio entre la imagen y la información del usuario
                const Text(
                  "Nombre del Usuario",
                  style:  h2Style,
                ),
                const SizedBox(height: 5),
                const Text(
                  "correo@ejemplo.com",
                  style:  h4Style,
                ),
              ],
            ),
          ),
          const Text(
            "Hello World!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAsset.githubPic, width: 60),
              const SizedBox(width: 10),
              const Text(
                "https://github.com/x0chipa",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          const SizedBox(height: 20), // Añade un poco de espacio en la parte inferior si es necesario
        ],
      ),
    );
  }
}
