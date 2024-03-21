import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganbooks/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._authRepository,
  ) : super(const AuthState());

  final AuthRepository _authRepository;

  void login(String email, String password) {
    emit(state.copyWith(isLoading: true));
    final isLogin = _authRepository.login(email, password);
    emit(
      state.copyWith(
        isLoading: false,
        successLogin: isLogin,
        error: !isLogin,
      ),
    );
  }

  void signup(String email, String password) {
    emit(state.copyWith(isLoading: true));
    _authRepository.signup(email, password);
    emit(state.copyWith(isLoading: false, successLogin: true));
  }

  void authenticate(String email, String password) {
    if (state.isLogin) {
      login(email, password);
    } else {
      signup(email, password);
    }
  }

  void toggleLogin() {
    emit(state.copyWith(isLogin: !state.isLogin, successLogin: false));
  }
}
