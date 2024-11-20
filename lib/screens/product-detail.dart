import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_medical/screens/cart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  // Carousel controller
  final _productImgController = CarouselSliderController();
  // Current index of the carousel
  int _currentImageIndex = 0;
// Package size button index
  int _selectedPkgButton = 0;

  List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxJKHKMlImXyXVOpcRk9-6mg-c5hkwaqLCRw&s',
    'https://c8.alamy.com/comp/K67J3G/antibiotic-pills-an-open-box-of-21-500mg-amoxicillin-capsules-with-K67J3G.jpg',
    'https://lh3.googleusercontent.com/proxy/JIEVWIY2xDHep2zF4raTrzwhsYGmu2BFF7qul8uNCdeiYhOffCmkGc7mKQXUrSUsO41YFqtK3j6eIGYls_fg8qsgMRuyXz0Wvris7g',
  ];
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.notifications_outlined),
          const SizedBox(
            width: 15,
          ),
          const Icon(Icons.shopping_bag_outlined),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Amoxiline-500 mg",
                    style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: const Color.fromARGB(255, 9, 15, 71),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tablets",
                    style: GoogleFonts.josefinSans(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 9, 15, 71),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
              CarouselSlider.builder(
                carouselController: _productImgController,
                itemCount: imageUrls.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    width: _screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            imageUrls[index],
                          ),
                          fit: BoxFit.cover,
                        )),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: 0,
                  height: 220,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: _currentImageIndex,
                  count: 3,
                  onDotClicked: (index) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  effect: const ScrollingDotsEffect(dotHeight: 6, dotWidth: 6),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Rs. 120",
                                    style: GoogleFonts.josefinSans(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color:
                                          const Color.fromARGB(155, 9, 15, 71),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Rs. 112",
                                    style: GoogleFonts.josefinSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color:
                                          const Color.fromARGB(255, 9, 15, 71),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "Etiam Molis",
                                style: GoogleFonts.josefinSans(
                                  color: const Color.fromARGB(255, 9, 15, 71),
                                ),
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.shopping_bag_outlined,
                                    color: Colors.blue),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text("Add to Cart",
                                    style: GoogleFonts.josefinSans(
                                        fontSize: 14, color: Colors.blue))
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: _screenWidth,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Package Size",
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          _packageSizeRadio(1, 112, 6),
                          _packageSizeRadio(2, 180, 10),
                          _packageSizeRadio(3, 250, 22),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Description",
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Amoxicillin - 500 mg is a broad-spectrum antibiotic used to treat various bacterial infections, including respiratory tract infections, urinary tract infections, and skin infections. It works by inhibiting the growth of bacteria, helping to eliminate the infection",
                          style: GoogleFonts.josefinSans(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 48, 48, 48),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Ingredients",
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Amoxicillin - 500 mg capsules contain the active ingredient Amoxicillin trihydrate, a penicillin-class antibiotic that fights bacterial infections. In addition to the active ingredient, the formulation includes inactive components such as magnesium stearate (a lubricant), microcrystalline cellulose (a filler), and gelatin for the capsule shell. These ingredients ensure stability, effectiveness, and ease of consumption.",
                          style: GoogleFonts.josefinSans(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 48, 48, 48),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Expiry Date",
                            style: GoogleFonts.josefinSans(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            '23/2/2029',
                            style: GoogleFonts.josefinSans(
                              fontSize: 13,
                              color: const Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Brand Name",
                            style: GoogleFonts.josefinSans(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Something',
                            style: GoogleFonts.josefinSans(
                              fontSize: 13,
                              color: const Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 180,
                            width: _screenWidth * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "4.4",
                                      style: GoogleFonts.josefinSans(
                                        fontSize: 42,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 30,
                                    )
                                  ],
                                ),
                                Text(
                                  "923 rating and 458 reviews",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 18,
                                    color:
                                        const Color.fromARGB(255, 65, 64, 64),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 1,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 180,
                            width: _screenWidth * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text("5",
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 18,
                                          color: const Color.fromARGB(
                                              255, 65, 64, 64),
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: _screenWidth * 0.4,
                                        child: const LinearProgressIndicator(
                                          value: 0.67,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text("67%")
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text("4",
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 18,
                                          color: const Color.fromARGB(
                                              255, 65, 64, 64),
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: _screenWidth * 0.4,
                                        child: const LinearProgressIndicator(
                                          value: 0.7,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text("70%")
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text("3",
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 18,
                                          color: const Color.fromARGB(
                                              255, 65, 64, 64),
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: _screenWidth * 0.4,
                                        child: const LinearProgressIndicator(
                                          value: 0.07,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text("7%")
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text("2",
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 18,
                                          color: const Color.fromARGB(
                                              255, 65, 64, 64),
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: _screenWidth * 0.4,
                                        child: const LinearProgressIndicator(
                                          value: 0.42,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text("42%")
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text("1",
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 18,
                                          color: const Color.fromARGB(
                                              255, 65, 64, 64),
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: _screenWidth * 0.4,
                                        child: const LinearProgressIndicator(
                                          value: 0.02,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text("2%")
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              BottomAppBar(
                color: Colors.transparent,
                child: Container(
                  height: 50,
                  width: _screenWidth,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: FloatingActionButton(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartView()),
                        );
                      },
                      child: Text(
                        "GO TO CART",
                        style: GoogleFonts.josefinSans(
                          fontSize: 19,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _packageSizeRadio(int index, int price, int tabletsNo) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedPkgButton = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color:
                    index == _selectedPkgButton ? Colors.amber : Colors.grey)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rs. $price",
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text(
                "$tabletsNo Capsules",
                style: GoogleFonts.josefinSans(
                  fontSize: 12,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
