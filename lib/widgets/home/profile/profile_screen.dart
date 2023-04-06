import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/input/dynamic_text_field.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/item/file_item.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/input/text_field.dart';

import '../../../theme/icons.dart';
import '../../reusable_comps/visual/icon_image.dart';

class ProfileScreen extends StatefulWidget {
  // -- Props --
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // -- States --
  final _fullNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _mobileNumberTextController = TextEditingController();

  bool _isContactInfoEditing = false;
  bool _isEmploymentInfoEditing = false;

  // -- Actions --
  void onTapEditContactInfo() {
    print('onTapEditContactInfo');
    setState(() {
      _isContactInfoEditing = !_isContactInfoEditing;
    });
  }

  void onTapEditEmploymentInfo() {
    print('onTapEditEmploymentInfo');
    setState(() {
      _isEmploymentInfoEditing = !_isEmploymentInfoEditing;
    });
  }

  // -- UI --
  Widget _header(BuildContext context, String title, VoidCallback onTapEdit) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: onTapEdit,
            splashColor: Colors.orange,
            child: Ink(
              color: Colors.transparent,
              width: 22,
              height: 22,
              child: MyIcon(
                icon: AppIcons.pen,
                length: 20,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomInset = mediaQuery.padding.bottom;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Your Profile',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(width: 8),
            MyIcon(
              icon: AppIcons.user,
              length: 24,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            const Spacer()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 21,
            right: 21,
            bottom: bottomInset + 24,
          ),
          width: double.infinity,
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              const SizedBox(height: 24),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundImage: AssetImage(AppImages.face.path),
                  ),
                  Positioned(
                    right: -2,
                    bottom: -2,
                    child: Container(
                      width: 32,
                      height: 32,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(28),
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      child: const MyIcon(
                        icon: AppIcons.plus,
                        color: Colors.white,
                        length: 18,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 28),
              _header(context, 'Contact Info', onTapEditContactInfo),
              const SizedBox(height: 12),
              DynamicTextField(
                isEditing: _isContactInfoEditing,
                props: MyTextFieldProps(
                  title: 'Full Name',
                  placeholder: 'Enter Full Name',
                  controller: _fullNameTextController,
                ),
              ),
              const SizedBox(height: 10),
              DynamicTextField(
                isEditing: _isContactInfoEditing,
                props: MyTextFieldProps(
                  title: 'Email',
                  placeholder: 'Enter Email',
                  controller: _emailTextController,
                ),
              ),
              const SizedBox(height: 10),
              DynamicTextField(
                isEditing: _isContactInfoEditing,
                props: MyTextFieldProps(
                  title: 'Mobile Number',
                  placeholder: 'Enter Mobile Number',
                  controller: _mobileNumberTextController,
                ),
              ),
              const SizedBox(height: 18),
              const Divider(),
              const SizedBox(height: 14),
              _header(
                context,
                'Employment Information',
                onTapEditEmploymentInfo,
              ),
              const SizedBox(height: 12),
              FileItem(
                title: 'Resume',
                fileName: 'My Resume.pdf',
                uploadDate: DateTime(2020, 6, 11),
                isEditing: _isEmploymentInfoEditing,
              ),
              const SizedBox(height: 10),
              FileItem(
                title: 'Cover Letter',
                fileName: 'My cover letter final.pdf',
                uploadDate: DateTime(2020, 6, 11),
                isEditing: _isEmploymentInfoEditing,
              )
            ],
          ),
        ),
      ),
    );
  }
}
