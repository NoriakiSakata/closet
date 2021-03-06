import 'package:closet_app_xxx/controllers/pages/home/buy_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BuyStep4 extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: TextField(
        maxLines: 3,
        decoration: InputDecoration(
            hintText: "Box Logo Hooded Sweatshirt Black",
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            )),
        onChanged: (text) {
          ref.read(buyPageProvider.notifier).description(text);
        },
      ),
    );
  }
}
