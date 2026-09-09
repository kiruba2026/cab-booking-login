import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class AppSidebar extends StatelessWidget {
  final String selectedMenu;
  final Function(String) onMenuSelected;

  const AppSidebar({
    super.key,
    required this.selectedMenu,
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Colors.grey.shade200)),
      ),

      child: Column(
        children: [
          const SizedBox(height: 15),

          // ================= MENU =================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),

              children: [
                // ================= MAIN MENU =================

                const Padding(
                  padding: EdgeInsets.all(12),

                  child: Text(
                    'MAIN MENU',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8A8D91),
                    ),
                  ),
                ),

                _menuItem(Icons.dashboard_outlined, 'Dashboard'),

                _menuItem(
                  Icons.admin_panel_settings_outlined,
                  'Platform Administration',
                ),

                const SizedBox(height: 10),

                // ================= BUSINESS MODULES =================
                const Padding(
                  padding: EdgeInsets.all(12),

                  child: Text(
                    'BUSINESS MODULES',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8A8D91),
                    ),
                  ),
                ),

                _menuItem(Icons.people_outline, 'HRMS'),

                _menuItem(Icons.handshake_outlined, 'CRM'),

                _menuItem(Icons.inventory_2_outlined, 'ERP'),

                _menuItem(
                  Icons.account_balance_outlined,
                  'Finance & Accounting',
                ),

                _menuItem(Icons.shopping_cart_outlined, 'Procurement'),

                _menuItem(Icons.warehouse_outlined, 'Inventory'),

                _menuItem(Icons.local_shipping_outlined, 'Warehouse'),

                _menuItem(Icons.payments_outlined, 'Payroll'),

                _menuItem(Icons.person_search_outlined, 'Recruitment'),

                _menuItem(Icons.star_outline, 'Performance'),

                _menuItem(Icons.account_tree_outlined, 'Workflow Automation'),

                _menuItem(Icons.description_outlined, 'Document Management'),

                _menuItem(Icons.card_membership_outlined, 'Subscription'),

                _menuItem(Icons.trending_up, 'Revenue'),

                const SizedBox(height: 10),

                // ================= SERVICES =================
                const Padding(
                  padding: EdgeInsets.all(12),

                  child: Text(
                    'SERVICES',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8A8D91),
                    ),
                  ),
                ),

                _menuItem(Icons.analytics_outlined, 'Reports & BI'),

                _menuItem(Icons.auto_awesome_outlined, 'Enterprise AI'),

                _menuItem(Icons.notifications_none, 'Notifications'),

                _menuItem(Icons.calendar_month_outlined, 'Calendar'),

                _menuItem(
                  Icons.integration_instructions_outlined,
                  'Integrations',
                ),

                _menuItem(Icons.search_outlined, 'Enterprise Search'),

                _menuItem(Icons.code_outlined, 'API & Developer'),

                const SizedBox(height: 10),

                // ================= SYSTEM =================
                const Padding(
                  padding: EdgeInsets.all(12),

                  child: Text(
                    'SYSTEM',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8A8D91),
                    ),
                  ),
                ),

                _menuItem(Icons.settings_outlined, 'Settings'),
              ],
            ),
          ),

          // ================= USER SECTION =================
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),

            child: Column(
              children: [
                // ================= USER INFORMATION =================

                const Row(
                  children: [
                    CircleAvatar(
                      radius: 18,

                      backgroundColor: Color(0xFFE8F1FF),

                      child: Text(
                        'KR',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF1877F2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'User',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),

                          Text(
                            'Administrator',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF65676B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // ================= LOGOUT =================
                SizedBox(
                  width: double.infinity,

                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },

                    icon: const Icon(Icons.logout, size: 20),

                    label: const Text('Logout'),

                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFE53935),

                      alignment: Alignment.centerLeft,

                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= MENU ITEM =================

  Widget _menuItem(IconData icon, String title) {
    bool selected = selectedMenu == title;

    return Container(
      margin: const EdgeInsets.only(bottom: 3),

      decoration: BoxDecoration(
        color: selected ? const Color(0xFFE8F1FF) : Colors.transparent,

        borderRadius: BorderRadius.circular(8),
      ),

      child: ListTile(
        dense: true,

        leading: Icon(
          icon,
          size: 21,

          color: selected ? const Color(0xFF1877F2) : const Color(0xFF65676B),
        ),

        title: Text(
          title,

          style: TextStyle(
            fontSize: 13,

            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,

            color: selected ? const Color(0xFF1877F2) : const Color(0xFF3A3B3C),
          ),
        ),

        onTap: () {
          onMenuSelected(title);
        },
      ),
    );
  }
}
