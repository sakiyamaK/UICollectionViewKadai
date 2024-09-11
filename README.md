# 課題について

基本はstoryboardやxibを使わずにコードでやること

# 課題1

全画面にUICollectionViewを配置する
デフォルトのUICollectionViewFlowLayoutのままUICollectionViewCellを300個表示する
UICollectionViewCellの背景色を指定しないと透明なので注意する

## 参考
Regacy>DefaultUICollectionViewController.swift

# 課題2

課題1のcollectionViewに背景色を付けてセールエリアの外側から配置されていることが見えるようにする
セルはセーフエリアの内側から配置されていることを確認する
collectionView(継承元のUIScrollView)にcontentInsetAdjustmentBehaviorがある
これをデフォルト以外の値を代入してセルの開始位置がどう変わるのか確認する

## 参考
Regacy>ContentInsetAdjustmentBehaviorUICollectionViewController.swift

# 課題3

課題1のcollectionViewの構成からセルの横幅を画面いっぱいに広げる

## 参考
Regacy>SizeUICollectionViewController.swift

# 課題4

課題3のcollectionViewの構成から左右に余白を16入れる

## 参考
Regacy>ContentInsetsUICollectionViewController.swift

# 課題5

課題4のcollectionViewの構成からセルを2列にする
セル同士は横の間隔を10開ける

## 参考
Regacy>TwoColumnUICollectionViewController.swift

# 課題6

課題1のcollectionViewの構成からセクションを10個にする
偶数セクションはセルの数を10個でセルを赤
奇数セクションはセルの数を20個でセルを青

## 参考
Regacy>SectionUICollectionViewController.swift

# 課題7

課題1のcollectionViewの構成からセクションを3個にする
左右の余白を16開ける
セクション0はセルは1列にする
セクション1はセルは2列にする
セクション3はセルは2列にする
セルの数はセクションごとに分けること

## 参考
Regacy>SomeUICollectionViewController.swift

# 課題8

画像を表示させるカスタムセルを用意する
課題7のレイアウトでセルをカスタムセルにする
表示するデータは以下のURLから画像を表示させる(30人分のユーザデータ)
画像のキャッシュにはKingfisherを使おう
各セクションでセルは10個ずつ


https://randomuser.me/api/?page=0&results=30&seed=abc

## 参考
Regacy>CustomCell>CustomCellViewController.swift

# 課題9
課題3をUICollectionViewCompositionalLayout.list()でやる

## 参考
Trend>CompositionalListUICollectionViewController.swift

# 課題10
課題9をUICollectionViewCompositionalLayoutだがlistを使わずにやる (セルの高さは自由)

## 参考
Trend>CompositionalSizeUICollectionViewController

# 課題11

 課題10のcollectionViewの構成から左右に余白を16入れる

## 参考
Trend>CompositionalSizeContentInsetsUICollectionViewController.swift

# 課題12

課題10のcollectionViewの構成からセルを2列にする
セル同士は横の間隔を10開ける

## 参考
Trend>CompositionalTwoColumnUICollectionViewController.swift

# 課題13
CompositionalLayoutを使ってセクションを3個にする
左右の余白を16開ける
セクション0はセルは1列にする
セクション1はセルは2列にする
セクション3はセルは2列にする
セルの数はセクションごとに分けること

## 参考

Trend>CompositionalSomeSectionUICollectionViewController.swift

# 課題14
課題13のセクション1だけ2行で横スクロールさせる

Trend>CompositionalHorizontalScrollUICollectionViewController

# 課題15
課題14のセルを課題8のカスタムセルにする

Trend>CompositionalCustomCellUICollectionViewController
