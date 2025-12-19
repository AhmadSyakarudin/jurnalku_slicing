import 'package:flutter/material.dart';
import 'package:slicing_jurnalku/widgets/navbar.dart'; // Import NavbarPage

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool showAlert = false;
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

  Widget _buildCustomHeader(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.home_outlined, color: Colors.grey, size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: _toggleSidebar,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Shapira Bunga Aulia",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          "PPLG XII-5",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pic1.jpeg'),
                    radius: 22,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: null,
          body: Column(
            children: [
              // Header Kustom
              _buildCustomHeader(context),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Settings Account",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: const [
                            Text(
                              "Dashboard",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              " / ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "Settings Account",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Profile Information",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Center(
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: AssetImage(
                                            'assets/images/pic1.jpeg',
                                          ),
                                          radius: 70,
                                        ),
                                        CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                            255,
                                            4,
                                            86,
                                            153,
                                          ),
                                          radius: 18,
                                          child: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Upload New Photo",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 20),
                                        const Text(
                                          "Name",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            hintText: "Shapira Bunga Aulia",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                          "NIS",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            hintText: "12310999",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                          "Rombel",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            hintText: "PPLG XII-8",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                          "Rayon",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            hintText: "Cis 77",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.only(top: 25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                height: showAlert ? 45 : 0,
                                curve: Curves.easeOut,
                                child: showAlert
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                "Password berhasil diupdate!",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const SizedBox(),
                              ),

                              const SizedBox(height: 10),
                              const Text(
                                "Change Password",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "Last Password",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 7),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  hintText: "Add Password",
                                  suffixIcon: const Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "Add your last password",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                "New Password",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 7),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  hintText: "Add New Password",
                                  suffixIcon: const Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: 45,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        4,
                                        86,
                                        153,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        showAlert = true;
                                      });

                                      Future.delayed(
                                        const Duration(seconds: 3),
                                        () {
                                          if (mounted) {
                                            setState(() {
                                              showAlert = false;
                                            });
                                          }
                                        },
                                      );
                                    },
                                    child: const Text(
                                      "Save Changes",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
    );
  }
}
