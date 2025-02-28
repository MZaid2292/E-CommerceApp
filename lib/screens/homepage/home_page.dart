import 'package:e_commerce_app/appColors/app_colors.dart';
import 'package:e_commerce_app/data/home_page_data.dart';
import 'package:e_commerce_app/screens/homepage/backpack.dart';
import 'package:e_commerce_app/screens/homepage/jeans_men.dart';
import 'package:e_commerce_app/screens/homepage/men_hoodie.dart';
import 'package:e_commerce_app/screens/homepage/shirts_men.dart';
import 'package:e_commerce_app/screens/homepage/shorts.dart';
import 'package:e_commerce_app/screens/homepage/sneaker.dart';
import 'package:e_commerce_app/screens/homepage/cricket_shoes.dart';
import 'package:e_commerce_app/screens/homepage/t_shirts_men.dart';
import 'package:e_commerce_app/screens/homepage/t_shirts_women.dart';
import 'package:e_commerce_app/screens/homepage/trouser.dart';
import 'package:e_commerce_app/styles/home_screen_styles.dart';
import 'package:e_commerce_app/svgImages/svg_images.dart';
import 'package:e_commerce_app/widgets/show_all_widget.dart';
import 'package:e_commerce_app/widgets/single_product_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToProductScreen(BuildContext context, String productModel) {
    final Map<String, Widget Function()> productScreens = {
      "Sneaker": () => BlackSneaker(),
      "Cricket Shoes for men": () => CricketShoes(),
      "Shirts Men": () => ShirtsMen(),
      "T Shirts Men": () => TShirtsMen(),
      "T Shirts Women": () => TShirtsWomen(),
      "Essentials Mens Jeans": () => JeansMen(),
      "Men's Fashion Hoodies": () => MenHoodie(),
      "Sigma Black Trouser": () => Trouser(),
      "Mens Workout Athletic Shorts": () => Shorts(),
      "Lightweight Galaxy School Backpacks": () => Backpack(),
    };

    if (productScreens.containsKey(productModel)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => productScreens[productModel]!()),
      );
    }
  }

  AppBar buildAppBar() {
    return AppBar(
      bottom: TabBar(
        labelPadding: EdgeInsets.symmetric(
          horizontal: 22,
        ),
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
        tabs: [
          Text("All"),
          Text("Clothing"),
          Text("Shoes"),
          Text("Accessories"),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Welcome",
            style: HomeScreenStyles.appBarUpperTitleStyles,
          ),
          Text(
            "Shopping",
            style: HomeScreenStyles.appBarBottomTitleStyles,
          ),
        ],
      ),
      actions: [
        // Search Svg Image
        IconButton(
          icon: SvgPicture.asset(
            SvgImages.search,
            color: AppColors.baseBlackColor,
            width: 30,
          ),
          onPressed: () {
            showSearch(
              context: context,
              delegate: ProductSearchDelegate(),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(),
        body: TabBarView(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ShowAllWidget(
                  leftText: "New Arrival",
                ),
                // Advertisement Placeholder
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://mir-s3-cdn-cf.behance.net/project_modules/1400/8b6c3d166545379.641a111d53c60.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    itemCount: singleProductData.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      var data = singleProductData[index];
                      return SingleProductWidgets(
                        onPressed: () {
                          print("Product model received: '${data.productModel}'");
                          navigateToProductScreen(context, data.productModel);
                        },
                        productImage: data.productImage,
                        productName: data.productName,
                        productModel: data.productModel,
                        productOldPrice: data.productOldPrice,
                        productPrice: data.productPrice,
                      );
                    },
                  ),
                ),
              ],
            ),
            Center(child: Text("2Page")),
            Center(child: Text("3Page")),
            Center(child: Text("4Page")),
          ],
        ),
      ),
    );
  }
}

class ProductSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ""); // Close the search and return an empty string
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = singleProductData.where((product) =>
    product.productName.toLowerCase().contains(query.toLowerCase()) ||
        product.productModel.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var data = results[index];
        return ListTile(
          title: Text(data.productName),
          subtitle: Text(data.productModel),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _getProductScreen(data.productModel),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = singleProductData.where((product) =>
    product.productName.toLowerCase().contains(query.toLowerCase()) ||
        product.productModel.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        var data = suggestions[index];
        return ListTile(
          title: Text(data.productName),
          subtitle: Text(data.productModel),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _getProductScreen(data.productModel),
              ),
            );
          },
        );
      },
    );
  }

  Widget _getProductScreen(String productModel) {
    final Map<String, Widget Function()> productScreens = {
      "Sneaker": () => BlackSneaker(),
      "Cricket Shoes for men": () => CricketShoes(),
      "Shirts Men": () => ShirtsMen(),
      "T Shirts Men": () => TShirtsMen(),
      "T Shirts Women": () => TShirtsWomen(),
      "Essentials Mens Jeans": () => JeansMen(),
      "Men's Fashion Hoodies": () => MenHoodie(),
      "Sigma Black Trouser": () => Trouser(),
      "Mens Workout Athletic Shorts": () => Shorts(),
      "Lightweight Galaxy School Backpacks": () => Backpack(),
    };

    return productScreens[productModel]!();
  }
}