// import des packages
// bibliothèque material : bibliothèque de design de google
import 'package:flutter/material.dart';
import 'package:store/screens/home_screen.dart';

// fonction main : point d'entrée de l'application
void main() => runApp(const Store());

// widget (composant) Store : représente l'application
class Store extends StatelessWidget {
  const Store({super.key});

  // méthode build permet de définir l'interface visuelle du widget
  /*
    architecture :
      MaterialApp : représente l'application
        > Scaffold : permet d'architecturer l'application
          > premier écran
    
    principaux widgets :
      - SingleChildScrollView : créer un ascenseur
      - Row : alignement horizontal de plusieurs widgets
      - Column : alignement vertical de plusieurs widgets
      - Text : afficher un texte
      - Icon : afficher une icône
      - Image : afficher une image
      - OutlinedButton : bouton
      - Container : créer un bloc avec des padding, margin, image de fond…
  */
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Store",
      home: HomeScreen(),
    );
  }
}
