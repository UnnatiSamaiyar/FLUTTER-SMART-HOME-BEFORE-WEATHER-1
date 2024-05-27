import 'package:flutter/foundation.dart';
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

  double tdsATime = 0;
  double tdsBTime = 0;
  double tsCTime = 0;
  double temperatureSet = 0;
  double dosingRest = 0;

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
        if (temperatureResponse.statusCode == 200) {
          final temperatureData = json.decode(temperatureResponse.body);
          final fetchedTemperature = double.parse(temperatureData.toString());
          setState(() {
            temperature = fetchedTemperature;
          });
        }
      }

      if (widget.tdsApi.isNotEmpty) {
        final tdsResponse = await http.get(Uri.parse(widget.tdsApi));
        if (tdsResponse.statusCode == 200) {
          final tdsData = json.decode(tdsResponse.body);
          final fetchedTDS = double.parse(tdsData.toString());
          setState(() {
            tds = fetchedTDS;
          });
        }
      }

      if (widget.humidityApi.isNotEmpty) {
        final humidityResponse = await http.get(Uri.parse(widget.humidityApi));
        if (humidityResponse.statusCode == 200) {
          final humidityData = json.decode(humidityResponse.body);
          final fetchedHumidity = double.parse(humidityData.toString());
          setState(() {
            humidity = fetchedHumidity;
          });
        }
      }

      if (widget.phApi.isNotEmpty) {
        final phResponse = await http.get(Uri.parse(widget.phApi));
        if (phResponse.statusCode == 200) {
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
        if (windspeedResponse.statusCode == 200) {
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
        if (raincountResponse.statusCode == 200) {
          final raincountData = json.decode(raincountResponse.body);
          final fetchedraincount = double.parse(raincountData.toString());
          setState(() {
            raincount = fetchedraincount;
          });
        }
      }
      if (widget.winddirectionapi.isNotEmpty) {
        final winddirectionResponse =
            await http.get(Uri.parse(widget.raincountapi));
        if (winddirectionResponse.statusCode == 200) {
          final winddirectionData = json.decode(winddirectionResponse.body);
          final fetchedwinddirection = double.parse(winddirectionData.toString());
          setState(() {
            winddirection = fetchedwinddirection;
          });
        }
      }
      if (widget.iaqapi.isNotEmpty) {
        final iaqResponse =
            await http.get(Uri.parse(widget.raincountapi));
        if (iaqResponse.statusCode == 200) {
          final iaqData = json.decode(iaqResponse.body);
          final fetchediaq = double.parse(iaqData.toString());
          setState(() {
            iaq = fetchediaq;
          });
        }
      }
      if (widget.co2api.isNotEmpty) {
        final co2Response =
            await http.get(Uri.parse(widget.co2api));
        if (co2Response.statusCode == 200) {
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
        if (breathvocResponse.statusCode == 200) {
          final breathvocData = json.decode(breathvocResponse.body);
          final fetchedbreathvoc = double.parse(breathvocData.toString());
          setState(() {
            breathvoc = fetchedbreathvoc;
          });
        }
      }
      if (widget.pressureapi.isNotEmpty) {
        final pressureResponse =
            await http.get(Uri.parse(widget.pressureapi));
        if (pressureResponse.statusCode == 200) {
          final pressureData = json.decode(pressureResponse.body);
          final fetchedpressure = double.parse(pressureData.toString());
          setState(() {
            pressure = fetchedpressure;
          });
        }
      }
      if (widget.dewpointapi.isNotEmpty) {
        final dewpointResponse =
            await http.get(Uri.parse(widget.dewpointapi));
        if (dewpointResponse.statusCode == 200) {
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

  Future<void> _updateApi(String pin, double value) async {
    String baseUrl = widget.baseurlApi;
    String token = widget.tokenApi;

    final apiUrl = '$baseUrl?token=$token&$pin=$value';

    try {
      final response = await http.get(Uri.parse(apiUrl));
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
                        Expanded(
                          child: Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 180,
                                lineWidth: 14,
                                percent: temperature > 0
                                    ? temperature / maximumTemperature
                                    : 0,
                                progressColor: Colors.indigo,
                                center: Text(
                                  temperature > 0
                                      ? '$temperature\u00B0'
                                      : 'Connect Sensor',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: temperature > 0
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                temperature > 0 ? 'Temperature' : '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 180,
                                lineWidth: 14,
                                percent: tds > 0 ? tds / maximumTDS : 0,
                                progressColor: Colors.orange,
                                center: Text(
                                  tds > 0 ? '$tds TDS' : 'Connect Sensor',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: tds > 0 ? Colors.black : Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                tds > 0 ? 'TDS' : '',
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
                        Expanded(
                          child: Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 180,
                                lineWidth: 14,
                                percent: humidity > 0
                                    ? humidity / maximumHumidity
                                    : 0,
                                progressColor: Colors.green,
                                center: Text(
                                  humidity > 0
                                      ? '$humidity %'
                                      : 'Connect Sensor',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: humidity > 0
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                humidity > 0 ? 'Humidity' : '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 180,
                                lineWidth: 14,
                                percent: ph > 0 ? ph / maximumPH : 0,
                                progressColor: Colors.blue,
                                center: Text(
                                  ph > 0 ? '$ph pH' : 'Connect Sensor',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: ph > 0 ? Colors.black : Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                ph > 0 ? 'pH' : '',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
