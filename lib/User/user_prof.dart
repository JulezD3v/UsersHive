import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:user_profile/User/db/hiv.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'John Doe');
    _emailController = TextEditingController(text: 'john.doe@textrack.com');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){ 
          // Navigator.push(context,
          // MaterialPageRoute(builder: (_)=> )
          // );
        }, //back to setting
        
        icon: Icon(Icons.arrow_back, color: Color(0xFF0A2540),))
         ,
        centerTitle: true,
        title: const Text(
          "Profile & Settings",
          style: TextStyle(color: Color(0xFF0A2540), fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "Save",
                style: TextStyle(
                  color: Color(0xFF0A2540),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // PROFILE IMAGE
            Stack(
              children: [
                const CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage("assets/download.jpeg"), // placeholder
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor:  Color(0xFF0A2540),
                    child: const Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                )
              ],
            ),

            const SizedBox(height: 24),

            //NAME
            _buildLabel("FULL NAME"),
            _buildTextField("John Doe", controller: _nameController),

            const SizedBox(height: 16),

            // EMAIL
            _buildLabel("EMAIL"),
            _buildTextField("john.doe@textrack.com", controller: _emailController),

            const SizedBox(height: 16),

            // ROLE (LOCKED)changed by admin
            _buildLabel("ROLE"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F2F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Warehouse Manager",
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.lock, color:Color(0xFF0A2540)),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // SYNC STATUS CARD
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "Sync Status",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xFFE6F8EC),
                        child: Icon(Icons.cloud_done, size: 16, color: Color(0xFF0A2540)),
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Keep your inventory data up to date.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green, size: 18),
                          SizedBox(width: 6),
                          Text("All data synced"),
                        ],
                      ),
                      Text("Last synced: 2m ago",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final user = User(
                          name: _nameController.text.trim(),
                          email: _emailController.text.trim(),
                          role: 'Warehouse Manager',
                        );
                        final box = await Hive.openBox<User>('users');
                        await box.put('current', user);
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile synced')),
                        );
                      },
                      icon: const Icon(Icons.sync),
                      label: const Text("Sync Now", style: TextStyle(fontSize: 12),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A2540),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 24),

            // USAGE SNAPSHOT
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Usage Snapshot",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(child: _StatCard("1,240", "Total Scans", Colors.blue)),
                SizedBox(width: 12),
                Expanded(child: _StatCard("Oct 24", "Last Active", Colors.black)),
              ],
            ),

            const SizedBox(height: 24),

            // META INFO
            _buildInfoRow("Member Since", "Jan 12, 2023"),
            _buildInfoRow("Last Login", "Today, 09:41 AM"),

            const SizedBox(height: 16),

            // CHANGE PASSWORD
            _buildCard(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFEAF0FF),
                  child: Icon(Icons.lock_outline, color: Color(0xFF1E2DFF)),
                ),
                title: const Text("Change Password"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 24),

            // LOGOUT
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {

                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Color(0xFF0A2540),
                  side: const BorderSide(color: Color(0xFF0A2540)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "TexTrack v2.4.0 (Build 1042)",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  // -------- HELPERS --------

  static Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget _buildTextField(String value, {TextEditingController? controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: value,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  static Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: child,
    );
  }

  static Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// STAT CARD
class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatCard(this.value, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
