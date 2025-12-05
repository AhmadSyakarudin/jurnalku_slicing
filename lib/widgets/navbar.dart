import 'package:flutter/material.dart';

class NavbarPage extends StatelessWidget {
  const NavbarPage({super.key});

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, routeName);
  }

  void _logOut(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/login');
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54, size: 22),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 14.0),
      ),
      onTap: onTap,
      minLeadingWidth: 25,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          children: [

            _buildMenuItem(
              icon: Icons.home_outlined,
              title: 'Dashboard',
              onTap: () => _navigateTo(context, '/'),
            ),
            _buildMenuItem(
              icon: Icons.person_outline,
              title: 'Profil',
              onTap: () => _navigateTo(context, '/profile'),
            ),
            _buildMenuItem(
              icon: Icons.explore_outlined,
              title: 'Jelajahi',
              onTap: () => _navigateTo(context, '/explore'),
            ),

            const Divider(height: 1, thickness: 0.5, indent: 16, endIndent: 16),

            _buildMenuItem(
              icon: Icons.book_outlined,
              title: 'Jurnal Pembiasaan',
              onTap: () => _navigateTo(context, '/jurnal'),
            ),
            _buildMenuItem(
              icon: Icons.person_add_alt_outlined,
              title: 'Permintaan Saksi',
              onTap: () => _navigateTo(context, '/saksi'),
            ),
            _buildMenuItem(
              icon: Icons.bar_chart,
              title: 'Progress',
              onTap: () => _navigateTo(context, '/progress'),
            ),
            _buildMenuItem(
              icon: Icons.warning_amber_outlined,
              title: 'Catatan Sikap',
              onTap: () => _navigateTo(context, '/catatan-sikap'),
            ),

            const Divider(height: 1, thickness: 0.5, indent: 16, endIndent: 16),

            _buildMenuItem(
              icon: Icons.menu_book_outlined,
              title: 'Panduan Penggunaan',
              onTap: () => _navigateTo(context, '/guide'),
            ),
            _buildMenuItem(
              icon: Icons.settings_outlined,
              title: 'Pengaturan Akun',
              onTap: () => _navigateTo(context, '/settings'),
            ),
            _buildMenuItem(
              icon: Icons.logout,
              title: 'Log Out',
              onTap: () => _logOut(context),
            ),
          ],
        ),
      ),
    );
  }
}
