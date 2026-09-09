import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const AppHeader({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),

      child: Row(
        children: [
          // ================= MENU BUTTON =================

          IconButton(
            onPressed: onMenuPressed,

            icon: const Icon(Icons.menu, size: 24),

            tooltip: 'Menu',
          ),

          // ================= LOGO SECTION =================
          Container(
            width: 230,

            padding: const EdgeInsets.symmetric(horizontal: 10),

            child: Row(
              children: [
                const Icon(Icons.cloud, size: 38, color: Color(0xFF1877F2)),

                const SizedBox(width: 8),

                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'OneCloud',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1877F2),
                      ),
                    ),

                    Text(
                      'Enterprise Platform',
                      style: TextStyle(fontSize: 10, color: Color(0xFF65676B)),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ================= SEARCH =================
          Expanded(
            child: Container(
              height: 42,

              margin: const EdgeInsets.symmetric(horizontal: 20),

              decoration: BoxDecoration(
                color: const Color(0xFFF0F2F5),

                borderRadius: BorderRadius.circular(8),
              ),

              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search employees, customers, documents...',

                  prefixIcon: Icon(Icons.search),

                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // ================= NOTIFICATION =================
          IconButton(
            onPressed: () {},

            icon: const Icon(Icons.notifications_none),
          ),

          // ================= AI =================
          IconButton(
            onPressed: () {},

            icon: const Icon(Icons.auto_awesome, color: Color(0xFF1877F2)),
          ),

          // ================= PROFILE =================
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 8),

            child: Row(
              children: [
                const CircleAvatar(
                  radius: 19,

                  backgroundColor: Color(0xFFE8F1FF),

                  child: Text(
                    'KR',
                    style: TextStyle(
                      color: Color(0xFF1877F2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                const Text(
                  'User',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),

                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
