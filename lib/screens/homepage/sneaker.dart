import 'package:flutter/material.dart';

class BlackSneaker extends StatefulWidget {
  const BlackSneaker({super.key});

  @override
  _BlackSneakerState createState() => _BlackSneakerState();
}

class _BlackSneakerState extends State<BlackSneaker> {
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
                  "https://m.media-amazon.com/images/I/61UjPN4BRoL._AC_SY695_.jpg",
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildThumbnail("https://m.media-amazon.com/images/I/61UjPN4BRoL._AC_SY695_.jpg"),
                  _buildThumbnail("https://m.media-amazon.com/images/I/5120zFnOVRL._AC_SY695_.jpg"),
                  _buildThumbnail("https://m.media-amazon.com/images/I/61-DMfF47sL._AC_SY695_.jpg"),
                  _buildThumbnail("https://m.media-amazon.com/images/I/61GVeFgGoyL._AC_SY695_.jpg"),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Black Color Sneaker",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Sneakers",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text(
                    "\$150.0",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "\$200.0",
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
                    "Upgrade your footwear collection with these sleek Black Knit Sneakers\n"
                    "designed for ultimate comfort, durability, and style. \n"
                    "Whether you're heading to the gym, running errands, or just stepping out casually,\n"
                    "these sneakers will keep your feet feeling light,\n\n"
                    "Trendy & Versatile Design: Perfect for casual outings, sports activities, and daily wear.\n\n"
                    "Easy Slip-On Fit: No hassle of tying laces—just slip in and go!\n\n\n"
                    "Limited Stock Available! Get Yours Today!\n\n",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _addToCart("Black Color Sneaker");
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
                    _buildProductCard("Cricket Shoes", "https://m.media-amazon.com/images/I/8196B7Fk5hL._AC_SY695_.jpg"),
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
    return _buildDropdown("Color", ["Red", "Blue", "White", "Black", "Green"]);
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
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
          ),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
