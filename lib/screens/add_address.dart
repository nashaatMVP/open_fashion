import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/custom_appbar.dart';
import 'package:open_fashion/components/header.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({
    super.key,
    this.editData,
  });

  final dynamic editData;


  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if(widget.editData != null) {
      firstNameController.text = widget.editData['first'] ?? "";
      lastNameController.text = widget.editData['last'] ?? "";
      addressController.text = widget.editData['address'] ?? "";
      cityController.text = widget.editData['city'] ?? "";
      stateController.text = widget.editData['state'] ?? "";
      zipCodeController.text = widget.editData['Zip'] ?? "";
      phoneController.text = widget.editData['phone'] ?? "";
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [

            Header(title: "Add shipping address"),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'First name',
                          controller: firstNameController,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          label: 'Last name',
                          controller: lastNameController,
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  CustomTextField(label: 'Address', controller: addressController),
                  Gap(30),
                  CustomTextField(label: 'City', controller: cityController),
                  Gap(30),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'State',
                          controller: stateController,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          label: 'ZIP Code',
                          controller: zipCodeController,
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  CustomTextField(
                    label: 'Phone Number',
                    controller: phoneController,
                  ),
                ],
              ),
            ),


            Spacer(),


            Button(
              isSvgg: true,
              title: "Place order",
              onTap: () {
                if(_formKey.currentState!.validate()) {
                  return;
                } else {
                  final data = {
                    'first' : firstNameController.text,
                    'last' : lastNameController.text,
                    'address' : addressController.text,
                    'Zip' : zipCodeController.text,
                    'city' : cityController.text,
                    'phone' : phoneController.text,
                  };
                  Navigator.pop(context, data);
                }


              },
            ),

            Gap(70),
          ],
        ),
      ),
    );
  }
}
