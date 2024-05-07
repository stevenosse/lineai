import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/repositories/auth_repository.dart';
import 'package:lineai/src/shared/locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(LoginState.initial(email: '', password: ''));

  void onEmailChanged(String email) {
    emit(LoginState.initial(email: email, password: state.password));
  }

  void onPasswordChanged(String password) {
    emit(LoginState.initial(password: password, email: state.email));
  }

  void login() async {
    emit(LoginState.loading(email: state.email, password: state.password));
    final response = await _authRepository.login(email: state.email, password: state.password);

    response.when(
      success: (response) => emit(LoginState.success(email: state.email, password: state.password, response: response)),
      error: (error) => emit(LoginState.error(email: state.email, password: state.password, error: error)),
    );
  }
}
