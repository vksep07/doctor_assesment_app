import 'package:doctor_app_assessment/home/network/model/doctor_data_model.dart';
import 'package:doctor_app_assessment/util/assets.dart';

class HomeScreenBloc
{
  List<DoctorDataModel> doctors = [
    new DoctorDataModel(doctorName:'Dr. Gardner Pearson',doctorSpecialistaion:'Heart Specialist',imgPath: '${Assets.doctor1}' ),
    new DoctorDataModel(doctorName:'Dr. Rosa Williamson',doctorSpecialistaion:'Skin Specialist',imgPath: '${Assets.doctor2}' ),
    new DoctorDataModel(doctorName:'Dr. Gardner Pearson',doctorSpecialistaion:'Heart Specialist',imgPath: '${Assets.doctor3}' ),
    new DoctorDataModel(doctorName:'Dr. Rosa Williamson',doctorSpecialistaion:'Skin Specialist',imgPath: '${Assets.doctor4}' ),
  ];




}

final homeScreenBloc= HomeScreenBloc();