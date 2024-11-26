import 'package:flutter/material.dart';
import 'package:flutter_application_celebreak/shared/colors/colors.dart';
import 'package:flutter_application_celebreak/shared/styles/fonts_name.dart';
import 'package:flutter_application_celebreak/shared/styles/images_paths.dart';
import 'package:flutter_application_celebreak/shared/styles/text_styles.dart';
import 'package:flutter_application_celebreak/shared/utils/responsive.dart';

/// This Dart class named Sidebar extends StatelessWidget.
class Sidebar extends StatelessWidget {
  final Responsive responsive;

  const Sidebar({super.key, required this.responsive});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sidebarItems = [
      {'icon': Image.asset(Paths.icons.calendar2), 'label': 'Activities'},
      {'icon': Image.asset(Paths.icons.map2), 'label': 'Locations'},
      {'icon': Image.asset(Paths.icons.star2), 'label': 'Services'},
      {'icon': Image.asset(Paths.icons.users2), 'label': 'Communities'},
      {'icon': Image.asset(Paths.icons.bell2), 'label': 'Notifications'},
    ];

    return Container(
      width: responsive.wp(18),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: responsive.hp(7)),
          SizedBox(
              height: responsive.hp(5),
              width: responsive.wp(10),
              child: Image.asset(Paths.icons.logo)),
          SizedBox(height: responsive.hp(5)),
          ...sidebarItems.map(
            (item) => Padding(
              padding: EdgeInsets.only(left: responsive.wp(2)),
              child: SidebarItem(
                image: item['icon'],
                label: item['label'],
              ),
            ),
          ),
          SizedBox(height: responsive.hp(2)),
          Padding(
            padding: EdgeInsets.only(
                left: responsive.wp(3), right: responsive.wp(3)),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.lightBlue,
                minimumSize: Size(responsive.wp(20), responsive.hp(6)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.add, color: Colors.black),
                  SizedBox(width: responsive.wp(1.2)),
                  Text(
                    'Create',
                    style: TextStyles.dynamicTextStyle(
                      fontSize: responsive.fpw(18),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: responsive.hp(3)),
          Padding(
            padding: EdgeInsets.only(
                left: responsive.wp(3), right: responsive.wp(3)),
            child: const ProfileSection(),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final Image image;
  final String label;

  const SidebarItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const SizedBox(width: 20),
          SizedBox(
            width: responsive.wp(2), 
            height: responsive.wp(2), 
            child: image,
          ),
          const SizedBox(width: 20),
          Text(
            label,
            style: TextStyles.dynamicTextStyle(
              color: Colors.white,
              fontSize: responsive.fpw(20),
              fontFamily: Fonts.sfprodisplayregular,
            ),
          ),
        ],
      ),
    );
  }
}


/// This Dart class represents a profile section in a Flutter application.
class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: responsive.hp(3.6),
            height: responsive.hp(3.6),
            child: ClipOval(
              child: Image.asset(
                Paths.icons.profile,
                fit: BoxFit
                    .cover, 
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text('Profile',
              style: TextStyles.dynamicTextStyle(color: Colors.white, fontSize: responsive.fpw(20)), ),
          const Spacer(),
          const Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
    );
  }
}
