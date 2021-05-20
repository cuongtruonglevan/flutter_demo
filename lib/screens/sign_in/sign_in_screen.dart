import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_demo/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_demo/shared/app_colors.dart';
import 'package:flutter_demo/shared/app_text_styles.dart';
import 'package:flutter_demo/shared/utils.dart';
import 'package:flutter_demo/shared/validators/email_validator.dart';
import 'package:flutter_demo/shared/validators/required_field_validator.dart';
import 'package:flutter_demo/shared/widgets/app_button.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(32.0),
                height: getSafeHeight(context),
                child: BlocProvider<SignInBloc>(
                  create: (_) =>
                      SignInBloc(authBloc: BlocProvider.of<AuthBloc>(context)),
                  child: Column(
                    children: [
                      Expanded(child: _buildHeader()),
                      Expanded(
                          flex: 2,
                          child: BlocBuilder<SignInBloc, SignInState>(
                              builder: (context, state) {
                            if (state is SignInInit) {
                              return _buildInputActions(context, state);
                            } else {
                              return const SizedBox();
                            }
                          })),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16.0),
          Expanded(
            child: Center(
              child: DefaultTextStyle(
                style: AppTextStyles.normalBold40
                    .copyWith(color: AppColors.primaryColor),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('FLUTTER DEMO'),
                    RotateAnimatedText('WELCOME'),
                    RotateAnimatedText('SIGN IN'),
                  ],
                  repeatForever: true,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Sign in Flutter Demo using your email address',
            textAlign: TextAlign.center,
            style: AppTextStyles.italicRegular16
                .copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildInputActions(BuildContext context, SignInInit state) {
    return Form(
      key: state.formKey,
      child: Column(
        children: [
          const SizedBox(height: 16.0),

          /// Email input field
          TextFormField(
            controller: state.emailController,
            enabled: !state.isLoading,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) => EmailValidator.validate(value!),
            decoration: getInputOutlineDecoration('Email'),
          ),

          const SizedBox(height: 16.0),

          /// Password input field
          TextFormField(
            controller: state.passwordController,
            enabled: !state.isLoading,
            obscureText: true,
            validator: (value) => RequiredFieldValidator.validate(value),
            decoration: getInputOutlineDecoration('Password'),
          ),

          Spacer(),

          Container(
            height: 1.0,
            color: AppColors.lineColor,
          ),

          const SizedBox(height: 40.0),

          /// Sign in button
          AppButton(
            label: 'SIGN IN',
            showLoading: true,
            disabled: state.isLoading,
            onPressed: () =>
                BlocProvider.of<SignInBloc>(context).add(DoSignInEvent()),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
