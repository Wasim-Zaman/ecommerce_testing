import 'package:flutter/material.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mitt konto',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              // User Profile Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Profile Picture
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // User Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Wasim Zaman',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'wasimxaman13@gmail.com',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '+923005447070',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Settings Options
              _buildSettingOption(
                icon: Icons.settings,
                title: 'Kontoinstallningar',
                onTap: () {},
              ),
              _buildSettingOption(
                icon: Icons.payment,
                title: 'Mina betalmetoder',
                onTap: () {},
              ),
              _buildSettingOption(
                icon: Icons.support_agent,
                title: 'Support',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
