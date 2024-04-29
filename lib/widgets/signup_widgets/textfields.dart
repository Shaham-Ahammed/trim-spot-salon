import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';
import 'package:trim_spot_barber_side/utils/textformfields.dart';

class ShopNameTextFormField extends StatelessWidget {
  const ShopNameTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validator: (value) {
        if (value == "") {
          return "enter shop name";
        } else {
          return null;
        }
      },
      controller: registrationShopNameController,
      hintText: "Shop Name",
      textInputType: TextInputType.name,
    );
  }
}

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validator: (value) {
        if (value == "") {
          return "enter phone number";
        } else if (value!.length < 10) {
          return "enter valid phone number";
        } else {
          return null;
        }
      },
      controller: registrationPhoneController,
      hintText: "Phone",
      textInputType: TextInputType.number,
      maxLenght: 10,
    );
  }
}

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validator: (value) {
        if (value == "") {
          return "enter email address";
        } else if (!value!.contains("@gmail.com")) {
          return "enter valid email address";
        } else {
          return null;
        }
      },
      controller: registrationEmailController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      controller: registrationNameController,
      hintText: "Name",
      textInputType: TextInputType.name,
      filteringTextInputFormatter:
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
      validator: (value) {
        if (value == "") {
          return "enter your name";
        } else {
          return null;
        }
      },
    );
  }
}

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        } else {
          return null;
        }
      },
      controller: registrationPasswordController,
      hintText: "Password",
      obscureText: true,
    );
  }
}

class ConfirmPasswordTextFormField extends StatelessWidget {
  const ConfirmPasswordTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validator: (value) {
        if (value!.isEmpty) {
          return "enter the confirm password";
        } else if (value != registrationPasswordController.text) {
          return "password doesn't match";
        } else {
          return null;
        }
      },
      controller: registrationConfirmPasswordController,
      hintText: "Confirm Password",
      obscureText: true,
    );
  }
}
