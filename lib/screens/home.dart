

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_medical/screens/product-detail.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Positioned(
              child: Container(
                height: 200,
                width: _screenWidth,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20))),
              ),
            ),
            Positioned(
              top: 10,
              width: _screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 25,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Usman",
                      style: GoogleFonts.josefinSans(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Welcome to Quick Medical Store",
                      style: GoogleFonts.josefinSans(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 180, 45, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                elevation: 3,
                color: Colors.transparent,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search medicines and health care products",
                      hintStyle: GoogleFonts.josefinSans(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        color: Colors.blueGrey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.blueGrey,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            40), // Sets radius when not focused
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            40), // Sets radius when focused
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none)),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: GoogleFonts.josefinSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 120,
                        width: 75,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    "Dental",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 75,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    "Wellness",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 75,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.lime,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    "Homeo",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 75,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.purple,
                                      shape: BoxShape.circle),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    "Eye Care",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: _screenWidth,
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://png.pngtree.com/background/20210712/original/pngtree-medical-medical-equipment-blue-background-picture-image_1174410.jpg"),
                            fit: BoxFit.cover)),
                    child: Stack(
                      children: [
                        Positioned(
                          width: 200,
                          top: 25,
                          left: 25,
                          child: Text(
                            "Save extra on every order",
                            style: GoogleFonts.josefinSans(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 9, 15, 71),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 100,
                            left: 25,
                            child: Text(
                              "Save money, save health",
                              style: GoogleFonts.josefinSans(
                                fontSize: 16,
                                color: const Color.fromARGB(132, 9, 15, 71),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Deals of the day",
                        style: GoogleFonts.josefinSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "More",
                          style: GoogleFonts.josefinSans(
                              color: Colors.blue, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _screenWidth > 1200
                          ? 6
                          : _screenWidth > 700
                              ? 4
                              : 2,
                      childAspectRatio:
                          4 / 5, // Vertical rectangle shape for the card
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProductDetailView()),
  );
                        },
                        child: Card(
                          
                          elevation: 5, // Elevation effect for Card
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Rounded corners for the card
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: Container(
                                    width: double
                                        .infinity, // Make image responsive to container width
                                    height: 150,
                                    child: Image.network(
                                      "https://5.imimg.com/data5/SELLER/Default/2023/8/332350358/SI/JT/VF/98283251/amoxicillin-drugs3.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 160,
                                left: 0,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(6, 6, 0, 2),
                                  child: Text(
                                    "Amoxiline-500 mg",
                                    style: GoogleFonts.josefinSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: const Color.fromARGB(255, 9, 15, 71),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 195,
                                left: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 0),
                                  child: Text(
                                    "Tablets",
                                    style: GoogleFonts.josefinSans(
                                      fontSize: 16,
                                      color: const Color.fromARGB(255, 9, 15, 71),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 6,
                                bottom: 10,
                                child: Text(
                                  "RS. 112",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: const Color.fromARGB(255, 9, 15, 71),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 10,
                                child: Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(20)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "2",
                                        style: GoogleFonts.josefinSans(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   TextEditingController _searchController = TextEditingController();
//   List<String> _allItems = [
//     'Apple',
//     'Banana',
//     'Cherry',
//     'Date',
//     'Elderberry',
//     'Fig',
//     'Grape',
//     'Honeydew'
//   ]; // Example list of items
//   List<String> _filteredItems = [];

//   @override
//   void initState() {
//     super.initState();
//     _filteredItems = _allItems; // Initially, all items are shown

//     _searchController.addListener(() {
//       filterItems();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void filterItems() {
//     final query = _searchController.text.toLowerCase();

//     setState(() {
//       _filteredItems = _allItems
//           .where((item) => item.toLowerCase().contains(query))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search Example"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: "Search",
//                 hintText: "Enter a search term",
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: _filteredItems.isNotEmpty
//                   ? ListView.builder(
//                       itemCount: _filteredItems.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(_filteredItems[index]),
//                         );
//                       },
//                     )
//                   : Center(child: Text("No results found")),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
