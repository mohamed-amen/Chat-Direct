import 'package:chat_direct/constants/constants.dart';
import 'package:chat_direct/models/phone_code_model.dart';
import 'package:chat_direct/providers/phone_code_provider.dart';
import 'package:chat_direct/widgets/phone_code_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneCodeDialogue extends StatefulWidget {
  const PhoneCodeDialogue({super.key});

  @override
  State<PhoneCodeDialogue> createState() => _PhoneCodeDialogueState();
}

class _PhoneCodeDialogueState extends State<PhoneCodeDialogue> {
  TextEditingController searchFieldController = TextEditingController();
  List<PhoneCodeModel> phoneCodesToShow = [];
  late PhoneCodeProvider provider;

  void onSearchTextChanged(String searchText) {
    phoneCodesToShow.clear();

    if (searchText.isEmpty) {
      phoneCodesToShow = List.from(provider.allPhoneCodes);
      setState(() {});
      return;
    }

    phoneCodesToShow = provider.searchPhoneCodes(searchText);
    setState(() {});
  }

  @override
  void initState() {
    provider = Provider.of<PhoneCodeProvider>(context, listen: false);
    phoneCodesToShow = List.from(provider.allPhoneCodes);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 60, 15, 15),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: Card(
          clipBehavior: Clip.hardEdge,
          color: Constants.grey,
          child: Column(
            children: [
              const SizedBox(height: 5),
              TextField(
                controller: searchFieldController,
                decoration: Constants.searchBarDecoration,
                onChanged: (value) => onSearchTextChanged(value.toLowerCase()),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  padding: EdgeInsets.zero,
                  itemCount: phoneCodesToShow.length,
                  itemBuilder: (context, index) {
                    return PhoneCodeListWidget(
                      phoneCode: phoneCodesToShow[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchFieldController.dispose();
    super.dispose();
  }
}
