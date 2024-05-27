import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prectice/app/modules/Auth/controllers/auth_controller.dart';
import 'package:getx_prectice/app/routes/app_pages.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                initialValue: controller.email.value,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  controller.email.value = value!;
                },
              ),
              TextFormField(
                initialValue: controller.password.value,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  controller.password.value = value!;
                },
              ),
              const SizedBox(height: 20),
              Obx(() => ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.formKey.currentState!.save();
                        // Handle login logic with _email and _password
                        controller.login().then((value) {
                          if (value) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(content: Text('Logging in...')),
                              );
                            Get.toNamed(AppPages.INITIAL);
                          } else {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                    content: Text('Something going wrong!...')),
                              );
                          }
                        });
                      }
                    },
                    child: controller.loading.isTrue
                        ? const CircularProgressIndicator(
                            strokeWidth: 1,
                          )
                        : const Text('Login'),
                  )),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
