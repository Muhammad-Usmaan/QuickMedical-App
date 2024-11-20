import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int productQuantity = 1;

  List<Map<String, dynamic>> productList = [
    {
      "imageUrl":
          "https://5.imimg.com/data5/SELLER/Default/2023/8/332350358/SI/JT/VF/98283251/amoxicillin-drugs3.jpg",
      "price": 500,
      "title": "Amoxicillin-500mg",
      "subtitle": "Antibiotic Tablets",
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd5B0MlyqKdJDSRU_qf6gcRuyUCGpTOMJ8dQ&s",
      "price": 300,
      "title": "Paracetamol-500mg",
      "subtitle": "Pain Relief Tablets",
    },
    {
      "imageUrl":
          "https://media.istockphoto.com/id/1359178057/photo/ibuprofen-pill-box-box-paper-blister-tablets.jpg?s=612x612&w=0&k=20&c=iqdliihgmXPtkeKW8NX_YprRGdoh1d-bdcO8sw1Tsmw=",
      "price": 700,
      "title": "Ibuprofen-400mg",
      "subtitle": "Anti-Inflammatory Capsules",
    },
  ];
   
  late List<int> quantities;

  @override
  void initState() {
    super.initState();
    // Initialize quantities with 1 for each product
    quantities = List<int>.filled(productList.length, 1);
   
  }




  @override
  Widget build(BuildContext context) {
     double _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Cart',
            style: GoogleFonts.josefinSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(9, 15, 71, 1),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${productList.length} items in cart",
                    style: GoogleFonts.josefinSans(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 114, 114, 114),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add more",
                          style: GoogleFonts.josefinSans(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: 50,
                          height: 90,
                          child: Image(
                            image: NetworkImage(
                              productList[index]["imageUrl"],
                            ),
                            fit: BoxFit.cover,
                            height: 90,
                          ),
                        ),
                      ),
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productList[index]["title"],
                            style: GoogleFonts.josefinSans(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            productList[index]["subtitle"],
                            style: GoogleFonts.josefinSans(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      subtitle: Text(
                        "Rs. ${productList[index]["price"]}",
                        style: GoogleFonts.josefinSans(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                productList.removeAt(index);
                              });
                            },
                            child: Icon(
                              Icons.disabled_by_default_outlined,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                          // SizedBox(height:4 ,),
                          Spacer(
                            flex: 1,
                          ),
                          Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(59, 158, 158, 158),
                                borderRadius: BorderRadius.circular(25)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (quantities[index] > 1) {
                                      setState(() {
                                        quantities[index]--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            127, 33, 149, 243),
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(quantities[index].toString()),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantities[index]++;
                                    });
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            127, 33, 149, 243),
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 280,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment summary",
                style: GoogleFonts.josefinSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Total",
                    style: GoogleFonts.josefinSans(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "1500",
                    style: GoogleFonts.josefinSans(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Item Discount",
                    style: GoogleFonts.josefinSans(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "-10%",
                    style: GoogleFonts.josefinSans(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Coupon Discount",
                    style: GoogleFonts.josefinSans(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "-150",
                    style: GoogleFonts.josefinSans(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping",
                    style: GoogleFonts.josefinSans(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Free",
                    style: GoogleFonts.josefinSans(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 1,
                color: Colors.blueGrey,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.josefinSans(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Rs. 1100",
                    style: GoogleFonts.josefinSans(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                width: _screenWidth,
                height: 40,
                child: ElevatedButton(
                  
                  onPressed: () {},
                  child: Text(
                    "Place Order",
                    style: GoogleFonts.josefinSans(
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
