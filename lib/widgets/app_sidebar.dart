import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class AppSidebar extends StatefulWidget {
  final String selectedMenu;
  final Function(String) onMenuSelected;

  const AppSidebar({
    super.key,
    required this.selectedMenu,
    required this.onMenuSelected,
  });

  @override
  State<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends State<AppSidebar> {
  // ================================================================
  // EXPANDED MENU STATE
  // ================================================================

  final Map<String, bool> expandedMenus = {
    'Platform Administration': false,
    'HRMS': false,
    'CRM': false,
    'ERP': false,
    'Finance & Accounting': false,
    'Workflow & Automation': false,
    'Document Management': false,
    'Subscription': false,
    'Revenue': false,
    'Reporting & BI': false,
    'Enterprise AI': false,
    'Notification': false,
    'Calendar': false,
    'Integration': false,
    'Search': false,
    'Security & Compliance': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,

      decoration: const BoxDecoration(color: Color(0xFF071A3D)),

      child: Column(
        children: [
          // ============================================================
          // LOGO
          // ============================================================

          Container(
            height: 75,
            padding: const EdgeInsets.symmetric(horizontal: 18),

            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: const Icon(
                    Icons.cloud_outlined,
                    color: Color(0xFF1877F2),
                    size: 27,
                  ),
                ),

                const SizedBox(width: 10),

                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'OneCloud',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Enterprise Platform',
                      style: TextStyle(color: Color(0xFF9EB4D8), fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ============================================================
          // SIDEBAR MENU
          // ============================================================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),

              children: [
                _sectionTitle('MAIN MENU'),

                // Dashboard
                _mainMenuItem(
                  icon: Icons.dashboard_outlined,
                  title: 'Dashboard',
                ),

                const SizedBox(height: 12),

                // ======================================================
                // PLATFORM
                // ======================================================
                _sectionTitle('PLATFORM'),

                _expandableMenu(
                  icon: Icons.admin_panel_settings_outlined,
                  title: 'Platform Administration',
                  children: [
                    'Super Admin Management',
                    'Tenant Management',
                    'Organization Management',
                    'User Management',
                    'Role & Permission Management',
                    'Authentication & Security',
                    'System Configuration',
                    'Audit & Compliance',
                  ],
                ),

                const SizedBox(height: 12),

                // ======================================================
                // BUSINESS MODULES
                // ======================================================
                _sectionTitle('BUSINESS MODULES'),

                _expandableMenu(
                  icon: Icons.people_outline,
                  title: 'HRMS',
                  children: [
                    'Employee Management',
                    'Attendance',
                    'Leave',
                    'Payroll',
                    'Recruitment',
                    'Performance',
                    'Learning',
                    'Employee Self Service',
                    'Employee Assets',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.handshake_outlined,
                  title: 'CRM',
                  children: [
                    'Lead Management',
                    'Opportunity Management',
                    'Contact Management',
                    'Sales Pipeline',
                    'Quotations',
                    'Customer Management',
                    'CRM Reports & Analytics',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.business_center_outlined,
                  title: 'ERP',
                  children: [
                    'Procurement',
                    'Vendor Management',
                    'Inventory',
                    'Warehouse',
                    'Sales Management',
                    'Asset Management',
                    'Maintenance',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.account_balance_outlined,
                  title: 'Finance & Accounting',
                  children: [
                    'Chart of Accounts',
                    'Accounts Payable',
                    'Accounts Receivable',
                    'General Ledger',
                    'Budgeting',
                    'Financial Reports',
                    'Tax Management',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.account_tree_outlined,
                  title: 'Workflow & Automation',
                  children: [
                    'Workflow Designer',
                    'Approval Engine',
                    'Business Rules',
                    'Process Automation',
                    'Task Management',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.folder_outlined,
                  title: 'Document Management',
                  children: [
                    'Document Repository',
                    'Versioning',
                    'File Upload & Download',
                    'Document Search',
                    'Document Templates',
                    'Sharing & Search',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.card_membership_outlined,
                  title: 'Subscription',
                  children: [
                    'Plans & Features',
                    'Tenant Subscriptions',
                    'Usage & Quotas',
                    'Payment Tracking',
                    'License Allocation',
                    'Renewals',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.monetization_on_outlined,
                  title: 'Revenue',
                  children: [
                    'Revenue Tracking',
                    'Usage Analytics',
                    'Forecasting',
                    'Revenue Reports',
                    'Revenue Recognition',
                  ],
                ),

                const SizedBox(height: 12),

                // ======================================================
                // SERVICES
                // ======================================================
                _sectionTitle('SERVICES'),

                _expandableMenu(
                  icon: Icons.analytics_outlined,
                  title: 'Reporting & BI',
                  children: [
                    'Standard Reports',
                    'Ad-hoc Reports',
                    'Data Exploration',
                    'BI Management',
                    'Executive Reports',
                    'Data Visualization',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.auto_awesome_outlined,
                  title: 'Enterprise AI',
                  children: [
                    'AI Copilot',
                    'AI Chat',
                    'Document Understanding',
                    'Recommendations',
                    'Predictive Analytics',
                    'AI Workflows',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.notifications_outlined,
                  title: 'Notification',
                  children: [
                    'In-App Notifications',
                    'Email Notifications',
                    'SMS Notifications',
                    'Push Notifications',
                    'Templates',
                    'Preferences',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.calendar_month_outlined,
                  title: 'Calendar',
                  children: [
                    'User Calendars',
                    'Team Calendars',
                    'Meeting Scheduler',
                    'Resource Booking',
                    'Reminders',
                    'Availability',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.integration_instructions_outlined,
                  title: 'Integration',
                  children: [
                    'API Management',
                    'Third-Party Integrations',
                    'Webhooks',
                    'Event Streaming',
                    'Data Transformation',
                    'ETL / Data Sync',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.search_outlined,
                  title: 'Search',
                  children: [
                    'Global Search',
                    'Index Management',
                    'Semantic Search',
                    'Autocomplete',
                    'Relevance Ranking',
                    'Saved Searches',
                  ],
                ),

                _expandableMenu(
                  icon: Icons.security_outlined,
                  title: 'Security & Compliance',
                  children: [
                    'Authentication',
                    'Authorization',
                    'RBAC',
                    'Encryption',
                    'Audit Logs',
                    'Compliance Reports',
                    'Security Alerts',
                  ],
                ),

                const SizedBox(height: 12),

                // ======================================================
                // SYSTEM
                // ======================================================
                _sectionTitle('SYSTEM'),

                _mainMenuItem(icon: Icons.settings_outlined, title: 'Settings'),

                const SizedBox(height: 15),
              ],
            ),
          ),

          // ============================================================
          // USER SECTION
          // ============================================================
          Container(
            padding: const EdgeInsets.all(12),

            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFF20345A))),
            ),

            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,

                      backgroundColor: Color(0xFFE8F1FF),

                      child: Text(
                        'KR',
                        style: TextStyle(
                          color: Color(0xFF1877F2),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'User',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Text(
                            'Administrator',
                            style: TextStyle(
                              color: Color(0xFF9EB4D8),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // ======================================================
                // LOGOUT
                // ======================================================
                SizedBox(
                  width: double.infinity,

                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },

                    icon: const Icon(Icons.logout_outlined, size: 19),

                    label: const Text('Logout'),

                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFFF5A5F),

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

  // ================================================================
  // SECTION TITLE
  // ================================================================

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 7),

      child: Text(
        title,

        style: const TextStyle(
          color: Color(0xFF7F94B8),
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.6,
        ),
      ),
    );
  }

  // ================================================================
  // NORMAL MENU ITEM
  // ================================================================

  Widget _mainMenuItem({required IconData icon, required String title}) {
    final bool selected = widget.selectedMenu == title;

    return Container(
      margin: const EdgeInsets.only(bottom: 3),

      decoration: BoxDecoration(
        color: selected ? const Color(0xFF0B6FF9) : Colors.transparent,

        borderRadius: BorderRadius.circular(7),
      ),

      child: ListTile(
        dense: true,

        contentPadding: const EdgeInsets.symmetric(horizontal: 10),

        leading: Icon(
          icon,
          size: 20,

          color: selected ? Colors.white : const Color(0xFFB5C4DC),
        ),

        title: Text(
          title,

          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFFD8E1F0),

            fontSize: 13,

            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),

        onTap: () {
          widget.onMenuSelected(title);
        },
      ),
    );
  }

  // ================================================================
  // EXPANDABLE MENU
  // ================================================================

  Widget _expandableMenu({
    required IconData icon,
    required String title,
    required List<String> children,
  }) {
    final bool expanded = expandedMenus[title] ?? false;

    final bool selected = widget.selectedMenu == title;

    return Column(
      children: [
        // ============================================================
        // PARENT MENU
        // ============================================================

        Container(
          margin: const EdgeInsets.only(bottom: 2),

          decoration: BoxDecoration(
            color: selected ? const Color(0xFF0B6FF9) : Colors.transparent,

            borderRadius: BorderRadius.circular(7),
          ),

          child: ListTile(
            dense: true,

            contentPadding: const EdgeInsets.symmetric(horizontal: 10),

            leading: Icon(
              icon,
              size: 20,

              color: selected ? Colors.white : const Color(0xFFB5C4DC),
            ),

            title: Text(
              title,

              style: TextStyle(
                color: selected ? Colors.white : const Color(0xFFD8E1F0),

                fontSize: 13,

                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),

            // ========================================================
            // ARROW
            // ========================================================
            trailing: AnimatedRotation(
              turns: expanded ? 0.25 : 0,
              duration: const Duration(milliseconds: 200),

              child: Icon(
                Icons.keyboard_arrow_right,
                size: 18,

                color: selected ? Colors.white : const Color(0xFF7F94B8),
              ),
            ),

            onTap: () {
              setState(() {
                expandedMenus[title] = !expanded;
              });

              widget.onMenuSelected(title);
            },
          ),
        ),

        // ============================================================
        // ANIMATED SUBMENU
        // ============================================================
        ClipRect(
          child: AnimatedSize(
            duration: const Duration(milliseconds: 250),

            curve: Curves.easeInOut,

            child: expanded
                ? Padding(
                    padding: const EdgeInsets.only(left: 22, right: 5),

                    child: Column(
                      children: children.map((child) {
                        final bool childSelected = widget.selectedMenu == child;

                        return InkWell(
                          borderRadius: BorderRadius.circular(6),

                          onTap: () {
                            widget.onMenuSelected(child);
                          },

                          child: Container(
                            width: double.infinity,

                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),

                            margin: const EdgeInsets.only(bottom: 1),

                            decoration: BoxDecoration(
                              color: childSelected
                                  ? const Color(0xFF123F82)
                                  : Colors.transparent,

                              borderRadius: BorderRadius.circular(6),
                            ),

                            child: Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 4,

                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF6E8BB7),
                                  ),
                                ),

                                const SizedBox(width: 9),

                                Expanded(
                                  child: Text(
                                    child,

                                    style: TextStyle(
                                      color: childSelected
                                          ? Colors.white
                                          : const Color(0xFFAFC0DA),

                                      fontSize: 11.5,

                                      fontWeight: childSelected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : const SizedBox(height: 0, width: double.infinity),
          ),
        ),
      ],
    );
  }
}
