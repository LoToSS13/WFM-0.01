import 'package:flutter/material.dart';
import 'package:wfm_mobile_app/common/widgets/notifier_provider.dart';
import 'package:wfm_mobile_app/common/widgets/text_field_widget.dart';
import 'package:wfm_mobile_app/features/auth/models/auth_model.dart';
import 'package:wfm_mobile_app/features/auth/widgets/form/auth_button_widget.dart';
import 'package:wfm_mobile_app/features/auth/widgets/form/error_message.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.of<AuthModel>(context);
    return Column(
      children: [
        const ErrorMessageWidget(),
        TextFieldWidget(
          textEditingController: model?.loginTextController,
          iconData: Icons.account_circle,
          labelText: 'Login',
          isObscured: false,
        ),
        const SizedBox(height: 20),
        TextFieldWidget(
          textEditingController: model?.passwordTextController,
          iconData: Icons.lock,
          labelText: 'Password',
          isObscured: true,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthButtonWidget(model: model),
          ],
        ),
      ],
    );
  }
}
