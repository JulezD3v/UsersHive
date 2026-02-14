import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:user_profile/User/DB-user/hiv.dart';
import 'package:user_profile/User/Employee/employees.dart';
import 'package:user_profile/User/Widgets/build.dart';


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
    _nameController = TextEditingController();
    _emailController = TextEditingController();
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
            buildLabel("FULL NAME"),
            buildTextField("John Doe", controller: _nameController),

            const SizedBox(height: 16),

            // EMAIL
            buildLabel("EMAIL"),
            buildTextField("john.doe@textrack.com", controller: _emailController),

            const SizedBox(height: 16),

            // ROLE (LOCKED)changed by admin
            buildLabel("ROLE"),
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
                  Icon(Icons.person_pin_rounded, color:Color(0xFF0A2540)),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Teams (Also LOCKED)changed by admin
            buildLabel("Team"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F2F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Other co-workers Role",
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (_)=> Employees() ));
                  },                 
                  icon: const Icon(Icons.lock, color:Color(0xFF0A2540)))
                ],
              ),
            ),

const SizedBox(height: 24),

            // SYNC STATUS CARD
            buildCard(
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
                Expanded(child: StatCard("1,240", "Total Scans", Colors.blue)),
                SizedBox(width: 12),
                Expanded(child: StatCard("Oct 24", "Last Active", Colors.black)),
              ],
            ),

            const SizedBox(height: 24),

            // META INFO
            buildInfoRow("Member Since", "Jan 12, 2023"),
            buildInfoRow("Last Login", "Today, 09:41 AM"),

            const SizedBox(height: 16),

            // CHANGE PASSWORD
            buildCard(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFEAF0FF),
                  child: Icon(Icons.lock_outline, color: Color(0xFF1E2DFF)),
                ),
                title: const Text("Change Password"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  //...
                },
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
}

 