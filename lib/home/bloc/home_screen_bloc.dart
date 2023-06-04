import 'package:doctor_app_assessment/home/network/model/doctor_data_model.dart';
import 'package:doctor_app_assessment/util/assets.dart';
import 'package:flutter/material.dart';

class HomeScreenBloc {
  List<DoctorDataModel> doctors = [
    new DoctorDataModel(
        doctorName: 'Dr. Gardner Pearson',
        doctorSpecialistaion: 'Heart Specialist',
        imgPath: '${Assets.doctor1}',
    detail: "Doctor Gardner Pearson is a reputed name in his field with more than 20 years of experience as a physician specialist. He did his Senior residency from GB Pant Hospital, New Delhi. His areas of expertise include Infectious diseases, Hypertension, Diabetes, Thyroid and Metabolic disorders. He has acquired his coaching in the field of diabetes from john Hopkins University, USA and University of Leicester, UK. The clinic has provisions for Echocardiography and a pharmacy. Dr Bhat is an experienced General physician in Ghaziabad, Diabetes Doctor in Sahibabad, Cardiologist in Shalimar Garden. Visit Harmukh Clinic if you are looking for a general physician near me or a Diabetes Doctor near me or Cardiologist near me.",
        experiences: '10 Yrs',
        patients: '100+',
        rating: '4.5'),
    new DoctorDataModel(
        doctorName: 'Dr. Rosa Williamson',
        doctorSpecialistaion: 'Skin Specialist',
        imgPath: '${Assets.doctor2}',
        detail: "Doctor Gardner Pearson is a reputed name in his field with more than 20 years of experience as a physician specialist. He did his Senior residency from GB Pant Hospital, New Delhi. His areas of expertise include Infectious diseases, Hypertension, Diabetes, Thyroid and Metabolic disorders. He has acquired his coaching in the field of diabetes from john Hopkins University, USA and University of Leicester, UK. The clinic has provisions for Echocardiography and a pharmacy. Dr Bhat is an experienced General physician in Ghaziabad, Diabetes Doctor in Sahibabad, Cardiologist in Shalimar Garden. Visit Harmukh Clinic if you are looking for a general physician near me or a Diabetes Doctor near me or Cardiologist near me.",
        experiences: '12 Yrs',
        patients: '400+',
        rating: '4.7'
    ),
    new DoctorDataModel(
        doctorName: 'Dr. Gardner Pearson',
        doctorSpecialistaion: 'Heart Specialist',
        imgPath: '${Assets.doctor3}',
        detail: "Doctor Gardner Pearson is a reputed name in his field with more than 20 years of experience as a physician specialist. He did his Senior residency from GB Pant Hospital, New Delhi. His areas of expertise include Infectious diseases, Hypertension, Diabetes, Thyroid and Metabolic disorders. He has acquired his coaching in the field of diabetes from john Hopkins University, USA and University of Leicester, UK. The clinic has provisions for Echocardiography and a pharmacy. Dr Bhat is an experienced General physician in Ghaziabad, Diabetes Doctor in Sahibabad, Cardiologist in Shalimar Garden. Visit Harmukh Clinic if you are looking for a general physician near me or a Diabetes Doctor near me or Cardiologist near me.",
        experiences: '15 Yrs',
        patients: '800+',
        rating: '4.8'
    ),
    new DoctorDataModel(
        doctorName: 'Dr. Rosa Williamson',
        doctorSpecialistaion: 'Skin Specialist',
        imgPath: '${Assets.doctor4}',
        detail: "Doctor Gardner Pearson is a reputed name in his field with more than 20 years of experience as a physician specialist. He did his Senior residency from GB Pant Hospital, New Delhi. His areas of expertise include Infectious diseases, Hypertension, Diabetes, Thyroid and Metabolic disorders. He has acquired his coaching in the field of diabetes from john Hopkins University, USA and University of Leicester, UK. The clinic has provisions for Echocardiography and a pharmacy. Dr Bhat is an experienced General physician in Ghaziabad, Diabetes Doctor in Sahibabad, Cardiologist in Shalimar Garden. Visit Harmukh Clinic if you are looking for a general physician near me or a Diabetes Doctor near me or Cardiologist near me.",
        experiences: '14 Yrs',
        patients: '700+',
        rating: '4.6'
    ),
  ];

  List<Map> categories = [
    {'icon': Icons.coronavirus, 'text': 'Covid 19'},
    {'icon': Icons.local_hospital, 'text': 'Hospital'},
    {'icon': Icons.car_rental, 'text': 'Ambulance'},
    {'icon': Icons.local_pharmacy, 'text': 'Pill'},
  ];
}

final homeScreenBloc = HomeScreenBloc();
