import 'package:flutter/material.dart';
import 'package:wfm_mobile_app/common/constants/texts.dart';
import 'package:wfm_mobile_app/common/images/image_path.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: 125,
          child: Image.asset(AppImages.logo),
        ),
        const SizedBox(height: 25),
        const Text(
          logoText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          textAboutCompany,
          style: textStyle,
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
