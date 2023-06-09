import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';
import 'package:resume_builder_app/screens/education_screen.dart';
import 'package:resume_builder_app/widgets/my_text_field.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var resumeProvider = Provider.of<ResumeProvider>(context);
    final mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'PERSONAL INFO',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.shortestSide * 0.1, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                  controller: resumeProvider.linkedInController,
                  hintText: 'LinkedIn Profile',
                ),
                MyTextField(
                  controller: resumeProvider.mobileNoController,
                  hintText: 'Mobile Number',
                  keyboardType: TextInputType.phone,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      var gotDetails = resumeProvider.getPersonalInfo(context);
                      if (gotDetails) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EducationScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
