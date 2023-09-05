import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String value;
  const ForecastCard(
      {super.key, required this.time, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 3, 43, 5),
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Icon(
              icon,
              size: 32,
              color: icon == Icons.cloud ? Colors.white : Colors.yellow,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(value)
          ],
        ),
      ),
    );
  }
}
