import 'package:flutter/material.dart';
import 'temperature.dart';
import 'store.dart'; // Import the StorePage widget

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.temperatureApi,
    required this.tdsApi,
    required this.phApi,
    required this.humidityApi,
    required this.baseurlApi,
    required this.tokenApi,
  }) : super(key: key);

  final String temperatureApi;
  final String tdsApi;
  final String phApi;
  final String humidityApi;
  final String baseurlApi;
  final String tokenApi;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fetchedTdsApi = "Your TDS API Value";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weather Station Dashboard',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 135,
                    child: Icon(
                      Icons.bar_chart_rounded,
                      color: Colors.indigo,
                      size: 28,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,   // Set the desired width for the first logo
                          height: 150,  // Set the desired height for the first logo
                          child: Image.asset(
                            'assets/images/tatasteellogo.png',
                          ),
                        ),
                        SizedBox(width: 20),  // Add some spacing between the logos
                        SizedBox(
                          width: 150,   // Set the desired width for the second logo
                          height: 150,  // Set the desired height for the second logo
                          child: Image.asset(
                            'assets/images/nabardlogo.jpeg',  // Replace with your second logo path
                          ),
                        ),
                      ],
                    ),
                  ),
                    const SizedBox(height: 48),
                    const Text(
                      'SERVICES',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /*_cardMenu(
                          icon: 'assets/images/energy.png',
                          title: 'STORE',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StorePage(), // Navigate to the StorePage
                              ),
                            );
                          },
                        ),*/
                        _cardMenu(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TemperaturePage(
                                  temperatureApi: widget.temperatureApi,
                                  tdsApi: widget.tdsApi,
                                  humidityApi: widget.humidityApi,
                                  phApi: widget.phApi,
                                  baseurlApi: widget.baseurlApi,
                                  tokenApi: widget.tokenApi,
                                ),
                              ),
                            );
                          },
                          icon: 'assets/images/potkaicon.png',
                          title: 'Potka Station',
                          color: Colors.indigoAccent,
                          fontColor: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                          icon: 'assets/images/comingsoon.png',
                          title: 'Station 2',
                        ),
                        _cardMenu(
                          icon: 'assets/images/comingsoon.png',
                          title: 'Station 3',
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
              // Display the API values at the bottom
              /* const SizedBox(height: 28),
              const Text(
                'API Values:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text('Temperature API: ${widget.temperatureApi}'),
              Text('TDS API: ${widget.tdsApi}'),
              Text('pH API: ${widget.phApi}'),
              Text('Humidity API: ${widget.humidityApi}'),
              Text('baseurl API: ${widget.baseurlApi}'),
              Text('token API: ${widget.tokenApi}'),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardMenu({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
        ),
        width: 156,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Image.asset(icon),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
            )
          ],
        ),
      ),
    );
  }
}
