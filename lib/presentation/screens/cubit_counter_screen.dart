import 'package:flutter/material.dart';


class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Cubit Counter'),
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.refresh_outlined))
        ],
      ),
      body: const Center(
        child:  Text('Counter value: XX'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: (){}
          ),
          const SizedBox( height: 15 ),

          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: (){}
          ),
          const SizedBox( height: 15 ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: (){}
          ),
        ],
      ),
    );
  }
}