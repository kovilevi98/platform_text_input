import 'package:flutter/material.dart';
import 'package:platform_text_input/platform_text_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
          child: PlatformTextInput(
            controller: _emailController,
            focusNode: _emailFocus,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            inputDecorator: const InputDecoration(
              labelText: "Email",
              errorText: "Email error",
            ),
            onChanged: (value) {
              //new value is here
            },
          )
      ),
    );
  }
}
