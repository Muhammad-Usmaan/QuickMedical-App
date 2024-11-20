import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'My Profile',
              style: GoogleFonts.josefinSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(9, 15, 71, 1),
              ),
            ),
          ),
          body: Container(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    foregroundImage: NetworkImage(
                        "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D"),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Hi, Muhammad Usman",
                        style: GoogleFonts.josefinSans(
                            fontSize: 24, color: Color.fromRGBO(9, 15, 71, 1)),
                      ),
                      Text(
                        "Welcome to Quick Medical",
                        style: GoogleFonts.josefinSans(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 112, 112, 112)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.article_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Edit Profile",
                    style: GoogleFonts.josefinSans(),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ),
                Container(
                  height: 2,
                  color: const Color.fromARGB(87, 158, 158, 158),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.sticky_note_2_outlined,
                    color: Colors.blue,
                  ),
                  title: Text("My Orders",
                   style: GoogleFonts.josefinSans(),),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ),
               Container(
                  height: 2,
                  color: const Color.fromARGB(87, 158, 158, 158),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.blue,
                  ),
                  title: Text("Billing",
                   style: GoogleFonts.josefinSans(),),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ),
                Container(
                  height: 2,
                  color: const Color.fromARGB(87, 158, 158, 158),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.question_mark_rounded,
                    color: Colors.blue,
                  ),
                  title: Text("faq",
                   style: GoogleFonts.josefinSans(),),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
