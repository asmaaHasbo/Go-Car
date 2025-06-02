import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_car/core/helper/navigation_extension.dart';
import 'package:go_car/core/routing/routes.dart';
import 'package:go_car/core/shared/custom_elevated_btn.dart';
import 'package:go_car/core/shared/custom_text_field.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController invitationCodeController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confrimPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: const Text(
              'Personal info',
              style: TextStyle(
                color: Color(0xFF0D3244),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 40.0.w, right: 16.w, left: 16.w),
              child: Column(
                children: [
                  //---------------------  car  ---------------------
                  SizedBox(
                    height: 40.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 6.h,
                          width: 208.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFEAECF0),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: -12.h,
                          child: SvgPicture.asset('assets/svgs/car_line.svg'),
                        ),
                      ],
                    ),
                  ),

                  //---------------------  full name field ---------------------
                  CustomTextField(
                    controller: nameController,
                    fieldTitle: 'Full Name',
                  ),
                  SizedBox(height: 8.h),

                  //------------------ Phone Input Field ------------------
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Phone Number',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF344054),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 80.h,
                    child: IntlPhoneField(
                      controller: phoneController,
                      pickerDialogStyle: PickerDialogStyle(
                        countryNameStyle: TextStyle(color: Colors.black),
                        countryCodeStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      dropdownTextStyle: TextStyle(color: Colors.black),
                      dropdownDecoration: BoxDecoration(),
                      style: TextStyle(color: Colors.black),
                      autovalidateMode: AutovalidateMode.disabled,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFD0D5DD),
                            width: 1,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: Color(0xFFD0D5DD),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: Color(0xFFD0D5DD),
                            width: 1,
                          ),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      onChanged: (phone) {},
                    ),
                  ),

                  ///---------------------  invitation code field ---------------------
                  CustomTextField(
                    controller: invitationCodeController,
                    fieldTitle: 'invitation code',
                  ),

                  //---------------------  password field ---------------------
                  CustomTextField(
                    controller: passwordController,
                    fieldTitle: 'Password',
                    isTextScure: isPasswordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF98A2B3),
                      ),
                    ),
                  ),

                  //---------------------  confirm password field ---------------------
                  CustomTextField(
                    controller: confrimPasswordController,
                    fieldTitle: 'confirm Password',
                    isTextScure: isPasswordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF98A2B3),
                      ),
                    ),
                  ),

                  //---------------------  next button ---------------------
                  SizedBox(height: 36.h),
                  CustomElevatedBtn(
                    onPressed: () {
                      context.pushNamed(Routes.phoneNumberOtp);
                    },
                    btnName: 'Next',
                  ),

                  SizedBox(height: 36.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
