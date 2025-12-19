import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slicing_jurnalku/dashboard.dart';
import 'package:slicing_jurnalku/explore_page.dart';

void main() {
  runApp(const ExplorePage1());
}

class ExplorePage1 extends StatelessWidget {
  const ExplorePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explore',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        primaryColor: const Color(0xff0A3F88),
        scaffoldBackgroundColor: const Color(0xffF5F6FA),
        useMaterial3: true,
      ),
      home: const DirectoryPage(),
    );
  }
}

class Student {
  final String name;
  final String nis;
  final String rombel;
  final String rayon;
  final int portfolioCount;
  final int certificateCount;
  final String imageUrl;

  Student({
    required this.name,
    required this.nis,
    required this.rombel,
    required this.rayon,
    required this.portfolioCount,
    required this.certificateCount,
    required this.imageUrl,
  });
}

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({super.key});

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
  final int _itemsPerPage = 5;
  int _currentPage = 1;
  final TextEditingController _searchController = TextEditingController();

  bool _isFilterExpanded = false;
  String? _selectedRombel;
  String? _selectedRayon;
  String? _selectedJurusan;

  final List<Student> _allStudents = List.generate(20, (index) {
    return Student(
      name: index % 2 == 0 ? "Abdee Munzie Alazkha" : "Achmad Arya Djayadilaga",
      nis: "${12309000 + index}",
      rombel: index % 2 == 0 ? "PPLG X-3" : "PPLG XI-4",
      rayon: index % 2 == 0 ? "Cia 1" : "Wik 3",
      portfolioCount: (index * 2) + 1,
      certificateCount: (index * 3) + 2,
      imageUrl: "https://i.pravatar.cc/150?img=${index + 12}",
    );
  });

  List<Student> _filteredStudents = [];

  @override
  void initState() {
    super.initState();
    _filteredStudents = _allStudents;
  }

  void _handleSearch() {
    setState(() {
      _filteredStudents = _allStudents
          .where(
            (s) =>
                s.name.toLowerCase().contains(
                  _searchController.text.toLowerCase(),
                ) ||
                s.nis.contains(_searchController.text),
          )
          .toList();
      _currentPage = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int startIndex = (_currentPage - 1) * _itemsPerPage;
    final int endIndex = (startIndex + _itemsPerPage < _filteredStudents.length)
        ? startIndex + _itemsPerPage
        : _filteredStudents.length;

    final List<Student> currentData = _filteredStudents.isEmpty
        ? []
        : _filteredStudents.sublist(startIndex, endIndex);

    final int totalPages = (_filteredStudents.length / _itemsPerPage).ceil();

    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/background.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xff0A3F88).withOpacity(0.85),
                          const Color(0xff0A3F88).withOpacity(0.95),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Positioned(
                                bottom: 4,
                                left: 0,
                                right: 55,
                                child: Container(
                                  height: 12,
                                  color: Colors.white.withOpacity(0.15),
                                ),
                              ),
                              Text(
                                "Direktori Siswa",
                                style: GoogleFonts.inter(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Temukan dan jelajahi profil siswa SMK Wikrama Bogor",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff0A3F88).withOpacity(0.08),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 48,
                                  child: TextField(
                                    controller: _searchController,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      hintText:
                                          "Cari nama siswa, NIS, atau rombel...",
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 14,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.grey[400],
                                        size: 20,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.zero,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
                                          color: Color(0xff0A3F88),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff0A3F88),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: _handleSearch,
                                  child: Text(
                                    "Cari",
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isFilterExpanded = !_isFilterExpanded;
                                });
                              },
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.filter_alt_outlined,
                                      size: 16,
                                      color: Colors.grey[700],
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Filter Lanjutan",
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(
                                      _isFilterExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      size: 18,
                                      color: Colors.grey[700],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (_isFilterExpanded) ...[
                            const SizedBox(height: 24),
                            _buildFilterDropdown("Rombel", "Semua Rombel", [
                              "PPLG X",
                              "PPLG XI",
                              "PPLG XII",
                            ]),
                            const SizedBox(height: 16),
                            _buildFilterDropdown("Rayon", "Semua Rayon", [
                              "Ciawi",
                              "Cisarua",
                              "Cicurug",
                              "Wikrama",
                            ]),
                            const SizedBox(height: 16),
                            _buildFilterDropdown("Jurusan", "Semua Jurusan", [
                              "PPLG",
                              "TJKT",
                              "DKV",
                              "PMN",
                              "HTL",
                              "KLN",
                              "BDP",
                            ]),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff0A3F88),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  setState(() => _isFilterExpanded = false);
                                  _handleSearch();
                                },
                                child: Text(
                                  "Terapkan Filter",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0xffF8F9FA),
                                  side: BorderSide(color: Colors.grey.shade300),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectedRombel = null;
                                    _selectedRayon = null;
                                    _selectedJurusan = null;
                                  });
                                },
                                child: Text(
                                  "Reset Filter",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _filteredStudents.isEmpty
                      ? "Tidak ada data ditemukan"
                      : "Menampilkan ${startIndex + 1} - $endIndex dari ${_filteredStudents.length} siswa",
                  style: GoogleFonts.inter(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: currentData.length,
              itemBuilder: (context, index) {
                return StudentCard(student: currentData[index]);
              },
            ),
            if (_filteredStudents.isNotEmpty)
              _buildPaginationControls(totalPages),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdown(String label, String hint, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          hint: Text(
            hint,
            style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[500]),
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: GoogleFonts.inter(fontSize: 14)),
            );
          }).toList(),
          onChanged: (val) {},
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 20,
      title: Row(
        children: [
          const Icon(Icons.book, color: Color(0xff0A3F88), size: 24),
          const SizedBox(width: 8),
          Text(
            "Jurnalku",
            style: GoogleFonts.inter(
              color: const Color(0xff2C3E50),
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0A3F88),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 0,
                ),
                fixedSize: const Size.fromHeight(36),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardPage(),
                  ),
                );
              },
              child: const Text(
                "Dahsboard",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaginationControls(int totalPages) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.grey[700],
              side: BorderSide(color: Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: _currentPage > 1
                ? () => setState(() => _currentPage--)
                : null,
            child: Text(
              "« Previous",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.grey[700],
              side: BorderSide(color: Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: _currentPage < totalPages
                ? () => setState(() => _currentPage++)
                : null,
            child: Text(
              "Next »",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      color: const Color(0xff0A3F88),
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(FontAwesomeIcons.whatsapp),
              const SizedBox(width: 20),
              _socialIcon(FontAwesomeIcons.instagram),
              const SizedBox(width: 20),
              _socialIcon(FontAwesomeIcons.linkedinIn),
              const SizedBox(width: 20),
              _socialIcon(FontAwesomeIcons.youtube),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff0A3F88).withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                  image: DecorationImage(
                    image: NetworkImage(student.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff0A3F88),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          student.nis,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        _buildDivider(),
                        Text(
                          student.rombel,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        _buildDivider(),
                        Text(
                          student.rayon,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.grey[100], thickness: 1.5, height: 1),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildStatItem(
                Icons.folder_open_outlined,
                "${student.portfolioCount} Portfolio",
              ),
              const Spacer(),
              _buildStatItem(
                Icons.verified_outlined,
                "${student.certificateCount} Sertifikat",
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0A3F88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lihat Detail",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 1,
      height: 12,
      color: Colors.grey[300],
    );
  }

  Widget _buildStatItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[400]),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
