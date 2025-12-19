import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/widgets/navbar.dart';

class CatatanSikap extends StatefulWidget {
  const CatatanSikap({super.key});

  @override
  State<CatatanSikap> createState() => _CatatanSikapState();
}

class _CatatanSikapState extends State<CatatanSikap> {
  int expandedIndex = -1;
  bool _isSidebarVisible = false;

  final List<Map<String, String>> dataDummy = [
    {
      "kategori": "Keterlambatan",
      "judul": "Sering terlambat 20 menit, setelah bel sekolah",
      "status": "Diproses",
      "catatan": "Sering terlambat 20 menit, setelah bel sekolah",
      "update": "1 Des 2025",
      "lapor": "3 Des 2025",
    },
  ];

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

  Widget _buildDropdownCard(int index) {
    final item = dataDummy[index];
    final bool isOpen = expandedIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                expandedIndex = isOpen ? -1 : index;
              });
            },
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item["kategori"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item["judul"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellow[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          item["status"]!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  isOpen
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: 30,
                ),
              ],
            ),
          ),

          if (isOpen) ...[
            const SizedBox(height: 15),
            const Divider(),

            _buildRow("Catatan", item["catatan"]!),
            _buildRow("Status", item["status"]!),
            _buildRow("Update Terakhir", item["update"]!),
            _buildRow("Dilaporkan", item["lapor"]!),

            Row(
              children: const [
                SizedBox(width: 90),
                Text(
                  "Lihat",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const Text(": "),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: iconColor.withOpacity(0.15),
            child: Icon(icon, color: iconColor),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomHeader(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
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
              onPressed: () {
                Navigator.pop(context);
              },
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
                          color: Colors.black,
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
                    backgroundImage: const AssetImage(
                      "assets/images/pic1.jpeg", 
                    ),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCustomHeader(context), 

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Catatan Sikap Saya",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Lihat catatan sikap dan perilaku yang telah dilaporkan",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3CD),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.orange),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.orange,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Perhatian\nJika Anda merasa ada catatan yang tidak sesuai atau keliru, silakan hubungi guru jurusan untuk mengajukan klarifikasi.",
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildStatCard(
                        title: "Total Catatan",
                        value: "1",
                        icon: Icons.description_outlined,
                        iconColor: Colors.blue,
                      ),
                      const SizedBox(height: 14),
                      _buildStatCard(
                        title: "Dalam Perbaikan",
                        value: "1",
                        icon: Icons.flash_on,
                        iconColor: Colors.orange,
                      ),
                      const SizedBox(height: 14),
                      _buildStatCard(
                        title: "Sudah Berubah",
                        value: "3",
                        icon: Icons.check_circle,
                        iconColor: Colors.green,
                      ),
                      const SizedBox(height: 20),

                      for (int i = 0; i < dataDummy.length; i++)
                        _buildDropdownCard(i),
                    ],
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
}
