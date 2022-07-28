import 'package:flutter/material.dart';
import 'package:wfm_mobile_app/common/widgets/notifier_provider.dart';
import 'package:wfm_mobile_app/features/auth/models/auth_model.dart';

import '../../../../common/styles/colors.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = NotifierProvider.of<AuthModel>(context)?.errorMassage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(fontSize: 17, color: errorColor),
      ),
    );
  }
}
