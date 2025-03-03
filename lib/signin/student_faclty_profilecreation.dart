import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro/faculty_screens/faculty_home_screen.dart';
import 'package:scipro/faculty_screens/uploadImagetoFirebase.dart';
import 'package:scipro/student_screens/student_profilecreation.dart';
import 'package:scipro/student_screens/uploading_image.dart';

class StudentandFacultyCreationPage extends StatelessWidget {
  const StudentandFacultyCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 300.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const Text(
                    'To',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 50.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/SCIPRO.png'))),
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                onPressed: () async {
                  Get.to(UploadImageForStudent());
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'CREATE STUDENT PROFILE',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 65, 118, 225),
                    fixedSize: const Size(400, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              SizedBox(height: 27.h),
              ElevatedButton(
                onPressed: () {
                  Get.off(UploadImageforFaculty());
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'CREATE FACLTY PROFILE',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Color.fromARGB(255, 245, 79, 24),
                    fixedSize: const Size(400, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
