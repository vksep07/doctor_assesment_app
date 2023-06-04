import 'package:doctor_app_assessment/common/services/navigation_service.dart';
import 'package:doctor_app_assessment/home/bloc/detail_screen_bloc.dart';
import 'package:doctor_app_assessment/home/network/model/doctor_data_model.dart';
import 'package:doctor_app_assessment/home/network/model/time_slot_model.dart';
import 'package:doctor_app_assessment/util/app_logger.dart';
import 'package:doctor_app_assessment/util/assets.dart';
import 'package:doctor_app_assessment/util/colors.dart';
import 'package:doctor_app_assessment/util/common_widgets/app_text_widget.dart';
import 'package:doctor_app_assessment/util/common_widgets/custom_calendar.dart';
import 'package:doctor_app_assessment/util/common_widgets/extensions.dart';
import 'package:doctor_app_assessment/util/readmore.dart';
import 'package:doctor_app_assessment/util/string_constant.dart';
import 'package:flutter/material.dart';

class DoctorDetailScreen extends StatefulWidget {
  DoctorDataModel? doctorDataModel;

  DoctorDetailScreen({Key? key, this.doctorDataModel}) : super(key: key);

  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  void initState() {
    detailScreenBloc.getSlotList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Stack(
            children: [
              /***** Back Button *****/
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        appNavigationService.pop();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.20),
                            borderRadius:
                                new BorderRadius.all(const Radius.circular(50)),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 24,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                ),
              ),

              /***** Center title *****/
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: AppTextWidget(
                    text: '${stringConstant.doctor_detail_screen}',
                    size: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Container(
                  color: AppColors.primary,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Stack(children: [
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          child: SingleChildScrollView(
                            child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        130.heightBox,
                                        DoctorInfo(),
                                        20.heightBox,
                                        HeadingText(headText: "${stringConstant.about_doctor}"),
                                        10.heightBox,
                                        ReadMoreText(
                                          ' ${detailScreenBloc.getSelectedDoctor()?.detail}',
                                          trimLines: 2,
                                          colorClickableText: Colors.blue,
                                          style: TextStyle(color: Colors.black),
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: '${stringConstant.show_more}',
                                          trimExpandedText: '${stringConstant.show_less}',
                                          moreStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        20.heightBox,
                                        HeadingText(
                                            headText:
                                                stringConstant.select_schedule),
                                        10.heightBox,
                                        Calendar(),
                                        20.heightBox,
                                        StreamBuilder<String>(
                                          stream: detailScreenBloc.timeTextType,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData &&
                                                snapshot.data!.isNotEmpty) {
                                              return AppTextWidget(
                                                text: "${snapshot.data}",
                                                color: Colors.grey
                                                    .withOpacity(0.8),
                                                size: 16,
                                                fontWeight: FontWeight.w800,
                                              );
                                            }
                                            return 10.heightBox;
                                            ;
                                          },
                                        ),
                                        20.heightBox,
                                        StreamBuilder<List<TimeSlotModel>>(
                                          stream: detailScreenBloc
                                              .timeSlotController,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData &&
                                                snapshot.data!.isNotEmpty) {
                                              return SizedBox(
                                                height: 40,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        snapshot.data!.length ??
                                                            0,
                                                    itemBuilder:
                                                        ((context, index) {
                                                      TimeSlotModel? model =
                                                          snapshot.data![index];

                                                      return SlotSelectionItem(
                                                        time: model.time,
                                                        isSelected:
                                                            model.isSelected ??
                                                                false,
                                                        isBooked:
                                                            model.isSelected ??
                                                                false,
                                                        onClick: () {
                                                          detailScreenBloc
                                                              .onclickUpdateTimeSlotList(
                                                                  index: index);
                                                        },
                                                      );
                                                    })),
                                              );
                                            }
                                            return SizedBox();
                                          },
                                        ),
                                      ]),
                                )),
                          ),
                        ),
                        Column(
                          children: [
                            10.heightBox,
                            Container(
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 48,
                                      backgroundImage:
                                          AssetImage('${detailScreenBloc.getSelectedDoctor()?.imgPath}'),
                                    ),
                                  )),
                            ),
                            AppTextWidget(
                              text: "${detailScreenBloc.getSelectedDoctor()?.doctorName}",
                              size: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            5.heightBox,
                            AppTextWidget(
                              text: "${detailScreenBloc.getSelectedDoctor()?.doctorSpecialistaion}",
                              size: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.withOpacity(0.70),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class HeadingText extends StatelessWidget {
  String? headText;

  HeadingText({this.headText});

  @override
  Widget build(BuildContext context) {
    return AppTextWidget(
      text: '$headText',
      size: 24,
      fontWeight: FontWeight.bold,
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Row(
        children:  [
          NumberCard(
            label: stringConstant.patients,
            value: '${detailScreenBloc.getSelectedDoctor()?.patients}',
          ),
          SizedBox(width: 15),
          NumberCard(
            label: '${stringConstant.experiences}',
            value: '${detailScreenBloc.getSelectedDoctor()?.experiences}',
          ),
          SizedBox(width: 15),
          NumberCard(
            label: '${stringConstant.rating}',
            value: '${detailScreenBloc.getSelectedDoctor()?.rating}',
          ),
        ],
      ),
    );
  }
}

class NumberCard extends StatelessWidget {
  final String label;
  final String value;

  const NumberCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue.withOpacity(0.07),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlotSelectionItem extends StatelessWidget {
  String? time;
  bool? isSelected;
  bool? isBooked;
  Function? onClick;

  SlotSelectionItem(
      {required this.time, this.isSelected, this.isBooked, this.onClick});

  @override
  Widget build(BuildContext context) {
    AppLogger.printLog('SlotSelectionItem -- $time');
    return InkWell(
      onTap: () {
        if (onClick != null) {
          onClick!();
        }
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: (() {
            if (isSelected ?? false) {
              return AppColors.primary;
            }
            return Colors.blue.withOpacity(0.07);
          }()),
        ),
        margin: EdgeInsets.only(left: 5, right: 5),
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: Center(
            child: AppTextWidget(
          text: time!,
          color: (() {
            if (isSelected ?? false) {
              return Colors.white;
            }
            return Colors.black;
          }()),
          fontWeight: FontWeight.w700,
        )),
      ),
    );
  }
}
