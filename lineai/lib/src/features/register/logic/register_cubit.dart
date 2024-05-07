import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/datasource/repositories/auth_repository.dart';
import 'package:lineai/src/shared/locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(RegisterState.initial(email: '', password: ''));

  void onEmailChanged(String email) {
    emit(RegisterState.initial(email: email, password: state.password));
  }

  void onPasswordChanged(String password) {
    emit(RegisterState.initial(password: password, email: state.email));
  }

  void register() async {
    emit(RegisterState.loading(email: state.email, password: state.password));

    final response = await _authRepository.signUp(email: state.email, password: state.password);

    response.when(
      success: (response) =>
          emit(RegisterState.success(email: state.email, password: state.password, response: response)),
      error: (error) => emit(RegisterState.error(email: state.email, password: state.password, error: error)),
    );
  }
}
