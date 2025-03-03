import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scipro/screens/hybrid_courses.dart';
import 'package:scipro/screens/live_classroom.dart';
import 'package:scipro/screens/live_courses.dart';
import 'package:scipro/student_screens/pages/Hybrid_Courses.dart';
import 'package:scipro/student_screens/pages/Live_Courses/live_Course_Details.dart';
import 'package:scipro/student_screens/pages/Live_Courses/live_Courses_list.dart';
import 'package:scipro/student_screens/pages/Record_Courses/recorded_courses.dart';
import 'package:scipro/student_screens/pages/faculties.dart';
import 'package:scipro/student_screens/pages/live_Courses.dart';
import 'package:scipro/student_screens/pages/live_Mock_test.dart';
import 'package:scipro/student_screens/pages/record_Courses.dart';
import 'package:scipro/student_screens/pages/study_materials_screen.dart';
import 'package:scipro/video_player/videoplayer_firebase.dart';
import 'package:scipro/widgets/button_Container.dart';

class StudentCourseListScreen extends StatelessWidget {
  const StudentCourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Courses'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              LottieBuilder.asset(
                'assets/images/studentlottie.json',
                height: 320.h,
              ),
              SizedBox(
                height: 500,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(screens[index]);
                        },
                        child: ButtonContainerWidget(
                          curving: 30,
                          colorindex: 0,
                          height: 80.h,
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            studentCourseList[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          )),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: studentCourseList.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> studentCourseList = [
  'Record Courses',
  'Live Courses',
  'Scipro Hybrid Courses',
  'Faculties',
  'Study Materials',
  'Live Mock Tests'
      'Offline Mock Test',
];
List screens = const [
  RecordedCoursesListScreen(),
  LiveCoursesListScreen(),
  HybridCourses(),
  FacultieScreen(),
  StudyMaterialsScreen(),
  LiveMockTestsScreen()
];
