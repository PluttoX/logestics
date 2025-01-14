
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/dashbord/lms/student_progress.dart';
import 'package:logestics/features/home/view/dashbord/lms/time_spending.dart';
import 'package:logestics/features/home/view/dashbord/lms/today_course.dart';
import 'package:logestics/features/home/view/dashbord/lms/top_instructors.dart';
import 'package:logestics/features/home/view/dashbord/lms/total_courses_sales.dart';
import 'package:logestics/features/home/view/dashbord/lms/welcome_back.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import 'active_students.dart';
import 'aec.dart';
import 'average_enrollment_rate.dart';
import 'courses.dart';
import 'courses_categories.dart';

class LmsPageView extends StatefulWidget {
  const LmsPageView({super.key});

  @override
  State<LmsPageView> createState() => _LmsPageViewState();
}

class _LmsPageViewState extends State<LmsPageView> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

     if (width < 800) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              height: 450,
              child: welcomeBack(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 230,
              width: width,
              child: aecContainer(
                context,
                title: "Active Courses",
                subtitle: "2.3K+",
                image: "assets/images/active-learning.svg",
                greytext: "This Month",
                colortext: "3.25%",
                textcolor: Color(0xFF35d582),
                arrowimage: "assets/images/trend-up.png",
                backgroundcolor: notifier.ligreenColor,
                centercontainer: notifier.lightbgcolor,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 230,
              width: width,
              child: aecContainer(
                context,
                title: "Enrolled Students",
                subtitle: "1.2K",
                image: "assets/images/join.svg",
                greytext: "This Week",
                colortext: "1.25%",
                textcolor: Color(0xFFe74c46),
                arrowimage: "assets/images/trend-down.png",
                backgroundcolor: notifier.liredColor,
                centercontainer: notifier.lightbgcolor,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 230,
              width: width,
              child: aecContainer(
                context,
                title: "Completion Status",
                subtitle: "75%",
                image: "assets/images/school.svg",
                greytext: "This Week",
                colortext: "75%",
                textcolor: Color(0xFF35d582),
                arrowimage: "assets/images/trend-up.png",
                backgroundcolor: notifier.ligreenColor,
                centercontainer: notifier.lightbgcolor,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 550,
              child: activeStudents(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: width < 600 ? 700 : 580,
              child: coursesCategory(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: width < 600 ? 650 : 590,
              child: topInstructors(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: totalCoursesSales(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 230,
              width: width,
              child: aecContainer(
                context,
                title: "Video Courses",
                subtitle: "100+",
                image: "assets/images/video-content.svg",
                greytext: "This Month",
                colortext: "3.21%",
                textcolor: Color(0xFF35d582),
                arrowimage: "assets/images/trend-up.png",
                backgroundcolor: notifier.ligreenColor,
                centercontainer: Color(0xFF00cae3),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 230,
              width: width,
              child: aecContainer(
                context,
                title: "Total Instructors",
                subtitle: "1K+",
                image: "assets/images/instructor.svg",
                greytext: "Last Month",
                colortext: "50.05%",
                textcolor: Color(0xFF35d582),
                arrowimage: "assets/images/trend-up.png",
                backgroundcolor: notifier.ligreenColor,
                centercontainer: Color(0xFF796df6),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 500,
              child: studentProgress(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 530,
              child: courses(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: timeSpending(context),
            ),
            SizedBox(height: 20),
            Container(
              height: 300,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: notifier.isDark ? Color(0xFF1B232D) : const Color(0xFFddddef),
                borderRadius: BorderRadius.circular(10),
              ),
              child: todayCourse(),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: averageEnrollmentRate(context),
            ),
          ],
        ),
      );
    } else if (width < 1000) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: welcomeBack(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: aecContainer(
                        context,
                        title: "Active Courses",
                        subtitle: "2.3K+",
                        image: "assets/images/active-learning.svg",
                        greytext: "This Month",
                        colortext: "3.25%",
                        textcolor: Color(0xFF35d582),
                        arrowimage: "assets/images/trend-up.png",
                        backgroundcolor: notifier.ligreenColor,
                        centercontainer: notifier.lightbgcolor,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      child: aecContainer(
                        context,
                        title: "Enrolled Students",
                        subtitle: "1.2K",
                        image: "assets/images/join.svg",
                        greytext: "This Week",
                        colortext: "1.25%",
                        textcolor: Color(0xFFe74c46),
                        arrowimage: "assets/images/trend-down.png",
                        backgroundcolor: notifier.liredColor,
                        centercontainer: notifier.lightbgcolor,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      child: aecContainer(
                        context,
                        title: "Completion Status",
                        subtitle: "75%",
                        image: "assets/images/school.svg",
                        greytext: "This Week",
                        colortext: "75%",
                        textcolor: Color(0xFF35d582),
                        arrowimage: "assets/images/trend-up.png",
                        backgroundcolor: notifier.ligreenColor,
                        centercontainer: notifier.lightbgcolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 570,
              child: activeStudents(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 570,
              child: coursesCategory(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 550,
              child: topInstructors(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: totalCoursesSales(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: Row(
                children: [
                  Expanded(
                    child: aecContainer(
                      context,
                      title: "Video Courses",
                      subtitle: "100+",
                      image: "assets/images/video-content.svg",
                      greytext: "This Month",
                      colortext: "3.21%",
                      textcolor: Color(0xFF35d582),
                      arrowimage: "assets/images/trend-up.png",
                      backgroundcolor: notifier.ligreenColor,
                      centercontainer: Color(0xFF00cae3),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: aecContainer(
                      context,
                      title: "Total Instructors",
                      subtitle: "1K+",
                      image: "assets/images/instructor.svg",
                      greytext: "Last Month",
                      colortext: "50.05%",
                      textcolor: Color(0xFF35d582),
                      arrowimage: "assets/images/trend-up.png",
                      backgroundcolor: notifier.ligreenColor,
                      centercontainer: Color(0xFF796df6),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 470,
              child: studentProgress(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 540,
              child: courses(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: timeSpending(context),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: notifier.isDark ? Color(0xFF1B232D) : const Color(0xFFddddef),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: width / 3,
                      child: todayCourse(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: averageEnrollmentRate(context),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: welcomeBack(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: aecContainer(
                        context,
                        title: "Active Courses",
                        subtitle: "2.3K+",
                        image: "assets/images/active-learning.svg",
                        greytext: "This Month",
                        colortext: "3.25%",
                        textcolor: Color(0xFF35d582),
                        arrowimage: "assets/images/trend-up.png",
                        backgroundcolor: notifier.ligreenColor,
                        centercontainer: notifier.lightbgcolor,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      child: aecContainer(
                        context,
                        title: "Enrolled Students",
                        subtitle: "1.2K",
                        image: "assets/images/join.svg",
                        greytext: "This Week",
                        colortext: "1.25%",
                        textcolor: Color(0xFFe74c46),
                        arrowimage: "assets/images/trend-down.png",
                        backgroundcolor: notifier.liredColor,
                        centercontainer: notifier.lightbgcolor,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      child: aecContainer(
                        context,
                        title: "Completion Status",
                        subtitle: "75%",
                        image: "assets/images/school.svg",
                        greytext: "This Week",
                        colortext: "75%",
                        textcolor: Color(0xFF35d582),
                        arrowimage: "assets/images/trend-up.png",
                        backgroundcolor: notifier.ligreenColor,
                        centercontainer: notifier.lightbgcolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(),
              height: 570,
              child: Row(
                children: [
                  SizedBox(
                    width: width / 2.2,
                    child: activeStudents(context),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      child: coursesCategory(context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 570,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: topInstructors(context),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: totalCoursesSales(context),
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: aecContainer(
                                    context,
                                    title: "Video Courses",
                                    subtitle: "100+",
                                    image: "assets/images/video-content.svg",
                                    greytext: "This Month",
                                    colortext: "3.21%",
                                    textcolor: Color(0xFF35d582),
                                    arrowimage: "assets/images/trend-up.png",
                                    backgroundcolor: notifier.ligreenColor,
                                    centercontainer: Color(0xFF00cae3),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: aecContainer(
                                    context,
                                    title: "Total Instructors",
                                    subtitle: "1K+",
                                    image: "assets/images/instructor.svg",
                                    greytext: "Last Month",
                                    colortext: "50.05%",
                                    textcolor: Color(0xFF35d582),
                                    arrowimage: "assets/images/trend-up.png",
                                    backgroundcolor: notifier.ligreenColor,
                                    centercontainer: Color(0xFF796df6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 470,
              child: studentProgress(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 530,
              child: courses(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: timeSpending(context),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: notifier.isDark ? Color(0xFF1B232D) : const Color(0xFFddddef),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: todayCourse(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: averageEnrollmentRate(context),
            ),
          ],
        ),
      );
    }
    //   },
    // );
  }
}
