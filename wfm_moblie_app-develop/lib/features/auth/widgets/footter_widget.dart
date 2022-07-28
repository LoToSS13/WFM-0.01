import 'package:flutter/cupertino.dart';
import 'package:wfm_mobile_app/common/constants/texts.dart';
import 'package:wfm_mobile_app/common/styles/colors.dart';

class FootterWidget extends StatelessWidget {
  const FootterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 210),
        Text(
          version,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: secondaryColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
