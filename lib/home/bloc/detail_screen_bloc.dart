import 'package:doctor_app_assessment/home/network/model/doctor_data_model.dart';
import 'package:doctor_app_assessment/home/network/model/time_slot_model.dart';
import 'package:doctor_app_assessment/util/app_logger.dart';
import 'package:doctor_app_assessment/util/string_constant.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

class DetailScreenBloc {
  BehaviorSubject<List<TimeSlotModel>> _timeSlotController =
      BehaviorSubject<List<TimeSlotModel>>.seeded([]);

  BehaviorSubject<List<TimeSlotModel>> get timeSlotController =>
      _timeSlotController;

  BehaviorSubject<String> _timeTextType =
      BehaviorSubject<String>.seeded('${stringConstant.morning}');

  BehaviorSubject<String> get timeTextType => _timeTextType;

  List<TimeSlotModel> timeSlots = [];

  DoctorDataModel? selectedDoctor;

  void setDoctorModel({DoctorDataModel? doctorDataModel}) {
    this.selectedDoctor = doctorDataModel;
  }

  DoctorDataModel? getSelectedDoctor() {
    return selectedDoctor;
  }

  void getSlotList() {
    DateTime now = DateTime.now();
    DateTime startTime = DateTime(now.year, now.month, now.day, 8, 0, 0);
    DateTime endTime = DateTime(now.year, now.month, now.day, 22, 0, 0);
    Duration step = Duration(minutes: 30);
    while (startTime.isBefore(endTime)) {
      DateTime timeIncrement = startTime.add(step);
      timeSlots.add(new TimeSlotModel(
          time24HourFormat: DateFormat.Hm().format(timeIncrement),
          time: convert24To12(DateFormat.Hm().format(timeIncrement)),
          isSelected: false));
      startTime = timeIncrement;
    }
    timeSlots.first.isSelected = true;
    _timeSlotController.add(timeSlots);
  }

  String convert24To12(String time) {
    final hourFormat = DateFormat('h');
    final minuteFormat = DateFormat('mm');
    final periodFormat = DateFormat('a');

    final timeSplit = time.split(':');
    final hour = int.parse(timeSplit[0]);
    final minute = int.parse(timeSplit[1]);

    final dateTime = DateTime(2022, 01, 01, hour, minute);

    final hourString = hourFormat.format(dateTime);
    final minuteString = minuteFormat.format(dateTime);
    final periodString = periodFormat.format(dateTime);

    return '$hourString:$minuteString $periodString';
  }

  onclickUpdateTimeSlotList({num? index}) {
    for (int i = 0; i < timeSlots.length; i++) {
      if (i == index) {
        timeSlots[i].isSelected = true;
        changeTheTimeText(timeSlotModel: timeSlots[i]);
      } else {
        timeSlots[i].isSelected = false;
      }
    }
    _timeSlotController.add(timeSlots);
  }

  changeTheTimeText({TimeSlotModel? timeSlotModel}) {
    List<String> timeList = timeSlotModel!.time24HourFormat!.split(':');
    if (timeSlotModel.time!.contains('${stringConstant.am}')) {
      _timeTextType.add('${stringConstant.morning}');
    } else {
      int hour = int.parse(timeList[0]);
      if (hour <= 16) {
        _timeTextType.add('${stringConstant.afternoon}');
      } else if (hour > 16 && hour < 20) {
        _timeTextType.add('${stringConstant.evening}');
      } else {
        _timeTextType.add('${stringConstant.night}');
      }
    }
  }
}

final detailScreenBloc = DetailScreenBloc();
