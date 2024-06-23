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

  String apiKey = 'b3f616496a094aa7bc0210720212111&query';
  double latitude = 22.625389;
  double longitude = 86.224121;
  String temperature1 = '';
  String weatherDescriptionday1 = '';
  String weatherDescriptionday2 = '';
  String weatherDescriptionday3 = '';
  String weatherDescriptionday4 = '';
  String weatherDescriptionday5 = '';
  String humidity1 = '';
  String windSpeed1 = '';
  String weatherIconUrltoday = '';
  String weatherIconUrlday2 = '';
  String weatherIconUrlday3 = '';
  String weatherIconUrlday4 = '';
  String weatherIconUrlday5 = '';
  String Date1 = '';
  String Date2 = '';
  String Date3 = '';
  String Date4 = '';
  String Date5 = '';
  late String partDate1 = '';
  late String day1maxtemp = '';
  late String day1mintemp = '';
  late String day1avgtemp = '';
  late String day1maxwind = '';
  late String day1daily_will_it_rain = '';
  late String day1totalprecip_mm = '';
  late String day1daily_chance_of_rain = '';
  late String day1sunrise = '';
  late String day1sunset = '';
  late String day1avghumidity = '';
  late String dewpointday1 = '';
  late String dewpointday2 = '';
  late String dewpointday3 = '';
  late String dewpointday4 = '';
  late String dewpointday5 = '';

  late String day2maxtemp = '';
  late String day2mintemp = '';
  late String day2avgtemp = '';
  late String day2maxwind = '';
  late String day2daily_will_it_rain = '';
  late String day2totalprecip_mm = '';
  late String day2daily_chance_of_rain = '';
  late String day2sunrise = '';
  late String day2sunset = '';
  late String day2avghumidity = '';

  late String day3maxtemp = '';
  late String day3mintemp = '';
  late String day3avgtemp = '';
  late String day3maxwind = '';
  late String day3daily_will_it_rain = '';
  late String day3totalprecip_mm = '';
  late String day3daily_chance_of_rain = '';
  late String day3sunrise = '';
  late String day3sunset = '';
  late String day3avghumidity = '';

  late String day4maxtemp = '';
  late String day4mintemp = '';
  late String day4avgtemp = '';
  late String day4maxwind = '';
  late String day4daily_will_it_rain = '';
  late String day4totalprecip_mm = '';
  late String day4daily_chance_of_rain = '';
  late String day4sunrise = '';
  late String day4sunset = '';
  late String day4avghumidity = '';

  late String day5maxtemp = '';
  late String day5mintemp = '';
  late String day5avgtemp = '';
  late String day5maxwind = '';
  late String day5daily_will_it_rain = '';
  late String day5totalprecip_mm = '';
  late String day5daily_chance_of_rain = '';
  late String day5sunrise = '';
  late String day5sunset = '';
  late String day5avghumidity = '';

  late String weatherIconUrltoday1 = ''; // Replace this URL with the one you receive from your API
  late String weatherIconUrlday21 = '';
  late String weatherIconUrlday31 = '';
  late String weatherIconUrlday41 = '';
  late String weatherIconUrlday51 = '';
  late String winddirectionapi2 = '';
  late String currenttemperatureapi = '';
  late String currentwindspeedapi = '';
  late String currenthumidityapi = '';
  late String currentaqiapi = '';
  late String currentrainapi = '';
  late String currentpressureapi = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
    _startFetching();
    fetchWeatherData();
  }

  void _startFetching() {
    const fetchInterval = Duration(seconds: 1);
    Timer.periodic(fetchInterval, (_) {
      _fetchData();
    });
  }
  

  Future<void> fetchWeatherData() async {
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$latitude,$longitude&days=7&aqi=yes&alerts=yes'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        temperature1 = data['current']['temp_c'].toString();
        weatherDescriptionday1 = data['current']['condition']['text'];
        weatherDescriptionday2 =
            data['forecast']['forecastday'][1]['day']['condition']['text'];
        weatherDescriptionday3 =
            data['forecast']['forecastday'][2]['day']['condition']['text'];
        weatherDescriptionday4 =
            data['forecast']['forecastday'][3]['day']['condition']['text'];
        weatherDescriptionday5 =
            data['forecast']['forecastday'][4]['day']['condition']['text'];
        humidity1 = data['current']['humidity'].toString();
        windSpeed1 = data['current']['wind_kph'].toString();
        weatherIconUrltoday = data['current']['condition']['icon'];
        weatherIconUrlday2 =
            data['forecast']['forecastday'][1]['day']['condition']['icon'];
        weatherIconUrlday3 =
            data['forecast']['forecastday'][2]['day']['condition']['icon'];
        weatherIconUrlday4 =
            data['forecast']['forecastday'][3]['day']['condition']['icon'];
        weatherIconUrlday5 =
            data['forecast']['forecastday'][4]['day']['condition']['icon'];
        weatherIconUrltoday1 = "http:$weatherIconUrltoday";
        weatherIconUrlday21 = "http:$weatherIconUrlday2";
        weatherIconUrlday31 = "http:$weatherIconUrlday3";
        weatherIconUrlday41 = "http:$weatherIconUrlday4";
        weatherIconUrlday51 = "http:$weatherIconUrlday5";

        Date1 = data['location']['localtime'];
        partDate1 = Date1.split(' ')[0];
        Date2 = data['forecast']['forecastday'][1]['date'];
        Date3 = data['forecast']['forecastday'][2]['date'];
        Date4 = data['forecast']['forecastday'][3]['date'];
        Date5 = data['forecast']['forecastday'][4]['date'];

        day1maxtemp =
            data['forecast']['forecastday'][0]['day']['maxtemp_c'].toString();
        day1mintemp =
            data['forecast']['forecastday'][0]['day']['mintemp_c'].toString();
        day1avgtemp =
            data['forecast']['forecastday'][0]['day']['avgtemp_c'].toString();
        day1maxwind =
            data['forecast']['forecastday'][0]['day']['maxwind_kph'].toString();
        day1daily_will_it_rain = data['forecast']['forecastday'][0]['day']
                ['daily_will_it_rain']
            .toString();
        day1totalprecip_mm = data['forecast']['forecastday'][0]['day']
                ['totalprecip_mm']
            .toString();
        day1daily_chance_of_rain = data['forecast']['forecastday'][0]['day']
                ['daily_chance_of_rain']
            .toString();
        day1sunrise =
            data['forecast']['forecastday'][0]['astro']['sunrise'].toString();
        day1sunset =
            data['forecast']['forecastday'][0]['astro']['sunset'].toString();
        day1avghumidity =
            data['forecast']['forecastday'][0]['day']['avghumidity'].toString();

        day2maxtemp =
            data['forecast']['forecastday'][1]['day']['maxtemp_c'].toString();
        day2mintemp =
            data['forecast']['forecastday'][1]['day']['mintemp_c'].toString();
        day2avgtemp =
            data['forecast']['forecastday'][1]['day']['avgtemp_c'].toString();
        day2maxwind =
            data['forecast']['forecastday'][1]['day']['maxwind_kph'].toString();
        day2daily_will_it_rain = data['forecast']['forecastday'][1]['day']
                ['daily_will_it_rain']
            .toString();
        day2totalprecip_mm = data['forecast']['forecastday'][1]['day']
                ['totalprecip_mm']
            .toString();
        day2daily_chance_of_rain = data['forecast']['forecastday'][1]['day']
                ['daily_chance_of_rain']
            .toString();
        day2sunrise =
            data['forecast']['forecastday'][1]['astro']['sunrise'].toString();
        day2sunset =
            data['forecast']['forecastday'][1]['astro']['sunset'].toString();
        day2avghumidity =
            data['forecast']['forecastday'][1]['day']['avghumidity'].toString();

        day3maxtemp =
            data['forecast']['forecastday'][2]['day']['maxtemp_c'].toString();
        day3mintemp =
            data['forecast']['forecastday'][2]['day']['mintemp_c'].toString();
        day3avgtemp =
            data['forecast']['forecastday'][2]['day']['avgtemp_c'].toString();
        day3maxwind =
            data['forecast']['forecastday'][2]['day']['maxwind_kph'].toString();
        day3daily_will_it_rain = data['forecast']['forecastday'][2]['day']
                ['daily_will_it_rain']
            .toString();
        day3totalprecip_mm = data['forecast']['forecastday'][2]['day']
                ['totalprecip_mm']
            .toString();
        day3daily_chance_of_rain = data['forecast']['forecastday'][2]['day']
                ['daily_chance_of_rain']
            .toString();
        day3sunrise =
            data['forecast']['forecastday'][2]['astro']['sunrise'].toString();
        day3sunset =
            data['forecast']['forecastday'][2]['astro']['sunset'].toString();
        day3avghumidity =
            data['forecast']['forecastday'][2]['day']['avghumidity'].toString();

        day4maxtemp =
            data['forecast']['forecastday'][3]['day']['maxtemp_c'].toString();
        day4mintemp =
            data['forecast']['forecastday'][3]['day']['mintemp_c'].toString();
        day4avgtemp =
            data['forecast']['forecastday'][3]['day']['avgtemp_c'].toString();
        day4maxwind =
            data['forecast']['forecastday'][3]['day']['maxwind_kph'].toString();
        day4daily_will_it_rain = data['forecast']['forecastday'][3]['day']
                ['daily_will_it_rain']
            .toString();
        day4totalprecip_mm = data['forecast']['forecastday'][3]['day']
                ['totalprecip_mm']
            .toString();
        day4daily_chance_of_rain = data['forecast']['forecastday'][3]['day']
                ['daily_chance_of_rain']
            .toString();
        day4sunrise =
            data['forecast']['forecastday'][3]['astro']['sunrise'].toString();
        day4sunset =
            data['forecast']['forecastday'][3]['astro']['sunset'].toString();
        day4avghumidity =
            data['forecast']['forecastday'][3]['day']['avghumidity'].toString();

        day5maxtemp =
            data['forecast']['forecastday'][4]['day']['maxtemp_c'].toString();
        day5mintemp =
            data['forecast']['forecastday'][4]['day']['mintemp_c'].toString();
        day5avgtemp =
            data['forecast']['forecastday'][4]['day']['avgtemp_c'].toString();
        day5maxwind =
            data['forecast']['forecastday'][4]['day']['maxwind_kph'].toString();
        day5daily_will_it_rain = data['forecast']['forecastday'][4]['day']
                ['daily_will_it_rain']
            .toString();
        day5totalprecip_mm = data['forecast']['forecastday'][4]['day']
                ['totalprecip_mm']
            .toString();
        day5daily_chance_of_rain = data['forecast']['forecastday'][4]['day']
                ['daily_chance_of_rain']
            .toString();
        day5sunrise =
            data['forecast']['forecastday'][4]['astro']['sunrise'].toString();
        day5sunset =
            data['forecast']['forecastday'][4]['astro']['sunset'].toString();
        day5avghumidity =
            data['forecast']['forecastday'][4]['day']['avghumidity'].toString();

        winddirectionapi2 = data['current']['wind_dir'];

        currenttemperatureapi = data['current']['temp_c'].toString();
        currentwindspeedapi = data['current']['wind_kph'].toString();
        currenthumidityapi = data['current']['humidity'].toString();
        currentaqiapi = data['current']['air_quality']['pm2_5'].toString();
        currentrainapi = data['current']['precip_mm'].toString();
        currentpressureapi = data['current']['pressure_mb'].toString();
      });
    } else {
      // Handle API error
      print('Failed to fetch data: ${response.statusCode}');
    }
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
    String maxTempWithSymbolday1 = '$day1maxtemp °C';
    String minTempWithSymbolday1 = '$day1mintemp °C';
    String avgTempWithSymbolday1 = '$day1avgtemp °C';
    String maxWindWithSymbolday1 = '$day1maxwind km/h';
    String totalPrecipWithSymbolday1 = '$day1totalprecip_mm mm';
    String dailyChanceOfRainWithSymbolday1 = '$day1daily_chance_of_rain %';
    String avghumidityWithSymbolday1 = '$day1avghumidity %';
    String Dewpointcalculatedday1 =
        '${double.tryParse(day1avgtemp) != null && double.tryParse(day1avgtemp) != null ? (double.parse(day1avgtemp) - (100 - double.parse(day1avghumidity)) / 5).toString() : 'N/A'}';
    String Dewpointcalculatedday2 =
        '${double.tryParse(day2avgtemp) != null && double.tryParse(day2avgtemp) != null ? (double.parse(day2avgtemp) - (100 - double.parse(day2avghumidity)) / 5).toString() : 'N/A'}';
    String Dewpointcalculatedday3 =
        '${double.tryParse(day3avgtemp) != null && double.tryParse(day3avgtemp) != null ? (double.parse(day3avgtemp) - (100 - double.parse(day3avghumidity)) / 5).toString() : 'N/A'}';
    String Dewpointcalculatedday4 =
        '${double.tryParse(day4avgtemp) != null && double.tryParse(day4avgtemp) != null ? (double.parse(day4avgtemp) - (100 - double.parse(day4avghumidity)) / 5).toString() : 'N/A'}';
    String Dewpointcalculatedday5 =
        '${double.tryParse(day5avgtemp) != null && double.tryParse(day5avgtemp) != null ? (double.parse(day5avgtemp) - (100 - double.parse(day5avghumidity)) / 5).toString() : 'N/A'}';

    String maxTempWithSymbolday2 = '$day2maxtemp °C';
    String minTempWithSymbolday2 = '$day2mintemp °C';
    String avgTempWithSymbolday2 = '$day2avgtemp °C';
    String maxWindWithSymbolday2 = '$day2maxwind km/h';
    String totalPrecipWithSymbolday2 = '$day2totalprecip_mm mm';
    String dailyChanceOfRainWithSymbolday2 = '$day2daily_chance_of_rain %';
    String avghumidityWithSymbolday2 = '$day2avghumidity %';

    String maxTempWithSymbolday3 = '$day3maxtemp °C';
    String minTempWithSymbolday3 = '$day3mintemp °C';
    String avgTempWithSymbolday3 = '$day3avgtemp °C';
    String maxWindWithSymbolday3 = '$day3maxwind km/h';
    String totalPrecipWithSymbolday3 = '$day3totalprecip_mm mm';
    String dailyChanceOfRainWithSymbolday3 = '$day3daily_chance_of_rain %';
    String avghumidityWithSymbolday3 = '$day3avghumidity %';

    String maxTempWithSymbolday4 = '$day4maxtemp °C';
    String minTempWithSymbolday4 = '$day4mintemp °C';
    String avgTempWithSymbolday4 = '$day4avgtemp °C';
    String maxWindWithSymbolday4 = '$day4maxwind km/h';
    String totalPrecipWithSymbolday4 = '$day4totalprecip_mm mm';
    String dailyChanceOfRainWithSymbolday4 = '$day4daily_chance_of_rain %';
    String avghumidityWithSymbolday4 = '$day4avghumidity %';

    String maxTempWithSymbolday5 = '$day5maxtemp °C';
    String minTempWithSymbolday5 = '$day5mintemp °C';
    String avgTempWithSymbolday5 = '$day5avgtemp °C';
    String maxWindWithSymbolday5 = '$day5maxwind km/h';
    String totalPrecipWithSymbolday5 = '$day5totalprecip_mm mm';
    String dailyChanceOfRainWithSymbolday5 = '$day5daily_chance_of_rain %';
    String avghumidityWithSymbolday5 = '$day5avghumidity %';

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
                children: [
                  // Column for the first weather description and icon
                  Column(
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
                    ],
                  ),

                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Day1Page(
                                day1maxtemp: maxTempWithSymbolday1,
                                day1mintemp: minTempWithSymbolday1,
                                day1avgtemp: avgTempWithSymbolday1,
                                day1maxwind: maxWindWithSymbolday1,
                                day1daily_will_it_rain:
                                    (day1daily_will_it_rain == 1)
                                        ? 'YES'
                                        : 'NO',
                                day1totalprecip_mm: totalPrecipWithSymbolday1,
                                day1daily_chance_of_rain:
                                    dailyChanceOfRainWithSymbolday1,
                                day1sunrise: day1sunrise,
                                day1sunset: day1sunset,
                                day1avghumidity: avghumidityWithSymbolday1,
                                partDate1: partDate1,
                                dewpointday1: Dewpointcalculatedday1,
                              ), // Replace Day1Page with the actual page widget for "day1.dart"
                            ),
                          );
                        },
                        child: Image.network(
                          weatherIconUrltoday1,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        '$weatherDescriptionday1', // Use the appropriate variable
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.indigo,
                        ),
                      ),
                      Text(
                        '$partDate1', // Use the appropriate variable
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Day2Page(
                                day2maxtemp: maxTempWithSymbolday2,
                                day2mintemp: minTempWithSymbolday2,
                                day2avgtemp: avgTempWithSymbolday2,
                                day2maxwind: maxWindWithSymbolday2,
                                day2daily_will_it_rain:
                                    (day2daily_will_it_rain == 1)
                                        ? 'YES'
                                        : 'NO',
                                day2totalprecip_mm: totalPrecipWithSymbolday2,
                                day2daily_chance_of_rain:
                                    dailyChanceOfRainWithSymbolday2,
                                day2sunrise: day2sunrise,
                                day2sunset: day2sunset,
                                day2avghumidity: avghumidityWithSymbolday2,
                                Date2: Date2,
                                dewpointday2: Dewpointcalculatedday2,
                              ), // Replace Day1Page with the actual page widget for "day1.dart"
                            ),
                          );
                        },
                        child: Image.network(
                          weatherIconUrlday21,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        '$weatherDescriptionday2', // Use the appropriate variable
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.indigo,
                        ),
                      ),
                      Text(
                        '$Date2', // Use the appropriate variable
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Day3Page(
                                day3maxtemp: maxTempWithSymbolday3,
                                day3mintemp: minTempWithSymbolday3,
                                day3avgtemp: avgTempWithSymbolday3,
                                day3maxwind: maxWindWithSymbolday3,
                                day3daily_will_it_rain:
                                    (day3daily_will_it_rain == 1)
                                        ? 'YES'
                                        : 'NO',
                                day3totalprecip_mm: totalPrecipWithSymbolday3,
                                day3daily_chance_of_rain:
                                    dailyChanceOfRainWithSymbolday3,
                                day3sunrise: day3sunrise,
                                day3sunset: day3sunset,
                                day3avghumidity: avghumidityWithSymbolday3,
                                Date3: Date3,
                                dewpointday3: Dewpointcalculatedday3,
                              ), // Replace Day1Page with the actual page widget for "day1.dart"
                            ),
                          );
                        },
                        child: Image.network(
                          weatherIconUrlday31,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        '$weatherDescriptionday3', // Use the appropriate variable
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.indigo,
                        ),
                      ),
                      Text(
                        '$Date3', // Use the appropriate variable
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Day4Page(
                                day4maxtemp: maxTempWithSymbolday4,
                                day4mintemp: minTempWithSymbolday4,
                                day4avgtemp: avgTempWithSymbolday4,
                                day4maxwind: maxWindWithSymbolday4,
                                day4daily_will_it_rain:
                                    (day4daily_will_it_rain == 1)
                                        ? 'YES'
                                        : 'NO',
                                day4totalprecip_mm: totalPrecipWithSymbolday4,
                                day4daily_chance_of_rain:
                                    dailyChanceOfRainWithSymbolday4,
                                day4sunrise: day4sunrise,
                                day4sunset: day4sunset,
                                day4avghumidity: avghumidityWithSymbolday4,
                                Date4: Date4,
                                dewpointday4: Dewpointcalculatedday4,
                              ), // Replace Day1Page with the actual page widget for "day1.dart"
                            ),
                          );
                        },
                        child: Image.network(
                          weatherIconUrlday41,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        '$weatherDescriptionday4', // Use the appropriate variable
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.indigo,
                        ),
                      ),
                      Text(
                        '$Date4', // Use the appropriate variable
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),

                  // Add more columns for additional weather descriptions and icons here
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Day5Page(
                                day5maxtemp: maxTempWithSymbolday5,
                                day5mintemp: minTempWithSymbolday5,
                                day5avgtemp: avgTempWithSymbolday5,
                                day5maxwind: maxWindWithSymbolday5,
                                day5daily_will_it_rain:
                                    (day5daily_will_it_rain == 1)
                                        ? 'YES'
                                        : 'NO',
                                day5totalprecip_mm: totalPrecipWithSymbolday5,
                                day5daily_chance_of_rain:
                                    dailyChanceOfRainWithSymbolday5,
                                day5sunrise: day5sunrise,
                                day5sunset: day5sunset,
                                day5avghumidity: avghumidityWithSymbolday5,
                                Date5: Date5,
                                dewpointday5: Dewpointcalculatedday5,
                              ), // Replace Day1Page with the actual page widget for "day1.dart"
                            ),
                          );
                        },
                        child: Image.network(
                          weatherIconUrlday51,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        '$weatherDescriptionday5', // Use the appropriate variable
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.indigo,
                        ),
                      ),
                      Text(
                        '$Date5', // Use the appropriate variable
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
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
                        if (widget.temperatureApi.isNotEmpty)
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
                        if (widget.temperatureApi.isNotEmpty && widget.humidityApi.isNotEmpty)
                          const SizedBox(width: 16),

                        // Only include the TDS column if the TDS value is greater than 0
                        if (widget.humidityApi.isNotEmpty)
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
],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Only include the humidity column if the humidity is greater than 0
                        if (widget.tdsApi.isEmpty)
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
                      
                        // Include the spacing only if both humidity and pH values are greater than 0
                        if ( widget.tdsApi.isEmpty && widget.phApi.isEmpty) const SizedBox(width: 16),

                        // Only include the pH column if the pH value is greater than 0
                        if (widget.phApi.isEmpty)
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
                        if (widget.windspeedapi.isNotEmpty)
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
                        if (widget.windspeedapi.isNotEmpty && widget.raincountapi.isNotEmpty)
                          const SizedBox(width: 16),

                        // Only include the raincount column if the raincount is greater than 0
                        if (widget.raincountapi.isNotEmpty)
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
                        if (widget.iaqapi.isNotEmpty)
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
                        if (widget.iaqapi.isNotEmpty && widget.co2api.isNotEmpty) const SizedBox(width: 16),

                        // Only include the CO2 column if the CO2 is greater than 0
                        if (widget.co2api.isNotEmpty)
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
                        if (widget.breathvocapi.isNotEmpty)
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
                        if (widget.breathvocapi.isNotEmpty && widget.pressureapi.isNotEmpty)
                          const SizedBox(width: 16),

                        // Only include the pressure column if the pressure is greater than 0
                        if (widget.pressureapi.isNotEmpty)
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
                        if (widget.dewpointapi.isNotEmpty)
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

