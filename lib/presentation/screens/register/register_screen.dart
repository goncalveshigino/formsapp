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



class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> { 

   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 

  @override
  Widget build(BuildContext context) {  

    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formKey,
      child: Column(
        children: [

          CustomTextFormField(
            label: 'Nome do usuario', 
            onChanged: (value){
              registerCubit.usernameChanged(value); 
              _formKey.currentState!.validate();
            },
            //onChanged: registerCubit.usernameChanged, 
            validator: (value){
              if( value == null || value.isEmpty ) return 'Campo obrigatorio';
              if( value.trim().isEmpty ) return 'Campo obrigatorio'; 
              if( value.length < 6 ) return 'Mas de 5 letras'; 
              return null;
            },
          ), 
         const SizedBox( height: 10 ), 

           CustomTextFormField(
            label: 'Email', 
             onChanged: (value){
              registerCubit.emailChanged(value); 
              _formKey.currentState!.validate();
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
             onChanged: (value){
              registerCubit.passwordChanged(value); 
              _formKey.currentState!.validate();
            },
           // onChanged: registerCubit.passwordChanged,  
            validator: (value){
              if( value == null || value.isEmpty ) return 'Campo obrigatorio';
              if( value.trim().isEmpty ) return 'Campo obrigatorio'; 
              if( value.length < 6 ) return 'Mas de 5 letras'; 
              return null;
            }
           ),

          const SizedBox(height: 20 ),

          FilledButton.tonalIcon(
              onPressed: (){

               final isValid = _formKey.currentState!.validate();
               if( !isValid ) return;

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