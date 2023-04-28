import 'package:flutter/cupertino.dart';
import 'package:resume_builder_app/models/education.dart';
import 'package:resume_builder_app/models/personalInfo.dart';

class ResumeProvider with ChangeNotifier {
  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var addressController = TextEditingController();
  var linkedInController = TextEditingController();

  var personalInfo = PersonalInfo(
      firstName: '',
      lastName: '',
      email: '',
      address: '',
      linkedIn: '',
      dateOfBirth: '');

  List<Education> educationList = [Education()];

  getPersonalInfo() {
    personalInfo = PersonalInfo(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      address: addressController.text,
      linkedIn: linkedInController.text,
      dateOfBirth: dateOfBirthController.text,
    );
    notifyListeners();
  }

  updateCollageName(String clgName, int index) {
    educationList[index].collageName = clgName;
    notifyListeners();
  }

  updateCourse(String course, int index) {
    educationList[index].course = course;
    notifyListeners();
  }

  updateEducationStartDate(DateTime startDate, int index) {
    educationList[index].startDate = startDate;
    notifyListeners();
  }

  updateEducationEndDate(DateTime endDate, int index) {
    var date = endDate;
    endDate = educationList[index].endDate = endDate;
    notifyListeners();
  }

  addEducation() {
    educationList.add(Education());
    notifyListeners();
  }

  removeEducation(int index) {
    educationList.removeAt(index);
    notifyListeners();
  }
}
