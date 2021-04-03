# README

# アプリ名
D.maker
# 概要
・登録した献立をランダム出力できます  
・調理完了後の写真を感想と一緒に保存できます  
・保存された調理の記録を振り返れます

# 本番環境
herokuデプロイの予定
# 制作背景
料理が得意ではない男性に向けた夕食を選んでくれるアプリです。
家族のために夕食を作る機会があった時、すぐに調理を開始できない問題を解決しようと思いこのアプリを作成しました。
このアプリがあれば登録したレシピの中からメイン、サラダ、スープの３項目のメニューを提案してくれます。
また作った料理を振り返ることで自分の上達に気づくことができ、料理をすることが楽しくなっていきます。
<!-- 他のユーザーの投稿をみることであなたの料理の幅を広げることもできます。 -->
＊メイン、サラダ、スープの３項目を揃えることができるとバランスの良い夕食に思ってもらえると考えているのでこの３項目を出力することにしています。
# DEMO
トップ画面
![image](https://user-images.githubusercontent.com/78346587/112436012-d693a100-8d88-11eb-8c70-0bfee0e6ff05.png)
献立表示画面
![image](https://user-images.githubusercontent.com/78346587/112436801-836e1e00-8d89-11eb-9dca-6925c5c141ad.png)
調理履歴の一覧画面
![image](https://user-images.githubusercontent.com/78346587/112436828-8963ff00-8d89-11eb-8439-f6936d9cef49.png)
履歴の詳細
![image](https://user-images.githubusercontent.com/78346587/112436877-9f71bf80-8d89-11eb-84a2-986621d73bc2.png)

[![Image from Gyazo](https://i.gyazo.com/b33931c4c4fdec7bc2129c7438f848a9.gif)](https://gyazo.com/b33931c4c4fdec7bc2129c7438f848a9)
# 工夫したポイント
・全体の雰囲気を統一し、見やすいレイアウトを心がけました  
・アイコンにリンクをつけることで画面遷移を簡単にしました

# 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

# 今後実装したい機能
・調理した日付や調理にかかった時間を画像や感想と一緒に保存する機能の追加をする予定です  
・ユーザー管理機能の実装をする予定です

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
