import 'package:flutter/material.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/model_data/user_model_data.dart';
import 'package:jobbox_app_daryl_sofia_gialolo/widgets/reusable_comps/item/group_header.dart';
import 'package:provider/provider.dart';

import '../../../../theme/icons.dart';

import '../../../reusable_comps/visual/icon_image.dart';
import '../../../reusable_comps/input/dynamic_text_field.dart';
import '../../../reusable_comps/item/file_item.dart';
import '../../../reusable_comps/input/text_field.dart';

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

  late UserModelData userModelData;

  // -- Actions --
  void onTapEditContactInfo() {
    setState(() {
      _isContactInfoEditing = !_isContactInfoEditing;
    });
  }

  void onTapEditEmploymentInfo() {
    setState(() {
      _isEmploymentInfoEditing = !_isEmploymentInfoEditing;
    });
  }

  // -- Lifecycle --
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userModelData = Provider.of<UserModelData>(context, listen: false);
      setState(() {
        _fullNameTextController.text = userModelData.fullName;
        _emailTextController.text = userModelData.emailAddress;
        _mobileNumberTextController.text = userModelData.mobileNumber;
      });
    });
  }

  // -- UI --
  @override
  Widget build(BuildContext context) {
    final userModelData = Provider.of<UserModelData>(context);

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
              GroupHeader(
                title: 'Contact Info',
                onTapEdit: onTapEditContactInfo,
              ),
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
              GroupHeader(
                title: 'Employment Information',
                onTapEdit: onTapEditEmploymentInfo,
              ),
              const SizedBox(height: 12),
              if (userModelData.selectedResume != null)
                FileItem(
                  title: 'Resume',
                  fileDocument: userModelData.selectedResume!,
                  isEditing: _isEmploymentInfoEditing,
                ),
              const SizedBox(height: 10),
              if (userModelData.selectedCoverLetter != null)
                FileItem(
                  title: 'Cover Letter',
                  fileDocument: userModelData.selectedCoverLetter!,
                  isEditing: _isEmploymentInfoEditing,
                ),
            ],
          ),
        ),
      ),
    );
  }
}