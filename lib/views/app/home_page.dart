import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //venstre side "tekst" + bokse
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome, User',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                //Visa Status
                const Text('Visa status:', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                // grå boks til visa status
                Container(
                  width: 120,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text('Tourist', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),

                // Visa udløbsdato
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Visa expiration date:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 8),

                    // grå boks til visa udløbsdato
                    Container(
                      width: 120,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          // Evt. dynamisk data, her placeholder
                          '2023-12-31',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 4) Needed documentation (uden boks)
                const Text(
                  'Needed documentation',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),

          // Højre side (billede)
          Expanded(
            flex: 1,
            child: Center(
              child: Image.asset(
                'assets/images/travelers.png',
                width: 280, // tilpas efter behov
              ),
            ),
          ),
        ],
      ),
    );
  }
}
