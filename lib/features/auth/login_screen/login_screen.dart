// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_car/core/helper/navigation_extension.dart';
import 'package:go_car/core/routing/routes.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String completePhoneNumber = '';
  bool isPasswordVisible = false;
  bool isRememberMeChecked = false;

  // لوفي داتا في shared preferences   موجودة، جيبها وحطها في المتغيرات
  Future<void> checkDataInSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isRememberMeChecked = prefs.getBool('rememberMe') ?? false;
      // إذا كان "chexc button checked" مختار، جيب رقم التليفون و الباسوردالمحفوظ
      if (isRememberMeChecked) {
        completePhoneNumber = prefs.getString('phone') ?? '';
        passwordController.text = prefs.getString('password') ?? '';
        phoneController.text = completePhoneNumber;
      }
    });
  }

  //-- نادي علي الدالة في initState عشان تتأكد من وجود بيانات في shared preferences
  @override
  void initState() {
    super.initState();
    checkDataInSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 40.0.w, right: 16.w, left: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //------------------ logo and app name ------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/app_logo.svg',
                      width: 50.w,
                      height: 50.h,
                    ),
                    Text(
                      'Go Car',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF266FFF),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),

                //------------------ welcome text ------------------//
                Text(
                  'Hello Again!',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0D3244),
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  'Welcome back you\'ve been missed',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF475467),
                  ),
                ),
                SizedBox(height: 30.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //------------------ Phone Input Field ------------------//
                    Text(
                      'Phone Number',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF344054),
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
                        onChanged: (phone) {
                          setState(() {
                            completePhoneNumber = phone.completeNumber;
                          });
                          print(phone.completeNumber);
                          print(phone.number);
                          print(phone.countryCode);
                        },
                      ),
                    ),

                    //------------------ password ------------------//
                    Text(
                      'Password',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF344054),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      controller: passwordController,
                      obscureText: isPasswordVisible,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Password',
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
                    ),

                    //------------------ forgot password ------------------//
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF475467),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),

                    //------------------ rememper me ------------------//
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isRememberMeChecked,
                          onChanged: (value) async {
                            //--------- Save phone and password in shared preferences---//
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool(
                              'rememberMe',
                              isRememberMeChecked,
                            );
                            if (isRememberMeChecked) {
                              await prefs.setString(
                                'phone',
                                completePhoneNumber,
                              );
                              await prefs.setString(
                                'password',
                                passwordController.text,
                              );

                              print(prefs.getString('phone'));
                              print(prefs.getString('password'));
                            } else {
                              await prefs.remove('phone');
                              await prefs.remove('password');
                            }
                            setState(() {
                              isRememberMeChecked = value ?? false;
                            });
                          },
                          activeColor: const Color(0xFF266FFF),
                        ),
                        // SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Save my login details for next time.',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF667085),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //------------------- login button ------------------//
                    SizedBox(height: 30.h),
                    ElevatedButton(
                      onPressed: () {
                        context.pushNamed(Routes.home); 
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF266FFF),
                        minimumSize: Size(343.w, 48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    //------------------ dont have account ------------------//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to sign up screen
                          },
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF266FFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
