import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybay/features/common/ui/widgets/category_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoryListScreen extends StatefulWidget {
  static const String name = "/CategoryScreen";
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__)=>_onPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
          leading: IconButton(
              onPressed: _onPop,
              icon: const Icon(Icons.arrow_back_ios)),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                height: 2,
                color: Colors.grey.shade200,)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext context, index)=>const CategoryIconWidget(),
            itemCount: 20,
          ),
        ),
      ),
    );
  }

  void _onPop(){
    Get.find<MainBottomNavController>().backToHome();
  }
}
