import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';

class OtherInfoScreen extends StatelessWidget {
  const OtherInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'OTHER DETAILS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'SUMMARY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: mediaQuery.size.height * 0.02,
                // ),
                TextField(
                  controller: resumeProvider.summaryController, minLines: 3,
                  maxLines: 5,
                  // cursorColor: HexColor("#4f4f4f"),
                  // keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: 'SUMMARY',
                    // fillColor: HexColor("#f0f3f1"),
                    contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),

                    // hintStyle: GoogleFonts.poppins(
                    //   fontSize: 15,
                    //   color: HexColor("#8d8d8d"),
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    // prefixIcon: prefixIcon,
                    // prefixIconColor: HexColor("#4f4f4f"),
                    filled: true,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'CAREER OBJECTIVE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: mediaQuery.size.height * 0.02,
                // ),
                TextField(
                  controller: resumeProvider.careerObjectiveController,
                  minLines: 3,
                  maxLines: 5,
                  // cursorColor: HexColor("#4f4f4f"),
                  // keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: 'SUMMARY',
                    // fillColor: HexColor("#f0f3f1"),
                    contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),

                    // hintStyle: GoogleFonts.poppins(
                    //   fontSize: 15,
                    //   color: HexColor("#8d8d8d"),
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    // prefixIcon: prefixIcon,
                    // prefixIconColor: HexColor("#4f4f4f"),
                    filled: true,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text('Preview'),
              onPressed: () {
                resumeProvider.getOtherInfo();
                resumeProvider.getResumeDetails();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtherInfoScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
