import 'package:closet_app_xxx/controllers/pages/clothes_edit_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DatePickField extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clothes =
        ref.watch(clothesEditPageProvider.select((value) => value.clothes));
    final selectedDate = ref.watch(
        clothesEditPageProvider.select((value) => value.selectedDateForBuy));
    final state = ref.watch(clothesEditPageProvider);
    return clothes == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '購入日',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  width: 250,
                  child: Column(
                    children: [
                      selectedDate == null
                          ? Text(
                              clothes.year +
                                  '/' +
                                  clothes.month +
                                  '/' +
                                  clothes.day,
                              style: TextStyle(fontSize: 25),
                            )
                          : Text(
                              state.year + '/' + state.month + '/' + state.day,
                              style: TextStyle(fontSize: 25),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), //角の丸み
                            ),
                            side: const BorderSide(color: Colors.black45),
                          ),
                          child: Text(
                            '選択',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () async {
                            var selectedDate = DateTime.now();
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(2018),
                              lastDate: DateTime(2030),
                            );
                            if (pickedDate != null) {
                              await ref
                                  .read(clothesEditPageProvider.notifier)
                                  .selectDate(selectedDate: pickedDate);
                            }
                          },
                        ),
                      )
                    ],
                  ))
            ],
          );
  }
}
