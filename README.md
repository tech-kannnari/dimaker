# README

# アプリ名
D.maker
# 概要
・登録した献立をランダム出力します  
・調理完了後の写真を感想と一緒に保存できます  
・保存された調理の記録を振り返れます

# 本番環境
https://dimaker.herokuapp.com/  
ゲストのアイコンからログインが可能となっています
# 制作背景
料理が得意ではない男性に向けた夕食を選んでくれるアプリです。
家族のために夕食を作る機会があった時、すぐに調理を開始できない問題を解決しようと思いこのアプリを作成しました。
このアプリがあれば登録したレシピの中からメイン、サラダ、スープの３項目のメニューを提案してくれます。
また作った料理を振り返ることで自分の上達に気づくことができ、料理をすることが楽しくなっていきます。
＊メイン、サラダ、スープの３項目を揃えることでバランスの良い夕食と思ってもらえると考えています。  そのため調理項目はメイン、サラダ、スープの３つとなっています。
# DEMO
トップ画面

献立表示画面

調理履歴の一覧画面

履歴の詳細


[![Image from Gyazo](https://i.gyazo.com/b33931c4c4fdec7bc2129c7438f848a9.gif)](https://gyazo.com/b33931c4c4fdec7bc2129c7438f848a9)
# 工夫したポイント
・全体の雰囲気を統一し、見やすいレイアウトを心がけました  
・アイコンにリンクをつけることで画面遷移をわかりやすくしました  
・トップページにランダムで調理画像を載せているので、作ってみたい料理が見つかりやすくなっています

# 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code  

# 今後実装したい機能
・viewをレスポンシブに対応させたいと思っています  
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
