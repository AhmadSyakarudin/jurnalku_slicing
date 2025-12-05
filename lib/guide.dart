import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_jurnalku/widgets/navbar.dart';

class GuideApp extends StatelessWidget {
  const GuideApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      endDrawer: const NavbarPage(),
      backgroundColor: Colors.grey[100],
      body: DefaultTextStyle(
        style: GoogleFonts.poppins(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Buka drawer dari kanan
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.home_outlined, size: 25),
                        const SizedBox(width: 12),
                
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Ahmad Syakarudin",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "PPLG XII-5",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                
                        const SizedBox(width: 12),
                
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(
                            "assets/images/pp-dummy.jpg",
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.menu_book_rounded,
                            color: Colors.lightBlueAccent,
                            size: 28,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Panduan Penggunaan",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Text(
                        "Selamat datang di panduan penggunaan aplikasi Jurnalku. Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur yang tersedia dengan optimal.",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Umum",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Divider(color: Colors.grey.shade300),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              _GuideItem(
                icon: Icons.file_upload_outlined,
                title: "Unggah Profile",
                subtitle: "Panduan untuk mengunggah profile pengguna",
              ),

              _GuideItem(
                icon: Icons.lock_outline,
                title: "Ganti Password",
                subtitle: "Panduan untuk mengganti password pengguna",
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Untuk Siswa",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Divider(color: Colors.grey.shade300),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              _GuideItem(
                icon: Icons.edit_document,
                title: "Mengisi Jurnal",
                subtitle: "Panduan untuk mengisi kegiatan sehari - hari",
              ),

              _GuideItem(
                icon: Icons.person,
                title: "Kelengkapan Profile",
                subtitle: "Panduan untuk melengkapi profile",
              ),

              _GuideItem(
                icon: Icons.folder_copy,
                title: "Mengelola Portfolio",
                subtitle: "Panduan untuk menambah, edit, dan hapus portfolio",
              ),

              _GuideItem(
                icon: Icons.check_circle_outline,
                title: "Mengelola Sertifikat",
                subtitle: "Panduan untuk menambah, edit, dan hapus sertifikat",
              ),

              _GuideItem(
                icon: Icons.info_outline,
                title: "Catatan Sikap Saya",
                subtitle: "Panduan untuk melihat dan memahami catatan sikap",
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuideItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _GuideItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blue, size: 30),
            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
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
