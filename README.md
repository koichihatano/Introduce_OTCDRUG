
## タイトル
#### OtcDrug

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

# 使用方法
- 新規情報投稿 → ニックネーム、年齢、性別、相談内容を入力すると、マイページでこれらの情報を見ることが可能（薬に応じたリンク、商品を表示可能）
- お客様一覧 → 投稿した情報のニックネーム、年齢、性別が表示
