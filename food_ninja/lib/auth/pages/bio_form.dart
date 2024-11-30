import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/auth/bloc/user_update_bloc.dart';
import 'package:food_ninja/auth/widgets/auth_field.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/widgets/button.dart';
import 'package:food_ninja/splash/squash_page/on_boarding_page.dart';

class BioForm extends StatefulWidget {
  const BioForm({super.key});

  @override
  State<BioForm> createState() => _BioFormState();
}

class _BioFormState extends State<BioForm> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _mobileNumber.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.only(left: 5),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Color(0xFFF9A84D).withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFFF9012),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(AppVectors.bg_2),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Fill in your bio to get\nstarted",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "This data will be displayed in your account\nprofile for security",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    _nameField(_firstName, "First Name"),
                    SizedBox(
                      height: 20,
                    ),
                    _nameField(_lastName, "Last Name"),
                    SizedBox(
                      height: 20,
                    ),
                    _phoneNumberField(),
                    SizedBox(
                      height: 100,
                    ),
                    Button(
                        width: 157,
                        height: 57,
                        text: "Next",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<UserUpdateBloc>().add(
                                UpdateUserProfile(
                                    firstName: _firstName.text.trim(),
                                    lastName: _lastName.text.trim(),
                                    phoneNumber: _mobileNumber.text.trim(),
                                    userId: userId));
                          }
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameField(TextEditingController controller, String hint) {
    return AuthField(
        text: controller,
        hintText: hint,
        validator: (value) {
          if (value!.isEmpty) {
            return "First Name Field is empty";
          }

          if (value.length < 3) {
            return "First Name is too short";
          }
        });
  }

  Widget _phoneNumberField() {
    return AuthField(
        text: _mobileNumber, hintText: "Mobile Number", validator: (value) {});
  }
}
