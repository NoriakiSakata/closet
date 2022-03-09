import 'package:closet_app_xxx/Screen/home/account_screen/account_screen.dart';
import 'package:closet_app_xxx/Screen/home/buy_screen/buy_step_screen.dart';
import 'package:closet_app_xxx/Screen/home/calender_screen/calender_screen.dart';
import 'package:closet_app_xxx/Screen/home/sell_screen/sellStep_screen.dart';
import 'package:closet_app_xxx/Screen/home/src/category_controller.dart';
import 'package:closet_app_xxx/Screen/home/src/closet.dart';
import 'package:closet_app_xxx/Screen/home/src/favorite.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import '../../controllers/pages/home_page_controller.dart';



class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
    this.userId,
  }) : super(key: key);

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        HomePageProvider.overrideWithProvider(
          HomePageProviderFamily(
            HomePageProviderArg(userId: userId),
          ),
        ),
      ],
      child: _HomePage(userId: userId),
    );
  }
}



class _HomePage extends ConsumerWidget {
  _HomePage({Key? key, this.userId}) : super(key: key);
  final String? userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomePageProvider);
    return
      state.accountImage == '' ?
          Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          ):
    Scaffold(
          backgroundColor: Colors.brown.shade50,
          floatingActionButton: userId == null ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                      backgroundColor: Colors.brown.shade50,
                      heroTag: 'add',
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(LineIcons.tShirt),
                          Text('購入', style: TextStyle(fontSize: 10),)
                        ],
                      ),
                      onPressed: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => BuyStepScreen(),
                            )
                        );
                        if (result) {
                          ref.read(HomePageProvider.notifier).fetchHomePageData();
                        }
                      },
                    ),

                SizedBox(height: 10,),
                FloatingActionButton(
                        backgroundColor: Colors.brown.shade50,
                        heroTag: 'sell',
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(LineIcons.handHoldingUsDollar),
                            Text('売却', style: TextStyle(fontSize: 10),)],
                        ),
                        onPressed: () async {
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => SellStepScreen(),
                              )
                          );
                          if (result) {
                            ref.read(HomePageProvider.notifier)
                                .fetchHomePageData();
                          }
                        },
                      ),
                SizedBox(height: 10,),
                FloatingActionButton(
                  backgroundColor: Colors.brown.shade50,
                  heroTag: 'calender',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LineIcons.calendar),
                      Text('収支', style: TextStyle(fontSize: 10),)],),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => CalenderScreen(),
                        )
                    );
                  },
                ),
                SizedBox(height: 10,),
                 FloatingActionButton(
                          backgroundColor: Colors.brown.shade50,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) => AccountScreen(),
                                )
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              color: Colors.white,
                              child: Image.network(
                                state.accountImage,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                      ),
              ]) :
          Container(),

          body: Center(
            child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.white.withOpacity(0.5),
                    child: Column(
                      children: [
                        SizedBox(height: 45,),
              Container(
                              width: 400,
                              height: 50,
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(state.year,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),),
                                  SizedBox(width: 5,),
                                  Text(state.month,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),),
                                  SizedBox(width: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(
                                            0.5),
                                        borderRadius: BorderRadius
                                            .circular(10)
                                    ),
                                    height: 48,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        Text(
                                          '購入額',
                                          style: TextStyle(fontSize: 10,),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(state.buying)
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    height: 48,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(
                                            0.5),
                                        borderRadius: BorderRadius
                                            .circular(10)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        Text('収入額', style: TextStyle(
                                          fontSize: 10,),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(state.selling)
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),

                  Row(
                    children: [
                      SizedBox(width: 5,),
                      Container(width: 100, decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)
                      ), child: Center(child: Text('お気に入り'))),
                    ],
                  ),
                  Container(height: 200,
                      width: double.infinity,
                      child: ClosetFavorite()
                  ),


                  ClosetController(),
                  Expanded(child: Closet()),
                ]
            ),
          )
      );
  }
}