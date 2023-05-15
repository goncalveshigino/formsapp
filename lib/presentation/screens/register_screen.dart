import 'package:flutter/material.dart';

import '../widgets/widgets.dart';




class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Usuario'),
      ),
      body: _RegisterScreenView(),
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
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [

          CustomTextFormField(), 
          SizedBox( height: 10 ), 
           CustomTextFormField(), 

          const SizedBox(height: 20 ),

          FilledButton.tonalIcon(
              onPressed: (){},
              icon: const Icon( Icons.save), 
              label: const Text('Criar usuario')
          ),
        ],
      )
    );
  }
}