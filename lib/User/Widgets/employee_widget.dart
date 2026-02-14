import 'package:flutter/material.dart';

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
    final statusData = statusStyle(status);

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
                Text(role, style: const TextStyle(color: Colors.black54)),
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

  StatusStyle statusStyle(EmployeeStatus status) {
    switch (status) {
      case EmployeeStatus.active:
        return StatusStyle(
          label: 'Active',
          bgColor: const Color(0xFFE6F6EC),
          textColor: const Color(0xFF1E9E5A),
          dotColor: const Color(0xFF1E9E5A),
        );
      case EmployeeStatus.onLeave:
        return StatusStyle(
          label: 'On Leave',
          bgColor: const Color(0xFFFFF2E5),
          textColor: const Color(0xFFF2994A),
          dotColor: const Color(0xFFF2994A),
        );
      case EmployeeStatus.inactive:
        return StatusStyle(
          label: 'Inactive',
          bgColor: const Color(0xFFEDEFF2),
          textColor: Colors.grey,
          dotColor: Colors.grey,
        );
    }
  }
}

class StatusStyle {
  final String label;
  final Color bgColor;
  final Color textColor;
  final Color dotColor;

  StatusStyle({
    required this.label,
    required this.bgColor,
    required this.textColor,
    required this.dotColor,
  });
}
