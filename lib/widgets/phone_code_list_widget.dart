import 'package:chat_direct/models/phone_code_model.dart';
import 'package:chat_direct/providers/phone_code_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneCodeListWidget extends StatelessWidget {
  const PhoneCodeListWidget({super.key, required this.phoneCode});

  final PhoneCodeModel phoneCode;

  @override
  Widget build(BuildContext context) {
    PhoneCodeProvider provider = Provider.of<PhoneCodeProvider>(context, listen: false);

    return InkWell(
      onTap: () {
        provider.selectNewPhoneCode(phoneCode);
        Navigator.pop(context);
      },
      child: ListTile(
        leading: Text(
          phoneCode.flag,
          style: const TextStyle(fontSize: 25),
        ),
        title: Text(phoneCode.englishName),
        subtitle: Text(phoneCode.arabicName),
        trailing: Text(
          phoneCode.phoneCode,
          style: const TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }
}
