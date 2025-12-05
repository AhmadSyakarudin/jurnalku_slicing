import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_jurnalku/widgets/navbar.dart' show NavbarPage;

class JurnalPage extends StatefulWidget {
  const JurnalPage({super.key});

  @override
  State<JurnalPage> createState() => _JurnalPageState();
}

class _JurnalPageState extends State<JurnalPage> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  endDrawer() => const NavbarPage();

  void _showAddWorkDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'B. Pekerjaan',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, size: 20),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  const Divider(height: 30),
                  Text(
                    'Saksi',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    hint: Text(
                      'Pilih teman rombel...',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: '1', child: Text('Teman 1')),
                      DropdownMenuItem(value: '2', child: Text('Teman 2')),
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tanggal',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2030),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _dateController.text = "${pickedDate.day}/12/2025";
                        });
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'hh/12/2025',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(
                        Icons.calendar_today_outlined,
                        size: 18,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Pekerjaan yang dilakukan',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                            color: Colors.grey.shade50,
                          ),
                          child: Row(
                            children: [
                              _buildToolbarIcon(Icons.format_bold),
                              _buildToolbarIcon(Icons.format_italic),
                              _buildToolbarIcon(Icons.strikethrough_s),
                              const SizedBox(width: 8),
                              _buildToolbarIcon(Icons.title),
                              _buildToolbarIcon(Icons.format_quote),
                              _buildToolbarIcon(Icons.code),
                              const SizedBox(width: 8),
                              _buildToolbarIcon(Icons.format_list_bulleted),
                              _buildToolbarIcon(Icons.format_list_numbered),
                              _buildToolbarIcon(Icons.format_indent_decrease),
                              _buildToolbarIcon(Icons.format_indent_increase),
                              const Spacer(),
                              _buildToolbarIcon(Icons.undo),
                              _buildToolbarIcon(Icons.redo),
                            ],
                          ),
                        ),
                        TextField(
                          maxLines: 5,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                          ),
                          style: GoogleFonts.inter(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Tambah',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showAddMaterialDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'C. Materi',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, size: 20),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  const Divider(height: 30),
                  Text(
                    'Materi',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    hint: Text(
                      'Pilih materi...',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: '1', child: Text('Materi 1')),
                      DropdownMenuItem(value: '2', child: Text('Materi 2')),
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tanggal',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2030),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _dateController.text = "${pickedDate.day}/12/2025";
                        });
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'hh/12/2025',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(
                        Icons.calendar_today_outlined,
                        size: 18,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Catatan ke guru (optional)',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                            color: Colors.grey.shade50,
                          ),
                          child: Row(
                            children: [
                              _buildToolbarIcon(Icons.format_bold),
                              _buildToolbarIcon(Icons.format_italic),
                              _buildToolbarIcon(Icons.strikethrough_s),
                              const SizedBox(width: 8),
                              _buildToolbarIcon(Icons.title),
                              _buildToolbarIcon(Icons.format_quote),
                              _buildToolbarIcon(Icons.code),
                              const SizedBox(width: 8),
                              _buildToolbarIcon(Icons.format_list_bulleted),
                              _buildToolbarIcon(Icons.format_list_numbered),
                              _buildToolbarIcon(Icons.format_indent_decrease),
                              _buildToolbarIcon(Icons.format_indent_increase),
                              const Spacer(),
                              _buildToolbarIcon(Icons.undo),
                              _buildToolbarIcon(Icons.redo),
                            ],
                          ),
                        ),
                        TextField(
                          maxLines: 5,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                          ),
                          style: GoogleFonts.inter(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Tambah',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildToolbarIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Icon(icon, size: 18, color: Colors.grey[700]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const NavbarPage(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 24),
              Text(
                'Jurnal Pembiasaan',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'DESEMBER - 2025',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Navigasi ke bulan sebelumnya'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 2,
                ),
                icon: const Icon(Icons.arrow_back, size: 18),
                label: Text(
                  'Bulan Sebelumnya',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('A. Pembiasaan harian'),
              const SizedBox(height: 12),
              _buildLegend(),
              const SizedBox(height: 16),
              _buildCalendarGrid(),
              const SizedBox(height: 32),
              _buildSectionTitle('B. Pekerjaan yang dilakukan'),
              const SizedBox(height: 12),
              _buildWorkTable(context),
              const SizedBox(height: 32),
              _buildSectionTitle('C. Materi yang dipelajari'),
              const SizedBox(height: 12),
              _buildMaterialTable(context),
              const SizedBox(height: 12),
              _buildStatusLegend(),
              const SizedBox(height: 32),
              _buildSectionTitle('D. Poin'),
              const SizedBox(height: 12),
              _buildPointsTable(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(50),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.home_outlined, size: 28, color: Colors.grey),
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Ahmad Syakarudin',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'PPLG XII-5',
              style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/pp-dummy.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      children: [
        _legendItem(Colors.green, 'Sudah diisi'),
        const SizedBox(width: 16),
        _legendItem(Colors.grey.shade300, 'Belum diisi'),
        const SizedBox(width: 16),
        _legendItem(Colors.red, 'Tidak diisi'),
      ],
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    final List<String> days = List.generate(
      31,
      (index) => (index + 1).toString().padLeft(2, '0'),
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.2,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        String day = days[index];
        bool isMissed = day == "01" || day == "02";

        return Container(
          decoration: BoxDecoration(
            color: isMissed ? const Color(0xFFFFEBEE) : const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                day,
                style: GoogleFonts.inter(
                  color: isMissed ? Colors.red : Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isMissed)
                const Positioned(
                  top: 4,
                  right: 4,
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 14,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWorkTable(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Container(
            color: const Color(0xFFE3F2FD),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Expanded(flex: 3, child: _tableHeader('Pekerjaan')),
                Expanded(
                  flex: 1,
                  child: _tableHeader('Tgl', align: TextAlign.center),
                ),
                Expanded(
                  flex: 1,
                  child: _tableHeader('Saksi', align: TextAlign.center),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFBBDEFB))),
            ),
            child: Text(
              'Belum ada pekerjaan yang diinput.',
              style: GoogleFonts.inter(
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ),
          InkWell(
            onTap: () => _showAddWorkDialog(context),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Text(
                '+ Tambah Pekerjaan',
                style: GoogleFonts.inter(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialTable(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Container(
            color: const Color(0xFFE3F2FD),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Expanded(flex: 3, child: _tableHeader('Materi')),
                Expanded(
                  flex: 1,
                  child: _tableHeader('Sts', align: TextAlign.center),
                ),
                Expanded(
                  flex: 1,
                  child: _tableHeader('Tgl', align: TextAlign.center),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFBBDEFB))),
            ),
            child: Text(
              'Belum ada materi yang diinput.',
              style: GoogleFonts.inter(
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ),
          InkWell(
            onTap: () => _showAddMaterialDialog(context),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Text(
                '+ Tambah Materi',
                style: GoogleFonts.inter(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusLegend() {
    return Row(
      children: [
        _legendItem(Colors.green, 'A : Approved'),
        const SizedBox(width: 16),
        _legendItem(Colors.amber, 'P : Pending'),
        const SizedBox(width: 16),
        _legendItem(Colors.red, 'R : Revisi'),
      ],
    );
  }

  Widget _buildPointsTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Container(
            color: const Color(0xFFE3F2FD),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: _tableHeader('Kategori Poin'),
                    ),
                  ),
                  const VerticalDivider(width: 1, color: Color(0xFFBBDEFB)),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color(0xFFBBDEFB)),
                            ),
                          ),
                          child: _tableHeader('Jumlah Poin'),
                        ),
                        Row(
                          children: [
                            _subHeader('M1'),
                            _subHeader('M2'),
                            _subHeader('M3'),
                            _subHeader('M4'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _pointRow('(5) mengerjakan project/adanya update progress belajar', [
            '0',
            '0',
            '0',
            '0',
          ]),
          _pointRow(
            '(1 - 5) poin dari pertanyaan atau laporan pengetahuan materi',
            ['0', '0', '0', '0'],
          ),
          _pointRow('Jumlah poin minggu ini', [
            '0',
            '0',
            '0',
            '0',
          ], isLastWeekRow: true),
          _mergedPointRow('Jumlah poin ceklist pembiasaan', '0'),
          _mergedPointRow('Jumlah keseluruhan poin', '0', isLast: true),
        ],
      ),
    );
  }

  Widget _subHeader(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: Colors.transparent)),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _pointRow(
    String title,
    List<String> values, {
    bool isLastWeekRow = false,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFBBDEFB))),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.grey[800],
                    height: 1.3,
                  ),
                ),
              ),
            ),
            const VerticalDivider(width: 1, color: Color(0xFFBBDEFB)),
            Expanded(
              flex: 3,
              child: Row(
                children: values
                    .map(
                      (e) => Expanded(
                        child: Center(
                          child: Text(
                            e,
                            style: GoogleFonts.inter(
                              color: Colors.grey[700],
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mergedPointRow(String title, String value, {bool isLast = false}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFBBDEFB))),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
            const VerticalDivider(width: 1, color: Color(0xFFBBDEFB)),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  value,
                  style: GoogleFonts.inter(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tableHeader(String text, {TextAlign align = TextAlign.left}) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Colors.black87,
      ),
    );
  }
}
