// import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krakeeb/core/utils/constants/app_colors.dart';
import '../cubit/otp_cubit.dart';
import '../widgets/otp_input_fields.dart';

class PhoneOtpScreen extends StatefulWidget {
  final String phoneNumber;

  const PhoneOtpScreen({super.key, required this.phoneNumber});

  @override
  State<PhoneOtpScreen> createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<PhoneOtpScreen> {
  late Timer _timer;
  int _secondsRemaining = 59;
  String _enteredCode = "";

  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  void _startTimer() {
    _secondsRemaining = 59;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String maskedPhone(String phone) {
  if (phone.length < 4) return phone;
  final visible = phone.substring(phone.length - 3);
  return '***$visible';
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: BlocConsumer<PhoneOtpCubit, PhoneOtpState>(
            listener: (context, state) {
              if (state is PhoneOtpError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is PhoneOtpVerified) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Code successfully verified!')),
                );
                Navigator.pop(context, true); // نرجع ومعانا result = true
              }
            },
            builder: (context, state) {
              if (state is PhoneOtpLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              // width: 10.w,
                              // height: 48.h,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xff04332D),
                                size: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            //SizedBox(width: 10.w),
                            Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff04332D),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Otama-ep',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 17.h),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'OTP Verification',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff04332D),
                              fontFamily: 'Otama-ep',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 8.w,),
                      Text(
                        'We sent a 5-digit code to ${maskedPhone(widget.phoneNumber)}',
                        style: TextStyle(fontSize: 14.sp, color: const Color.fromARGB(255, 126, 123, 123)),
                        
                      ),
                    ],
                  ),
                    ],
                  ),

                  

                  SizedBox(height: 54.h),

                  OtpInputFields(
                    onCompleted: (code) {
                      setState(() {
                        _enteredCode = code;
                      });
                    },
                  ),

                   SizedBox(height: 41.h),
                   SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff009639),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _enteredCode.isEmpty
                          ? null
                          : () {
                              context
                                  .read<PhoneOtpCubit>()
                                  .verifyOtp(widget.phoneNumber);
                            },
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: _secondsRemaining > 0
                        ? Text(
                            'Resend Code in 00:${_secondsRemaining.toString().padLeft(2, '0')}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff180901),
                            ),
                          )
                        : TextButton(
                            onPressed: () {
                              context.read<PhoneOtpCubit>().sendOtp(widget.phoneNumber);
                              _startTimer();
                            },
                            child: const Text(
                              "Resend Code",
                              style: TextStyle(color: Color(0xff180901)),
                            ),
                          ),),
                            SizedBox(height: 16.h),
                          Center(
                    
                          ),
                  
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
// appBar: AppBar(
//         title: Text(
//           'Verify OTP',
//           style: TextStyle(fontSize: 20.sp),
//         ),
//       ),
     