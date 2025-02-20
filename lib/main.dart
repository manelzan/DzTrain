import 'package:dz_train/page-inscription%20.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Assure l'initialisation des widgets Flutter
  await Firebase.initializeApp(); // ✅ Initialise Firebase avant de lancer l'app
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DZTrain',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade200), // Éclaircissement de la couleur
      ),
      home: SplashScreen(),
    );
  }
}

// Écran de chargement avec une combinaison d'images
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🖼️ Image en arrière-plan
          Positioned.fill(
            child: Image.asset(
              "assets/images/train.gif",
              fit: BoxFit.cover, // Permet d'ajuster l'image à l'écran
            ),
          ),

          // 📌 Contenu au-dessus de l'image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/localisation.jpg", width: 200), // JPEG de localisation
              ],
            ),
          ),

          // 🔘 Bouton en bas à droite
          Positioned(
            bottom: 30,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.lightBlue,
              ),
              child: Text("Essayer"), // Modification du bouton
            ),
          ),
        ],
      ),
    );
  }
}



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade100, Colors.grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),

            // 🖼️ Image en haut
            Image.asset(
              "assets/images/DZ_TRAIN.png",
              width: 790,
              height: 270,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Nom d'utilisateur ",
                      icon: Icon(Icons.person, color: Colors.indigo),
                    ),
                  ),
                  Divider(color: Colors.grey.shade300),
                  TextField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mot de passe",
                      icon: Icon(Icons.lock, color: Colors.indigo),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.indigo,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Action mot de passe oublié
              },
              child: Text(
                "Mot de passe oublié ?",
                style: TextStyle(color: Colors.white70),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    "Se connecter",
                    style: TextStyle(
                      color: Colors.lightBlue.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                "Créer un compte",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accueil")),
      body: Center(child: Text("Bienvenue dans l'application DZTrain !")),
    );
  }
}
