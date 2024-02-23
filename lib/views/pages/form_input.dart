// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_resume_builder/core/data/constants.dart';
import 'package:flutter_resume_builder/core/enums/gender.dart';
import 'package:flutter_resume_builder/core/extensions/build_context_ex.dart';
import 'package:flutter_resume_builder/core/extensions/date_time_ex.dart';
import 'package:flutter_resume_builder/core/utils/date_time_picker.dart';
import 'package:flutter_resume_builder/provider/form_provider.dart';
import 'package:flutter_resume_builder/views/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FormInputPage extends StatefulWidget {
  const FormInputPage({super.key});

  static const String route = '/form-page';

  @override
  State<FormInputPage> createState() => _FormInputPageState();
}

class _FormInputPageState extends State<FormInputPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(
      builder: (context, provider, widget) {
        String buttonText = provider.id != null ? 'Update' : 'Save';
        return Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await provider.onSave();
              Navigator.pop(context);
            },
            child: provider.loading
                ? const CircularProgressIndicator()
                : Text(buttonText),
          ),
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(defaultPaddingValue),
              children: buildMobileView(provider),
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildMobileView(FormProvider provider) {
    return [
      PrimaryTextField(
        labelText: 'Name',
        controller: provider.name,
      ),
      PrimaryTextField(
        labelText: 'Email',
        controller: provider.email,
      ),
      PrimaryTextField(
        labelText: 'Contact Number',
        controller: provider.contactNumber,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
      PrimaryTextField(
        labelText: 'Date of Birth',
        controller: TextEditingController(
          text: provider.dob?.toDobFormat(),
        ),
        onTap: () async {
          DateTime? value = await DateTimePicker.pickDateTime(context);
          if (value != null) {
            provider.setDob(value);
          }
        },
        readOnly: true,
      ),
      Text(
        'Gender',
        style: context.theme.textTheme.labelMedium,
      ),
      buildGender(provider),
      const SizedBox(height: 10),
      PrimaryTextField(
        labelText: 'Job Title',
        controller: provider.jobTitle,
      ),
      PrimaryTextField(
        labelText: 'Experience',
        controller: provider.experience,
      ),
      PrimaryTextField(
        labelText: 'Skills',
        controller: provider.skills,
      ),
      PrimaryTextField(
        labelText: 'Summery',
        controller: provider.summary,
        maxLine: 3,
      ),
    ];
  }

  List<Widget> buildWebAndTableView(FormProvider provider) {
    return [
      Row(
        children: [
          Expanded(
            child: PrimaryTextField(
              labelText: 'Name',
              controller: provider.name,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: PrimaryTextField(
              labelText: 'Email',
              controller: provider.email,
            ),
          ),
        ],
      ),
      PrimaryTextField(
        labelText: 'Contact Number',
        controller: provider.contactNumber,
      ),
      PrimaryTextField(
        labelText: 'Date of Birth',
        controller: TextEditingController(
          text: provider.dob.toString(),
        ),
        onTap: () async {
          DateTime? value = await DateTimePicker.pickDateTime(context);
          if (value != null) {
            provider.setDob(value);
          }
        },
        readOnly: true,
      ),
      Text(
        'Gender',
        style: context.theme.textTheme.labelMedium,
      ),
      buildGender(provider),
      const SizedBox(height: 10),
      PrimaryTextField(
        labelText: 'Job Title',
        controller: provider.jobTitle,
      ),
      Row(
        children: [
          Expanded(
            child: PrimaryTextField(
              labelText: 'Experience',
              controller: provider.experience,
            ),
          ),
          Expanded(
            child: PrimaryTextField(
              labelText: 'Skills',
              controller: provider.skills,
            ),
          ),
        ],
      ),
      PrimaryTextField(
        labelText: 'Summery',
        controller: provider.summary,
        maxLine: 3,
      ),
    ];
  }

  Widget buildGender(FormProvider provider) {
    return Row(
      children: Gender.values
          .map(
            (e) => Row(
              children: [
                Radio(
                  value: e,
                  groupValue: provider.selectedGender,
                  onChanged: provider.setGender,
                ),
                Text(e.name),
              ],
            ),
          )
          .toList(),
    );
  }
}
