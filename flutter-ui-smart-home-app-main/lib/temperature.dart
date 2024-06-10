import 'package:flutter/foundation.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(const MaterialApp(
    home: TemperaturePage(
      temperatureApi: '',
      tdsApi: '',
      humidityApi: '',
      phApi: '',
      baseurlApi: '',
      tokenApi: '',
      windspeedapi: '',
      raincountapi: '',
      winddirectionapi: '',
      iaqapi: '',
      co2api: '',
      breathvocapi: '',
      pressureapi: '',
      dewpointapi: '',
      dosing1api: '',
      dosing2api: '',
      dosing3api: '',
      dosing4api: '',
      nftpumpapi: '',
      aeropumpapi: '',
      nftdosingapi: '',
      dwcdosingapi: '',
      aerodosingapi: '',
      fanrelayapi: '',
      padrelayapi: '',
      fogrelayapi: '',
    ),
  ));
}

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({
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
  _TemperaturePageState createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  double temperature = 0;
  double tds = 0;
  double humidity = 0;
  double ph = 0;
  double maximumTemperature = 50;
  double maximumTDS = 4000;
  double maximumHumidity = 100;
  double maximumPH = 14;
  double windspeed = 0;
  double raincount = 0;
  double winddirection = 0;
  double iaq = 0;
  double co2 = 0;
  double breathvoc = 0;
  double pressure = 0;
  double dewpoint = 0;
  double maximumWindspeed = 100;
  double maximumRaincount = 500;
  double maximumWinddirection = 360;
  double maximumIAQ = 500;
  double maximumCO2 = 2000;
  double maximumBreathVOC = 100;
  double maximumPressure = 12000000;
  double maximumDewpoint = 50;
  double dosing1api = 0;
  double dosing2api = 0;
  double dosing3api = 0;
  double dosing4api = 0;
  double nftpumpapi = 0;
  double aeropumpapi = 0;
  double nftdosingapi = 0;
  double dwcdosingapi = 0;
  double aerodosingapi = 0;
  double fanrelayapi = 0;
  double padrelayapi = 0;
  double fogrelayapi = 0;
  double maximumdosing1api = 100;
  double maximumdosing2api = 100;
  double maximumdosing3api = 100;
  double maximumdosing4api = 100;
  double maximumnftpumpapi = 100;
  double maximumaeropumpapi = 100;
  double maximumnftdosingapi = 100;
  double maximumdwcdosingapi = 100;
  double maximumaerodosingapi = 100;
  double maximumfanrelayapi = 100;
  double maximumpadrelayapi = 100;
  double maximumfogrelayapi = 100;

  double tdsATime = 0;
  double tdsBTime = 0;
  double tsCTime = 0;
  double temperatureSet = 0;
  double dosingRest = 0;

  late String winddirectionapi = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
    _startFetching();
  }

  void _startFetching() {
    const fetchInterval = Duration(seconds: 1);
    Timer.periodic(fetchInterval, (_) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    try {
      if (widget.temperatureApi.isNotEmpty) {
        final temperatureResponse =
            await http.get(Uri.parse(widget.temperatureApi));
        if (temperatureResponse.statusCode == 200 &&
            _isValidJson(temperatureResponse.body)) {
          final temperatureData = json.decode(temperatureResponse.body);
          final fetchedTemperature = double.parse(temperatureData.toString());
          setState(() {
            temperature = fetchedTemperature;
          });
        }
      }

      if (widget.tdsApi.isNotEmpty) {
        final tdsResponse = await http.get(Uri.parse(widget.tdsApi));
        if (tdsResponse.statusCode == 200 && _isValidJson(tdsResponse.body)) {
          final tdsData = json.decode(tdsResponse.body);
          final fetchedTDS = double.parse(tdsData.toString());
          setState(() {
            tds = fetchedTDS;
          });
        }
      }

      if (widget.humidityApi.isNotEmpty) {
        final humidityResponse = await http.get(Uri.parse(widget.humidityApi));
        if (humidityResponse.statusCode == 200 &&
            _isValidJson(humidityResponse.body)) {
          final humidityData = json.decode(humidityResponse.body);
          final fetchedHumidity = double.parse(humidityData.toString());
          setState(() {
            humidity = fetchedHumidity;
          });
        }
      }

      if (widget.phApi.isNotEmpty) {
        final phResponse = await http.get(Uri.parse(widget.phApi));
        if (phResponse.statusCode == 200 && _isValidJson(phResponse.body)) {
          final phData = json.decode(phResponse.body);
          final fetchedPH = double.parse(phData.toString());
          setState(() {
            ph = fetchedPH;
          });
        }
      }

      if (widget.windspeedapi.isNotEmpty) {
        final windspeedResponse =
            await http.get(Uri.parse(widget.windspeedapi));
        if (windspeedResponse.statusCode == 200 &&
            _isValidJson(windspeedResponse.body)) {
          final windspeedData = json.decode(windspeedResponse.body);
          final fetchedwindspeed = double.parse(windspeedData.toString());
          setState(() {
            windspeed = fetchedwindspeed;
          });
        }
      }

      if (widget.raincountapi.isNotEmpty) {
        final raincountResponse =
            await http.get(Uri.parse(widget.raincountapi));
        if (raincountResponse.statusCode == 200 &&
            _isValidJson(raincountResponse.body)) {
          final raincountData = json.decode(raincountResponse.body);
          final fetchedraincount = double.parse(raincountData.toString());
          setState(() {
            raincount = fetchedraincount;
          });
        }
      }

      if (widget.winddirectionapi.isNotEmpty) {
        final winddirectionResponse =
            await http.get(Uri.parse(widget.winddirectionapi));
        if (winddirectionResponse.statusCode == 200 &&
            _isValidJson(winddirectionResponse.body)) {
          final winddirectionData = json.decode(winddirectionResponse.body);
          final fetchedwinddirection =
              double.parse(winddirectionData.toString());
          setState(() {
            winddirection = fetchedwinddirection;
          });
        }
      }

      if (widget.iaqapi.isNotEmpty) {
        final iaqResponse = await http.get(Uri.parse(widget.iaqapi));
        if (iaqResponse.statusCode == 200 && _isValidJson(iaqResponse.body)) {
          final iaqData = json.decode(iaqResponse.body);
          final fetchediaq = double.parse(iaqData.toString());
          setState(() {
            iaq = fetchediaq;
          });
        }
      }

      if (widget.co2api.isNotEmpty) {
        final co2Response = await http.get(Uri.parse(widget.co2api));
        if (co2Response.statusCode == 200 && _isValidJson(co2Response.body)) {
          final co2Data = json.decode(co2Response.body);
          final fetchedco2 = double.parse(co2Data.toString());
          setState(() {
            co2 = fetchedco2;
          });
        }
      }

      if (widget.breathvocapi.isNotEmpty) {
        final breathvocResponse =
            await http.get(Uri.parse(widget.breathvocapi));
        if (breathvocResponse.statusCode == 200 &&
            _isValidJson(breathvocResponse.body)) {
          final breathvocData = json.decode(breathvocResponse.body);
          final fetchedbreathvoc = double.parse(breathvocData.toString());
          setState(() {
            breathvoc = fetchedbreathvoc;
          });
        }
      }

      if (widget.pressureapi.isNotEmpty) {
        final pressureResponse = await http.get(Uri.parse(widget.pressureapi));
        if (pressureResponse.statusCode == 200 &&
            _isValidJson(pressureResponse.body)) {
          final pressureData = json.decode(pressureResponse.body);
          final fetchedpressure = double.parse(pressureData.toString());
          setState(() {
            pressure = fetchedpressure;
          });
        }
      }

      if (widget.dewpointapi.isNotEmpty) {
        final dewpointResponse = await http.get(Uri.parse(widget.dewpointapi));
        if (dewpointResponse.statusCode == 200 &&
            _isValidJson(dewpointResponse.body)) {
          final dewpointData = json.decode(dewpointResponse.body);
          final fetcheddewpoint = double.parse(dewpointData.toString());
          setState(() {
            dewpoint = fetcheddewpoint;
          });
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }

  bool _isValidJson(String jsonStr) {
    try {
      json.decode(jsonStr);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<void> _updateApi(String pin, double value) async {
    String baseUrl = widget.baseurlApi;
    String token = widget.tokenApi;

    final apiUrl = '$baseUrl?token=$token&$pin=$value';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          winddirectionapi = data['current']['wind_dir'];
        });
      }

      if (response.statusCode != 200) {
        if (kDebugMode) {
          print('Error updating API: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error updating API: $error');
      }
    }
  }

  double _clampValue(double value, double max) {
    return value > max ? max : value;
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.indigo,
                    ),
                  ),
                  const RotatedBox(
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
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the temperature column if the temperature is greater than 0
                        if (temperature > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent: _clampValue(
                                          temperature, maximumTemperature) /
                                      maximumTemperature,
                                  progressColor: Colors.indigo,
                                  center: Text(
                                    '$temperature\u00B0',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Temperature',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both temperature and TDS values are greater than 0
                        if (temperature > 0 && tds > 0)
                          const SizedBox(width: 16),

                        // Only include the TDS column if the TDS value is greater than 0
                        if (tds > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(tds, maximumTDS) / maximumTDS,
                                  progressColor: Colors.orange,
                                  center: Text(
                                    '$tds TDS',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'TDS',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the humidity column if the humidity is greater than 0
                        if (humidity > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(humidity, maximumHumidity) /
                                          maximumHumidity,
                                  progressColor: Colors.green,
                                  center: Text(
                                    '$humidity %',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Humidity',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both humidity and pH values are greater than 0
                        if (humidity > 0 && ph > 0) const SizedBox(width: 16),

                        // Only include the pH column if the pH value is greater than 0
                        if (ph > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(ph, maximumPH) / maximumPH,
                                  progressColor: Colors.blue,
                                  center: Text(
                                    '$ph pH',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'pH',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the windspeed column if the windspeed is greater than 0
                        if (windspeed > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(windspeed, maximumWindspeed) /
                                          maximumWindspeed,
                                  progressColor: Colors.green,
                                  center: Text(
                                    '$windspeed %',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Wind-speed',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both windspeed and raincount values are greater than 0
                        if (windspeed > 0 && raincount > 0)
                          const SizedBox(width: 16),

                        // Only include the raincount column if the raincount is greater than 0
                        if (raincount > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(raincount, maximumRaincount) /
                                          maximumRaincount,
                                  progressColor: Colors.blue,
                                  center: Text(
                                    '$raincount Rain-count',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Rain-count',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the IAQ column if the IAQ is greater than 0
                        if (iaq > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(iaq, maximumIAQ) / maximumIAQ,
                                  progressColor: Colors.indigo,
                                  center: Text(
                                    '$iaq %',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'IAQ',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both IAQ and CO2 values are greater than 0
                        if (iaq > 0 && co2 > 0) const SizedBox(width: 16),

                        // Only include the CO2 column if the CO2 is greater than 0
                        if (co2 > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(co2, maximumCO2) / maximumCO2,
                                  progressColor: Colors.orange,
                                  center: Text(
                                    '$co2 ppm',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'CO2',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the breathVOC column if breathVOC is greater than 0
                        if (breathvoc > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(breathvoc, maximumBreathVOC) /
                                          maximumBreathVOC,
                                  progressColor: Colors.indigo,
                                  center: Text(
                                    '$breathvoc %',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'BreathVoc',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both breathVOC and pressure values are greater than 0
                        if (breathvoc > 0 && pressure > 0)
                          const SizedBox(width: 16),

                        // Only include the pressure column if the pressure is greater than 0
                        if (pressure > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(pressure, maximumPressure) /
                                          maximumPressure,
                                  progressColor: Colors.orange,
                                  center: Text(
                                    '$pressure Pa',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Pressure',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the dewpoint column if the dewpoint is greater than 0
                        if (dewpoint > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(dewpoint, maximumDewpoint) /
                                          maximumDewpoint,
                                  progressColor: Colors.indigo,
                                  center: Text(
                                    '$dewpoint %',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Dewpoint',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the breathVOC column if breathVOC is greater than 0
                        if (dosing1api > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(dosing1api, maximumdosing1api) /
                                          maximumdosing1api,
                                  progressColor: Colors.indigo,
                                  center: Text(
                                    '$dosing1api',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Dosing 1',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both breathVOC and pressure values are greater than 0
                        if (dosing1api > 0 && dosing2api > 0)
                          const SizedBox(width: 16),

                        // Only include the pressure column if the pressure is greater than 0
                        if (dosing2api > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(dosing2api, maximumdosing2api) /
                                          maximumdosing2api,
                                  progressColor: Colors.orange,
                                  center: Text(
                                    '$dosing2api',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Dosing 2',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the breathVOC column if breathVOC is greater than 0
                        if (dosing3api > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(dosing3api, maximumdosing3api) /
                                          maximumdosing3api,
                                  progressColor: Colors.indigo,
                                  center: Text(
                                    '$dosing3api',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Dosing 3',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both breathVOC and pressure values are greater than 0
                        if (dosing3api > 0 && dosing4api > 0)
                          const SizedBox(width: 16),

                        // Only include the pressure column if the pressure is greater than 0
                        if (dosing4api > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(dosing4api, maximumdosing4api) /
                                          maximumdosing4api,
                                  progressColor: Colors.orange,
                                  center: Text(
                                    '$dosing4api',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Dosing 4',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the breathVOC column if breathVOC is greater than 0
                        if (nftpumpapi > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(nftpumpapi, maximumnftpumpapi) /
                                          maximumnftpumpapi,
                                  progressColor: Colors.indigo,
                                  center: Text(
                                    '$nftpumpapi',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'NFT Pump',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both breathVOC and pressure values are greater than 0
                        if (nftpumpapi > 0 && aeropumpapi > 0)
                          const SizedBox(width: 16),

                        // Only include the pressure column if the pressure is greater than 0
                        if (aeropumpapi > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(aeropumpapi, maximumaeropumpapi) /
                                          maximumaeropumpapi,
                                  progressColor: Colors.orange,
                                  center: Text(
                                    '$aeropumpapi',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Aero Pump',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the breathVOC column if breathVOC is greater than 0
                        if (nftdosingapi > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(nftdosingapi, maximumnftdosingapi) /
                                          maximumnftdosingapi,
                                  progressColor: Colors.indigo,
                                  center: Text(
                                    '$nftdosingapi',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'NFT Dosing',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both breathVOC and pressure values are greater than 0
                        if (nftdosingapi > 0 && dwcdosingapi > 0)
                          const SizedBox(width: 16),

                        // Only include the pressure column if the pressure is greater than 0
                        if (dwcdosingapi > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(dwcdosingapi, maximumdwcdosingapi) /
                                          maximumdwcdosingapi,
                                  progressColor: Colors.orange,
                                  center: Text(
                                    '$dwcdosingapi',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'DWC Dosing',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the breathVOC column if breathVOC is greater than 0
                        if (aerodosingapi > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(aerodosingapi, maximumaerodosingapi) /
                                          maximumaerodosingapi,
                                  progressColor: Colors.indigo,
                                  center: Text(
                                    '$aerodosingapi',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Aero Dosing',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both breathVOC and pressure values are greater than 0
                        if (aerodosingapi > 0 && fanrelayapi > 0)
                          const SizedBox(width: 16),

                        // Only include the pressure column if the pressure is greater than 0
                        if (fanrelayapi > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(fanrelayapi, maximumfanrelayapi) /
                                          maximumfanrelayapi,
                                  progressColor: Colors.orange,
                                  center: Text(
                                    '$fanrelayapi',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Fan Relay',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the breathVOC column if breathVOC is greater than 0
                        if (padrelayapi > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent: _clampValue(
                                          padrelayapi, maximumpadrelayapi) /
                                      maximumpadrelayapi,
                                  progressColor: Colors.indigo,
                                  center: Text(
                                    '$padrelayapi ',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Pad Relay',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Include the spacing only if both breathVOC and pressure values are greater than 0
                        if (padrelayapi > 0 && fogrelayapi > 0)
                          const SizedBox(width: 16),

                        // Only include the pressure column if the pressure is greater than 0
                        if (fogrelayapi > 0)
                          Expanded(
                            child: Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 14,
                                  percent:
                                      _clampValue(fogrelayapi, maximumfogrelayapi) /
                                          maximumfogrelayapi,
                                  progressColor: Colors.orange,
                                  center: Text(
                                    '$fogrelayapi ',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Fog Relay',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    SliderWidget(
                      label: 'TDS A Time',
                      value: tdsATime,
                      onChanged: (value) {
                        setState(() {
                          tdsATime = value;
                        });
                        _updateApi('v13', value);
                      },
                    ),
                    SliderWidget(
                      label: 'TDS B Time',
                      value: tdsATime,
                      onChanged: (value) {
                        setState(() {
                          tdsATime = value;
                        });
                        _updateApi('v13', value);
                      },
                    ),
                    SliderWidget(
                      label: 'TDS B Time',
                      value: tdsBTime,
                      onChanged: (value) {
                        setState(() {
                          tdsBTime = value;
                        });
                        _updateApi('v14', value);
                      },
                    ),
                    SliderWidget(
                      label: 'TS C Time',
                      value: tsCTime,
                      onChanged: (value) {
                        setState(() {
                          tsCTime = value;
                        });
                        _updateApi('v16', value);
                      },
                    ),
                    SliderWidget(
                      label: 'Temperature Set',
                      value: temperatureSet,
                      onChanged: (value) {
                        setState(() {
                          temperatureSet = value;
                        });
                        _updateApi('v17', value);
                      },
                    ),
                    SliderWidget(
                      label: 'Dosing Rest',
                      value: dosingRest,
                      onChanged: (value) {
                        setState(() {
                          dosingRest = value;
                        });
                        _updateApi('v15', value);
                      },
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                  width:
                                      380, // Adjust the size of the container as needed
                                  height: 380,
                                  child:

                                      /*Text(
                                        '$winddirectionapi2', // Use the appropriate variable
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.indigo,
                                        ),
                                      ),*/

                                      Stack(
                                    children: <Widget>[
                                      Positioned(
                                        top: 64, // adjust as needed
                                        left: 64, // adjust as needed
                                        child: Transform.rotate(
                                          angle: _getRotationAngle(
                                              winddirectionapi),
                                          child: Lottie.asset(
                                            'assets/west_north.json',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 380, // specify the width
                                        height: 380, // specify the height
                                        child: Lottie.asset(
                                          'assets/wind_dir_animation.json',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _getRotationAngle(String windDirectionapi2) {
    switch (windDirectionapi2) {
      case 'N':
        return 0.50; //0.50
      case 'NNE':
        return 0.97; //0.97
      case 'NE':
        return 1.35; //1.35
      case 'ENE':
        return 1.75; //1.75
      case 'E':
        return 2.11; //2.11
      case 'ESE':
        return 2.41; //2.41
      case 'SE':
        return 2.85; //2.85
      case 'SSE':
        return 3.25; //3.25
      case 'S':
        return 3.65; //3.65
      case 'SSW':
        return 4.0; //4.0
      case 'SW':
        return 4.40; //4.40
      case 'WSW':
        return 4.80; //4.80
      case 'W':
        return 5.19; //5.19
      case 'WNW':
        return 5.53; //5.53
      case 'NW':
        return 5.99; //5.99
      case 'NNW':
        return 6.40; //6.40
      default:
        return 0.0;
    }
  }
}

class SliderWidget extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  const SliderWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Slider(
          value: value,
          min: 0,
          max: 100,
          onChanged: onChanged,
        ),
        Text(value.toStringAsFixed(2)),
        const SizedBox(height: 16),
      ],
    );
  }
}
