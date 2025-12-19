import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/widgets/navbar.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  bool _isSidebarVisible = false;

  void _toggleSidebar() {
    setState(() {
      _isSidebarVisible = !_isSidebarVisible;
    });
  }

  void _navigateToAndClose(String routeName) {
    if (_isSidebarVisible) {
      _toggleSidebar();
    }
    Navigator.pushReplacementNamed(context, routeName);
  }

  void _handleLogOut() {
    if (_isSidebarVisible) {
      _toggleSidebar();
    }
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Progress Belajar",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Pantau perkembangan kompetensi dan materi \npembelajaran Anda",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Tuesday, 2 December 2025",
                              style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          _buildStatCard(
                            title: "Total Pengajuan",
                            value: "2",
                            statusText: "Semua status",
                            statusColor: Colors.blue,
                            icon: Icons.check_circle_outline,
                            iconColor: Colors.blue,
                            iconBgColor: Colors.blue.shade50,
                          ),
                          const SizedBox(height: 16),
                          _buildStatCard(
                            title: "Halaman Ini",
                            value: "0",
                            statusText: "Data ditampilkan",
                            statusColor: Colors.green,
                            icon: Icons.calendar_today_outlined,
                            iconColor: Colors.green,
                            iconBgColor: Colors.green.shade50,
                          ),
                          const SizedBox(height: 16),
                          _buildStatCard(
                            title: "Status Pending",
                            value: "0",
                            statusText: "Perlu validasi",
                            statusColor: Colors.orange,
                            icon: Icons.access_time,
                            iconColor: Colors.orange,
                            iconBgColor: Colors.orange.shade50,
                          ),
                          const SizedBox(height: 16),
                          _buildStatCard(
                            title: "Total Halaman",
                            value: "1",
                            statusText: "Navigasi tersedia",
                            statusColor: Colors.purple,
                            icon: Icons.emoji_events_outlined,
                            iconColor: Colors.purple,
                            iconBgColor: Colors.purple.shade50,
                          ),
                          const SizedBox(height: 30),
                          _buildProjectCard(
                            title: "Project Work",
                            subtitle: "Kompetensi dan materi pembelajaran",
                            items: [
                              _ProjectData(
                                title: "Pemrograman Dasar",
                                kompetensi: "Logika dan Algoritma Dasar",
                                guru: "Pak Budi",
                                date: "02 Des 2025",
                                status: "Pending",
                                statusColor: Colors.orange,
                                noteGuru: "Revisi bab 1 bagian algoritma flow.",
                                noteSiswa: "Sudah diperbaiki pak.",
                              ),
                              _ProjectData(
                                title: "Desain UI/UX",
                                kompetensi: "Prototyping Figma",
                                guru: "Bu Siti",
                                date: "01 Des 2025",
                                status: "Selesai",
                                statusColor: Colors.green,
                                noteGuru: "Sangat bagus, pertahankan.",
                                noteSiswa: "-",
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildProjectCard(
                            title: "Mobile Apps",
                            subtitle: "Kompetensi dan materi pembelajaran",
                            items: [],
                          ),
                          const SizedBox(height: 16),
                          _buildProjectCard(
                            title: "UKK (Uji Kompetensi Keahlian)",
                            subtitle: "Kompetensi dan materi pembelajaran",
                            items: [],
                          ),
                          const SizedBox(height: 16),
                          _buildProjectCard(
                            title: "GIM",
                            subtitle: "Kompetensi dan materi pembelajaran",
                            items: [],
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isSidebarVisible)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleSidebar,
                child: Container(color: Colors.black.withOpacity(0.3)),
              ),
            ),
          if (_isSidebarVisible)
            NavbarPage(
              onClose: _toggleSidebar,
              onNavigate: _navigateToAndClose,
              onLogOut: _handleLogOut,
            ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.home_outlined, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          GestureDetector(
            onTap: _toggleSidebar,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Shapira Bunga Aulia",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "PPLG XII-5",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const AssetImage("assets/images/pic1.jpeg"),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String statusText,
    required Color statusColor,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.circle, size: 8, color: statusColor),
              const SizedBox(width: 8),
              Text(
                statusText,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String subtitle,
    required List<_ProjectData> items,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade200),
          if (items.isEmpty)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "Belum ada data",
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) =>
                  Divider(height: 1, color: Colors.grey.shade100),
              itemBuilder: (context, index) {
                final item = items[index];
                return Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    title: Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    children: [
                      Container(
                        color: const Color(0xFFFAFAFA),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            _buildDetailRow("Kompetensi", item.kompetensi),
                            const SizedBox(height: 12),
                            _buildDetailRow("Guru", item.guru),
                            const SizedBox(height: 12),
                            _buildDetailRow("Tanggal", item.date),
                            const SizedBox(height: 12),
                            _buildDetailRow(
                              "Status",
                              item.status,
                              colorValue: item.statusColor,
                            ),
                            const SizedBox(height: 12),
                            _buildDetailRow("Catatan Guru", item.noteGuru),
                            const SizedBox(height: 12),
                            _buildDetailRow("Catatan Siswa", item.noteSiswa),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? colorValue}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13,
              color: colorValue ?? Colors.black87,
              fontWeight: colorValue != null
                  ? FontWeight.w600
                  : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectData {
  final String title;
  final String kompetensi;
  final String guru;
  final String date;
  final String status;
  final Color statusColor;
  final String noteGuru;
  final String noteSiswa;

  _ProjectData({
    required this.title,
    required this.kompetensi,
    required this.guru,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.noteGuru,
    required this.noteSiswa,
  });
}
