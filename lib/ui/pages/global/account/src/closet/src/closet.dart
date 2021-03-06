import 'package:closet_app_xxx/controllers/pages/home/closet_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/clothes_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Closet extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closet =
        ref.watch(ClosetPageProvider.select((value) => value.closet));
    return closet.isEmpty
        ? Center(
            child: Text(
            'クローゼットは空です',
            style: TextStyle(color: Colors.black45),
          ))
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: closet.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = closet[index];
                  return InkWell(
                    onTap: () async {
                      final result = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ClothesViewScreen(clothes: item);
                      }));
                      if (result) {
                        ref
                            .read(ClosetPageProvider.notifier)
                            .fetchHomePageData();
                      }
                    },
                    child: GlassContainer(
                        borderRadius: BorderRadius.circular(15),
                        width: 150,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                width: 140,
                                height: 140,
                                child: CacheImage(imageURL: item.imageURL),
                              ),
                            ),
                          ],
                        )),
                  );
                }),
          );
  }
}
