import 'package:chat_direct/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key, required this.fieldNode, required this.fieldController});
  final FocusNode fieldNode;
  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      focusNode: fieldNode,
      onSubmitted: (text) => "gotoWhatsapp()",
      onTapOutside: (event) => fieldNode.unfocus(),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      keyboardType: TextInputType.phone,
      maxLength: 15,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: TextStyle(color: Constants.grey),
      cursorColor: Constants.green,
      decoration: InputDecoration(
        label: const Center(child: Text("رقم الهاتف")),
        counter: const SizedBox(),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.grey!),
        ),
        labelStyle: TextStyle(
          color: fieldNode.hasFocus ? Constants.green : Constants.grey,
        ),
        helperStyle: TextStyle(color: Constants.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.green),
        ),
      ),
    );
  }
}
