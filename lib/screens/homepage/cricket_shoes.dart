import 'package:flutter/material.dart';

class CricketShoes extends StatefulWidget {
  const CricketShoes({super.key});

  @override
  _CricketShoesState createState() => _CricketShoesState();
}

class _CricketShoesState extends State<CricketShoes> {
  bool _isDescriptionExpanded = false; // Controls the visibility of the description

  List<String> cart = []; // Cart to store added items

  void _addToCart(String itemName) {
    setState(() {
      cart.add(itemName); // Add item to cart
    });
    _showPaymentDialog();
  }

  void _showPaymentDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Payment Method"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.payment, color: Colors.blue),
                title: const Text("Online Payment"),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Online Payment Selected")),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.money, color: Colors.green),
                title: const Text("Cash on Delivery"),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Cash on Delivery Selected")),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reebok"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
         // Run the cart function
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Cart Items: ${cart.length}")),
                  );
                },
              ),
              if (cart.isNotEmpty)
                Positioned(
                  right: 5,
                  top: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      cart.length.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  "https://m.media-amazon.com/images/I/8196B7Fk5hL.AC_SY695.jpg",
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildThumbnail(
                      "https://m.media-amazon.com/images/I/8196B7Fk5hL.AC_SY695.jpg"),
                  _buildThumbnail(
                      "https://m.media-amazon.com/images/I/81NinH-MkGL.AC_SY695.jpg"),
                  _buildThumbnail(
                      "https://m.media-amazon.com/images/I/81RaYS+ngzL.AC_SY695.jpg"),
                  _buildThumbnail(
                      "https://m.media-amazon.com/images/I/71PFq8lZsRL.AC_SY695.jpg"),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Cricket Shoes for Men",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Cricket Shoes",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text(
                    "\$255.0",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "\$300.0",
                    style: TextStyle(fontSize: 18, color: Colors.grey, decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildColorDropdown(),
                  _buildDropdown("Size", ["Small", "Medium", "Large"]),
                ],
              ),
              const SizedBox(height: 16),

              // Expandable Description
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isDescriptionExpanded = !_isDescriptionExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      _isDescriptionExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              if (_isDescriptionExpanded)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Unleash your best performance with SOLM8 Cricket Shoes – built for speed, stability, and comfort,\n"
                        "  Ultimate Grip – Advanced sole for unbeatable traction on all surfaces.\n\n"
                        "Lightweight & Durable – FlexSkin material for long-lasting comfort.\n\n"
                        "  Secure Fit – Adjustable midfoot strap for extra stability.\n\n"
                        " Breathable Comfort – Cushioned inner for all-day play.\n\n"
                        " Play harder, run faster, and dominate the field! Get yours now!\n\n"
                        "\n\n"
                        "Limited Stock Available – Order Now!",


                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ),

              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _addToCart("Cricket Shoes");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Related Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildProductCard("Sneaker",  "https://m.media-amazon.com/images/I/61UjPN4BRoL._AC_SY695_.jpg"),
                    _buildProductCard("Shirts", "https://m.media-amazon.com/images/I/71z+GXNqeRL._AC_SX569_.jpg"),
                    _buildProductCard("T-Shirts", "https://m.media-amazon.com/images/I/61YcjrXWweL._AC_SX569_.jpg"),
                    _buildProductCard("Jeans", "https://m.media-amazon.com/images/I/81tG74bCSZS._AC_SX569_.jpg"),
                    _buildProductCard("Hoodies", "https://m.media-amazon.com/images/I/81HmoMefLDL._AC_SY741_.jpg"),
                    _buildProductCard("Trousers", "https://m.media-amazon.com/images/I/61PM4WHBsML._AC_SY741_.jpg"),
                    _buildProductCard("Shorts", "https://m.media-amazon.com/images/I/71I+w4YnysL._AC_SX679_.jpg"),
                    _buildProductCard("Backpack", "https://m.media-amazon.com/images/I/71ncX2LxlCL.__AC_SX300_SY300_QL70_FMwebp_.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorDropdown() {
    return _buildDropdown("Color", ["Sky Blue", "Blue", "White", "Black", "Green"]);
  }

  Widget _buildDropdown(String title, List<String> options) {
    return DropdownButton<String>(
      hint: Text(title),
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {},
    );
  }

  Widget _buildThumbnail(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Image.network(
        imageUrl,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProductCard(String name, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
