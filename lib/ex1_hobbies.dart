import 'package:flutter/material.dart';

// EX 1 – The hobbies (handout page: EX 1)
// Part 1: build ONE hobby card.
// Part 2: extract it into a StatelessWidget called HobbyCard, then show several cards.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('My Hobbies')),
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(40), 
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                title: 'Travelling',
                icon: Icons.travel_explore,
                color: Colors.green,
              ),
              SizedBox(height: 10), 
              HobbyCard(
                title: 'Skating',
                icon: Icons.skateboarding,
                color: Colors.blueGrey,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.blue,
  });

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Icon(icon, color: Colors.white),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
        ],
      ),
    );
  }
}