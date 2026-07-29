import 'package:flutter/material.dart';

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'entrega em:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(13, 158, 20, 1),
                  ),
                ),
                Text(
                  'Rua das Flores, 123',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 174, 230, 204),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(
                'assets/images/Icon.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 10, 80, 50),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(255, 200, 200, 200),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: const Text(
                            'Ofertas do dia',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Hortifruti com até 30%' + '\n' + 'de desconto',
                          style: TextStyle(
                            fontSize: 23,
                            color: Color.fromARGB(255, 200, 200, 100),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Ver ofertas',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 200, 50),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Image(
                          image: AssetImage('assets/images/offer.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
