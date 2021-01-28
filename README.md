# 郵便番号検索アプリ

郵便番号を検索できるアプリ


AppleのSwiftUI Tutorialsをやってみたので、似たようUIパーツを使ったアプリのサンプル

SQLiteはFMDBとかのライブラリを使えば簡単に実装できるが、直接触るとどれくらい大変なのか体験


![light](./img/light.png)

![dark](./img/dark.png)

## 開発環境

* Xcode 12.4 (12D4e)
* Swift 5.3.2

## 対応OS

* iOS14以降

## 利用データ

郵便番号データベースは下記のものを使用  
https://github.com/ynug/convertPostalCodeToSqlite

## 既知の問題

* 検索時に検索結果が多い状態で再検索するとフリーズする
検索結果件数が少ない場合は時に問題にならない。  
Listに10000万件とかのデータを表示して再度データを適用しようとするフリーズするような感じ。  
UITableViewのように直近だけのセルを作るような仕様に出来れば改善しそう  
実装が悪いのかListの不具合なのかいまいちわからない

