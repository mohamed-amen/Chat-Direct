import 'dart:developer';

import 'package:chat_direct/constants/constants.dart';
import 'package:chat_direct/data/local_data.dart';
import 'package:chat_direct/models/phone_code_model.dart';
import 'package:chat_direct/providers/phone_code_provider.dart';
import 'package:chat_direct/widgets/phone_code_button.dart';
import 'package:chat_direct/widgets/phone_code_field.dart';
import 'package:chat_direct/widgets/phone_number_field.dart';
import 'package:chat_direct/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController phoneNumberController;
  late TextEditingController phoneCodeController;
  late PhoneCodeProvider phoneCodeProvider;
  FocusNode phoneNumberNode = FocusNode();
  FocusNode phoneCodeNode = FocusNode();

  void gotoWhatsapp() {
    Uri uri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phoneNumber(),
    );

    log(uri.toString());

    if (phoneNumber().isNotEmpty) saveToClipboard(uri.toString());

    launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  String phoneNumber() {
    String phoneNumber = phoneNumberController.text;

    if (phoneCodeProvider.selectedPhoneCode != null) {
      String phoneCode = phoneCodeProvider.selectedPhoneCode!.phoneCode.replaceAll('+', "");
      return phoneCode + phoneNumber;
    }

    return phoneNumber;
  }

  void saveToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));

    Fluttertoast.showToast(
      msg: "تم نسخ رابط المحادثة",
      backgroundColor: Constants.grey,
      textColor: Colors.black,
    );
  }

  void asyncInit() async {
    phoneCodeProvider = Provider.of<PhoneCodeProvider>(context, listen: false);
    phoneCodeProvider.loadCodesDataAsset();

    await LocalData.loadLocalData();
    PhoneCodeModel? savedPhoneCode = LocalData.savedPhoneCode;

    phoneCodeProvider.selectNewPhoneCode(savedPhoneCode);
  }

  @override
  void initState() {
    asyncInit();

    phoneNumberController = TextEditingController();
    phoneCodeController = TextEditingController();

    phoneNumberNode.addListener(() => setState(() {}));
    phoneCodeNode.addListener(() => setState(() {}));

    KeyboardVisibilityController().onChange.listen(
          (isVisible) => setState(() {
            if (!isVisible) {
              phoneNumberNode.unfocus();
              phoneCodeNode.unfocus();
            }
          }),
        );

    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    phoneCodeController.dispose();
    phoneNumberNode.dispose();
    phoneCodeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.darkGrey,
      body: CustomScrollView(
        slivers: [
          const TopBar(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PhoneCodeButton(),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: PhoneNumberField(
                          fieldNode: phoneNumberNode,
                          fieldController: phoneNumberController,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: PhoneCodeField(
                          fieldNode: phoneCodeNode,
                          fieldController: phoneCodeController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.darkerGreen,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: gotoWhatsapp,
                    child: const Text("إبدأ المحادثة"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
