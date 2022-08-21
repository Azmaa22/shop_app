import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shop_app/business_logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:shop_app/business_logic/cubits/auth_cubit/auth_states.dart';
import 'package:shop_app/data/enums/auth_enum.dart';
import 'package:shop_app/presentation/widgets/button.dart';
import 'package:shop_app/presentation/widgets/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // AuthFormType formType = AuthFormType.login;
  // bool isLoginForm = true;
  final String email = 'email';
  final String password = 'password';
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: SingleChildScrollView(
          child: BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              AuthCubit myCubit = AuthCubit.get(context);
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Text(
                    myCubit.isLoginForm ? 'Login' : 'Register',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    myCubit.isLoginForm
                        ? 'Login now to browse our hot offers'
                        : 'Register',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  SizedBox(
                    height: size.height * 0.3,
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          Input(
                            name: email,
                            placeholder: 'please enter your email',
                            icon: Icons.email,
                            label: 'email',
                            textInputType: TextInputType.emailAddress,
                            onChange: (value) {},
                            onValidate: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(
                                  errorText: 'you should enter your email',
                                ),
                                FormBuilderValidators.email(
                                  errorText: 'you should enter valid email',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Input(
                            name: password,
                            placeholder: 'please enter your password',
                            icon: Icons.lock,
                            label: 'password',
                            isPassword: true,
                            textInputType: TextInputType.visiblePassword,
                            onChange: (value) {},
                            onValidate: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(
                                  errorText: 'you should enter your password',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Button(
                            title: myCubit.isLoginForm ? 'Login' : 'Register',
                            onPress: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        myCubit.isLoginForm
                            ? 'Don\'t have an account ? '
                            : 'Do you already have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          if (myCubit.isLoginForm) {
                            myCubit.changeFormType(
                              AuthFormType.register,
                            );
                          } else {
                            myCubit.changeFormType(
                              AuthFormType.login,
                            );
                          }
                        },
                        child: Text(
                          myCubit.isLoginForm ? 'Register Now!' : 'Login Now!',
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
