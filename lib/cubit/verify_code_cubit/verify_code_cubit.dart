import 'package:asia_uz/core/imports/imports.dart';
import 'package:asia_uz/cubit/verify_code_cubit/verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState>{
  VerifyCodeCubit() : super(const VerifyCodeInitial());
}