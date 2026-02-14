import 'package:flutter/material.dart';
import 'package:user_profile/User/user_prof.dart';
import 'package:user_profile/User/Widgets/employee_widget.dart';

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


