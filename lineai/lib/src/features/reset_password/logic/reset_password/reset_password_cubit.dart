import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/repositories/auth_repository.dart';
import 'package:lineai/src/shared/locator.dart';

part 'reset_password_state.dart';
part 'reset_password_cubit.freezed.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository _authRepository;

  ResetPasswordCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(ResetPasswordState.initial(password: ''));

  void onPasswordChanged(String password) {
    emit(ResetPasswordState.initial(password: password));
  }

  void resetPassword() async {
    emit(ResetPasswordState.loading(password: state.password));

    final response = await _authRepository.resetPassword(password: state.password);
    response.when(
      success: (userResponse) => emit(ResetPasswordState.success(password: state.password)),
      error: (error) => emit(ResetPasswordState.error(password: state.password, error: error)),
    );
  }
}
