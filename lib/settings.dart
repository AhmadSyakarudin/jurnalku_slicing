import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {

  bool showAlert = false; // ALERT PASSWORD UPDATED

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        centerTitle: true,
        leading:
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Colors.grey, size: 25),
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
                    padding: const EdgeInsets.all(8.0),
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
      body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings Account",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
            SizedBox(height: 5),

            Row(
              children: [
                Text("Dashboard",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                ),
                Text(" / ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                ),
                Text("Settings Account",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0,3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Profile Information",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height: 15),

                  Center(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/pic1.jpeg'),
                              radius: 70,
                            ),
                            CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 4, 86, 153),
                              radius: 18,
                              child: Icon(Icons.camera_alt, color: Colors.white, size: 16),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        Text(
                          "Upload New Photo",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(height: 20),
                            Text(
                              "Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: "Shapira Bunga Aulia",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            Text(
                              "NIS",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: "12310999",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            Text(
                              "Rombel",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: "PPLG XII-8",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            Text(
                              "Rayon",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: "Cis 77",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ),

            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0,3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ----------- ALERT SUCCESS -----------
                  AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    height: showAlert ? 45 : 0,
                    curve: Curves.easeOut,
                    child: showAlert
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.white),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "Password berhasil diupdate!",
                                    style: TextStyle(color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                  ),
                  // -------------------------------------

                  SizedBox(height: 10),

                  Text("Change Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  ),

                  SizedBox(height: 15),
                  Text("Last Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  SizedBox(height: 7,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: "Add Password",
                      suffixIcon: Icon(Icons.visibility_outlined, color: Colors.grey,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                  Text("Add your last password",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  ),

                  SizedBox(height: 15),
                  Text("New Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),
                  ),

                  SizedBox(height: 7,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: "Add New Password",
                      suffixIcon: Icon(Icons.visibility_outlined, color: Colors.grey,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child:SizedBox(
                      height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 4, 86, 153),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: () {

                        setState(() {
                          showAlert = true;
                        });

                        Future.delayed(Duration(seconds: 3), () {
                          if (mounted) {
                            setState(() {
                              showAlert = false;
                            });
                          }
                        });

                      },
                      child: Text(
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
            )
          ],
        ),
      )
      )
    );
  }
}
