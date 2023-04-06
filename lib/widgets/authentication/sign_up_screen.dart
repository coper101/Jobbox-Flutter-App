import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/theme/types.dart';
import 'package:provider/provider.dart';

import '../reusable_comps/input/filled_button.dart';
import '../reusable_comps/input/text_field.dart';
import '../reusable_comps/input/circle_image_button.dart';
import '../../model_data/user_model_data.dart';
import '../../model_data/data.dart';

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
  void onTapLogin() {
    Navigator.pop(context);
  }

  void _onRegistered() {
    Navigator.pop(context);
  }

  // -- UI --
  @override
  Widget build(BuildContext context) {
    final userModelData = Provider.of<UserModelData>(context);
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        iconTheme: const IconThemeData().copyWith(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: FontFamilies.antourOne.name,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 34),
            CircleImageButon(
              title: 'Add Photo',
              onTap: () {},
            ),
            const SizedBox(height: 24),
            MyTextField(
              props: MyTextFieldProps(
                title: 'Email',
                placeholder: 'Enter email',
                controller: _emailTextController,
              ),
            ),
            const SizedBox(height: 24),
            MyTextField(
                props: MyTextFieldProps(
              title: 'New Password',
              placeholder: 'Enter new password',
              isMasked: true,
              controller: _newPasswordTextController,
            )),
            const SizedBox(height: 24),
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
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: onTapLogin,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomInset),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "By creating an account, you agree to Koko's",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Terms of Use',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          const Text(
                            'and',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
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
            )
          ],
        ),
      ),
    );
  }
}
