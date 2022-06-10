import 'package:flutter/material.dart';
import 'package:jumiaa/views/address/cubits/cubits.dart';
import 'package:jumiaa/widgets/customTextFormField.dart';

class Fields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: AddressCubit.of(context).formKey,
      child: ListView(
        padding: EdgeInsets.all(20),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomTextFormField(
            labelText: 'Name',
            controller: AddressCubit.of(context).nameController,
          ),
          CustomTextFormField(
            labelText: 'City',
            controller: AddressCubit.of(context).cityController,
          ),
          CustomTextFormField(
            labelText: 'Region',
            controller: AddressCubit.of(context).regionController,
          ),
          CustomTextFormField(

            labelText: 'Details',
            controller: AddressCubit.of(context).detailsController, type: null,
          ),
          CustomTextFormField(
            labelText: 'Notes',
            controller: AddressCubit.of(context).notesController,
          ),
        ],
      ),
    );
  }
}
