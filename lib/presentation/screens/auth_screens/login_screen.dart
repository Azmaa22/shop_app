import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shop_app/business_logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:shop_app/business_logic/cubits/auth_cubit/auth_states.dart';
import 'package:shop_app/presentation/widgets/button.dart';
import 'package:shop_app/presentation/widgets/input.dart';
import 'package:shop_app/presentation/widgets/toast_bar.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';
import 'package:shop_app/utilities/constants/strings_manager.dart';
import 'package:shop_app/utilities/helpers/shared_preference_helper.dart';
import 'package:shop_app/utilities/navigation/route_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String email = 'email';
    const String password = 'password';
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
              if (state is SignInIsLoadedState) {
                ToastBar.show(
                  message: state.message,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                );
                SharedPreferenceHelper.saveData(
                        key: StringsManager.cachedLoginToken,
                        value: state.userData.token)
                    .then((value) {
                  if (value) {
                    Navigator.pushNamed(
                      context,
                      RouteManager.homeRoute,
                    );
                  }
                });
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
                    'Login',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'Login now to browse our hot offers',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  state is SignInIsErrorState
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
                    height: size.height * 0.3,
                    child: FormBuilder(
                      key: formKey,
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
                          state is SignInIsLoadingState
                              ? const CircularProgressIndicator(
                                  color: ColorManager.kPrimaryColor,
                                )
                              : Button(
                                  title: 'Login',
                                  onPress: () {
                                    formKey.currentState?.save();
                                    if (formKey.currentState!.validate()) {
                                      var user = formKey.currentState!.value;

                                      myCubit.loginToApp(
                                        userInfo: user,
                                        headers: {
                                          'lang': 'ar',
                                        },
                                      );
                                    } else {
                                      ToastBar.show(
                                        message:
                                            'please enter the user data to login',
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                      );
                                    }
                                  },
                                )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text('Don\'t have an account ? '),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RouteManager.registerRoute,
                          );
                        },
                        child: const Text(
                          'Register Now!',
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
