import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/colors.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/icons.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/types.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/navigation/top_bar.dart';
import 'package:provider/provider.dart';

import '../../reusable_comps/input/filled_button.dart';
import '../../reusable_comps/input/text_field.dart';
import '../../reusable_comps/input/circle_image_button.dart';
import '../../../model_data/user_model_data.dart';
import '../../../model_data/data.dart';

class SignUpScreen extends StatefulWidget {
  // -- Props --
  static const routeName = '/sign-up';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // -- States --
  final _emailTextController = TextEditingController(text: Users.user.email);
  final _newPasswordTextController =
      TextEditingController(text: Users.user.password);
  final _reTypePasswordTextController =
      TextEditingController(text: Users.user.password);

  // -- Actions --
  void onTapBack(BuildContext context) {
    Navigator.pop(context);
  }

  void onTapLogin() {
    Navigator.pop(context);
  }

  void _onRegistered() {
    Navigator.pop(context);
  }

  // -- UI --
  Widget _message(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Positioned(
      right: 0,
      left: 0,
      bottom: bottomInset,
      child: Container(
        height: 64,
        color: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "By creating an account, you agree to Koko's",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.brownDark.color,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0,
                  ),
            ),
            Container(
              height: 38,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Terms of Use',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Text(
                    'and',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.brownDark.color,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0,
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Privacy Policy',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  const Text(
                    '.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final userModelData = Provider.of<UserModelData>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: TopBar(
        dimissIcon: AppIcons.chevronLeft,
        centerTitle: 'Sign Up',
        onTapBack: () => onTapBack(context),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 18, right: 18, bottom: bottomInset),
          child: Column(
            children: [
              const SizedBox(height: 38),
              CircleImageButon(
                title: 'Add Photo',
                onTap: () {},
              ),
              const SizedBox(height: 20),
              MyTextField(
                props: MyTextFieldProps(
                  title: 'Email',
                  placeholder: 'Enter email',
                  controller: _emailTextController,
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                  props: MyTextFieldProps(
                title: 'New Password',
                placeholder: 'Enter new password',
                isMasked: true,
                controller: _newPasswordTextController,
              )),
              const SizedBox(height: 20),
              MyTextField(
                  props: MyTextFieldProps(
                title: 'Re-type Password',
                placeholder: 'Enter password again',
                isMasked: true,
                isMaskedDisabled: true,
                controller: _reTypePasswordTextController,
              )),
              const SizedBox(height: 54),
              MyFilledButton(
                title: 'Create Account',
                onTap: () => {
                  userModelData.register(
                    _emailTextController.text,
                    _newPasswordTextController.text,
                    _reTypePasswordTextController.text,
                    _onRegistered,
                  )
                },
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.brownDark.color,
                        ),
                  ),
                  TextButton(
                    onPressed: onTapLogin,
                    child: Text(
                      'Log In',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
        _message(context),
      ]),
    );
  }
}
