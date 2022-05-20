import 'package:domino/views/widgets/custom_form.dart';
import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  TextEditingController  firstName;
  TextEditingController  secondName;
  TextEditingController  thirdName;
  TextEditingController  fourthName;
  var formKey =GlobalKey<FormState>();
   FormFields(this.firstName,this.secondName,this.thirdName,this.fourthName,this.formKey,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormFields(controller: firstName, myLabelText: 'First Name'),
            const SizedBox(
              height: 15.0,
            ),
            CustomTextFormFields(controller: secondName, myLabelText: 'Second Name'),
            const SizedBox(
              height: 15.0,
            ),
            CustomTextFormFields(controller: thirdName, myLabelText: 'Third Name'),
            const SizedBox(
              height: 15.0,
            ),
            CustomTextFormFields(controller: fourthName, myLabelText: 'Fourth Name'),
            const SizedBox(
              height: 15.0,
            ),

          ],
        ),
      ),
    );
  }
}
