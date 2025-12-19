import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_jurnalku/widgets/navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
      backgroundColor: Colors.grey[100],

      body: Stack(
        children: [
          Column(
            children: [
              _Header(onTapProfile: _toggleSidebar),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _HeroSection(),
                      const SizedBox(height: 32),
                      const _ResponsiveContent(),
                      const SizedBox(height: 40),
                      const _MenuSection(),
                      const SizedBox(height: 40),
                      _StatisticsSection(
                        isMobile: MediaQuery.of(context).size.width < 900,
                      ),
                      const SizedBox(height: 80),
                      buildFooter(),
                    ],
                  ),
                ),
              ),
            ],
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

class _Header extends StatelessWidget {
  final VoidCallback onTapProfile;

  const _Header({required this.onTapProfile});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            const Icon(Icons.home_outlined, size: 28, color: Colors.grey),

            if (isDesktop) ...[
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, size: 20, color: Colors.black54),
              const SizedBox(width: 8),
              const Text(
                "Dashboard",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],

            const Spacer(),

            GestureDetector(
              onTap: onTapProfile,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Shapira Bunga Aulia",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "PPLG XII-5",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/pic1.jpeg',
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
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
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(50),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bgsecondary.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Selamat Datang di Jurnalku",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            "Solusi cerdas untuk memantau perkembangan kompetensi siswa secara efektif",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ResponsiveContent extends StatelessWidget {
  const _ResponsiveContent();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
      child: Column(
        children: [
          const _InfoCard(),
          const SizedBox(height: 20),
          _FeatureSection(isMobile: isMobile),
          const SizedBox(height: 40),
          const _MenuSection(),
          const SizedBox(height: 40),
          _StatisticsSection(isMobile: isMobile),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 34, 68, 129),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Apa itu Jurnalku?",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif, terstruktur, dan real-time. Dengan fitur lengkap, proses pemantauan menjadi lebih mudah dan transparan.",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureSection extends StatelessWidget {
  final bool isMobile;
  const _FeatureSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final features = [
      _FeatureData(
        icon: Icons.account_balance_wallet_outlined,
        title: "Dirancang Khusus",
        desc:
            "Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.",
      ),
      _FeatureData(
        icon: Icons.trending_up_outlined,
        title: "Efektif",
        desc:
            "Memudahkan siswa dan guru melihat perkembangan secara real-time.",
      ),
      _FeatureData(
        icon: Icons.sync_alt_outlined,
        title: "Terintegrasi",
        desc:
            "Pengajuan kompetensi siswa, validasi dan laporan perkembangan yang transparan.",
      ),
    ];

    final List<Widget> cards = features
        .map(
          (f) => isMobile
              ? _FeatureCardDesktop(data: f)
              : _FeatureCardDesktop(data: f),
        )
        .toList();
    return isMobile
        ? Column(
            children: cards
                .map(
                  (c) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: c,
                  ),
                )
                .toList(),
          )
        : Row(
            children: cards
                .map(
                  (c) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: c,
                    ),
                  ),
                )
                .toList(),
          );
  }
}

class _FeatureData {
  final IconData icon;
  final String title;
  final String desc;
  const _FeatureData({
    required this.icon,
    required this.title,
    required this.desc,
  });
}

