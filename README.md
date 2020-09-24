
## タイトル
#### OtcDrug
<img width="1438" alt="スクリーンショット 2020-09-17 23 30 26" src="https://user-images.githubusercontent.com/66227302/93486861-9e298b00-f93f-11ea-8c90-d47ec3d1ac43.png">

# 概要
- ドラッグストアの店舗販売員として経験したことを活かし、症状に応じた薬の提案を行うアプリを開発

# 開発環境
- Ruby 2.66
- Ruby on Rails 6.0.0
- PostgreSQL(DB)
- Github
- Visual Studio Code

# 実装機能
- ログイン機能
- ゲストログイン機能
- マイページで症状にあった薬の提案表示
- Bootstrapでナビゲーションバー、背景色、ボタン作成
- 投稿機能
- アカウント編集機能
- 投稿削除機能
- ページネーション機能

# Pharmaciesテーブル
| column     | type    | options                        | 
| ---------- | ------- | ------------------------------ | 
|  nickname  | string  | null: false, foreign_key: true | 
| age        | integer | null: false, foreign_key: true | 
| sex        | string  | null: false, foreign_key: true | 
| counseling | text    | null: false, foreign_key: true | 
| sick       | string  | null: false, foreign_key: true | 

# Association
- has_many :pharmacies
- belongs_to :user

