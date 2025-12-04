import 'package:flutter/material.dart';

class CatatanSikap extends StatefulWidget {
  const CatatanSikap({super.key});

  @override
  State<CatatanSikap> createState() => _CatatanSikapState();
}

class _CatatanSikapState extends State<CatatanSikap> {
  int expandedIndex = -1;

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
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
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
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item["kategori"]!,
                          style: const TextStyle(color: Colors.white, fontSize: 12),
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
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                )
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
            )
          ]
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
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.w600)),
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 6),
              Text(value,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home_outlined, color: Colors.grey, size: 25),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Shapira Bunga Aulia",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text("PPLG XII-5",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pic1.jpeg'),
                  radius: 22,
                ),
              ],
            ),
          )
        ],
      ),

      /// BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Catatan Sikap Saya",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text(
              "Lihat catatan sikap dan perilaku yang telah dilaporkan",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Container(
               width: double.infinity, 
               padding: EdgeInsets.all(12), 
               decoration: BoxDecoration( 
                color: Color(0xFFFFF3CD), 
                borderRadius: BorderRadius.circular(12), 
                border: Border.all(color: Colors.orange), 
                ), 
                child: Row( 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [ 
                    Icon(Icons.warning_amber_rounded, color: Colors.orange), 
                    SizedBox(width: 10), 
                    Expanded( 
                      child: Text( "Perhatian\nJika Anda merasa ada catatan yang tidak sesuai atau keliru, silakan hubungi guru jurusan untuk mengajukan klarifikasi.", 
                      style: TextStyle(fontSize: 13), 
                      ), 
                      ) 
                    ], 
                  ), 
              ),

            const SizedBox(height: 20),
            _buildStatCard(
                title: "Total Catatan",
                value: "1",
                icon: Icons.description_outlined,
                iconColor: Colors.blue),

            const SizedBox(height: 14),
            _buildStatCard(
                title: "Dalam Perbaikan",
                value: "1",
                icon: Icons.flash_on,
                iconColor: Colors.orange),

                const SizedBox(height: 14),
            _buildStatCard(
                title: "Sudah Berubah",
                value: "3",
                icon: Icons.check_circle, 
                iconColor: Colors.green,),

            const SizedBox(height: 20),

            /// ✅ DROPDOWN PENGGANTI TABEL
            for (int i = 0; i < dataDummy.length; i++)
              _buildDropdownCard(i),
          ]),
        ),
      ),
    );
  }
}
