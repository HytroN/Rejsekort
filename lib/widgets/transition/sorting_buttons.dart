import 'package:flutter/material.dart';

class SortingButtons extends StatelessWidget {
  const SortingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.blue.shade800,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            side: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          onPressed: () {
            print('hello');
          },
          child: const Text(
            'Alle',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.blue.shade800,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            side: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          onPressed: () {
            print('hello');
          },
          child: const Text(
            'Rejser',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.blue.shade800,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            side: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          onPressed: () {
            print('hello');
          },
          child: const Text(
            'Optankning',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
