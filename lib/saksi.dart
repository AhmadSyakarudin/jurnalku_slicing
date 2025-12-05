import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_jurnalku/widgets/navbar.dart';

class SaksiPage extends StatelessWidget {
  const SaksiPage({super.key});

  final List<Map<String, dynamic>> requests = const [
    {
      "pengirim": "Siti Nurhaliza",
      "kelas": "PPLG XII-3",
      "tanggal": "2 Desember 2025",
      "waktu": "09:15 WIB",
      "alasan":
          "Membutuhkan saksi untuk laporan praktikum Rekayasa Perangkat Lunak hari ini.",
      "status": "Menunggu",
    },
  ];

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool hasData = requests.isNotEmpty;

    return Scaffold(
      endDrawer: const NavbarPage(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.home_outlined, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Ahmad Syakarudin',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'PPLG XII-5',
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(
                          'assets/images/pp-dummy.jpg',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),
            Divider(color: Colors.grey.shade300),
            const SizedBox(height: 20),

            LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop = constraints.maxWidth > 600;

                final dateWidget = Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Tuesday, 2 December 2025',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade900,
                    ),
                  ),
                );

                final title = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Permintaan Saksi',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Kelola permintaan menjadi saksi dari siswa lain',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                );

                return isDesktop
                    ? Row(children: [title, const Spacer(), dateWidget])
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title,
                          const SizedBox(height: 12),
                          dateWidget,
                        ],
                      );
              },
            ),

            const SizedBox(height: 24),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // Header Tabel
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                      ),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(2),
                          2: FlexColumnWidth(2),
                        },
                        children: [
                          TableRow(
                            children: [
                              _buildHeaderCell('PENGIRIM'),
                              _buildHeaderCell('TANGGAL'),
                              _buildHeaderCell('KONFIRMASI'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    hasData
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: requests.length,
                              itemBuilder: (context, index) {
                                final req = requests[index];

                                return ExpansionTile(
                                  tilePadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 4,
                                  ),
                                  childrenPadding: const EdgeInsets.fromLTRB(
                                    16,
                                    0,
                                    16,
                                    20,
                                  ),
                                  leading: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.blue.shade100,
                                    child: Text(
                                      req['pengirim'][0],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue.shade900,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    req['pengirim'],
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${req['tanggal']} • ${req['waktu']}',
                                    style: GoogleFonts.poppins(fontSize: 13),
                                  ),
                                  trailing: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 28,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    Divider(thickness: 0.8),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Alasan Permintaan',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      req['alasan'],
                                      style: GoogleFonts.poppins(fontSize: 14),
                                    ),
                                    const SizedBox(height: 20),

                                    // Tombol Aksi
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Permintaan ditolak',
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text('Tolak'),
                                        ),
                                        const SizedBox(width: 12),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                          ),
                                          onPressed: () {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Permintaan diterima',
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Terima',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        : Expanded(child: _buildEmptyState()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.groups_outlined, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 20),
          Text(
            'Belum ada permintaan',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Belum ada yang mengirim permintaan saksi kepada Anda',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
