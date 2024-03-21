import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganbooks/cubit/auth_cubit.dart';
import 'package:ganbooks/views/books_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthCubit(context.read()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Ganbooks',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 32),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.successLogin) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<Widget>(
                        builder: (context) => const BooksView(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AuthCubit>().authenticate(
                                  emailController.text,
                                  passwordController.text,
                                );
                          },
                          child: Text(state.isLogin ? 'Login' : 'Signup'),
                        ),
                      ),
                      if (state.error) const Text('Invalid email or password'),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          context.read<AuthCubit>().toggleLogin();
                        },
                        child: Text(
                          state.isLogin
                              ? "Don't have an account?"
                              : 'Already have an account?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