class _FeatureCardDesktop extends StatelessWidget {
  final _FeatureData data;
  const _FeatureCardDesktop({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: _cardDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: const Color(0xFF3B82F6),
            child: Icon(data.icon, size: 36, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            data.desc,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  const _MenuSection();

  static const topMenus = [
    {
      "icon": Icons.person_outline,
      "title": "Profil",
      "subtitle": "Lihat dan kelola profilmu di sini.",
      "target": "/profile",
    },
    {
      "icon": Icons.folder_open_outlined,
      "title": "Portofolio",
      "subtitle": "Lihat dan kelola portofolio kompetensimu di sini.",
      "target": "/portfolio",
    },
    {
      "icon": Icons.card_membership_outlined,
      "title": "Sertifikat",
      "subtitle": "Lihat dan unduh sertifikat kompetensimu di sini.",
      "target": "/certificate",
    },
    {
      "icon": Icons.search,
      "title": "Direktori Siswa",
      "subtitle": "Lihat daftar dan profil siswa.",
      "target": "/explore-private",
    },
  ];

  static const bottomMenus = [
    {
      "icon": Icons.book_outlined,
      "title": "Jurnal Pembiasaan",
      "subtitle": "Catat dan pantau kegiatan pembiasaan harianmu.",
      "target": "/daily_journal",
    },
    {
      "icon": Icons.task_alt_outlined,
      "title": "Permintaan Saksi",
      "subtitle": "Lihat teman yang mengajukan permintaan saksi.",
      "target": "/witness_requests",
    },
    {
      "icon": Icons.bar_chart_outlined,
      "title": "Progress",
      "subtitle": "Lihat kemajuan kompetensi dan pencapaian belajarmu.",
      "target": "/progress",
    },
    {
      "icon": Icons.warning_amber_outlined,
      "title": "Catatan Sikap",
      "subtitle": "Lihat catatan sikap dan perilaku dari guru.",
      "target": "/behavior_notes",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MENU APLIKASI",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          _MenuCard(items: topMenus),
          const SizedBox(height: 16),
          _MenuCard(items: bottomMenus),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const _MenuCard({required this.items});

  void _navigateToPage(
    BuildContext context,
    String title,
    String? targetRoute,
  ) {
    if (targetRoute != null) {
      Navigator.pushNamed(context, targetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cardDecoration(radius: 20),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(
          height: 1,
          thickness: 0.5,
          indent: 76,
          endIndent: 24,
          color: Color(0xFFE0E0E0),
        ),
        itemBuilder: (context, i) {
          final item = items[i];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 6,
            ),
            leading: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xFF3B82F6),
              child: Icon(
                item["icon"] as IconData,
                color: Colors.white,
                size: 26,
              ),
            ),
            title: Text(
              item["title"] as String,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              item["subtitle"] as String,
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {
              _navigateToPage(
                context,
                item["title"] as String,
                item["target"] as String?,
              );
            },
          );
        },
      ),
    );
  }
}

class _StatisticsSection extends StatelessWidget {
  final bool isMobile;
  const _StatisticsSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "STATISTIK KOMPETENSI",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          ..._buildStatCards(),
          const SizedBox(height: 32),
          isMobile
              ? Column(
                  children: [
                    const _ProgressCard(),
                    const SizedBox(height: 24),
                    const _CompetencySection(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(flex: 2, child: _CompetencySection()),
                    const SizedBox(width: 24),
                    const Expanded(child: _ProgressCard()),
                  ],
                ),
        ],
      ),
    );
  }

  List<Widget> _buildStatCards() {
    final stats = [
      {
        "title": "Materi Diselesaikan",
        "count": "2",
        "label": "Selesai",
        "color": Colors.green,
        "icon": Icons.check_circle_outline,
      },
      {
        "title": "Pengajuan Pending",
        "count": "1",
        "label": "Pending",
        "color": Colors.orange,
        "icon": Icons.access_time,
      },
      {
        "title": "Materi Hari Ini",
        "count": "0",
        "label": "Hari Ini",
        "color": Colors.blue,
        "icon": Icons.today_outlined,
      },
      {
        "title": "Materi Revisi",
        "count": "0",
        "label": "Revisi",
        "color": Colors.purple,
        "icon": Icons.refresh_outlined,
      },
    ];

    return stats.asMap().entries.map((e) {
      final s = e.value;
      final last = e.key == stats.length - 1;
      return Padding(
        padding: EdgeInsets.only(bottom: last ? 0 : 12),
        child: _StatCard(
          title: s["title"] as String,
          count: s["count"] as String,
          label: s["label"] as String,
          color: s["color"] as Color,
          icon: s["icon"] as IconData,
        ),
      );
    }).toList();
  }
}

class _StatCard extends StatelessWidget {
  final String title, count, label;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.count,
    required this.label,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  count,
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(icon, size: 28, color: color),
        ],
      ),
    );
  }
}

class _CompetencySection extends StatelessWidget {
  const _CompetencySection();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(radius: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lihat Progress Kamu →",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 24, 0, 129),
            ),
          ),
          const SizedBox(height: 12),
          _competencyItem("Installasi Postman", "Approved", Colors.green),
          const SizedBox(height: 8),
          Divider(color: Colors.grey.shade300),
          const SizedBox(height: 8),
          _competencyItem("Normalisasi Klinik", "Pending", Colors.orange),
          const SizedBox(height: 8),
          Divider(color: Colors.grey.shade300),
          TextButton(
            onPressed: () {},
            child: Text(
              "Lihat semua kompetensi →",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color.fromARGB(255, 24, 0, 129),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _competencyItem(String title, String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Text(
              status,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Text(
            "Progress Akademik",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          _legend("Selesai", "2", Colors.blue),
          _legend("Pending", "1", Colors.purple),
          _legend("Belum", "0", Colors.cyan),
          _legend("Hari Ini", "0", Colors.teal),
        ],
      ),
    );
  }

  Widget _legend(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700]),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration _cardDecoration({double radius = 16}) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(radius),
  );
}

Widget buildFooter() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 20),
    color: const Color(0xFFE7F1FF),
    child: Center(
      child: Text(
        "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: Colors.blue.shade700,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
