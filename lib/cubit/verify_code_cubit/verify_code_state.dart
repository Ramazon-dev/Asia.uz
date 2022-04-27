abstract class VerifyCodeState{
  const VerifyCodeState();
}

class VerifyCodeInitial extends VerifyCodeState{
  const VerifyCodeInitial();
}

class VerifyCodeLoading extends VerifyCodeState{
  const VerifyCodeLoading();
}

class VerifyCodeError extends VerifyCodeState{
  final String errorMessage;
  const VerifyCodeError(this.errorMessage);
}