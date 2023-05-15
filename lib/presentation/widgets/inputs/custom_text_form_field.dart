import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  
  const CustomTextFormField();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

  final border = OutlineInputBorder(
    //borderSide: BorderSide(color: colors.primary),
    borderRadius: BorderRadius.circular(40)
  );

    return TextFormField(
      onChanged: (value){
        print('value: $value');
      },
      validator: (value){
        if( value == null ) return 'Campo necessario'; 
        if( value.isEmpty ) return 'Campo necessario'; 
        if( value.trim().isEmpty ) return 'Campo necessario';

        return null;
      },
      decoration: InputDecoration(
         enabledBorder: border, 
         focusedBorder: border.copyWith( borderSide: BorderSide( color: colors.primary ))
      ),
    );
  }
}