import 'package:flutter/material.dart';
class Tela1 extends StatelessWidget {
  const Tela1({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(children: [Column( crossAxisAlignment: CrossAxisAlignment.start,
      children:[ 
        Text('entrega em:', style: TextStyle(fontSize: 12,color: Color.fromRGBO(11, 126, 17, 1)),),
        Text('Rua das Flores, 123', style: TextStyle(fontSize: 16,color: const Color.fromARGB(255, 0, 0, 0)),),
        Expanded(child: Container(width: 38,height: 38,decoration: BoxDecoration(color: const Color.fromARGB(255, 5, 207, 113),
        borderRadius: BorderRadius.circular(16),image: const DecorationImage(
        image: AssetImage('assets/images/icone.png'),fit: BoxFit.cover)
         ),),)

      ],
      )],))

      ,body: Center(
        
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/tela2');
          },
          child: const Text('Ir para Tela 2'),
          ),
        ),
      );
    }
  }
 