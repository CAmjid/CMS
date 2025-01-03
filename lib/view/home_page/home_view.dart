import 'package:c_m_s_report_labortary/utils/constants/color_string.dart';
import 'package:c_m_s_report_labortary/utils/constants/text_styles.dart';
import 'package:c_m_s_report_labortary/widgets/custom_responsive_text.dart';
import 'package:c_m_s_report_labortary/widgets/image_view_widget.dart';

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({super.key});
  final AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        decoration: BoxDecoration(
            color: colors.primaryColor,
            image: DecorationImage(image: AssetImage('assets/images/bg1.png'))),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: colors.primaryColor,
                      shape: CircleBorder()),
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Patient Details",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                children: [
                  ImageView(
                    imageSource:
                        "https://imgs.search.brave.com/StlxyBoQ0njPZKEq3Y0eOAO_fMzK-NeceVXKMiXvBR8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAxLzY2LzM5LzU0/LzM2MF9GXzE2NjM5/NTQwMl9VY2JhUzVa/NVRqMXJFYk12emhI/UjFVN0RwQ2dDV2Qz/ci5qcGc",
                    imageHeight: 60,
                    imageWidth: 60,
                    isCircularImage: true,
                  ),
                  // CircleAvatar(
                  //   radius: 30,
                  //   backgroundColor: Colors.white,
                  //   child: CircleAvatar(
                  //     radius: 25,
                  //     backgroundColor: Colors.white,
                  //     backgroundImage: NetworkImage(
                  //         "https://imgs.search.brave.com/StlxyBoQ0njPZKEq3Y0eOAO_fMzK-NeceVXKMiXvBR8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAxLzY2LzM5LzU0/LzM2MF9GXzE2NjM5/NTQwMl9VY2JhUzVa/NVRqMXJFYk12emhI/UjFVN0RwQ2dDV2Qz/ci5qcGc"),
                  //   ),
                  // ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomResponsiveText(
                        text: "Mohammed Anees",
                        style: AppTextStyles.whiteAppBarTitle,
                      ),
                      CustomResponsiveText(
                        text: "Male | 39 years old | +9876543210",
                        style: AppTextStyles.whiteAppBarTitle,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View Details",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.blue.shade900,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: size.width * 0.15,
            ),
          ],
        ));
  }
}

class PatientDetailsTabBar extends StatelessWidget {
  PatientDetailsTabBar({super.key});
  final AppColors colors = AppColors();
  final List<String> tabs = [
    "General",
    "Appointment",
    "Clinic notes",
  ];
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        SizedBox(
          width: size.width,
          height: 35,
          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    width: 16,
                  ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                String current = tabs[index];
                return Container(
                  decoration: BoxDecoration(
                      color: index == 0 ? colors.primaryColor : Colors.white),
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: size.width * 0.03),
                  child: Text(
                    current,
                    style: TextStyle(
                        color: index == 0 ? Colors.white : Colors.black45),
                  ),
                );
              }),
        ),
        Expanded(
            child: ValueListenableBuilder(
                valueListenable: currentIndex,
                builder: (context, val, _) {
                  return Container();
                }))
      ],
    );
  }
}
