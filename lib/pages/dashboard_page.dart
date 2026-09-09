import 'package:flutter/material.dart';

import '../widgets/app_header.dart';
import '../widgets/app_sidebar.dart';
import '../widgets/app_footer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  String selectedMenu = 'Dashboard';

  // Controls whether the sidebar is visible
  bool sidebarOpen = true;

  void selectMenu(String menu) {
    setState(() {
      selectedMenu = menu;
    });
  }

  // Open / close sidebar
  void toggleSidebar() {
    setState(() {
      sidebarOpen = !sidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FC),

      body: Column(
        children: [
          // ================= HEADER =================

          AppHeader(onMenuPressed: toggleSidebar),

          // ================= BODY =================
          Expanded(
            child: Row(
              children: [
                // ================= SIDEBAR =================

                if (sidebarOpen)
                  AppSidebar(
                    selectedMenu: selectedMenu,
                    onMenuSelected: selectMenu,
                  ),

                // ================= WORKSPACE =================
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        // ================= PAGE TITLE =================

                        const Text(
                          'Dashboard',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C1E21),
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          'Welcome to OneCloud Enterprise Platform',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF65676B),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // ================= KPI CARDS =================
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double width = (constraints.maxWidth - 48) / 4;

                            if (constraints.maxWidth < 900) {
                              width = (constraints.maxWidth - 24) / 2;
                            }

                            if (constraints.maxWidth < 600) {
                              width = constraints.maxWidth;
                            }

                            return Wrap(
                              spacing: 16,
                              runSpacing: 16,

                              children: [
                                DashboardCard(
                                  width: width,
                                  title: 'Revenue',
                                  value: '₹12.5M',
                                  subtitle: '+8.5% this month',
                                  icon: Icons.trending_up,
                                ),

                                DashboardCard(
                                  width: width,
                                  title: 'Profit',
                                  value: '₹4.2M',
                                  subtitle: '+6.2% this month',
                                  icon: Icons.account_balance,
                                ),

                                DashboardCard(
                                  width: width,
                                  title: 'Employees',
                                  value: '2,458',
                                  subtitle: 'Active employees',
                                  icon: Icons.people,
                                ),

                                DashboardCard(
                                  width: width,
                                  title: 'Customers',
                                  value: '1,284',
                                  subtitle: '+12.4% growth',
                                  icon: Icons.business,
                                ),
                              ],
                            );
                          },
                        ),

                        const SizedBox(height: 25),

                        // ================= SALES + APPROVALS =================
                        LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth < 800) {
                              return Column(
                                children: [
                                  _salesPipelineCard(),

                                  const SizedBox(height: 20),

                                  _pendingApprovalsCard(),
                                ],
                              );
                            }

                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Expanded(child: _salesPipelineCard()),

                                const SizedBox(width: 20),

                                Expanded(child: _pendingApprovalsCard()),
                              ],
                            );
                          },
                        ),

                        const SizedBox(height: 25),

                        // ================= QUICK ACCESS =================
                        _quickAccessCard(),

                        const SizedBox(height: 25),

                        // ================= AI RECOMMENDATIONS =================
                        _aiRecommendationCard(),

                        const SizedBox(height: 30),

                        // ================= FOOTER =================
                        const AppFooter(),
                      ],
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

  // ==========================================================
  // SALES PIPELINE
  // ==========================================================

  Widget _salesPipelineCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            'Sales Pipeline',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          _pipelineRow('Leads', '428', 0.75),

          _pipelineRow('Opportunities', '186', 0.55),

          _pipelineRow('Quotations', '92', 0.38),

          _pipelineRow('Closed Deals', '47', 0.25),
        ],
      ),
    );
  }

  Widget _pipelineRow(String title, String value, double progress) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(title),

              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),

          const SizedBox(height: 8),

          LinearProgressIndicator(
            value: progress,

            minHeight: 7,

            backgroundColor: const Color(0xFFE3EDF8),

            valueColor: const AlwaysStoppedAnimation(Color(0xFF1877F2)),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // PENDING APPROVALS
  // ==========================================================

  Widget _pendingApprovalsCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                'Pending Approvals',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFE8F1FF),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Text(
                  '8 Pending',
                  style: TextStyle(
                    color: Color(0xFF1877F2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          _approvalRow(Icons.receipt_long, 'Purchase Request', '₹2,40,000'),

          _approvalRow(Icons.person, 'Leave Request', '3 Employees'),

          _approvalRow(Icons.account_balance, 'Expense Claim', '₹18,500'),

          _approvalRow(Icons.description, 'Document Approval', '5 Documents'),
        ],
      ),
    );
  }

  Widget _approvalRow(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: const Color(0xFFEAF4FF),

              borderRadius: BorderRadius.circular(8),
            ),

            child: Icon(icon, color: const Color(0xFF1877F2)),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 3),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF65676B),
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right, color: Color(0xFF8A8D91)),
        ],
      ),
    );
  }

  // ==========================================================
  // QUICK ACCESS
  // ==========================================================

  Widget _quickAccessCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            'Quick Access',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 12,
            runSpacing: 12,

            children: [
              _quickButton(Icons.people, 'Employees'),

              _quickButton(Icons.attach_money, 'Finance'),

              _quickButton(Icons.shopping_cart, 'Procurement'),

              _quickButton(Icons.inventory, 'Inventory'),

              _quickButton(Icons.description, 'Documents'),

              _quickButton(Icons.analytics, 'Reports'),

              _quickButton(Icons.smart_toy, 'AI Copilot'),

              _quickButton(Icons.calendar_month, 'Calendar'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickButton(IconData icon, String title) {
    return OutlinedButton.icon(
      onPressed: () {},

      icon: Icon(icon, size: 20),

      label: Text(title),

      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF1877F2),

        side: const BorderSide(color: Color(0xFFD6E4F5)),

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // ==========================================================
  // AI RECOMMENDATIONS
  // ==========================================================

  Widget _aiRecommendationCard() {
    return _whiteCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color: const Color(0xFFE8F1FF),

              borderRadius: BorderRadius.circular(12),
            ),

            child: const Icon(
              Icons.auto_awesome,
              size: 30,
              color: Color(0xFF1877F2),
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'AI Recommendations',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 8),

                Text(
                  'AI-powered recommendations and insights will appear here as enterprise AI services are connected.',
                  style: TextStyle(color: Color(0xFF65676B), height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // COMMON WHITE CARD
  // ==========================================================

  Widget _whiteCard({required Widget child}) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: const Color(0xFFE3EAF2)),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),

            blurRadius: 10,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: child,
    );
  }
}

// ============================================================
// DASHBOARD CARD
// ============================================================

class DashboardCard extends StatelessWidget {
  final double width;
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  const DashboardCard({
    super.key,
    required this.width,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: const Color(0xFFE3EAF2)),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),

            blurRadius: 10,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                title,
                style: const TextStyle(color: Color(0xFF65676B), fontSize: 14),
              ),

              Icon(icon, color: const Color(0xFF1877F2)),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            value,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Color(0xFF65676B)),
          ),
        ],
      ),
    );
  }
}
