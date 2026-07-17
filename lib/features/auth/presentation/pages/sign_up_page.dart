import 'package:flutter/material.dart';
import 'package:flutter_chat/app/routes/app_routes.dart';
import 'package:flutter_chat/core/validators/validators.dart';
import 'package:flutter_chat/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_chat/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordRepeatController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordRepeatController = TextEditingController();

    ref.listenManual(
      authControllerProvider,
      (previous, next) {
        if (next is Created) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Registrado com Sucesso!'),
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    final loading = state is Loading;

    return Scaffold(
      appBar: AppBar(
        title: Text('Crie sua conta'),
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
                    Text('Registre-se e se divirta!'),
                    TextFormField(
                      controller: _nameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      validator: Validators.required,
                      decoration: InputDecoration(
                        hint: Text('Nome'),
                      ),
                    ),
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
                      keyboardType: TextInputType.visiblePassword,
                      validator: Validators.password,
                      obscureText: true,
                      decoration: InputDecoration(
                        hint: Text('Senha'),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordRepeatController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value) {
                        return Validators.repeatPassword(
                          value,
                          _passwordController.text,
                        );
                      },
                      decoration: InputDecoration(
                        hint: Text('Repetir senha'),
                      ),
                    ),
                    BuildButton(
                      isLoading: loading,
                      onPressed: () {
                        if(!_formKey.currentState!.validate()) return;
                        
                        ref
                          .read(authControllerProvider.notifier)
                          .register(
                            name: _nameController.text.trim(),
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                      }
                    ),
                    TextButton(
                      onPressed: () => context.goNamed(AppRoutes.login),
                      child: Text('Já tem uma conta ?'),
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
            child: Text('CRIAR CONTA'),
          );
  }
}
