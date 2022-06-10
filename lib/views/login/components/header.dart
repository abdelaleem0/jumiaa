import 'package:flutter/material.dart';
import 'package:jumiaa/views/login/widgets/loginImage.dart';
import 'package:jumiaa/widgets/loginText.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:jumiaa/widgets/textname.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoginImage(),
        TextLogin('LoginView.textnamebold'.tr(),"LoginView.textname".tr()),
      ],
    );
  }
}
