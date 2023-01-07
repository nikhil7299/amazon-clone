import 'package:amazon/common/widgets/stars.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Image.network(
            product.images[0],
            fit: BoxFit.fitHeight,
            height: 140,
            width: 160,
          ),
          Column(
            children: [
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 15, right: 5, top: 5),
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 13, top: 5),
                child: Stars(
                  rating: avgRating,
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 15, top: 18),
                child: Text(
                  "₹ ${product.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: const Text(
                  "Eligible for FREE Shipping",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: const Text(
                  "In Stock",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.teal,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
