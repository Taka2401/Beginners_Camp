
# Beginner's Camp
**キャンプを始めたい、初心者向けに特化した情報を提供するアプリです！**

キャンプをしてみたい！でも、キャンプ場の予約や用品を準備するのに時間が掛かりませんか？<br />
**Beginner's Campではその手間を省き**、初心者向けにオススメのキャンプ場等を紹介しています。<br />
（ゲストログインできます。）


![Beginner's Camp top](https://user-images.githubusercontent.com/79072615/123040710-24bf4b80-d42f-11eb-9719-e5d74f7a1b10.png)

## URL
https://beginners-camp.net/

## 使用技術
 ## フロントエンド
  - HTML/CSS
  - JavaScript/jQuery
  - Bootstrap 4.5
  - Vue.js 2.6.14
 ## バックエンド
  - Ruby 2.6.3
  - Ruby on Rails 5.2.6
  - Rubocop（コード解析ツール）
  - Rspec（テスト）
 ## インフラ
  - MySQL 5.7.22 / Puma / Nginx
  - GitHub Actions(CI/CD)
  - AWS(VPC、ACM、Route53、IAM、ALB、EC2、RDS、S3、CloudFront)
 ## 開発環境
  - VScode
  - Docker/docker-compose

## 工夫・意識した点

### ①直感的に操作しやすいUI/UX
どこをクリックすればほしい情報があるか分かりやすいボタンの配置を意識しました。<br />
要所要所に非同期通信やj-queryを使用し画面の遷移を抑えています。<br />
とくに予約画面では、j-queryで利用日数に応じて、（1泊2日　→　2泊3日）や（2泊3日　→　1泊2日）の<br />
料金を自動的に計算させることでページの遷移を抑え、UI/UXの向上を図りました。

### ②ユーザー同士で情報を多角的に
既存のキャンプサイトに近づけた機能（Google Maps APIやraty.js（クチコミ）、予約機能）に加え、<br />
**プラスαでタグ付けや投稿機能、ランキング機能**を加えることでユーザーに人気のある情報がすぐに得られやすいサイトの機能を加えました。<br />
また、サイトからのオススメだけでユーザーの選択肢に不利益が生じないように、タグ付けや投稿機能等を加えることができます。
その結果、同じ初心者のユーザからも情報を得られ、多角的に情報の共有ができます。

### ③疑似的なチーム開発やN＋1問題の解消
チーム開発の時に学んだプルリクエストやlssue等を積極的に取り入れて、なるべく実務を想定した形で取り組みました。
プレフィックスをつけることで、どのような意図でコードを書いたか可視化。<br />
N＋1問題では、開発当初ページ遷移時の時間が若干遅く、この問題の解消にあたってSQLを学ぶきっかけになりました。
ユーザーにストレスなく、サービスを利用していただくことは、サービスの信用に繋がると考えているので、
今後さらにSQLの知識を深めていきます。

## Beginner's Campの開発背景
僕自身、キャンプに行ったことがありませんでした。
キャンプに行こうと考えるも、どのキャンプ場がいいか調べることに、時間が掛かり断念しました。
その経緯があり、初心者向けに特化したサイトを制作することに至りました。<br />
既存のキャンプサイトでは、さまざまな情報が豊富にあるがゆえに、結局何を選べばいいか分からなくなります。
あらかじめターゲットを初心者に絞り、キャンプに詳しくない人でも行きやすいキャンプ場を紹介することにしました。
また、ユーザーが投稿できるのでサイトからのオススメだけではなく、多角的に情報を得られ、
ユーザ間で情報を共有できます。<br />
それにより、サイトとユーザーが共にキャンプに行きやすい情報を提供できるサービスになるように制作しました。

## 【機能一覧/詳細】

## **ユーザー基本機能**<br />
・ユーザー新規登録/ログイン<br />
・ユーザー一覧、編集、詳細<br />
・ゲストログイン機能<br />
・マイページで下記表示可能<br />
（フォロー・フォロワー一覧、投稿一覧、いいねした投稿、予約一覧、ブックマーク一覧）<br />

### 投稿機能（みんなのキャンプ）<br />
・キャンプ情報投稿一覧、詳細表示、記事投稿、編集、削除機能<br />
・プレビュー機能<br />
・いいね機能（非同期通信/Ajax）<br />
・コメント機能（非同期通信/Ajax）<br />

### フォロー機能
・ユーザー同士の「フォロー」機能（非同期通信 / Vue.js axios)

### タグ付け機能
・中間テーブルの概念を学ぶため、gemを未使用<br />
・カンマで区切り、複数タグ付けができます<br />
・タグをクリックすると、同じタグの投稿一覧が表示されます

### ランキング機能
・みんなのキャンプのいいね数、キャンプ場、キャンプ用品はraty.jsの平均点のTOP3を表示<br />

## <details><summary>キャンプ場に関する機能</summary>
・キャンプ場一覧、詳細表示

### 予約機能
・DatetimePicker使用（カレンダーで予約日時を選択）<br />
・過去の日付を選択できない（カレンダー、手入力も不可）<br />
・重複予約できない（チェックイン、アウト日が被ると、エラーメッセージ表示）<br />
・予約時間の制限（15～24時まで）
・予約日数に応じて利用料金を非同期で計算<br />

### 口コミ機能
・口コミ機能投稿、一覧、詳細（raty.js）<br />
・TOP画面のみ、ユーザーが評価した平均点を表示<br />

### 検索機能
・キャンプ場一覧から、キャンプ場の名前検索可能

### ブックマーク機能
・気になったキャンプ場を保存できる (非同期通信 / Vue.js axios)

### Google Maps
・Google Maps API
（管理者が投稿した住所をgeocoderで緯度経度を読み取り、キャンプ場の地図を表示）<br /></details>

### **キャンプ用品に関する機能**
・キャンプ用品一覧、詳細表示

### 口コミ機能
・口コミ機能投稿、一覧、詳細（raty.js）<br />
・TOP画面のみ、ユーザーが評価した平均点を表示<br />

## **管理者機能**

### キャンプ場投稿<br />
・キャンプ場投稿一覧、詳細、編集、削除<br />
・複数画像アップロード（refile）<br />

### キャンプ用品機能（管理者が投稿）<br />
・キャンプ場投稿一覧、詳細、編集、削除<br />
・口コミ機能投稿、一覧、詳細（raty.js）<br />

### その他機能<br />
・ページング機能<br />
・BgSwitcher（画面スライダー）<br />
・レスポンシブ対応（スマホのみ）<br />
・多言語化（flash、エラーメッセージをi18nにより日本語化）<br />

### 工夫した点<br />
・bulletでN+1問題を検出<br />
・GitHub Actionsを使った自動デプロイ<br />
・予約機能（重複予約、過去日付の予約不可、予約時間の制限、利用日数に応じて料金の計算）

## 設計書

## ER図
![PF_最新_ER図](https://user-images.githubusercontent.com/79072615/134756537-cb18cc8f-ae09-4863-9b0a-be9b50233e2c.png)

## インフラ構成図
![PF_最新インフラ構成図](https://user-images.githubusercontent.com/79072615/131221620-c709739c-9476-4acc-b545-7cb52dd90524.png)

## Qiitaで外部発信もしています。
https://qiita.com/tkht2401

## 使用素材
【画像素材】<br />
https://o-dan.net/ja/<br />
https://www.pakutaso.com/<br />
https://morguefile.com/photos/morguefile/1/camp/pop

