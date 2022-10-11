# flutter_beacon_riverpod

https://github.com/mamorucom/flutter_beacon_riverpod
からフォークして作成。
ビーコン検出後、GoogleスプレッドシートAPIに対して検出内容をPOSTする処理を追加

## POST先スプレッドシート側コードについて
GAS_doPOSTcode.txtの内容をスプレッドシートのAppsScriptコードとして保存してデプロイする

## POST先スプレッドシートの指定方法
flutter_beacon_riverpod\lib\state_notifier\notifiers\beacon_scanning_notifier.dart
上記ファイル内の
var url = Uri.https("script.google.com", "macros/s/[スプレッドシートID]/exec");
部分の[スプレッドシートID]を対象のスプレッドシートのIDに変更する

## スマートフォン名称の設定方法
flutter_beacon_riverpod\lib\state_notifier\notifiers\beacon_scanning_notifier.dart
上記ファイル内の
var phone = "[端末名称]";
部分の[端末名称]を対象の任意の名称に変更する