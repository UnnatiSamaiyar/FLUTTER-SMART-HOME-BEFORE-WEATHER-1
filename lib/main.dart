import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'login_page_o.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Request network permissions
  await PermissionHandler().request(
    [Permission.nearbyWifiDevices, Permission.unknown],
  );

  runApp(const LoginApp());
}

class PermissionHandler {
  request(List<dynamic> list) {}
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
