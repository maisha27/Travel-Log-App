import 'package:flutter/material.dart';
import 'dart:ui';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final Color deepSeaGreen = const Color(0xFF264F5C);
  final Color blueLagoon = const Color(0xFF007A8C);

  // Controllers for text fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selectedGender = 'Male';
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current user data
    _fullNameController.text = 'James Odin';
    _usernameController.text = '@james45';
    _emailController.text = 'jamesodin45@gmail.com';
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        // Background Image with Blur
        SizedBox.expand(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Image.asset(
              'assets/travel-bg2.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Semi-transparent overlay
        // Content
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                _buildProfileImage(),
                _buildForm(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          const Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage('assets/profile.jpg'),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: blueLagoon,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildTextField(
            label: 'Full name',
            controller: _fullNameController,
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  label: 'Gender',
                  value: _selectedGender,
                  items: ['Male', 'Female', 'Other'],
                  icon: Icons.people_outline,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDatePicker(
                  label: 'Birthday',
                  icon: Icons.calendar_today,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'E-mail',
            controller: _emailController,
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Username',
            controller: _usernameController,
            icon: Icons.alternate_email,
          ),
          const SizedBox(height: 32),
          _buildSaveButton(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

Widget _buildTextField({
  required String label,
  required TextEditingController controller,
  required IconData icon,
  TextInputType? keyboardType,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 4, bottom: 8),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 230),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(
            color: deepSeaGreen,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: blueLagoon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ),
    ],
  );
}

// Update the dropdown styling as well
Widget _buildDropdown({
  required String label,
  required String value,
  required List<String> items,
  required IconData icon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 4, bottom: 8),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 230),
          borderRadius: BorderRadius.circular(12),
        ),
        child: DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: blueLagoon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          dropdownColor: Colors.white,
          style: TextStyle(
            color: deepSeaGreen,
            fontSize: 16,
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue!;
            });
          },
        ),
      ),
    ],
  );
}

// Update the date picker styling
Widget _buildDatePicker({
  required String label,
  required IconData icon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 4, bottom: 8),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 230),
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: blueLagoon,
                      onPrimary: Colors.white,
                      surface: Colors.white,
                      onSurface: deepSeaGreen,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) {
              setState(() {
                _selectedDate = picked;
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Row(
              children: [
                Icon(icon, color: blueLagoon),
                const SizedBox(width: 12),
                Text(
                  '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: deepSeaGreen,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Handle save
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: blueLagoon,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Save',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}