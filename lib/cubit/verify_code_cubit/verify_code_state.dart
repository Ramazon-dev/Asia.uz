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

class VerifyCodeValidateState extends VerifyCodeState{
  final bool isValidateState;
  const VerifyCodeValidateState(this.isValidateState);
}