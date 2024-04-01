import 'package:e_commerce_app/components/shoe_tile.dart';
import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/models/shoe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added ! "),
        content: Text("Check you're cart"),
      ),
    );
  }

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  searchText = text;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          // Picks

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot picks',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      searchText = "";
                    });
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
                itemCount: value.getShoeList().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Shoe shoe = value.getShoeList()[index];
                  if (shoe.name
                      .toLowerCase()
                      .contains(searchText.toLowerCase())) {
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  } else {
                    // If the shoe name doesn't contain the search text, return an empty container
                    return Container();
                  }
                }),
          )
        ],
      ),
    );
  }
}
