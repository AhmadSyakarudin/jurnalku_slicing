// file: widgets/navbar.dart (Sudah Diperbaiki)

import 'package:flutter/material.dart';

class NavbarPage extends StatelessWidget {
  final VoidCallback onClose;
  final Function(String) onNavigate;
  final VoidCallback onLogOut;

  const NavbarPage({
    super.key,
    required this.onClose,
    required this.onNavigate,
    required this.onLogOut,
  });

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
    final double screenWidth = MediaQuery.of(context).size.width;
    // Rasio diperbesar dari 0.4 menjadi 0.75 (75%) agar lebih mudah digunakan di ponsel.
    const double navbarWidthRatio = 0.75;

    return Positioned(
      top: 0,
      right: 0,
      width: screenWidth * navbarWidthRatio,
      child: Material(
        elevation: 8.0,
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 4.0),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: onClose,
                      ),
                    ),
                  ),

                  // Menu Items
                  _buildMenuItem(
                    icon: Icons.home_outlined,
                    title: 'Dashboard',
                    onTap: () =>
                        onNavigate('/dashboard'), // Mengarahkan ke /dashboard
                  ),
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Profil',
                    onTap: () => onNavigate('/profile'),
                  ),
                  _buildMenuItem(
                    icon: Icons.explore_outlined,
                    title: 'Jelajahi (Direktori Siswa)',
                    onTap: () => onNavigate(
                      '/explore-private',
                    ), // << PERBAIKAN: Mengarah ke rute privat
                  ),

                  const Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 16,
                    endIndent: 16,
                  ),

                  _buildMenuItem(
                    icon: Icons.book_outlined,
                    title: 'Jurnal Pembiasaan',
                    onTap: () => onNavigate('/jurnal'),
                  ),
                  _buildMenuItem(
                    icon: Icons.person_add_alt_outlined,
                    title: 'Permintaan Saksi',
                    onTap: () => onNavigate('/saksi'),
                  ),
                  _buildMenuItem(
                    icon: Icons.bar_chart,
                    title: 'Progress',
                    onTap: () => onNavigate('/progress'),
                  ),
                  _buildMenuItem(
                    icon: Icons.warning_amber_outlined,
                    title: 'Catatan Sikap',
                    onTap: () => onNavigate('/catatan-sikap'),
                  ),

                  const Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 16,
                    endIndent: 16,
                  ),

                  _buildMenuItem(
                    icon: Icons.menu_book_outlined,
                    title: 'Panduan Penggunaan',
                    onTap: () => onNavigate('/guide'),
                  ),
                  _buildMenuItem(
                    icon: Icons.settings_outlined,
                    title: 'Pengaturan Akun',
                    onTap: () => onNavigate('/settings'),
                  ),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Log Out',
                    onTap: onLogOut,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
