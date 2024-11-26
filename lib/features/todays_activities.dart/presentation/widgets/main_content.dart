import 'package:flutter/material.dart';
import 'package:flutter_application_celebreak/shared/colors/colors.dart';
import 'package:flutter_application_celebreak/shared/styles/images_paths.dart';
import 'package:flutter_application_celebreak/shared/styles/text_styles.dart';
import 'package:flutter_application_celebreak/shared/utils/responsive.dart';

/// This Dart class named MainContent extends StatefulWidget.
class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  MainContentState createState() => MainContentState();
}

/// This Dart class represents the state of the MainContent widget.
class MainContentState extends State<MainContent> {
  List<Activity> activities = [];
  String selectedFilter = 'All';
  String searchQuery = '';
  bool isLoading = true;
  bool hasError = false;
  @override
  void initState() {
    super.initState();
    _fetchActivities();
  }

  Future<void> _fetchActivities() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        activities = [
          Activity('08:00', '60 min', 'Beach Yoga', 'La Playa de la Rada', '10',
              '9', 'Sports'),
          Activity('10:00', '90 min', 'Performer Pilates', 'Wellness Studios  ',
              '5', '15', 'Sports'),
          Activity('11:00', '120 min', '5-a-side Football',
              'Municipal Sports Center', '20', '20', 'Food'),
          Activity('13:00', '60 min', 'Standing Tapas Lunch', 'Casa Marina',
              '12', '25', 'Creative'),
        ];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    List<Activity> filteredActivities = activities.where((activity) {
      bool matchesFilter =
          selectedFilter == 'All' || activity.category == selectedFilter;
      bool matchesSearch =
          activity.title.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: MyColors.whiteDark,
      body: Padding(
        padding: EdgeInsets.only(
          left: responsive.wp(4.5),
          right: responsive.wp(4.5),
          top: responsive.hp(4),
          bottom: responsive.hp(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tues, Nov 12',
              style: TextStyles.dynamicTextStyle(
                  color: Colors.grey, fontSize: responsive.fpw(14)),
            ),
            SizedBox(height: responsive.hp(0.5)),
            Text(
              'This week in Estepona',
              style: TextStyle(
                color: Colors.black,
                fontSize: responsive.fpw(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'What do you feel like doing?',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  suffixIcon: SizedBox(
                      width: responsive.wp(3),
                      height: responsive.hp(3),
                      child: Image.asset(Paths.icons.search2)),
                ),
                style: TextStyle(fontSize: responsive.fpw(14)),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 9),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEE1F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Transform.rotate(
                        angle: 90 * (3.14159265359 / 180),
                        child: const Icon(
                          Icons.tune,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ...[
                    'All',
                    'Sports',
                    'Food',
                    'Kids',
                    'Creative',
                    'Popular',
                    'Calm'
                  ].map((category) {
                    bool isSelected = selectedFilter == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = category;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFBAA1C8)
                                : const Color(0xFFEEE1F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                    child: Column(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFF2AC),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Column(
                                children: List.generate(
                                  (constraints.maxHeight / 8).floor(),
                                  (index) => Expanded(
                                    child: Container(
                                      width: 2,
                                      color: index.isEven
                                          ? Colors.transparent
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Today ',
                                style: TextStyles.dynamicTextStyle(
                                  fontSize: responsive.fpw(16),
                                  isBold: true,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '/ tuesday',
                                style: TextStyles.dynamicTextStyle(
                                  fontSize: responsive.fpw(14),
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (isLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (hasError) {
                                return const Center(
                                    child: Text(
                                        'An error occurred. Please try again.'));
                              } else if (filteredActivities.isEmpty) {
                                return const Center(
                                    child: Text('No activities found.'));
                              } else {
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: filteredActivities.length,
                                  itemBuilder: (context, index) {
                                    Activity activity =
                                        filteredActivities[index];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: ActivityCard(activity: activity),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// This is a Dart class named Activity.
class Activity {
  final String time;
  final String duration;
  final String title;
  final String location;
  final String availableSpots;
  final String price;
  final String category;

  Activity(this.time, this.duration, this.title, this.location,
      this.availableSpots, this.price, this.category);
}

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Card(
      color: MyColors.white,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
   
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  activity.time,
                  style:
                      TextStyles.dynamicTextStyle(fontSize: responsive.fpw(16)),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${activity.duration})',
                  style: TextStyles.dynamicTextStyle(
                    fontSize: responsive.fpw(16),
                    color: Colors.grey, 
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    activity.title,
                    style: TextStyles.dynamicTextStyle(
                        fontSize: responsive.fpw(20), isBold: true),
                  ),
                ),
                Text(
                  '${activity.price}€',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                    width: responsive.wp(1.5),
                    height: responsive.wp(1.5),
                    child: Image.asset(Paths.icons.mapPin)),
                const SizedBox(width: 4),
                Text(
                  activity.location,
                  style: TextStyles.dynamicTextStyle(
                      color: Colors.grey, fontSize: responsive.fpw(14)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                          height: responsive.hp(1.9),
                          width: responsive.hp(1.9),
                          child: Image.asset(Paths.icons.userCard)),
                      const SizedBox(width: 4),
                      Text(
                        '${activity.availableSpots} spots left',
                        style: TextStyles.dynamicTextStyle(
                            color: Colors.grey, fontSize: responsive.fpw(14)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: responsive.wp(1),
                ),
                if (activity.title == 'Beach Yoga')
                  _buildTag(
                      'Delight', const Color(0xFFD5F1FF), const Color(0xFF65B5DB), context),
                if (activity.title == 'Performer Pilates')
                  _buildTag(
                      'Medium', const Color(0xFFD5F1FF), const Color(0xFF65B5DB), context),
                if (activity.title == 'Performer Pilates')
                  _buildTag('Childcare', const Color(0xFFD8F7DF), const Color(0xFF8AB58A),
                      context),
                if (activity.title == '5-a-side Football')
                  _buildTag(
                      'High', const Color(0xFFFFEAD1), const Color(0xFF8AB58A), context),
                if (activity.title == '5-a-side Football')
                  _buildTag('Childcare', const Color(0xFFD8F7DF), const Color(0xFF8AB58A),
                      context),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activity.availableSpots == '0'
                        ? Colors.grey
                        : Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: activity.availableSpots == '0'
                      ? null
                      : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Joined the activity!')),
                          );
                        },
                  child: Text(
                    activity.availableSpots == '0' ? 'Sold Out' : 'Join',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


Widget _buildTag(String label, Color backgroundColor, Color textColor,
    BuildContext context) {
  Responsive responsive = Responsive(context);
  return Container(
    margin: const EdgeInsets.only(right: 8),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      label,
      style: TextStyles.dynamicTextStyle(
          color: textColor, fontSize: responsive.fpw(14)),
    ),
  );
}
