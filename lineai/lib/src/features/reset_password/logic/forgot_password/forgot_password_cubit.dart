import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/repositories/auth_repository.dart';
import 'package:lineai/src/shared/locator.dart';

part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(const ForgotPasswordState.initial(email: ''));

  void onEmailChanged(String email) => emit(ForgotPasswordState.initial(email: email));

  void submit() async {
    emit(ForgotPasswordState.loading(email: state.email));

    final response = await _authRepository.sendPasswordReset(email: state.email);
    response.when(
      success: (_) => emit(ForgotPasswordState.success(email: state.email)),
      error: (error) => emit(ForgotPasswordState.error(email: state.email, error: error)),
    );
  }
}
