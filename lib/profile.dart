import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showTambahPortfolioDialog(BuildContext context) {
  final TextEditingController judulController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController durasiController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tambah Portfolio",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _buildField(
                  label: "Judul Portfolio *",
                  controller: judulController,
                  hint: "Masukkan judul portfolio",
                ),

                const SizedBox(height: 14),

                _buildField(
                  label: "Deskripsi *",
                  controller: deskripsiController,
                  hint: "Deskripsikan portfolio Anda",
                  maxLines: 4,
                ),

                const SizedBox(height: 14),

                _buildField(
                  label: "Durasi Pengerjaan *",
                  controller: durasiController,
                  hint: "Contoh: 2 minggu, 1 bulan",
                ),

                const SizedBox(height: 14),

                _buildField(
                  label: "Link Portfolio (Opsional)",
                  controller: linkController,
                  hint: "https://github.com/username/project",
                ),

                const SizedBox(height: 14),

                Text(
                  "Gambar Portfolio",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: const [
                      Icon(Icons.image_outlined, size: 40, color: Colors.grey),
                      SizedBox(height: 6),
                      Text(
                        "Klik untuk upload atau drag and drop\nPNG, JPG, GIF hingga 2MB",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                /// BUTTON BAWAH
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Batal"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 58, 5, 232),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // LOGIC SIMPAN DI SINI
                        Navigator.pop(context);
                      },
                      child: const Text("Simpan Portfolio", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void _showTambahSertifikatDialog(BuildContext context) {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tambah Sertifikat",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// NAMA SERTIFIKAT
                _buildField(
                  label: "Nama Sertifikat *",
                  controller: namaController,
                  hint: "Masukkan nama sertifikat",
                ),

                const SizedBox(height: 14),

                /// DESKRIPSI
                _buildField(
                  label: "Deskripsi (Opsional)",
                  controller: deskripsiController,
                  hint: "Deskripsikan sertifikat Anda",
                  maxLines: 4,
                ),

                const SizedBox(height: 14),

                /// FILE SERTIFIKAT
                const Text(
                  "File Sertifikat *",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: const [
                      Icon(Icons.image_outlined, size: 40, color: Colors.grey),
                      SizedBox(height: 6),
                      Text(
                        "Klik untuk upload atau drag and drop\nPNG, JPG, GIF, PDF, DOC, DOCX hingga 5MB",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                /// BUTTON
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Batal"),
                    ),

                    const SizedBox(width: 12),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF163887),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // LOGIC SIMPAN SERTIFIKAT
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Simpan Sertifikat",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}



Widget _buildField({
  required String label,
  required TextEditingController controller,
  required String hint,
  int maxLines = 1,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 6),
      TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        centerTitle: true,
        leading:
          IconButton(
            icon:  Icon(Icons.home_outlined, color: Colors.grey, size: 25),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),

          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child:
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Shapira Bunga Aulia",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text("PPLG XII-5",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pic1.jpeg'),
                    radius: 22,
                  ),
                ],
              )
            )
          ],
      ),
        body: Column(
          children: [
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.arrow_back, size: 18, color: Color.fromARGB(255, 255, 255, 255)),
                        SizedBox(width: 6),
                        Text(
                          "Kembali",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            // Header + Profile Picture
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 128,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/wikrama-mewah.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 24,
                  child: Stack(
                    children: [
                      Container(
                        width: 104,
                        height: 104,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 8,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 104,
                        height: 104,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        left: 4,
                        child: Container(
                          width: 96,
                          height: 96,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/pic1.jpeg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration:  BoxDecoration(
                            color: Color(0xFF163887),
                            shape: BoxShape.circle,
                          ),
                          child:  Icon(
                            Icons.camera_enhance_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

             SizedBox(height: 80),

            // Name + Share Button
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "Shapira Bunga Aulia",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(height: 8),
                        Text(
                          "12310047 | PPLG XII-5 | Cis 3",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color:  Color(0xFF163887),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon:  Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

             SizedBox(height: 24),

            // TAB BAR
             TabBar(
              labelColor: Color(0xFF163887),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Overview"),
                Tab(text: "Portfolio"),
                Tab(text: "Sertifikat"),
              ],
            ),

            // TAB VIEW
            Expanded(
              child: TabBarView(
                children: [
                  // Overview Tab
                  _buildOverviewTab(),

                  // Portfolio Tab
                  _buildPortfolioTab(),

                  // Sertifikat Tab
                  _buildCertificatesTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Portfolio Tab
  Widget _buildPortfolioTab() {
    return SingleChildScrollView(
      padding:  EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _showTambahPortfolioDialog(context);
                },
                icon:  Icon(Icons.add_circle_outline, size: 18),
                label:  Text("Tambah Portfolio"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFF163887),
                  foregroundColor: Colors.white,
                  padding:  EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),

           SizedBox(height: 16),

          // Empty State
          Container(
            padding:  EdgeInsets.symmetric(vertical: 64, horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset:  Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                 Text("💼", style: TextStyle(fontSize: 64)),
                 SizedBox(height: 16),
                 Text(
                  "Belum Ada Portfolio",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                 SizedBox(height: 8),
                Text(
                  "Portfolio akan ditampilkan di sini ketika sudah ditambahkan",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                 SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    _showTambahPortfolioDialog(context);
                  },
                  icon:  Icon(Icons.add_circle_outline, size: 18),
                  label:  Text("Tambah Portfolio Pertama"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF163887),
                    foregroundColor: Colors.white,
                    padding:  EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
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

  // Certificates Tab
  Widget _buildCertificatesTab() {
    return SingleChildScrollView(
      padding:  EdgeInsets.all(16),
      child: Column(
        children: [
          // Add Certificate Button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                    _showTambahSertifikatDialog(context);
                },
                icon:  Icon(Icons.add_circle_outline, size: 18),
                label:  Text("Tambah Sertifikat"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFF163887),
                  foregroundColor: Colors.white,
                  padding:  EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),

           SizedBox(height: 16),

          // Empty State
          Container(
            padding:  EdgeInsets.symmetric(vertical: 64, horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset:  Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                 Text("🏆", style: TextStyle(fontSize: 64)),
                 SizedBox(height: 16),
                 Text(
                  "Belum Ada Sertifikat",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                 SizedBox(height: 8),
                Text(
                  "Sertifikat akan ditampilkan di sini ketika sudah ditambahkan",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                 SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    _showTambahSertifikatDialog(context);
                  },
                  icon:  Icon(Icons.add_circle_outline, size: 18),
                  label:  Text("Tambah Sertifikat Pertama"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF163887),
                    foregroundColor: Colors.white,
                    padding:  EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
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

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding:  EdgeInsets.all(16),
      child: Column(
        children: [
          // Portfolio Card
          _buildPortfolioCard(),
           SizedBox(height: 16),

          // Certificates Card
          _buildCertificatesCard(),
           SizedBox(height: 16),

          // Documents Card
          _buildDocumentsCard(),
           SizedBox(height: 16),

          // Social Media Card
          _buildSocialMediaCard(),
        ],
      ),
    );
  }

  Widget _buildPortfolioCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset:  Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding:  EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  "Portfolio Terbaru",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon:  Icon(Icons.add_circle_outline, size: 16),
                      label:  Text(
                        "Tambah",
                        style: TextStyle(fontSize: 12),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        minimumSize:  Size(0, 32),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("|", style: TextStyle(color: Colors.grey)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child:  Text(
                        "Lihat Semua",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF163887),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Empty State
          Padding(
            padding:  EdgeInsets.all(48),
            child: Column(
              children: [
                 Text("💼", style: TextStyle(fontSize: 48)),
                 SizedBox(height: 8),
                Text(
                  "Portfolio akan ditampilkan di sini",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificatesCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset:  Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding:  EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  "Sertifikat Terbaru",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon:  Icon(Icons.add_circle_outline, size: 14),
                      label:  Text(
                        "Tambah",
                        style: TextStyle(fontSize: 11),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        minimumSize:  Size(0, 28),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Text("|", style: TextStyle(color: Colors.grey)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child:  Text(
                        "Lihat Semua",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF163887),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Empty State
          Padding(
            padding:  EdgeInsets.all(32),
            child: Column(
              children: [
                 Text("🏆", style: TextStyle(fontSize: 40)),
                 SizedBox(height: 8),
                Text(
                  "Sertifikat akan ditampilkan di sini",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset:  Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding:  EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child:  Text(
              "Dokumen",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),

          // Content
          Padding(
            padding:  EdgeInsets.all(16),
            child: Column(
              children: [
                // CV Document
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Curriculum Vitae",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                     SizedBox(height: 4),
                    Text(
                      "Dokumen CV siswa",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                     SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon:  Icon(Icons.download, size: 16),
                            label:  Text(
                              "Lihat CV",
                              style: TextStyle(fontSize: 12),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  Color(0xFF163887),
                              foregroundColor: Colors.white,
                              padding:  EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                         SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[700],
                              foregroundColor: Colors.white,
                              padding:  EdgeInsets.all(12),
                            ),
                            child:  Icon(Icons.upload, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                 SizedBox(height: 16),
                Divider(color: Colors.grey[300]),
                 SizedBox(height: 16),

                // Student Card Document
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Kartu Pelajar",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                     SizedBox(height: 4),
                    Text(
                      "Kartu identitas siswa",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                     SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding:  EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.warning_amber,
                                  size: 16,
                                  color: Colors.grey[500],
                                ),
                                 SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "Belum mengupload Kartu Pelajar",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                         SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[700],
                              foregroundColor: Colors.white,
                              padding:  EdgeInsets.all(12),
                            ),
                            child:  Icon(Icons.upload, size: 16),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(height: 12),
                    Container(
                      padding:  EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 16,
                            color: Colors.orange[800],
                          ),
                           SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Kartu pelajar dapat dilihat oleh anda dan guru",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.orange[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset:  Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding:  EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  "Media Sosial",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon:  Icon(Icons.edit_outlined, size: 14),
                  label:  Text("Edit", style: TextStyle(fontSize: 11)),
                  style: OutlinedButton.styleFrom(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    minimumSize:  Size(0, 28),
                  ),
                ),
              ],
            ),
          ),

          // Social Media Links
          Column(
            children: [
              _buildSocialMediaItem(
                "Linkedin",
                "https://www.linkedin.com/in/shapira797/",
              ),
              _buildSocialMediaItem(
                "Github",
                "https://github.com/Shapira-Bunga-Aulia",
              ),
              _buildSocialMediaItem(
                "Instagram",
                "https://www.instagram.com/_imyour.piw/",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaItem(String platform, String url) {
    return Container(
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style:  TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  url,
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF163887),
                    decoration: TextDecoration.underline,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(Icons.open_in_new, size: 16, color: Colors.grey[400]),
        ],
      ),
    );
  }
}