import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/app_palette.dart';
import 'package:food_ninja/core/widgets/form_field.dart';
import 'package:food_ninja/features/profile/utils/back_arrow.dart';

class CompleteProfile extends ConsumerStatefulWidget {
  const CompleteProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CompleteProfileState();
}

class _CompleteProfileState extends ConsumerState<CompleteProfile> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _mobileNumberController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.rightTopBg),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppPalette.darkScaffoldBackGroundTopGrad.withOpacity(0.69),
                  AppPalette.darkScaffoldBackGroundbottomGrad
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          backArrow(context),
          Positioned(
            top: 120,
            left: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fill in your bio to get\nstarted",
                  style: TextStyle(
                      fontSize: 25,
                      color: AppPalette.subTextColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "This data will be displayed in your account\nprofile for security",
                  style:
                      TextStyle(color: AppPalette.subTextColor, fontSize: 12),
                ),
                SizedBox(
                  height: 20,
                ),
                _nameFormField(_firstNameController, 'First Name'),
                SizedBox(
                  height: 15,
                ),
                _nameFormField(_lastNameController, 'Last Name'),
                SizedBox(
                  height: 15,
                ),
                _mobilePhoneFormField(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _nameFormField(TextEditingController controller, String hintText) {
    return CustomFormField(
      controller: controller,
      width: 347,
      height: 61,
      hintText: hintText,
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "First name field cannot be empty";
        }

        if (val.length < 3) {
          return "First name is too short";
        }
        return null;
      },
    );
  }

  _mobilePhoneFormField() {
    return CustomFormField(
      controller: _mobileNumberController,
      hintText: "Mobile Number",
      width: 347,
      height: 61,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number is required';
        } else if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
          return 'Enter a valid phone number';
        }
        return null;
      },
    );
  }
}
