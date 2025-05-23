import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';
import 'package:greengrocer/src/auth/sign_up_screen.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Nome do app
                  Text.rich(
                    TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                              text: "Green",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: "grocer",
                              style: TextStyle(
                                color: CustomColors.customContrastColor,
                              )),
                        ]),
                  ),
                  //Categorias
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 25),
                      child: AnimatedTextKit(
                          repeatForever: true,
                          pause: Duration.zero,
                          animatedTexts: [
                            FadeAnimatedText("Frutas"),
                            FadeAnimatedText("Verduras"),
                            FadeAnimatedText("Legumes"),
                            FadeAnimatedText("Carnes")
                          ]),
                    ),
                  )
                ],
              )),

              // Formulário
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Email input
                      const CustomTextField(label: "Email", icon: Icons.email),

                      //Senha input
                      const CustomTextField(
                        label: "Senha",
                        icon: Icons.lock,
                        isSecret: true,
                      ),

                      // Botão de entrar
                      SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ))),

                      // Esqueceu a senha
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                  color: CustomColors.customContrastColor),
                            )),
                      ),

                      // Divisor
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text("Ou"),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Botão de novo usuário
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                side: const BorderSide(
                                    width: 2, color: Colors.green)),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (c) {
                                return SignUpScreen();
                              }));
                            },
                            child: const Text(
                              "Criar conta",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.green),
                            )),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
