
import 'package:closet_app_xxx/ui/pages/shop/edit/shop_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../../ui/pages/shop/add/shop_add_page.dart';
import '../../../controllers/pages/shop_page_controller.dart';
import '../../libs/web_view.dart';
import '../../libs/floating_action_button_animation.dart';
import 'edit/shop_select_page.dart';




class ShopScreen extends HookConsumerWidget {



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        floatingActionButton: ExpandableFab(
          distance: 112.0,
          children: [
            Column(
              children: [
                ActionButton(
                  onPressed: () async {
                    final result = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShopAddPage()));
                    if (result) {
                      ref.read(ShopPageProvider.notifier).fetchShops();
                    }
                  }, icon: Icon(LineIcons.plus),
                ),
                Text('追加', style: TextStyle(color: Colors.grey),)
              ],
            ),
            Column(
              children: [
                ActionButton(

                  onPressed: () async {
                    final result = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShopSelectPage()));
                    if (result) {
                      ref.read(ShopPageProvider.notifier).fetchShops();
                    }
                  },

                  icon: const Icon(LineIcons.list),
                ),
                Text("編集", style: TextStyle(color: Colors.grey),)],
            ),
          ],
        ),
        backgroundColor: Colors.brown.shade50,
        body: ShopList()
    );
  }
}

class ShopList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shops = ref.watch(ShopPageProvider.select((value) => value.shops));
    return GridView.builder(
        itemCount: shops.length,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.9
        ),
        itemBuilder: (BuildContext context, int index) {
          final shop = shops[index];
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => WebViewScreen(shop.url)));
                  },
                  child: ClipRRect(borderRadius: BorderRadius.circular(80),
                      child: Container(
                          width: 150,
                          height: 150,
                          child: Image.network(
                            shop.image, fit: BoxFit.cover,))),
                ),

                Text(shop.name)
              ],
            ),
          );
        }
    );
  }
}


