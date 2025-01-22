import 'package:flutter/material.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full Name
            const Text('Full Name'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Victory',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Email ID
            const Text('Email Id'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'test@gmail.com',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // DOB
            const Text('DOB'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: '25-10-2000',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 16),

            // Gender
            const Text('Gender'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: 'Male',
                    onChanged: (value) {},
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: 'Male',
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Mobile Number
            const Text('Mobile Number'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: '9787456673',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Address
            const Text('Address'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Delhi',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // City
            const Text('City'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Delhi',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // State
            const Text('State'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Delhi',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Pin Code
            const Text('Pin Code'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: '201009',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Country
            const Text('Country'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'India',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Update Now Button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: const Text(
                  'Update Now',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
