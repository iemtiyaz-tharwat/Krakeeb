part of 'otp_state.dart';

// حالات OTP
abstract class PhoneOtpState {}


class PhoneOtpInitial extends PhoneOtpState {}

//  التحميل (إرسال/تحقق)
class PhoneOtpLoading extends PhoneOtpState {}

// إرسال الكود بنجاح
class PhoneOtpSent extends PhoneOtpState {
}

//  التحقق من الكود بنجاح
class PhoneOtpVerified extends PhoneOtpState {

}

///  حدوث خطأ
class PhoneOtpError extends PhoneOtpState {
  final String message;

  PhoneOtpError({required this.message});
}
