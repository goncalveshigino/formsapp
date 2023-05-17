import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/presentation/blocs/register_cubit/register_cubit.dart';

import '../../widgets/widgets.dart';




class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Usuario'),
      ),
      body: BlocProvider(
        create: ( _ ) => RegisterCubit(),
        child:const _RegisterScreenView(),
      ),
    );
  }
}


class _RegisterScreenView extends StatelessWidget {
  const _RegisterScreenView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [

               FlutterLogo( size: 100,),

              _RegisterForm(),

               SizedBox( height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}



class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {  

    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;

    return Form(
    
      child: Column(
        children: [

          CustomTextFormField(
            label: 'Nome do usuario', 
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage
          ), 
         const SizedBox( height: 10 ), 

           CustomTextFormField(
            label: 'Email', 
             onChanged: (value){
              registerCubit.emailChanged(value); 
            },
           // onChanged: registerCubit.emailChanged, 
            validator: (value){
              if( value == null || value.isEmpty ) return 'Campo obrigatorio';
              if( value.trim().isEmpty ) return 'Campo obrigatorio'; 
              
            final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',); 

            if( !emailRegExp.hasMatch(value) ) return 'Nao formato de email';
              return null;
            },
           ), 
         const SizedBox( height: 10 ), 

           CustomTextFormField(
            label: 'Senha', 
            obscureText: true, 
             onChanged: registerCubit.passwordChanged, 
             errorMessage: password.errorMessage, 
           ),

          const SizedBox(height: 20 ),

          FilledButton.tonalIcon(
              onPressed: (){

              //  final isValid = _formKey.currentState!.validate();
              //  if( !isValid ) return;

               registerCubit.onSubmit();

              },
              icon: const Icon( Icons.save), 
              label: const Text('Criar usuario')
          ),
        ],
      )
    );
  }
}