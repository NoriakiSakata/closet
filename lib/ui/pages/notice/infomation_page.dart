import 'package:closet_app_xxx/controllers/admin/notice_page_controller.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class InfomationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version =
        ref.watch(noticePageProvider.select((value) => value.version));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1000,
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() async {
                final url =
                    'https://noriakisakata.github.io/Closet-privacy-policy/';
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    forceSafariVC: true,
                    forceWebView: true,
                  );
                } else {
                  throw 'このURLにはアクセスできません';
                }
              }),
              child: ListTile(
                tileColor: Colors.white,
                title: Text('プライバシーポリシー'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                _openMailApp();
              }),
              child: ListTile(
                tileColor: Colors.white,
                title: Text('お問い合わせ'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {}),
              child: ListTile(
                tileColor: Colors.white,
                title: Text('バージョン情報'),
                trailing: Text(version),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                final result = await _showDialog(context, value: 'logout');
                if (result) {
                  await ref.read(userProvider.notifier).logout();
                  Navigator.pop(context);
                }
              },
              child: ListTile(
                tileColor: Colors.white,
                title: Text('ログアウト'),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _openMailApp() async {
    final title = Uri.encodeComponent('お問い合わせ');

    String mailUrl =
        "mailto:noriaki.sakata.app@gmail.com?subject=News&body=$title";

    return _launchURL(mailUrl);
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final Error error = ArgumentError('Could not launch $url');
      throw error;
    }
  }

  _showDialog(context, {required String value}) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: value == 'logout'
              ? Text('ログアウトしますか？')
              : value == 'block'
                  ? Text('ブロックしますか？')
                  : value == 'flag'
                      ? Text('報告しますか？')
                      : Text('ブロックを解除しますか？'),
          actions: [
            CupertinoDialogAction(
              child: Text('はい'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            CupertinoDialogAction(
              child: Text('いいえ'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }
}
