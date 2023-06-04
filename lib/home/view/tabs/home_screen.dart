import 'package:doctor_app_assessment/common/routes/routes.dart';
import 'package:doctor_app_assessment/common/services/navigation_service.dart';
import 'package:doctor_app_assessment/home/bloc/detail_screen_bloc.dart';
import 'package:doctor_app_assessment/home/bloc/home_screen_bloc.dart';
import 'package:doctor_app_assessment/home/network/model/doctor_data_model.dart';
import 'package:doctor_app_assessment/util/assets.dart';
import 'package:doctor_app_assessment/util/colors.dart';
import 'package:doctor_app_assessment/util/common_widgets/app_text_widget.dart';
import 'package:doctor_app_assessment/util/common_widgets/extensions.dart';
import 'package:doctor_app_assessment/util/string_constant.dart';
import 'package:doctor_app_assessment/util/styles/styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final void Function() onPressedScheduleCard;

  const HomeScreen({
    Key? key,
    required this.onPressedScheduleCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: AppColors.grey.withOpacity(0.1),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            20.heightBox,
            UserIntro(),
            10.heightBox,
            SearchInput(),
            20.heightBox,
            CategoryIcons(),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextWidget(
                  text: '${stringConstant.appointment_today}',
                  fontWeight: FontWeight.bold,
                  size: 20,
                ),
                AppTextWidget(
                  text: '${stringConstant.see_all}',
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  size: 16,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AppointmentCard(
              onTap: onPressedScheduleCard,
            ),
            20.heightBox,
            Row(
              children: [
                AppTextWidget(
                  text: '${stringConstant.top_doctor}',
                  fontWeight: FontWeight.bold,
                  size: 20,
                ),
                Spacer(),
                AppTextWidget(
                  text: '${stringConstant.see_all}',
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  size: 16,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            for (DoctorDataModel doctor in homeScreenBloc.doctors)
              TopDoctorCard(
                img: doctor.imgPath!,
                doctorName: doctor.doctorName!,
                doctorTitle: doctor.doctorSpecialistaion!,
                doctorDataModel: doctor,
              )
          ],
        ),
      ),
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  String img;
  String doctorName;
  String doctorTitle;
  DoctorDataModel? doctorDataModel;

  TopDoctorCard({
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
    this.doctorDataModel
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          detailScreenBloc.setDoctorModel(doctorDataModel: doctorDataModel);
          appNavigationService.pushNamed(Routes.doctor_detail_screen,arguments:doctorDataModel);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    width: 80,
                    height: 80,
                    image: AssetImage(img),
                  )),
              10.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                    text: doctorName,
                    color: Color(AppColors.header01),
                    fontWeight: FontWeight.w700,
                    size: 18,
                  ),
                  5.heightBox,
                  AppTextWidget(
                    text: doctorTitle,
                    color: Color(AppColors.grey02),
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  5.heightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(AppColors.yellow02),
                        size: 18,
                      ),
                      5.widthBox,
                      AppTextWidget(
                        text: '${stringConstant.reviews}',
                        color: Color(AppColors.grey02),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(Assets.doctor1),
                        ),
                        Spacer(),
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
                                      borderRadius: new BorderRadius.all(
                                          const Radius.circular(50)),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.chat_sharp,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.heightBox,
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextWidget(
                              text: '${stringConstant.dummy_name}',
                              color: AppColors.white,
                              size: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            2.heightBox,
                            AppTextWidget(
                                text: stringConstant.dental_specialist,
                                size: 14,
                                color: Color(AppColors.text01)),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextWidget(
                              text: '${stringConstant.dummy_time}',
                              color: AppColors.white,
                              size: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            2.heightBox,
                            AppTextWidget(
                              text: '${stringConstant.dummy_date}',
                              color: Color(AppColors.text01),
                              size: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ],
                    ),
                    20.heightBox,
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(AppColors.bg02),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(AppColors.bg03),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var category in homeScreenBloc.categories)
          CategoryIcon(
            icon: category['icon'],
            text: category['text'],
          ),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  IconData icon;
  String text;

  CategoryIcon({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(AppColors.bg01),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AppTextWidget(
              text: text,
              color: AppColors.primary,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: Color(AppColors.purple02),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '${stringConstant.search_a_doctor_or_heath_issue}',
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(AppColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserIntro extends StatelessWidget {
  UserIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
              text: '${stringConstant.hello} ${stringConstant.name}',
              fontWeight: FontWeight.bold,
              size: 20,
            ),
            10.heightBox,
            AppTextWidget(
              text: '${stringConstant.how_do_you_feel_today}',
              fontWeight: FontWeight.bold,
              color: Colors.grey.withOpacity(0.5),
              size: 16,
            ),
          ],
        ),
        CircleAvatar(
          backgroundImage: AssetImage(Assets.doctor1),
        )
      ],
    );
  }
}
