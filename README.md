# flutter_beacon_riverpod

Flutter Beacon×Riverpodによるビーコン発信/検出方法


## アーキテクチャ

MVVM+Repositoryパターンを参考に、レイヤー分けしています。 

![](screenshot/zenn1-MVVM+RepositoryパターンAfter.drawio.png)


## ディレクトリ構成

```
lib
├─repository
├─state_notifier
│  ├─notifiers  // MVVMで言う、ViewModel的なやつ
│  └─states　   // MVVMで言う、Model的なやつ
├─util
└─view
    └─pages
```

