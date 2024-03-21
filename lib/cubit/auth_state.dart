part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.isLoading = false,
    this.isLogin = false,
    this.successLogin = false,
    this.error = false,
  });

  final bool isLoading;
  final bool isLogin;
  final bool successLogin;
  final bool error;

  AuthState copyWith({
    bool? isLoading,
    bool? isLogin,
    bool? successLogin,
    bool? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isLogin: isLogin ?? this.isLogin,
      successLogin: successLogin ?? this.successLogin,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isLogin,
        successLogin,
        error,
      ];
}
