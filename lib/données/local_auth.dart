
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuthenticationScreen extends StatefulWidget {
  const FingerprintAuthenticationScreen({super.key});

  @override
  _FingerprintAuthenticationScreenState createState() =>
      _FingerprintAuthenticationScreenState();
}

class _FingerprintAuthenticationScreenState
    extends State<FingerprintAuthenticationScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _isBiometricAvailable = false;
  String _authStatus = '';

  @override
  void initState() {
    super.initState();
    _checkBiometricAvailability();
  }

  Future<void> _checkBiometricAvailability() async {
    try {
      bool isAvailable = await _localAuthentication.canCheckBiometrics;
      setState(() {
        _isBiometricAvailable = isAvailable;
        _authStatus =
            isAvailable ? 'Empreinte digitale disponible' : 'Empreinte digitale non disponible';
      });
    } catch (e) {
      print('Erreur lors de la vérification de la disponibilité de l\'empreinte digitale: $e');
      setState(() {
        _authStatus = 'Erreur lors de la vérification de la disponibilité';
      });
    }
  }

  Future<void> _authenticate() async {
    try {
      bool isAuthenticated = await _localAuthentication.authenticate(
        localizedReason: 'Veuillez utiliser votre empreinte digitale pour vous authentifier',
      );

      setState(() {
        _authStatus =
            isAuthenticated ? 'Authentification réussie' : 'Échec de l\'authentification';
      });

      if (isAuthenticated) {
        // Rediriger vers la page principale de l'application
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      print('Erreur lors de l\'authentification par empreinte digitale: $e');
      setState(() {
        _authStatus = 'Erreur lors de l\'authentification';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification par empreinte digitale'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fingerprint,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              _authStatus,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
