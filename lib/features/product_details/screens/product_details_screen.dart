import 'package:amazon/common/widgets/custom_buttons.dart';
import 'package:amazon/common/widgets/stars.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/product_details/services/product_details_services.dart';
import 'package:amazon/features/search/screens/search_screen.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  double avgRating = 0;
  double myRating = 0;
  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 16),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black45, width: 1),
                          ),
                          hintText: "Search Amazon.in",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 25),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.id!,
                    ),
                    Stars(rating: avgRating),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Text(
                  widget.product.name,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Container(
                color: Colors.black12,
                height: 3,
              ),
              CarouselSlider(
                items: widget.product.images.map((e) {
                  return Builder(
                      builder: (BuildContext context) => Image.network(
                            e,
                            fit: BoxFit.contain,
                            height: 200,
                          ));
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 250,
                ),
              ),
              Container(
                color: Colors.black12,
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: RichText(
                  text: TextSpan(
                    text: 'Deal Price:  ',
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "₹ ${widget.product.price}",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 15, right: 10, bottom: 5),
                child: Text(
                  widget.product.description,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: CustomButton(
                  text: 'Buy Now',
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomButton(
                  text: 'Add to Cart',
                  color: Colors.yellow.shade600,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 5),
              Container(
                color: Colors.black12,
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Rate the Product",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: myRating,
                      minRating: 1,
                      allowHalfRating: true,
                      itemCount: 5,
                      direction: Axis.horizontal,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: GlobalVariables.secondaryColor,
                      ),
                      itemSize: 25,
                      onRatingUpdate: (rating) {
                        productDetailsServices.rateProduct(
                          context: context,
                          product: widget.product,
                          rating: rating,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
