import 'package:closet_app_xxx/controllers/pages/shop_edit_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/shop/edit/shop_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../controllers/pages/shop_page_controller.dart';
import '../../../../models/shop.dart';



class ShopSelectPage extends HookConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shops = ref.watch(
        ShopPageProvider.select((value) => value.shops));
    return  Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        leading: IconButton(onPressed: () {
          Navigator.pop(context, true);
        }, icon: Icon(LineIcons.angleLeft),

        ),
      ),

      body: Center(
        child: ListView.builder(
            itemCount: shops.length,
            itemBuilder: (BuildContext context, int index) {
              final shop = shops[index];

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Slidable(

                  key: const ValueKey(0),


                  endActionPane: ActionPane(

                    motion: const ScrollMotion(),

                    children: [

                      SlidableAction(
                        onPressed: (context){
                          ref.read(ShopPageProvider.notifier).deleteShop(shop: shop);
                        },
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: LineIcons.alternateTrashAlt,
                        label: '削除',
                      ),
                      SlidableAction(
                        onPressed: (context) async{
                          final result = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ShopEditPage(shop: shop,)));
                          if(result){
                            ref.read(ShopPageProvider.notifier).fetchShops();
                          }
                        },
                        backgroundColor: Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: LineIcons.editAlt,
                        label: '編集',
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: SizedBox(height: 50,
                      width: 50,
                      child:ClipRRect(borderRadius: BorderRadius.circular(100),
                          child: Image.network(shop.image, fit: BoxFit.cover,)),),
                    title: Text(shop.name),

                    ),
                  ),
                );
            }
        ),

      ),

    );

  }
}