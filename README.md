# platform_text_input

## Introduction

This project provides an amazing widget for using the specific inputfield for the specific platform

### Example


```dart
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
          child: MTextFormField(
          controller: _usernameController,
          focusNode: _usernameFocus,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          inputDecorator: InputDecoration(
            labelText: "username",
            errorText: "username error",
          ),
          onChanged: (value) {
            _store.username = value;
          },
          onFieldSubmitted: (_) {
            _emailFocus.requestFocus();
      },
    );
  }
}
```
    

## Getting started

Run this command for installation
```
flutter pub add platform_text_input
```
Or add this dependency
```
dependencies:
  platform_text_input: ^0.0.1
```
