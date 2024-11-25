import 'package:flutter/material.dart';

import 'package:flutter_application_celebreak/features/todays_activities.dart/presentation/widgets/custom_card.dart';
import 'package:flutter_application_celebreak/features/todays_activities.dart/presentation/widgets/main_content.dart';
import 'package:flutter_application_celebreak/features/todays_activities.dart/presentation/widgets/sidebar.dart';

import 'package:flutter_application_celebreak/shared/utils/responsive.dart';

/// This class represents the desktop version of the Activities page in a Flutter application.
class ActivitiesPageDesktop extends StatelessWidget {
  const ActivitiesPageDesktop({super.key});
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      body: Row(
        children: [
          Sidebar(responsive: responsive),
          const Expanded(
            child: MainContent(),
          ),
          const CardsSection(),
        ],
      ),
    );
  }
}
