import 'package:flutter_task/modules/home_page/contains/settings/const/settings_page_ar_text.dart';
import 'package:flutter_task/modules/home_page/contains/settings/const/settings_page_text_key.dart';
import 'package:flutter_task/modules/sign_up_page/const/sign_up_ar_text.dart';
import 'package:flutter_task/modules/sign_up_page/contains/medical_info/const/medical_info_ar_text.dart';
import 'package:flutter_task/modules/sign_up_page/contains/personal_info/const/personal_info_ar_text.dart';
import 'package:flutter_task/modules/sign_up_page/contains/work_info/const/work_info_ar_text.dart';

import '../../modules/home_page/const/home_page_ar_text.dart';
import '../../modules/home_page/const/home_page_text_key.dart';
import '../../modules/sign_up_page/const/sign_up_text_key.dart';
import '../../modules/sign_up_page/contains/medical_info/const/mediacl_info_text_key.dart';
import '../../modules/sign_up_page/contains/personal_info/const/personal_info_text_key.dart';
import '../../modules/sign_up_page/contains/work_info/const/work_info_text_key.dart';

///Add the key and value that will be in Arabic
Map<String, String> arabic = {
  /// Like this 👇.
  SignUpTextKey.language: SignUpArText.language,
  SignUpTextKey.addImage: SignUpArText.addImage,
  SignUpTextKey.personalInfo: SignUpArText.personalInfo,
  SignUpTextKey.workInfo: SignUpArText.workInfo,
  SignUpTextKey.medicalInfo: SignUpArText.medicalInfo,
  SignUpTextKey.signUp: SignUpArText.signUp,


  PersonalInfoTextKey.fullName: PersonalInfoArText.fullName,
  PersonalInfoTextKey.yourId: PersonalInfoArText.yourId,
  PersonalInfoTextKey.passport: PersonalInfoArText.passport,
  PersonalInfoTextKey.gender: PersonalInfoArText.gender,
  PersonalInfoTextKey.female: PersonalInfoArText.female,
  PersonalInfoTextKey.male: PersonalInfoArText.male,
  PersonalInfoTextKey.dateOfBirth: PersonalInfoArText.dateOfBirth,
  PersonalInfoTextKey.personalAddress: PersonalInfoArText.personalAddress,
  PersonalInfoTextKey.city: PersonalInfoArText.city,
  PersonalInfoTextKey.selectYourCity: PersonalInfoArText.selectYourCity,
  PersonalInfoTextKey.region: PersonalInfoArText.region,
  PersonalInfoTextKey.selectYourRegion: PersonalInfoArText.selectYourRegion,
  PersonalInfoTextKey.mobile: PersonalInfoArText.mobile,
  PersonalInfoTextKey.email: PersonalInfoArText.email,
  PersonalInfoTextKey.password: PersonalInfoArText.password,
  PersonalInfoTextKey.confirmPassword: PersonalInfoArText.confirmPassword,

  WorkInfoTextKey.mainSpeciality: WorkInfoArText.mainSpeciality,
  WorkInfoTextKey.selectYourSpeciality: WorkInfoArText.selectYourSpeciality,
  WorkInfoTextKey.subSpeciality: WorkInfoArText.subSpeciality,
  WorkInfoTextKey.selectYourSubSpeciality: WorkInfoArText.selectYourSubSpeciality,
  WorkInfoTextKey.scientificDegree: WorkInfoArText.scientificDegree,
  WorkInfoTextKey.selectYourScientificDegree: WorkInfoArText.selectYourScientificDegree,
  WorkInfoTextKey.clinicName: WorkInfoArText.clinicName,
  WorkInfoTextKey.clinicAddress: WorkInfoArText.clinicAddress,
  WorkInfoTextKey.clinicPhone: WorkInfoArText.clinicPhone,
  WorkInfoTextKey.uploadCertificates: WorkInfoArText.uploadCertificates,
  WorkInfoTextKey.uploadPhoto: WorkInfoArText.uploadPhoto,
  WorkInfoTextKey.uploadLicense: WorkInfoArText.uploadLicense,
  WorkInfoTextKey.add: WorkInfoArText.add,

  MedicalInfoTextKey.pleaseAddDiagnosisIfAny:MedicalInfoArText.pleaseAddDiagnosisIfAny,
  MedicalInfoTextKey.pleaseAddPreviousOperationsIfAny:MedicalInfoArText.pleaseAddPreviousOperationsIfAny,
  MedicalInfoTextKey.pleaseAddMedicationsIfAny:MedicalInfoArText.pleaseAddMedicationsIfAny,
  MedicalInfoTextKey.describeYourConditionByVideo:MedicalInfoArText.describeYourConditionByVideo,
  MedicalInfoTextKey.describeYourConditionByVoice:MedicalInfoArText.describeYourConditionByVoice,

  HomePageTextKey.home:HomePageArText.home,
  HomePageTextKey.settings:HomePageArText.settings,
  HomePageTextKey.dashboard:HomePageArText.dashboard,
  HomePageTextKey.clinical:HomePageArText.clinical,
  HomePageTextKey.ovr:HomePageArText.ovr,
  HomePageTextKey.staffRisk:HomePageArText.staffRisk,
  HomePageTextKey.pcraIcra:HomePageArText.pcraIcra,
  HomePageTextKey.kpis:HomePageArText.kpis,

  SettingsPageTextKey.back:SettingsPageArText.back,
  SettingsPageTextKey.darkMode:SettingsPageArText.darkMode,
  SettingsPageTextKey.profile:SettingsPageArText.profile,
};
