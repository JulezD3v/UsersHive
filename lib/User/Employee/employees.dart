import 'package:flutter/material.dart';
import 'package:user_profile/User/user_prof.dart';

class Employees extends StatefulWidget {
  const Employees({super.key});

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileSettingsPage() ));
        },
        icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        
        // 
        title: const Text(
          'Employee Directory',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Icon(Icons.more_horiz, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0B1C3D),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: Column(
        children: [
          const SizedBox(height: 12),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search employees...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Employee list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                EmployeeTile(
                  name: 'Marcus Thorne',
                  role: 'Warehouse Manager',
                  status: EmployeeStatus.active,
                ),
                EmployeeTile(
                  name: 'Sarah Jenkins',
                  role: 'Inventory Specialist',
                  status: EmployeeStatus.active,
                ),
                EmployeeTile(
                  name: 'David Chen',
                  role: 'Logistics Coordinator',
                  status: EmployeeStatus.onLeave,
                ),
                EmployeeTile(
                  name: 'Elena Rodriguez',
                  role: 'Quality Control',
                  status: EmployeeStatus.active,
                ),
                EmployeeTile(
                  name: 'Robert Vance',
                  role: 'Former Supervisor',
                  status: EmployeeStatus.inactive,
                ),
                EmployeeTile(
                  name: 'Maya Patel',
                  role: 'Stock Analyst',
                  status: EmployeeStatus.active,
                ),
              ],
            ),
          ),

          // Offline banner
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            color: const Color(0xFFE9EDF3),
            child: const Text(
              'OFFLINE CHANGES WILL SYNC AUTOMATICALLY',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 1,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum EmployeeStatus { active, onLeave, inactive }

class EmployeeTile extends StatelessWidget {
  final String name;
  final String role;
  final EmployeeStatus status;

  const EmployeeTile({
    super.key,
    required this.name,
    required this.role,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final statusData = _statusStyle(status);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Avatar
          Stack(
            children: [
              const CircleAvatar(
                radius: 26,
                backgroundColor: Color(0xFFE6EBF2),
                child: Icon(Icons.person, color: Colors.grey),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: statusData.dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          // Name & role
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusData.bgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              statusData.label,
              style: TextStyle(
                color: statusData.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _StatusStyle _statusStyle(EmployeeStatus status) {
    switch (status) {
      case EmployeeStatus.active:
        return _StatusStyle(
          label: 'Active',
          bgColor: const Color(0xFFE6F6EC),
          textColor: const Color(0xFF1E9E5A),
          dotColor: const Color(0xFF1E9E5A),
        );
      case EmployeeStatus.onLeave:
        return _StatusStyle(
          label: 'On Leave',
          bgColor: const Color(0xFFFFF2E5),
          textColor: const Color(0xFFF2994A),
          dotColor: const Color(0xFFF2994A),
        );
      case EmployeeStatus.inactive:
        return _StatusStyle(
          label: 'Inactive',
          bgColor: const Color(0xFFEDEFF2),
          textColor: Colors.grey,
          dotColor: Colors.grey,
        );
    }
  }
}

class _StatusStyle {
  final String label;
  final Color bgColor;
  final Color textColor;
  final Color dotColor;

  _StatusStyle({
    required this.label,
    required this.bgColor,
    required this.textColor,
    required this.dotColor,
  });
}
