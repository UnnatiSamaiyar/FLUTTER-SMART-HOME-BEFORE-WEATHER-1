import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _checkSavedLogin();
  }

  Future<void> _checkSavedLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');

    if (savedUsername != null && savedPassword != null) {
      _usernameController.text = savedUsername;
      _passwordController.text = savedPassword;
      _performLogin();
    }
  }

  Future<void> _performLogin() async {
    try {
      String enteredUsername = _usernameController.text;
      String enteredPassword = _passwordController.text;
      String url =
          "https://api.airtable.com/v0/appn3jOUjHv0nHMRY/Tasks?filterByFormula=AND(username%3D%22$enteredUsername%22%2C+password%3D%22$enteredPassword%22)";
      Map<String, String> headers = {
        "Authorization":
            "Bearer patXIJ9NMoiZYgfEL.7fa08205b7b65171b762727516cd80e9ea3aeff226e71012d6dfb0360162f7c2",
      };

      http.Response response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> result = json.decode(response.body);
        List records = result['records'];

        if (records.isNotEmpty) {
          // Extract the API values from the first record (assuming there's only one)
          Map<String, dynamic> fields = records[0]['fields'];

          // Safely fetch the API fields with default values for null or empty fields
          String fetchedTdsApi = fields['tdsapi'] ?? '';
          String fetchedTemperatureApi = fields['temperatureapi'] ?? '';
          String fetchedHumidityApi = fields['humidityapi'] ?? '';
          String fetchedPhApi = fields['phapi'] ?? '';
          String fetchedbaseurlApi = fields['baseurl'] ?? '';
          String fetchedtokenApi = fields['token'] ?? '';
          String fetchedwindspeedapi = fields['windspeedapi'] ?? '';
          String fetchedraincountapi = fields['raincountapi'] ?? '';
          String fetchedwinddirectionapi = fields['winddirectionapi'] ?? '';
          String fetchediaqapi = fields['iaqapi'] ?? '';
          String fetchedco2api = fields['co2api'] ?? '';
          String fetchedbreathvocapi = fields['breathvocapi'] ?? '';
          String fetchedpressureapi = fields['pressureapi'] ?? '';
          String fetcheddewpointapi = fields['dewpointapi'] ?? '';
          String fetcheddosing1api = fields['dosing1api'] ?? '';
          String fetcheddosing2api = fields['dosing2api'] ?? '';
          String fetcheddosing3api = fields['dosing3api'] ?? '';
          String fetcheddosing4api = fields['dosing4api'] ?? '';
          String fetchednftpumpapi = fields['nftpumpapi'] ?? '';
          String fetchedaeropumpapi = fields['aeropumpapi'] ?? '';
          String fetchednftdosingapi = fields['nftdosingapi'] ?? '';
          String fetcheddwcdosingapi = fields['dwcdosingapi'] ?? '';
          String fetchedaerodosingapi = fields['aerodosingapi'] ?? '';
          String fetchedfanrelayapi = fields['fanrelayapi'] ?? '';
          String fetchedpadrelayapi = fields['padrelayapi'] ?? '';
          String fetchedfogrelayapi = fields['fogrelayapi'] ?? '';

          // Save username and password to SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', enteredUsername);
          await prefs.setString('password', enteredPassword);

          // Navigate to HomePage with the fetched API values
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                temperatureApi: fetchedTemperatureApi,
                tdsApi: fetchedTdsApi,
                humidityApi: fetchedHumidityApi,
                phApi: fetchedPhApi,
                baseurlApi: fetchedbaseurlApi,
                tokenApi: fetchedtokenApi,
                windspeedapi: fetchedwindspeedapi,
                raincountapi: fetchedraincountapi,
                winddirectionapi: fetchedwinddirectionapi,
                iaqapi: fetchediaqapi,
                co2api: fetchedco2api,
                breathvocapi: fetchedbreathvocapi,
                pressureapi: fetchedpressureapi,
                dewpointapi: fetcheddewpointapi,
                dosing1api: fetcheddosing1api,
                dosing2api: fetcheddosing2api,
                dosing3api: fetcheddosing3api,
                dosing4api: fetcheddosing4api,
                nftpumpapi: fetchednftpumpapi,
                aeropumpapi: fetchedaeropumpapi,
                nftdosingapi: fetchednftdosingapi,
                dwcdosingapi: fetcheddwcdosingapi,
                aerodosingapi: fetchedaerodosingapi,
                fanrelayapi: fetchedfanrelayapi,
                padrelayapi: fetchedpadrelayapi,
                fogrelayapi: fetchedfogrelayapi,
              ),
            ),
          );
        } else {
          setState(() {
            _errorMessage = 'Invalid username or password';
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Error connecting to the server';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _performLogin,
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              Text(
                _errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
