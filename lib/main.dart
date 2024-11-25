import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_celebreak/features/todays_activities.dart/presentation/pages/activities_page_desktop.dart';
import 'package:flutter_application_celebreak/features/todays_activities.dart/presentation/pages/activities_page_mobile.dart';
import 'package:flutter_application_celebreak/shared/utils/responsive.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return MaterialApp(
  
      title: 'TWNSQR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: kIsWeb && responsive.isDesktop
          ? const ActivitiesPageDesktop()
          : const ActivitiesPageMobile(),
    );
  }
}
