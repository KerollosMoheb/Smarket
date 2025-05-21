import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_market/constants.dart';
import 'package:fruit_market/models/product_model.dart';
import 'package:fruit_market/widgets/banner_builder.dart';
import 'package:fruit_market/widgets/build_app_bar.dart';
import 'package:fruit_market/widgets/category_list_view.dart';
import 'package:fruit_market/widgets/custom_text_widget.dart';
import 'package:fruit_market/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> products = [
    ProductModel(
      name: 'Banana',
      price: r"$3.99",
      image: 'assets/fruits/banana.png',
      rate: '4.8',
      rateCount: '(287)',
    ),
    ProductModel(
      name: 'Pepper',
      price: r"$2.99",
      image: 'assets/fruits/papper.png',
      rate: '4.8',
      rateCount: '(287)',
    ),
    ProductModel(
      name: 'Orange',
      price: r"$3.99",
      image: 'assets/fruits/orange.png',
      rate: '4.8',
      rateCount: '(287)',
    ),
    ProductModel(
      name: 'Eggs',
      price: r"$1.99",
      image: 'assets/category/egg.png',
      rate: '4.8',
      rateCount: '(287)',
    ),
    ProductModel(
      name: 'Beverages',
      price: r"$3.99",
      image: 'assets/category/bavergas.png',
      rate: '4.8',
      rateCount: '(287)',
    ),
  ];
  List basketList = [];
  void toggleSelection(ProductModel products) {
    setState(() {
      if (basketList.contains(products)) {
        basketList.remove(products);
      } else {
        basketList.add(products);
      }
    });
  }

  bool isSelected(ProductModel products) => basketList.contains(products);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerBuilder(),
            categoryListView(),
            SizedBox(height: 20),
            CustomTextWidget(),
            SizedBox(height: 10),
            buildProductScrollList(),
            SizedBox(height: 10),
            buildBasketBar(context),
            SizedBox(height: 10),
          ],
        ),
      ),
      // bottomNavigationBar: bottomNavigationBar(),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 1,
      selectedItemColor: AppColor.primaryColor,
      unselectedItemColor: Colors.black,
      currentIndex: 0,
      onTap: (index) {},
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
      ],
    );
  }

  Widget buildProductScrollList() {
    return SizedBox(
      height: 210, // Adjust height based on your product item size
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = products[index];
          return ProductItem(
            image: item.image,
            name: item.name,
            rate: item.rate,
            rateCount: item.rateCount,
            price: item.price,
            onTap: () => toggleSelection(item),
            icon:
                isSelected(item)
                    ? const Icon(Icons.close)
                    : const Icon(Icons.add),
          );
        },
      ),
    );
  }

  Widget buildBasketBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 77,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              // Product thumbnails
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.47,
                child: ListView.builder(
                  itemCount: basketList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(basketList[index].image),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              Container(width: 2, height: 40, color: Colors.white),
              const SizedBox(width: 10),
              const Text(
                "View Basket",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 10),
              Badge(
                backgroundColor: Colors.red,
                label: Text(
                  basketList.length.toString(),
                  style: const TextStyle(fontSize: 13),
                ),
                largeSize: 15,
                child: SvgPicture.asset(
                  "assets/icons/basket.svg",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
