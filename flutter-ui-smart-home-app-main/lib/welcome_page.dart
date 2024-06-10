import 'package:flutter/material.dart';
import 'temperature.dart';
// Import the StorePage widget

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.temperatureApi,
    required this.tdsApi,
    required this.phApi,
    required this.humidityApi,
    required this.baseurlApi,
    required this.tokenApi,
    required this.windspeedapi,
    required this.raincountapi,
    required this.winddirectionapi,
    required this.iaqapi,
    required this.co2api,
    required this.breathvocapi,
    required this.pressureapi,
    required this.dewpointapi,
    required this.dosing1api,
    required this.dosing2api,
    required this.dosing3api,
    required this.dosing4api,
    required this.nftpumpapi,
    required this.aeropumpapi,
    required this.nftdosingapi,
    required this.dwcdosingapi,
    required this.aerodosingapi,
    required this.fanrelayapi,
    required this.padrelayapi,
    required this.fogrelayapi,
  }) : super(key: key);

  final String temperatureApi;
  final String tdsApi;
  final String phApi;
  final String humidityApi;
  final String baseurlApi;
  final String tokenApi;
  final String windspeedapi;
  final String raincountapi;
  final String winddirectionapi;
  final String iaqapi;
  final String co2api;
  final String breathvocapi;
  final String pressureapi;
  final String dewpointapi;
  final String dosing1api;
  final String dosing2api;
  final String dosing3api;
  final String dosing4api;
  final String nftpumpapi;
  final String aeropumpapi;
  final String nftdosingapi;
  final String dwcdosingapi;
  final String aerodosingapi;
  final String fanrelayapi;
  final String padrelayapi;
  final String fogrelayapi;

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
                            width:
                                150, // Set the desired width for the first logo
                            height:
                                150, // Set the desired height for the first logo
                            child: Image.asset(
                              'assets/images/tatasteellogo.png',
                            ),
                          ),
                          const SizedBox(
                              width: 20), // Add some spacing between the logos
                          SizedBox(
                            width:
                                150, // Set the desired width for the second logo
                            height:
                                150, // Set the desired height for the second logo
                            child: Image.asset(
                              'assets/images/nabardlogo.jpeg', // Replace with your second logo path
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
                    const SizedBox(height: 48),
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
                                  temperatureApi:
                                      widget.temperatureApi.isNotEmpty
                                          ? widget.temperatureApi
                                          : 'default_temperature_api',
                                  tdsApi: widget.tdsApi.isNotEmpty
                                      ? widget.tdsApi
                                      : 'default_tds_api',
                                  humidityApi: widget.humidityApi.isNotEmpty
                                      ? widget.humidityApi
                                      : 'default_humidity_api',
                                  phApi: widget.phApi.isNotEmpty
                                      ? widget.phApi
                                      : 'default_ph_api',
                                  baseurlApi: widget.baseurlApi,
                                  tokenApi: widget.tokenApi,
                                  windspeedapi: widget.windspeedapi.isNotEmpty
                                      ? widget.windspeedapi
                                      : 'default_windspeed_api',
                                  raincountapi: widget.raincountapi.isNotEmpty
                                      ? widget.raincountapi
                                      : 'default_raincount_api',
                                  winddirectionapi:
                                      widget.winddirectionapi.isNotEmpty
                                          ? widget.winddirectionapi
                                          : 'default_winddirection_api',
                                  iaqapi: widget.iaqapi.isNotEmpty
                                      ? widget.iaqapi
                                      : 'default_iaq_api',
                                  co2api: widget.co2api.isNotEmpty
                                      ? widget.co2api
                                      : 'default_co2_api',
                                  breathvocapi: widget.breathvocapi.isNotEmpty
                                      ? widget.breathvocapi
                                      : 'default_breathvoc_api',
                                  pressureapi: widget.pressureapi.isNotEmpty
                                      ? widget.pressureapi
                                      : 'default_pressure_api',
                                  dewpointapi: widget.dewpointapi.isNotEmpty
                                      ? widget.dewpointapi
                                      : 'default_dewpoint_api',
                                  dosing1api: widget.dosing1api.isNotEmpty
                                      ? widget.dosing1api
                                      : 'default_dosing1_api',
                                  dosing2api: widget.dosing2api.isNotEmpty
                                      ? widget.dosing2api
                                      : 'default_dosing2_api',
                                  dosing3api: widget.dosing3api.isNotEmpty
                                      ? widget.dosing3api
                                      : 'default_dosing3_api',
                                  dosing4api: widget.dosing4api.isNotEmpty
                                      ? widget.dosing4api
                                      : 'default_dosing4_api',
                                  nftpumpapi: widget.nftpumpapi.isNotEmpty
                                      ? widget.nftpumpapi
                                      : 'default_nftpump_api',
                                  aeropumpapi: widget.aeropumpapi.isNotEmpty
                                      ? widget.aeropumpapi
                                      : 'default_aeropump_api',
                                  nftdosingapi: widget.nftdosingapi.isNotEmpty
                                      ? widget.nftdosingapi
                                      : 'default_nftdosing_api',
                                  dwcdosingapi: widget.dwcdosingapi.isNotEmpty
                                      ? widget.dwcdosingapi
                                      : 'default_dwcdosing_api',
                                  aerodosingapi: widget.aerodosingapi.isNotEmpty
                                      ? widget.aerodosingapi
                                      : 'default_aerodosing_api',
                                  fanrelayapi: widget.fanrelayapi.isNotEmpty
                                      ? widget.fanrelayapi
                                      : 'default_fanrelay_api',
                                  padrelayapi: widget.padrelayapi.isNotEmpty
                                      ? widget.padrelayapi
                                      : 'default_padrelay_api',
                                  fogrelayapi: widget.fogrelayapi.isNotEmpty
                                      ? widget.fogrelayapi
                                      : 'default_fogrelay_api',
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TemperaturePage(
                                  temperatureApi:
                                      widget.temperatureApi.isNotEmpty
                                          ? widget.temperatureApi
                                          : 'default_temperature_api',
                                  tdsApi: widget.tdsApi.isNotEmpty
                                      ? widget.tdsApi
                                      : 'default_tds_api',
                                  humidityApi: widget.humidityApi.isNotEmpty
                                      ? widget.humidityApi
                                      : 'default_humidity_api',
                                  phApi: widget.phApi.isNotEmpty
                                      ? widget.phApi
                                      : 'default_ph_api',
                                  baseurlApi: widget.baseurlApi,
                                  tokenApi: widget.tokenApi,
                                  windspeedapi: widget.windspeedapi.isNotEmpty
                                      ? widget.windspeedapi
                                      : 'default_windspeed_api',
                                  raincountapi: widget.raincountapi.isNotEmpty
                                      ? widget.raincountapi
                                      : 'default_raincount_api',
                                  winddirectionapi:
                                      widget.winddirectionapi.isNotEmpty
                                          ? widget.winddirectionapi
                                          : 'default_winddirection_api',
                                  iaqapi: widget.iaqapi.isNotEmpty
                                      ? widget.iaqapi
                                      : 'default_iaq_api',
                                  co2api: widget.co2api.isNotEmpty
                                      ? widget.co2api
                                      : 'default_co2_api',
                                  breathvocapi: widget.breathvocapi.isNotEmpty
                                      ? widget.breathvocapi
                                      : 'default_breathvoc_api',
                                  pressureapi: widget.pressureapi.isNotEmpty
                                      ? widget.pressureapi
                                      : 'default_pressure_api',
                                  dewpointapi: widget.dewpointapi.isNotEmpty
                                      ? widget.dewpointapi
                                      : 'default_dewpoint_api',
                                  dosing1api: widget.dosing1api.isNotEmpty
                                      ? widget.dosing1api
                                      : 'default_dosing1_api',
                                  dosing2api: widget.dosing2api.isNotEmpty
                                      ? widget.dosing2api
                                      : 'default_dosing2_api',
                                  dosing3api: widget.dosing3api.isNotEmpty
                                      ? widget.dosing3api
                                      : 'default_dosing3_api',
                                  dosing4api: widget.dosing4api.isNotEmpty
                                      ? widget.dosing4api
                                      : 'default_dosing4_api',
                                  nftpumpapi: widget.nftpumpapi.isNotEmpty
                                      ? widget.nftpumpapi
                                      : 'default_nftpump_api',
                                  aeropumpapi: widget.aeropumpapi.isNotEmpty
                                      ? widget.aeropumpapi
                                      : 'default_aeropump_api',
                                  nftdosingapi: widget.nftdosingapi.isNotEmpty
                                      ? widget.nftdosingapi
                                      : 'default_nftdosing_api',
                                  dwcdosingapi: widget.dwcdosingapi.isNotEmpty
                                      ? widget.dwcdosingapi
                                      : 'default_dwcdosing_api',
                                  aerodosingapi: widget.aerodosingapi.isNotEmpty
                                      ? widget.aerodosingapi
                                      : 'default_aerodosing_api',
                                  fanrelayapi: widget.fanrelayapi.isNotEmpty
                                      ? widget.fanrelayapi
                                      : 'default_fanrelay_api',
                                  padrelayapi: widget.padrelayapi.isNotEmpty
                                      ? widget.padrelayapi
                                      : 'default_padrelay_api',
                                  fogrelayapi: widget.fogrelayapi.isNotEmpty
                                      ? widget.fogrelayapi
                                      : 'default_fogrelay_api',
                                ),
                              ),
                            );
                          },
                          icon: 'assets/images/bodam.jpg',
                          title: 'Bodam Station',
                          color: Colors.indigoAccent,
                          fontColor: Colors.white,
                          width: 150,
                          height: 200,
                          iconSize: 80,
                        ),
                        _cardMenu(
                          icon: 'assets/images/comingsoon.png',
                          title: 'Station 3',
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    // Display the API values at the bottom
                    const SizedBox(height: 28),
                    /*const Text(
                      'API Values:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),*/
                    /*const SizedBox(height: 8),
                    if (widget.temperatureApi.isNotEmpty)
                      Text('Temperature API: ${widget.temperatureApi}'),
                    if (widget.tdsApi.isNotEmpty)
                      Text('TDS API: ${widget.tdsApi}'),
                    if (widget.phApi.isNotEmpty)
                      Text('pH API: ${widget.phApi}'),
                    if (widget.humidityApi.isNotEmpty)
                      Text('Humidity API: ${widget.humidityApi}'),
                    if (widget.baseurlApi.isNotEmpty)
                      Text('Base URL API: ${widget.baseurlApi}'),
                    if (widget.tokenApi.isNotEmpty)
                      Text('Token API: ${widget.tokenApi}'),
                    if (widget.windspeedapi.isNotEmpty)
                      Text('WindSpeed API: ${widget.windspeedapi}'),
                    if (widget.raincountapi.isNotEmpty)
                      Text('raincount API: ${widget.raincountapi}'),
                    if (widget.winddirectionapi.isNotEmpty)
                      Text('winddirection API: ${widget.winddirectionapi}'),
                    if (widget.iaqapi.isNotEmpty)
                      Text('iaq API: ${widget.iaqapi}'),
                    if (widget.co2api.isNotEmpty)
                      Text('co2 API: ${widget.co2api}'),
                    if (widget.breathvocapi.isNotEmpty)
                      Text('breathvoc API: ${widget.breathvocapi}'),
                    if (widget.pressureapi.isNotEmpty)
                      Text('pressure API: ${widget.pressureapi}'),
                    if (widget.dewpointapi.isNotEmpty)
                      Text('dewpoint API: ${widget.dewpointapi}'),*/
                  ],
                ),
              ),
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
    double width = 156, // Set default width for the card
    double height = 200, // Set default height for the card
    double iconSize = 80, // Set default size for the icon
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: iconSize,
              height: iconSize,
              child: Image.asset(icon, fit: BoxFit.contain),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
