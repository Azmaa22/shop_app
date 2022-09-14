import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shop_app/business_logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:shop_app/business_logic/cubits/auth_cubit/auth_states.dart';
import 'package:shop_app/presentation/widgets/button.dart';
import 'package:shop_app/presentation/widgets/input.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';
import 'package:shop_app/utilities/navigation/route_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String name = 'name';
    const String email = 'email';
    const String password = 'password';
    const String phone = 'phone';
    final formKey = GlobalKey<FormBuilderState>();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is SignUpIsLoadedState) {
                Navigator.pushNamed(
                  context,
                  RouteManager.homeRoute,
                );
              }
            },
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
                    'Register',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'Register',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  state is SignUpIsErrorState
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.03,
                          ),
                          child: Text(
                            state.errorMsg,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 15.0,
                            ),
                          ),
                        )
                      : SizedBox(
                          height: size.height * 0.05,
                        ),
                  SizedBox(
                    height: size.height * 0.5,
                    child: FormBuilder(
                      key: formKey,
                      child: Column(
                        children: [
                          Input(
                            name: name,
                            placeholder: 'please enter your name',
                            icon: Icons.perm_identity,
                            label: 'name',
                            textInputType: TextInputType.name,
                            onChange: (value) {},
                            onValidate: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(
                                  errorText: 'you should enter your name',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
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
                          Input(
                            name: phone,
                            placeholder: 'please enter your phone',
                            icon: Icons.phone,
                            label: 'phone',
                            isPassword: false,
                            textInputType: TextInputType.phone,
                            onChange: (value) {},
                            onValidate: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(
                                  errorText: 'you should enter your phone',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          state is SignUpIsLoadingState
                              ? const CircularProgressIndicator(
                                  color: ColorManager.kPrimaryColor,
                                )
                              : Button(
                                  title: 'Register',
                                  onPress: () {
                                    formKey.currentState?.save();
                                    if (formKey.currentState!.validate()) {
                                      var user = formKey.currentState!.value;

                                      myCubit.registerToApp(
                                          userInfo: user,
                                          headers: {
                                            'lang': 'en',
                                          });
                                    } else {
                                      print("validation failed");
                                    }
                                  },
                                )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Do you already have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RouteManager.loginRoute,
                          );
                        },
                        child: const Text(
                          'Login Now!',
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