class Day1Page extends StatelessWidget {
  final String day1maxtemp;
  final String day1mintemp;
  final String day1avgtemp;
  final String day1maxwind;
  final String day1daily_will_it_rain;
  final String day1totalprecip_mm;
  final String day1daily_chance_of_rain;
  final String day1sunrise;
  final String day1sunset;
  final String day1avghumidity;
  final String partDate1;
  final String dewpointday1;

  Day1Page({
    required this.day1maxtemp,
    required this.day1mintemp,
    required this.day1avgtemp,
    required this.day1maxwind,
    required this.day1daily_will_it_rain,
    required this.day1totalprecip_mm,
    required this.day1daily_chance_of_rain,
    required this.day1sunrise,
    required this.day1sunset,
    required this.day1avghumidity,
    required this.partDate1,
    required this.dewpointday1,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$partDate1'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Parameter')),
              DataColumn(label: Text('Value')),
            ],
            rows: [
              buildDataRow('MaxTemp', day1maxtemp, Icons.thermostat),
              buildDataRow('MinTemp', day1mintemp, Icons.thermostat_outlined),
              buildDataRow('AvgTemp', day1avgtemp, Icons.thermostat_rounded),
              buildDataRow('MaxWind', day1maxwind, Icons.waves),
              buildDataRow('avghumidity', day1avghumidity, Icons.water),
              buildDataRow('Daily Will It Rain', day1daily_will_it_rain,
                  Icons.wb_cloudy),
              buildDataRow(
                  'Total Precipitation', day1totalprecip_mm, Icons.umbrella),
              buildDataRow('Probability of Rain', day1daily_chance_of_rain,
                  Icons.wb_sunny),
              buildDataRow('Sunrise', day1sunrise, Icons.wb_sunny),
              buildDataRow('Sunset', day1sunset, Icons.nights_stay),
              buildDataRow('dewpoint', dewpointday1, Icons.nights_stay),
            ],
          ),
        ),
      ),
    );
  }

  DataRow buildDataRow(String parameter, String value, IconData icon) {
    return DataRow(
      cells: [
        DataCell(Row(
          children: [
            Icon(icon),
            SizedBox(width: 5),
            Text(parameter),
          ],
        )),
        DataCell(
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Day2Page extends StatelessWidget {
  final String day2maxtemp;
  final String day2mintemp;
  final String day2avgtemp;
  final String day2maxwind;
  final String day2daily_will_it_rain;
  final String day2totalprecip_mm;
  final String day2daily_chance_of_rain;
  final String day2sunrise;
  final String day2sunset;
  final String day2avghumidity;
  final String Date2;
  final String dewpointday2;

  Day2Page({
    required this.day2maxtemp,
    required this.day2mintemp,
    required this.day2avgtemp,
    required this.day2maxwind,
    required this.day2daily_will_it_rain,
    required this.day2totalprecip_mm,
    required this.day2daily_chance_of_rain,
    required this.day2sunrise,
    required this.day2sunset,
    required this.day2avghumidity,
    required this.Date2,
    required this.dewpointday2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$Date2'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Parameter')),
              DataColumn(label: Text('Value')),
            ],
            rows: [
              buildDataRow('MaxTemp', day2maxtemp, Icons.thermostat),
              buildDataRow('MinTemp', day2mintemp, Icons.thermostat_outlined),
              buildDataRow('AvgTemp', day2avgtemp, Icons.thermostat_rounded),
              buildDataRow('MaxWind', day2maxwind, Icons.waves),
              buildDataRow('avghumidity', day2avghumidity, Icons.water),
              buildDataRow('Daily Will It Rain', day2daily_will_it_rain,
                  Icons.wb_cloudy),
              buildDataRow(
                  'Total Precipitation', day2totalprecip_mm, Icons.umbrella),
              buildDataRow('Probability of Rain', day2daily_chance_of_rain,
                  Icons.wb_sunny),
              buildDataRow('Sunrise', day2sunrise, Icons.wb_sunny),
              buildDataRow('Sunset', day2sunset, Icons.nights_stay),
              buildDataRow('dewpoint', dewpointday2, Icons.nights_stay),
            ],
          ),
        ),
      ),
    );
  }

  DataRow buildDataRow(String parameter, String value, IconData icon) {
    return DataRow(
      cells: [
        DataCell(Row(
          children: [
            Icon(icon),
            SizedBox(width: 5),
            Text(parameter),
          ],
        )),
        DataCell(
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Day3Page extends StatelessWidget {
  final String day3maxtemp;
  final String day3mintemp;
  final String day3avgtemp;
  final String day3maxwind;
  final String day3daily_will_it_rain;
  final String day3totalprecip_mm;
  final String day3daily_chance_of_rain;
  final String day3sunrise;
  final String day3sunset;
  final String day3avghumidity;
  final String Date3;
  final String dewpointday3;

  Day3Page({
    required this.day3maxtemp,
    required this.day3mintemp,
    required this.day3avgtemp,
    required this.day3maxwind,
    required this.day3daily_will_it_rain,
    required this.day3totalprecip_mm,
    required this.day3daily_chance_of_rain,
    required this.day3sunrise,
    required this.day3sunset,
    required this.day3avghumidity,
    required this.Date3,
    required this.dewpointday3,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$Date3'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Parameter')),
              DataColumn(label: Text('Value')),
            ],
            rows: [
              buildDataRow('MaxTemp', day3maxtemp, Icons.thermostat),
              buildDataRow('MinTemp', day3mintemp, Icons.thermostat_outlined),
              buildDataRow('AvgTemp', day3avgtemp, Icons.thermostat_rounded),
              buildDataRow('MaxWind', day3maxwind, Icons.waves),
              buildDataRow('avghumidity', day3avghumidity, Icons.water),
              buildDataRow('Daily Will It Rain', day3daily_will_it_rain,
                  Icons.wb_cloudy),
              buildDataRow(
                  'Total Precipitation', day3totalprecip_mm, Icons.umbrella),
              buildDataRow('Probability of Rain', day3daily_chance_of_rain,
                  Icons.wb_sunny),
              buildDataRow('Sunrise', day3sunrise, Icons.wb_sunny),
              buildDataRow('Sunset', day3sunset, Icons.nights_stay),
              buildDataRow('dewpoint', dewpointday3, Icons.nights_stay),
            ],
          ),
        ),
      ),
    );
  }

  DataRow buildDataRow(String parameter, String value, IconData icon) {
    return DataRow(
      cells: [
        DataCell(Row(
          children: [
            Icon(icon),
            SizedBox(width: 5),
            Text(parameter),
          ],
        )),
        DataCell(
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Day4Page extends StatelessWidget {
  final String day4maxtemp;
  final String day4mintemp;
  final String day4avgtemp;
  final String day4maxwind;
  final String day4daily_will_it_rain;
  final String day4totalprecip_mm;
  final String day4daily_chance_of_rain;
  final String day4sunrise;
  final String day4sunset;
  final String day4avghumidity;
  final String Date4;
  final String dewpointday4;

  Day4Page({
    required this.day4maxtemp,
    required this.day4mintemp,
    required this.day4avgtemp,
    required this.day4maxwind,
    required this.day4daily_will_it_rain,
    required this.day4totalprecip_mm,
    required this.day4daily_chance_of_rain,
    required this.day4sunrise,
    required this.day4sunset,
    required this.day4avghumidity,
    required this.Date4,
    required this.dewpointday4,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$Date4'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Parameter')),
              DataColumn(label: Text('Value')),
            ],
            rows: [
              buildDataRow('MaxTemp', day4maxtemp, Icons.thermostat),
              buildDataRow('MinTemp', day4mintemp, Icons.thermostat_outlined),
              buildDataRow('AvgTemp', day4avgtemp, Icons.thermostat_rounded),
              buildDataRow('MaxWind', day4maxwind, Icons.waves),
              buildDataRow('avghumidity', day4avghumidity, Icons.water),
              buildDataRow('Daily Will It Rain', day4daily_will_it_rain,
                  Icons.wb_cloudy),
              buildDataRow(
                  'Total Precipitation', day4totalprecip_mm, Icons.umbrella),
              buildDataRow('Probability of Rain', day4daily_chance_of_rain,
                  Icons.wb_sunny),
              buildDataRow('Sunrise', day4sunrise, Icons.wb_sunny),
              buildDataRow('Sunset', day4sunset, Icons.nights_stay),
              buildDataRow('dewpoint', dewpointday4, Icons.nights_stay),
            ],
          ),
        ),
      ),
    );
  }

  DataRow buildDataRow(String parameter, String value, IconData icon) {
    return DataRow(
      cells: [
        DataCell(Row(
          children: [
            Icon(icon),
            SizedBox(width: 5),
            Text(parameter),
          ],
        )),
        DataCell(
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Day5Page extends StatelessWidget {
  final String day5maxtemp;
  final String day5mintemp;
  final String day5avgtemp;
  final String day5maxwind;
  final String day5daily_will_it_rain;
  final String day5totalprecip_mm;
  final String day5daily_chance_of_rain;
  final String day5sunrise;
  final String day5sunset;
  final String day5avghumidity;
  final String Date5;
  final String dewpointday5;

  Day5Page({
    required this.day5maxtemp,
    required this.day5mintemp,
    required this.day5avgtemp,
    required this.day5maxwind,
    required this.day5daily_will_it_rain,
    required this.day5totalprecip_mm,
    required this.day5daily_chance_of_rain,
    required this.day5sunrise,
    required this.day5sunset,
    required this.day5avghumidity,
    required this.Date5,
    required this.dewpointday5,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$Date5'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Parameter')),
              DataColumn(label: Text('Value')),
            ],
            rows: [
              buildDataRow('MaxTemp', day5maxtemp, Icons.thermostat),
              buildDataRow('MinTemp', day5mintemp, Icons.thermostat_outlined),
              buildDataRow('AvgTemp', day5avgtemp, Icons.thermostat_rounded),
              buildDataRow('MaxWind', day5maxwind, Icons.waves),
              buildDataRow('avghumidity', day5avghumidity, Icons.water),
              buildDataRow('Daily Will It Rain', day5daily_will_it_rain,
                  Icons.wb_cloudy),
              buildDataRow(
                  'Total Precipitation', day5totalprecip_mm, Icons.umbrella),
              buildDataRow('Probability of Rain', day5daily_chance_of_rain,
                  Icons.wb_sunny),
              buildDataRow('Sunrise', day5sunrise, Icons.wb_sunny),
              buildDataRow('Sunset', day5sunset, Icons.nights_stay),
              buildDataRow('dewpoint', dewpointday5, Icons.nights_stay),
            ],
          ),
        ),
      ),
    );
  }

  DataRow buildDataRow(String parameter, String value, IconData icon) {
    return DataRow(
      cells: [
        DataCell(Row(
          children: [
            Icon(icon),
            SizedBox(width: 5),
            Text(parameter),
          ],
        )),
        DataCell(
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
