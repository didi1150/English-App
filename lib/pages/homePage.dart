import 'package:eng_app_v2/classes/category.dart';
import 'package:eng_app_v2/classes/product.dart';
import 'package:eng_app_v2/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  List<Category> foodCategories = [
    Category(name: "Fast Food", iconpath: "assets/iconpngs/fast-food.png"),
    Category(name: "Soups", iconpath: "assets/iconpngs/hot-soup.png"),
    Category(name: "Meals", iconpath: "assets/iconpngs/dish.png"),
    Category(name: "Sweet Stuff", iconpath: "assets/iconpngs/donut.png"),
    Category(name: "Salads", iconpath: "assets/iconpngs/salad.png")
  ];
  Map<Product, Category> productMap = {};

  List<CategoryModel> products = CategoryModel.getCategories();

  int selectedIndex = 0;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 40),
        _categorySection(),
        const SizedBox(height: 40),
        _searchField(),
        const SizedBox(height: 80),
        _productSection()
      ],
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: widget.foodCategories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: (widget.selectedIndex == index
                            ? Color.fromARGB(255, 111, 241, 146)
                            : const Color.fromRGBO(240, 240, 240, 1)),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                widget.foodCategories[index].iconpath),
                          ),
                        ),
                        Text(
                          widget.foodCategories[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ));
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search Products...',
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.search),
            ),
            suffixIcon: const SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.filter_list),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  //TODO: Informationen zu footprint stehen drin
  GridView _productSection() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      padding: const EdgeInsets.all(4),
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      crossAxisCount: 3,
      // children: [
      //   Container(
      //     padding: const EdgeInsets.all(20),
      //     child: Center(
      //       child: const Text('FIRST'),
      //     ),
      //     color: Colors.red,
      //   ),
      //   Container(
      //     padding: const EdgeInsets.all(20),
      //     child: Center(
      //       child: const Text('SECOND'),
      //     ),
      //     color: Colors.indigo,
      //   ),
      //   Container(
      //     padding: const EdgeInsets.all(20),
      //     child: Center(
      //       child: const Text('THIRD'),
      //     ),
      //     color: Colors.teal,
      //   ),
      //   Container(
      //     padding: const EdgeInsets.all(20),
      //     child: Center(
      //       child: const Text('FOURTH'),
      //     ),
      //     color: Colors.cyan,
      //   ),
      //   Container(
      //     padding: const EdgeInsets.all(20),
      //     child: Center(
      //       child: const Text('FIFTH'),
      //     ),
      //     color: Colors.yellow,
      //   ),
      //   Container(
      //     padding: const EdgeInsets.all(20),
      //     child: Center(
      //       child: const Text('SIXTH'),
      //     ),
      //   ),
      //   Container(
      //     padding: const EdgeInsets.all(20),
      //     child: Center(
      //       child: const Text('SEVENTH'),
      //     ),
      //     color: Colors.purple,
      //   ),
      //   Container(
      //     padding: const EdgeInsets.all(20),
      //     child: Center(
      //       child: const Text('EIGHTH'),
      //     ),
      //     color: Colors.blue,
      //   ),
      //   Container(
      //     padding: const EdgeInsets.all(20),
      //     child: Center(
      //       child: const Text('NINTH'),
      //     ),
      //     color: Colors.orange,
      //   ),
      // ],
      children: widget.products.map((product) {
        return Container(
          width: 100,
          decoration: BoxDecoration(
              color: product.boxColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(product.iconPath),
                ),
              ),
              Text(
                product.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 14),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
