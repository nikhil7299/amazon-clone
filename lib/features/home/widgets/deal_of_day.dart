import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 3),
          child: Text(
            "Deal of the day",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1659135890084-930731031f40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFjYm9vayUyMG0yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
          height: 230,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            '\$999',
            style: TextStyle(fontSize: 15),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: Text(
            "Mackbook",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1659135890084-930731031f40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFjYm9vayUyMG0yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1659135890084-930731031f40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFjYm9vayUyMG0yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1659135890084-930731031f40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFjYm9vayUyMG0yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1659135890084-930731031f40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFjYm9vayUyMG0yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1659135890084-930731031f40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFjYm9vayUyMG0yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            "See all deals",
            style: TextStyle(color: Colors.cyan[800]),
          ),
        ),
      ],
    );
  }
}
