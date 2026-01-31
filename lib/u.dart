import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}
class _ProfileSettingsPageState extends State<ProfileSettingsPage>{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  Icon(Icons.arrow_back, color: Color(0xFF0A2540)),
        title: const Text(
          "User Profile Settings",
          style: TextStyle(
            color: Color(0xFF0A2540),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text( // to add a text button
                "Save",
                style: TextStyle(
                  color: Color(0xFF0A2540),
                  fontWeight: FontWeight.w600,
                ),
                
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _avatarSection(),

          _sectionTitle("IDENTITY"),
          _infoTile(title: "Full Name", value: "Alex Mitchell"),
          _infoTile(title: "Email Address", value: "alex.mitchell@textrack.io"),

          _sectionTitle("SECURITY"),
          _navigationTile(
            title: "Change Password",
            icon: Icons.lock_outline,
          ),

          _sectionTitle("ROLE & ACCESS"),
          _roleSelector(),

          _sectionTitle("ACCOUNT INFO"),
          _infoTile(title: "Created At", value: "October 12, 2023"),
          _infoTile(title: "Last Login", value: "2 hours ago"),

          _sectionTitle("DANGER ZONE", danger: true),
          _dangerTile(),

          const SizedBox(height: 24),
          const Center(
            child: Text(
              "Manage your account across all TexTrack devices.",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              "SECURITY POLICY     DATA USAGE",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  // ---------- Sections ----------

  Widget _avatarSection() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFFE5E7EB),
              child: Icon(Icons.person, size: 40, color: Colors.grey),
            ),
            CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFF0A2540),
              child: const Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, {bool danger = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: danger ? Colors.red : Colors.grey,
        ),
      ),
    );
  }

  Widget _infoTile({required String title, required String value}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: _boxDecoration(),
      child: ListTile(
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _navigationTile({required String title, required IconData icon}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: _boxDecoration(),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF0A2540)),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _roleSelector() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: _boxDecoration(),
      child: ListTile(
        title: const Text("User Role"),
        trailing: DropdownButton<String>(
          value: "Administrator",
          underline: const SizedBox(),
          items: const [
            DropdownMenuItem(
              value: "Administrator",
              child: Text("Administrator"),
            ),
            DropdownMenuItem(
              value: "Staff",
              child: Text("Staff"),
            ),
            DropdownMenuItem(
              value: "Viewer",
              child: Text("Viewer"),
            ),
          ],
          onChanged: null, // UI only
        ),
      ),
    );
  }

  Widget _dangerTile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: _boxDecoration(),
      child: ListTile(
        title: const Text(
          "Delete Account",
          style: TextStyle(color: Colors.red),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.red),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    );
  }