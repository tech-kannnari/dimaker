# README

# アプリ名
D.maker
# 概要
・登録した献立をランダム出力します  
・調理完了後の写真を感想と一緒に保存できます  
・保存された調理の記録を振り返れます

# 本番環境
https://dimaker.herokuapp.com/  
Basic認証  
・ユーザー名：dmaker  
・パスワード：0000   
＊guestのアイコンからログインが可能となっています
# 制作背景
料理が得意ではない男性に向けた夕食を選んでくれるアプリです。
家族のために夕食を作る機会があった時、すぐに調理を開始できない問題を解決しようと思いこのアプリを作成しました。
このアプリがあれば登録したレシピの中からメイン、サラダ、スープの３項目のメニューを提案してくれます。
また作った料理を振り返ることで自分の上達に気づくことができ、料理をすることが楽しくなっていきます。  
＊メイン、サラダ、スープの３項目を揃えることでバランスの良い夕食と思ってもらえると考えています。  そのため調理項目はメイン、サラダ、スープの３つとなっています。
# DEMO
トップ画面
[![Image from Gyazo](https://i.gyazo.com/1fcf48cd9f42b1ae464ede81b47868ed.gif)](https://gyazo.com/1fcf48cd9f42b1ae464ede81b47868ed)

献立表示画面
[![Image from Gyazo](https://i.gyazo.com/7e183e2ef282d6ab8437167cf1af0d1a.gif)](https://gyazo.com/7e183e2ef282d6ab8437167cf1af0d1a)
調理履歴の一覧画面
[![Image from Gyazo](https://i.gyazo.com/2e0ea8aae57dfdb2b139dc7b4ada49bb.gif)](https://gyazo.com/2e0ea8aae57dfdb2b139dc7b4ada49bb)
履歴の詳細
[![Image from Gyazo](https://i.gyazo.com/b20fd6ab5a317540a07d3d5436f5f68b.gif)](https://gyazo.com/b20fd6ab5a317540a07d3d5436f5f68b)
# 工夫したポイント
・全体の雰囲気を統一し、見やすいレイアウトを心がけました  
・アイコンにリンクをつけることで画面遷移をわかりやすくしました  

# 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code  

# 今後実装したい機能
・レシピがみづらいので改善できないか考え中です  
・viewをレスポンシブに対応させたいと考えています  
・レコードにコメント機能をつけたいと考えています  

# DB設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |

### Association

- has_many   : menus
- has_many   : dinners


## menus テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| main_name    | string     | null: false                   |
| main_recipe  | text       |                               |
| main_genre   | string     |                               | 
| salad_name   | string     | null: false                   | 
| salad_recipe | text       |                               | 
| salad_genre  | string     |                               |
| soup_name    | string     | null: false                   | 
| soup_recipe  | text       |                               |  
| soup_genre   | string     |                               |
| user         | references | null: false, foreign_key:true |


### Association

- belongs_to : user


## dinners テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| impression | text       | null: false                   |
| cookday    | date       | null: false                   |
| user       | references | null: false, foreign_key:true |

//imageはActiveStorageで実装

### Association

- belongs_to :user
