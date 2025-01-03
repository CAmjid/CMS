import 'package:c_m_s_report_labortary/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';

class DentalTestAdd extends StatelessWidget {
  const DentalTestAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(
            height: 18,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEAF8FF),
            ),
            child: Icon(Icons.chevron_left_outlined),
          ),
          centerTitle: true,
          title: Text(
            "Dental Test",
            style: AppTextStyles.blackBodyText1,
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
