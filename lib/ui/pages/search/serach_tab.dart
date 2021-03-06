import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/libs/tab_info.dart';
import 'package:closet_app_xxx/ui/pages/search/user/user_search_screen.dart';
import 'package:closet_app_xxx/ui/pages/search/brand/search_brand_page.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo("ブランド", SearchBrandPage()),
    TabInfo("ユーザー", UserSearchScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: GlassScaffold(
        appBar: GlassAppBar(
          title: TabBar(
            indicatorColor: AppColors.theme,
            labelColor: AppColors.theme,
            unselectedLabelColor: AppColors.text,
            isScrollable: true,
            tabs: _tabs.map((TabInfo tab) {
              return Tab(text: tab.label);
            }).toList(),
          ),
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: _tabs.map((tab) => tab.widget).toList()),
      ),
    );
  }
}
