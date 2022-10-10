# flutter_beacon_riverpod

https://github.com/mamorucom/flutter_beacon_riverpod
からフォークして作成。
ビーコン検出後、GoogleスプレッドシートAPIに対して検出内容をPOSTする処理を追加


## POST先スプレッドシートの指定方法
[スプレッドシートIDを指定]
flutter_beacon_riverpod\lib\state_notifier\notifiers\beacon_scanning_notifier.dart

## POST先スプレッドシート側コードについて
GAS_doPOSTcode.txtの内容をスプレッドシートのAppsScriptコードとして保存してデプロイする
