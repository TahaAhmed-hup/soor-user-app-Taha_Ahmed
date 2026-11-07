enum OtpFlow {
  register,
  forgetPassword,
}

class OtpArguments {
  final String phone;
  final OtpFlow flow;

  const OtpArguments({
    required this.phone,
    required this.flow,
  });
}