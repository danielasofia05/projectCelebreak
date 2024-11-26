import 'package:flutter/material.dart';
import 'package:flutter_application_celebreak/features/todays_activities.dart/presentation/widgets/custom_card.dart';
import 'package:flutter_application_celebreak/shared/colors/colors.dart';

import 'package:flutter_application_celebreak/shared/styles/images_paths.dart';
import 'package:flutter_application_celebreak/shared/styles/text_styles.dart';
import 'package:flutter_application_celebreak/shared/utils/responsive.dart';
import 'package:flutter_svg/svg.dart';

/// This class represents the mobile version of the Activities page in a Flutter app.
class ActivitiesPageMobile extends StatefulWidget {
  const ActivitiesPageMobile({super.key});

  @override
  ActivitiesPageMobileState createState() => ActivitiesPageMobileState();
}

/// This Dart class represents the state of the ActivitiesPageMobile widget in a mobile application.
class ActivitiesPageMobileState extends State<ActivitiesPageMobile> {
  List<Activity> activities = [];
  String selectedFilter = 'All';
  String searchQuery = '';
  bool isLoading = true;
  bool hasError = false;
  int _currentIndex = 0;

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
          Activity('10:00', '90 min', 'Performer Pilates', 'Wellness Studios',
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
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tues, Nov 12',
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                Row(
                  children: [
                    SizedBox(
                        width: responsive.wp(7.12),
                        height: responsive.wp(7.12),
                        child: SvgPicture.asset(Paths.icons.bell)),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: responsive.wp(7.12),
                      height: responsive.wp(7.12),
                      child: ClipOval(
                        child: Image.asset(
                          Paths.icons.profile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: responsive.hp(0.5)),
            const Text('This week in Estepona',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              width: responsive.wp(93),
              child: const InfoCard(
                color: Color(0xFFBAE6FD), 
                title: 'You\'re close to your goal!',
                subtitle: 'Join more sport activities to collect more points',
                actions: ['Join Now', 'My Points'],
              ),
            ),
            const SizedBox(height: 16),

            // Buscador
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.2), 
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
                      borderSide: const BorderSide(
                          color: Colors.transparent), 
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.grey.shade300), 
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                          right: 15, top: 0, left: 4, bottom: 0),
                      child: SvgPicture.asset(Paths.icons.search),
                    )),
                style:
                    TextStyles.dynamicTextStyle(fontSize: responsive.fp(16)), 
              ),
            ),
            const SizedBox(height: 16),

     
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                     // print("Settings tapped");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEE1F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Transform.rotate(
                        angle: 90 *
                            (3.14159265359 /
                                180), 
                        child: const Icon(
                          Icons.tune,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      width:
                          8), 
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
                              horizontal: 12, vertical: 6),
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
                              const TextSpan(
                                text: 'Today ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: '/ tuesday',
                                style: TextStyles.dynamicTextStyle(
                                    fontSize: responsive.fp(15),
                                    color: Colors.grey),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
        type: BottomNavigationBarType.fixed, 
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(Paths.icons.calendar),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Paths.icons.map),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Paths.icons.plus),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Paths.icons.users),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Paths.icons.star),
            label: '',
          ),
        ],
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
                  style: TextStyle(fontSize: responsive.fp(16)),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${activity.duration})',
                  style: TextStyle(
                    fontSize: responsive.fp(16),
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
                    style: TextStyle(
                      fontSize: responsive.fp(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${activity.price}€',
                  style: TextStyle(
                    fontSize: responsive.fp(16),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.grey, size: 14),
                const SizedBox(width: 4),
                Text(
                  activity.location,
                  style: TextStyles.dynamicTextStyle(
                    color: Colors.grey,
                    fontSize: responsive.fp(12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.person, color: Colors.grey, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        '${activity.availableSpots} spots left',
                        style: TextStyle(
                            color: Colors.grey, fontSize: responsive.fp(12)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: responsive.wp(0.5),
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
                        horizontal: 17, vertical: 18),
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
    margin: EdgeInsets.only(right: responsive.wp(0.5)),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      label,
      style: TextStyle(color: textColor, fontSize: responsive.fp(12)),
    ),
  );
}
