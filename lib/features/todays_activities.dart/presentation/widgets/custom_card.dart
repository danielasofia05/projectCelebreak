import 'package:flutter/material.dart';
import 'package:flutter_application_celebreak/shared/colors/colors.dart';
import 'package:flutter_application_celebreak/shared/styles/images_paths.dart';
import 'package:flutter_application_celebreak/shared/styles/text_styles.dart';
import 'package:flutter_application_celebreak/shared/utils/responsive.dart';

class InfoCard extends StatelessWidget {
  final Color color;
  final String title;
  final List<String> actions;
  final String subtitle;

  const InfoCard({
    super.key,
    required this.color,
    required this.title,
    required this.actions,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Card(
      color: color,
      child: Padding(
        padding: EdgeInsets.only(
            left: responsive.fpw(19),
            top: responsive.fpw(16),
            bottom: responsive.fpw(16),
            right: responsive.fpw(2)),
        child: Stack(
          children: [
  
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: responsive.isDesktop
                            ? responsive.fpw(20)
                            : responsive.fp(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                        height: responsive.isDesktop
                            ? responsive.hp(2)
                            : responsive.hp(1)),
                    SizedBox(
                      width: responsive.isDesktop
                          ? responsive.wp(12)
                          : responsive.wp(60),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: responsive.isDesktop
                              ? responsive.fpw(12)
                              : responsive.fp(12),
                        ),
                      ),
                    ),
                    SizedBox(height: responsive.hp(1)),
                    Row(
                      children: actions
                          .map(
                            (action) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ElevatedButton(
                                onPressed: () {
                           
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 6.0,
                                  ),
                                  minimumSize: responsive.isDesktop
                                      ? Size(
                                          responsive.wp(4.8), responsive.hp(5))
                                      : Size(
                                          responsive.wp(5.2), responsive.wp(7)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                                child: Text(
                                  action,
                                  style: TextStyles.dynamicTextStyle(
                                      fontSize: responsive.isDesktop
                                          ? responsive.fpw(12)
                                          : responsive.fp(12),
                                      color: MyColors.white),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom:
                  responsive.isDesktop ? responsive.hp(1) : responsive.hp(-1),
              left:
                  responsive.isDesktop ? responsive.wp(13) : responsive.wp(60),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                      height: responsive.isDesktop
                          ? responsive.hp(10)
                          : responsive.hp(12),
                      width: responsive.isDesktop
                          ? responsive.hp(10)
                          : responsive.hp(12),
                      child: Image.asset(Paths.icons.pointDisplay)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardsSection extends StatelessWidget {
  const CardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: responsive.wp(22.10),
              child: const InfoCard(
                color: Color(0xFFBAE6FD),
                title: 'You\'re close to your goal!',
                subtitle: 'Join more sport activities to collect more points',
                actions: ['Join Now', 'My Points'],
              ),
            ),
            SizedBox(height: responsive.hp(2.5)),
            SizedBox(
              width: responsive.wp(22.10),
              child: Card(
                color: const Color(0xFFFBF2C0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, bottom: 16, top: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: responsive.hp(4),
                      ),
                      SizedBox(
                        width: responsive.wp(12),
                        child: Text(
                          'Weekly Workshops for Kids',
                          style: TextStyles.dynamicTextStyle(
                            lineSpacing: 1.3,
                            isBold: true,
                            fontSize: responsive.fpw(20),
                          ),
                        ),
                      ),
                      SizedBox(height: responsive.hp(1)),
                      SizedBox(
                        width: responsive.wp(16),
                        child: Text(
                          'Sign up for early access to weekly activities for your kids full of learning and fun!',
                          style: TextStyles.dynamicTextStyle(
                              fontSize: responsive.fpw(12), lineSpacing: 1.5),
                        ),
                      ),
                      SizedBox(height: responsive.hp(2)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              minimumSize: const Size(150, 30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Learn More',
                                  style:
                                      TextStyle(fontSize: responsive.fpw(16)),
                                ),
                                SizedBox(width: responsive.wp(6.5)),
                                SizedBox(
                                    width: responsive.wp(2),
                                    height: responsive.hp(3),
                                    child: Image.asset(Paths.icons.arrowRight)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: responsive.hp(2.5)),
            SizedBox(
              width: responsive.wp(22.10),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage(Paths.icons.rectangle),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, bottom: 16, top: 16, right: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: responsive.hp(2)),
                        SizedBox(
                          width: responsive.wp(19),
                          child: Text(
                            'Popular events near you!',
                            style: TextStyles.dynamicTextStyle(
                              color: MyColors.white,
                              isBold: false,
                              fontSize: responsive.fpw(20),
                            ),
                          ),
                        ),
                        SizedBox(height: responsive.hp(14)),
                        SizedBox(
                          width: responsive.wp(20),
                          child: Text(
                            'Unleash the fun! Explore the world of exciting events happening near you',
                            style: TextStyles.dynamicTextStyle(
                              fontSize: responsive.fpw(14),
                              lineSpacing: 1.2,
                              color: MyColors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: responsive.hp(4)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // Botón
                                Padding(
                                  padding: const EdgeInsets.only(left: 27),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColors.white,
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 16.0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      minimumSize: Size(responsive.wp(16), 50),
                                    ),
                                    child: Text(
                                      'See More',
                                      style: TextStyle(
                                          fontSize: responsive.fpw(16)),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  left: 5,
                                  top: responsive.hp(-0.5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150.0),
                                    child: Image.asset(
                                      Paths.icons.cover,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
