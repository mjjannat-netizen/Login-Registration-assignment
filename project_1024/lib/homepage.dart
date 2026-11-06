import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_1024/converter.page.dart';
import 'package:project_1024/login_page.dart';
 
class HomePage extends StatelessWidget {
  final String name;
  final String email;
  const HomePage({super.key, required this.name, required this.email});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: GoogleFonts.lobster(fontSize: 26),
        ),
        backgroundColor: const Color.fromARGB(255, 171, 62, 118),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              label: Text(
                "0",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: const Color.fromARGB(255, 183, 235, 80),
              textColor: const Color.fromARGB(255, 10, 10, 10),
              child: Icon(Icons.notifications),
            ),
            tooltip: "Notification",
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            tooltip: "Search",
          ),
        ],
      ),
 
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
 
            // Profile Card
            Container(
              height: 250,
              width: 300,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                shape: BoxShape.rectangle,
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 95, 147, 235),
                    Color.fromARGB(255, 171, 62, 118),
                  ],
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Text(
                      name.isNotEmpty ? name[0].toUpperCase() : "?",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 171, 62, 118),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "CSE-64",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
 
            SizedBox(height: 20),
 
            // Message Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                  label: Text("Message"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 171, 62, 118),
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConverterPage()),
                    );
                  },
                  icon: Icon(Icons.currency_exchange),
                  label: Text("Converter"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 171, 62, 118),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
 
            SizedBox(height: 20),
 
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 6),
                  hintText: "Search...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 171, 62, 118),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 171, 62, 118),
                    ),
                  ),
                ),
              ),
            ),
 
            SizedBox(height: 20),
 
            // Three Equal-Width Cards
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double cardWidth = (constraints.maxWidth - 16) / 3;
 
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Year Card
                      SizedBox(
                        width: cardWidth,
                        height: 125,
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Color.fromARGB(255, 197, 92, 178),
                                  size: 30,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "3rd",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Year",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
 
                      // Courses Card
                      SizedBox(
                        width: cardWidth,
                        height: 125,
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.book,
                                  color: Color.fromARGB(255, 197, 92, 178),
                                  size: 30,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "6",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Courses",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
 
                      // Projects Card
                      SizedBox(
                        width: cardWidth,
                        height: 125,
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.code,
                                  color: Color.fromARGB(255, 197, 92, 178),
                                  size: 30,
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "2",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Projects",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
 
            SizedBox(height: 10),
 
            // My Skills Heading
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Skills",
                  style: GoogleFonts.lobster(
                    fontSize: 24,
                    color: Color.fromARGB(255, 167, 7, 89),
                  ),
                ),
              ),
            ),
 
            SizedBox(height: 8),
 
            // Skills
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(
                      label: Text("Flutter"),
                      backgroundColor: Colors.pink.shade100,
                    ),
                    Chip(
                      label: Text("Dart"),
                      backgroundColor: Colors.pink.shade100,
                    ),
                    Chip(
                      label: Text("DBMS"),
                      backgroundColor: Colors.pink.shade100,
                    ),
                    Chip(
                      label: Text("OOP"),
                      backgroundColor: Colors.pink.shade100,
                    ),
                  ],
                ),
              ),
            ),
 
            SizedBox(height: 80),
          ],
        ),
      ),
 
      // Drawer
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 59, 119, 150),
              ),
              accountName: Text(name),
              accountEmail: Text(email),
            ),
 
            // HomePage
            ListTile(
              onTap: () {
                Navigator.pop(context); // drawer bondho
              },
              hoverColor: Colors.limeAccent,
              splashColor: Colors.greenAccent,
              title: Text("HomePage"),
              trailing: Icon(Icons.home),
            ),
 
            Divider(color: Colors.lightBlueAccent),
 
            // Converter
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConverterPage()),
                );
              },
              hoverColor: Colors.limeAccent,
              splashColor: const Color.fromARGB(255, 111, 143, 127),
              title: Text("USD to BDT Converter"),
              trailing: Icon(Icons.currency_exchange),
            ),
 
            // Settings
            ListTile(
              onTap: () {},
              hoverColor: Colors.limeAccent,
              splashColor: const Color.fromARGB(255, 111, 143, 127),
              title: Text("Setting"),
              trailing: Icon(Icons.settings),
            ),
 
            Spacer(),
 
            Divider(),
 
            // Logout
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              hoverColor: Colors.limeAccent,
              splashColor: const Color.fromARGB(255, 111, 143, 127),
              title: Text(
                "LogOut",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.logout),
            ),
          ],
        ),
      ),
 
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.blueGrey,
        tooltip: "Add something",
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}