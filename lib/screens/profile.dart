// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Profile extends StatefulWidget {
  // final AppUser? appUser;
  const Profile({
    super.key,
    // required this.appUser,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = false;
  bool _emailHasError = false;

  void _onChanged(dynamic val) => debugPrint(val.toString());
  _buildTextField(
      {required String name,
      required bool hasError,
      required Function(String?) onChanged,
      required String? Function(String?)? validator}) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: name,
      decoration: InputDecoration(
        labelText: name.toTitleCase(),
        suffixIcon: hasError
            ? const Icon(Icons.error, color: Colors.red)
            : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: onChanged,
      // valueTransformer: (text) => num.tryParse(text),
      validator: validator,
      textInputAction: TextInputAction.next,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Attendee Info')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
                onChanged: () {
                  _formKey.currentState!.save();
                  debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                // initialValue: widget.appUser!.toMap(),
                skipDisabled: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 15),
                    _buildTextField(
                        name: "name",
                        hasError: _nameHasError,
                        onChanged: (val) {
                          setState(() {
                            _nameHasError = !(_formKey
                                    .currentState?.fields["name"]
                                    ?.validate() ??
                                false);
                          });
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.max(70),
                        ])),
                    _buildTextField(
                      name: "email",
                      hasError: _emailHasError,
                      onChanged: (val) {
                        setState(() {
                          _emailHasError = !(_formKey
                                  .currentState?.fields["email"]
                                  ?.validate() ??
                              false);
                        });
                      },
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                          FormBuilderValidators.max(70),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      name: "address.street",
                      decoration: InputDecoration(
                        labelText: "street".toTitleCase(),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      name: "address.city",
                      decoration: InputDecoration(
                        labelText: "city".toTitleCase(),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      name: "address.zipcode",
                      decoration: InputDecoration(
                        labelText: "zipcode".toTitleCase(),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      name: "githubuserid",
                      decoration: InputDecoration(
                        hintText: 'github.com/yourusername',
                        labelText: "Github user id".toTitleCase(),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      name: "linkedInhandle",
                      decoration: InputDecoration(
                        hintText: 'linkedin.com/in/yourusername',
                        labelText: "linkedIn handle".toTitleCase(),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      name: "slackId",
                      decoration: InputDecoration(
                        labelText: "slack Id".toTitleCase(),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      name: "twitterhandle",
                      decoration: InputDecoration(
                        hintText: 'twitter.com/yourusername',
                        labelText: "twitter handle".toTitleCase(),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      name: "profileImageUrl",
                      decoration: InputDecoration(
                        labelText: "profileImageUrl".toTitleCase(),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          debugPrint(_formKey.currentState?.value.toString());
                          // DatabaseService().updateUserJson(widget.appUser!.id!,
                          //     _formKey.currentState?.value);
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
                      // color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
