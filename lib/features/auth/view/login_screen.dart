import '../../../core/router/export.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            LoginEvent(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            showSnackBar(state.message ?? AppStrings.loginSuccessful, SnackType.success);
            NavigationService().pushNamedReplacement(HomeScreen.id);
          } else if (state.status == AuthStatus.error) {
            showSnackBar(state.message ?? AppStrings.loginFailed, SnackType.failed);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 60.h),
                    Text(
                      AppStrings.login,
                      style: FontStyles.headline1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Welcome back! Please login to continue.',
                      style: FontStyles.body1.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40.h),

                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: AppStrings.email,
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppValidationStrings.emailRequired;
                        }
                        if (!value.contains('@')) {
                          return AppValidationStrings.invalidEmailFormat;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),

                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: AppStrings.password,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextFieldValidationString.passwordRequired;
                        }
                        if (value.length < 6) {
                          return TextFieldValidationString.passwordMustBeAtLeast8Characters;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.h),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          NavigationService().pushNamed(
                            ForgotPasswordScreen.id,
                          );
                        },
                        child: Text(AppStrings.forgotPassword),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Login Button
                    ElevatedButton(
                      onPressed: state.status == AuthStatus.loading ? null : _handleLogin,
                      child: state.status == AuthStatus.loading ? const CircularProgressIndicator() : Text(AppStrings.login),
                    ),
                    SizedBox(height: 16.h),

                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.dontHaveAccount,
                          style: FontStyles.body2,
                        ),
                        TextButton(
                          onPressed: () {
                            // NavigationService().pushNamed(RegisterScreen.id);
                          },
                          child: Text(AppStrings.signUp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
