import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),

      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          const Text(
            '© 2026 OneCloud Enterprise Platform',
            style: TextStyle(fontSize: 12, color: Color(0xFF65676B)),
          ),

          Row(
            children: [
              TextButton(
                onPressed: () {},

                child: const Text('Help', style: TextStyle(fontSize: 12)),
              ),

              TextButton(
                onPressed: () {},

                child: const Text('Privacy', style: TextStyle(fontSize: 12)),
              ),

              TextButton(
                onPressed: () {},

                child: const Text('Terms', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
