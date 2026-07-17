import 'package:flutter/material.dart';
import 'package:flutter_chat/app/routes/app_routes.dart';
import 'package:flutter_chat/core/validators/validators.dart';
import 'package:flutter_chat/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_chat/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignInPage> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    ref.listenManual(
      authControllerProvider,
      (previous, next) {
        if (next is Logged) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logado com Sucesso!'),
              backgroundColor: Colors.green,
            ),
          );
          context.goNamed(AppRoutes.chat);
        }

        if (next is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    final loading = state is Loading;

    return Scaffold(
      appBar: AppBar(
        title: Text('Entre na sua conta'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Column(
                  spacing: 14,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Bem-vindo(a) de volta'),
                    TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                      decoration: InputDecoration(
                        hint: Text('E-mail'),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      validator: Validators.password,
                      obscureText: true,
                      decoration: InputDecoration(
                        hint: Text('Senha'),
                      ),
                    ),
                    BuildButton(
                      isLoading: loading,
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;

                        ref
                            .read(authControllerProvider.notifier)
                            .login(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                      },
                    ),
                    TextButton(
                      onPressed: () => context.goNamed(AppRoutes.register),
                      child: Text('Não tem uma conta ?'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : OutlinedButton(
            onPressed: onPressed,
            child: Text('ENTRAR'),
          );
  }
}
