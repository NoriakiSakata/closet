import 'package:closet_app_xxx/controllers/pages/home/buy_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';

import 'package:closet_app_xxx/ui/pages/closet/buy_screen/src/buy_step7.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'src/buy_step1.dart';
import 'src/buy_step2.dart';
import 'src/buy_step3.dart';
import 'src/buy_step4.dart';
import 'src/buy_step5.dart';
import 'src/buy_step6.dart';

class BuyStepScreen extends StatefulWidget {
  const BuyStepScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BuyStepScreen();
  }
}

class _BuyStepScreen extends State<BuyStepScreen> {
  int currentStep = 0;
  bool hide = true;

  bool itemState = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer(builder: (context, ref, _) {
      final items = ref.watch(buyPageProvider);
      if (items.imageFile != null &&
          items.selectedBrand.brandId != 0 &&
          items.category != '' &&
          items.description != '' &&
          items.buyingForm != '' &&
          items.price != '' &&
          items.day != '') {
        itemState = true;
      } else {
        itemState = false;
      }
      return Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: Container(
            margin: EdgeInsets.only(bottom: 100.0),
            child: itemState
                ? FloatingActionButton(
                    child: Text('追加'),
                    backgroundColor: AppColors.theme,
                    onPressed: () async {
                      await ref.read(buyPageProvider.notifier).addCloset();
                      Navigator.pop(context, true);
                    })
                : FloatingActionButton(
                    child: Icon(LineIcons.angleDown),
                    backgroundColor: AppColors.white,
                    onPressed: () {
                      if (currentStep < 6) {
                        setState(() {
                          currentStep += 1;
                        });
                      }
                    }),
          ),
          body: Center(
            child: Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(primary: AppColors.white)),
              child: GlassContainer(
                borderRadius: BorderRadius.zero,
                width: double.infinity,
                height: double.infinity,
                child: CupertinoStepper(
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: details.onStepContinue,
                          child: Text(hide == true ? '' : 'Confirm'),
                        ),
                        TextButton(
                          onPressed: details.onStepCancel,
                          child: Text(hide == true ? '' : 'Cancel'),
                        ),
                      ],
                    );
                  },
                  currentStep: currentStep,
                  onStepTapped: (index) {
                    setState(() {
                      currentStep = index;
                    });
                  },
                  steps: <Step>[
                    Step(
                        isActive: items.imageFile != null,
                        title: Text('写真'),
                        content: BuyStep1()),
                    Step(
                        isActive: items.selectedBrand.brandId != 0,
                        title: Text('ブランド'),
                        content: BuyStep2()),
                    Step(
                      isActive: items.category != '',
                      title: Text('カテゴリ'),
                      content: BuyStep3(),
                    ),
                    Step(
                      isActive: items.description != '',
                      title: Text("詳細"),
                      content: BuyStep4(),
                    ),
                    Step(
                      isActive: items.buyingForm != '',
                      title: Text('購入形態'),
                      content: BuyStep5(),
                    ),
                    Step(
                      isActive: items.price != '',
                      title: Text('購入額'),
                      content: BuyStep6(),
                    ),
                    Step(
                      isActive: items.day != '',
                      title: Text('日付'),
                      content: BuyStep7(),
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
