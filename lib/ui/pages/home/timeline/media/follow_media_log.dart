import 'package:closet_app_xxx/controllers/pages/timeline/follow_log_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/timeline/log_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/follow_media_log_list.dart';

class FollowMediaLogPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final isLoading =
        ref.watch(followLogPageProvider.select((value) => value.isLoading));
    final isScrollLoading = ref
        .watch(followLogPageProvider.select((value) => value.isScrollLoading));
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: Center(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(timeLinePageProvider.notifier).fetchTimeLine();
                },
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: size.height * 5 / 6,
                    child: NotificationListener<ScrollEndNotification>(
                      onNotification: (notification) {
                        final metrics = notification.metrics;
                        if (!isScrollLoading && metrics.extentAfter == 0) {
                          ref.read(followLogPageProvider.notifier).endScroll();
                        }
                        return true;
                      },
                      child: RefreshIndicator(
                          onRefresh: () async {
                            await ref
                                .read(followLogPageProvider.notifier)
                                .fetchTimeLine();
                          },
                          child: FollowMediaLogList()),
                    ),
                  ),
                ),
              ),
            ));
  }
}
