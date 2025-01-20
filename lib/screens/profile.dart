import 'package:flutter/material.dart';
import 'package:opiny/custom_text.dart';
import 'package:opiny/screens/personal_detail.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const CustomText(text: 'My Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Profile Section
               Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/victory.png',width: 100,height: 140,),
                    const CustomText(text: 'Victory Vertex',fontWeight: FontWeight.bold,fontSize: 16,),
                   const CustomText(text: 'Level 1',fontSize: 16,fontWeight: FontWeight.bold,)
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const CustomText(text: 'Playing Experience',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              const SizedBox(height: 12),SizedBox(
                height: 200, // Constrain the height of the GridView
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  children: [
                    _buildExperienceCard('assets/images/contest.png', '0', 'Contests Won', const Color(0xFFE0FFBA)), // Green
                    _buildExperienceCard('assets/images/matches.png', '1', 'Matches', const Color(0xFFDCF2FF)), // Blue
                    _buildExperienceCard('assets/images/win.png', '0', 'Winning %', const Color(0xFFE3D8D8)), // Purple
                    _buildExperienceCard('assets/images/total_contest.png', '1', 'Total Contests', const Color(0xFFFFD6BD)), // Pink
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Profile Info Section
              const CustomText(text: 'Profile Info',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              const SizedBox(height: 12),
              _buildProfileInfoRow('User Name', 'Victory Vortex'),
              _buildProfileInfoRow('Your Email', 'test@gmail.com'),
              _buildProfileInfoRow('Your Level', 'Level 1'),
              _buildProfileInfoRow('Your Phone', '9787456673'),
              const SizedBox(height: 16),
              Container(width: 555,height: 1,color: Colors.black,),
              const SizedBox(height: 16),
              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton('Update Profile', Colors.green, () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const PersonalDetailsScreen()));
                    // Add functionality for Update Profile
                  }),
                  _buildActionButton('Set Password', Colors.red, () {
                    _showSetPasswordModal(context);
                  }),
                  _buildActionButton('      Logout      ', Colors.blue, () {
                    // Add functionality for Logout
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceCard(String imagePath, String value, String label, Color bgColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: bgColor, // Apply background color
                shape: BoxShape.rectangle, // Make the icon background circular
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: 30,
                  height:30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: value,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: label,
                  fontSize: 8,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child:CustomText(text: label,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          Expanded(
            child: CustomText(text: value,
              textAlign: TextAlign.end,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all( 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: onPressed,
      child:CustomText(text:label,fontSize: 10,color: Colors.white,),
    );
  }

  void _showSetPasswordModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const TextField(
                decoration: InputDecoration(
                  labelText: 'test@gmail.com',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined)
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Skip'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add password setting logic
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
