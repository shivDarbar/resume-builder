import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/models/education.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';
import 'package:resume_builder_app/screens/education_screen.dart';
import 'package:resume_builder_app/widgets/my_text_field.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var resumeProvider = Provider.of<ResumeProvider>(context);
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text(''),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'PERSONAL INFO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            MyTextField(
              controller: resumeProvider.firstNameController,
              hintText: 'First Name',
            ),
            MyTextField(
              controller: resumeProvider.lastNameController,
              hintText: 'Last Name',
            ),
            MyTextField(
              controller: resumeProvider.emailController,
              hintText: 'Email',
            ),
            MyTextField(
              controller: resumeProvider.addressController,
              hintText: 'Address',
            ),
            MyTextField(
              controller: resumeProvider.linkedInController,
              hintText: 'LinkedIn Profile',
            ),
            MyTextField(
              controller: resumeProvider.dateOfBirthController,
              hintText: 'Date of Birth',
            ),
            ElevatedButton(
              onPressed: () {
                resumeProvider.getPersonalInfo();
                print(resumeProvider.personalInfo.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EducationScreen(),
                  ),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
