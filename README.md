
# Beginner's Camp
**キャンプを始めたい、初心者向けに特化した情報を提供するWebアプリケーションです！**

キャンプをしてみたい！でも、キャンプ場の予約や用品を準備するのに時間が掛かりませんか？<br />
**Beginner's Campではその手間を省き**、初心者向けにオススメのキャンプ場等を紹介しています。<br />
（ゲストログインできます。）


![Beginner's Camp top](https://user-images.githubusercontent.com/79072615/123040710-24bf4b80-d42f-11eb-9719-e5d74f7a1b10.png)

## URL
~https://beginners-camp.net/~
※2021/12/23に配信停止しました。

## 使用技術
 ## フロントエンド
  - HTML / CSS
  - JavaScript / jQuery
  - Bootstrap 4.5
  - Vue.js 2.6.14
 ## バックエンド
  - Ruby 2.6.3
  - Ruby on Rails 5.2.6（一部APIモード）
  - Rubocop（コード解析ツール）
  - Rspec（テスト）
 ## インフラ
  - MySQL 5.7.22 / Puma / Nginx
  - GitHub Actions(CI/CD)
  - AWS(VPC、ACM、Route53、IAM、ALB、RDS、S3、CloudFront、EC2、ECS(Fargate))
 ## 開発環境
  - VScode
  - Docker/docker-compose

## 設計書

## ER図
![PF_最新_ER図](https://user-images.githubusercontent.com/79072615/134756537-cb18cc8f-ae09-4863-9b0a-be9b50233e2c.png)

## インフラ構成図
![PF_最新インフラ構成図](https://user-images.githubusercontent.com/79072615/131221620-c709739c-9476-4acc-b545-7cb52dd90524.png)

## 特に工夫・意識した点

### ①WBSで作業工程の管理
ポートフォリオを作成する際に**WBSを使用し、設計からデプロイして完成するまでの工数管理や進捗状況の確認を行いました。**
機能毎に工数を見積り、作業を進め時間が足りなければ期日に間に合うようにタスクを減らし、柔軟にスケジュールを変更しました。実務を想定しながら簡易的なプロジェクトマネジメントをしたことで、モチベーションにもなり開発のイメージを掴むことに繋がりました。

### WBS
https://docs.google.com/spreadsheets/d/1MpyaG61adD7yL64vpLip-1SAqMoH9yT4X5OxsGIv8cA/edit#gid=1773513600

### ②直感的に操作しやすいUI/UX
欲しい情報がすぐ見つかるように、ボタンの配置を意識しました。<br />
要所要所に非同期通信（Vue.js / axios / Ajax）を使用し、画面の遷移を抑えています。<br />
とくに予約画面では、利用日数に応じて、（1泊2日　⇒　2泊3日）や（2泊3日　⇒　1泊2日）の<br />
利用料金を非同期通信で計算させ、UXの向上を図りました。

### ③ユーザー同士で情報を多角的に
既存のキャンプサイトに存在する機能（Google Maps APIやraty.js（クチコミ）、予約機能）に加え、<br />
**プラスαでタグ付けや投稿機能、ランキング機能**を加えることで、多角的に情報の共有を行えます。<br />
ユーザーの選択肢に不利益が生じないように、サイトからのオススメだけでがなく、<br />
ユーザー同士の生の声を得られることで、サービスの向上を図りました。

### ④疑似的なチーム開発、リーダブルコードの意識
チーム開発の時に学んだプルリクエストやlssue等を積極的に取り入れて、なるべく実務を想定した形で取り組みました。
プレフィックスをつけることで、どのような意図でコードを書いたか可視化。<br />
また、チーム開発では個人開発とは違い、「リーダブルコード」を意識しました。<br />
他者が見ても可読性が高く、インデントの意識、変数名やメソッド名も適切に決め、綺麗なコードを心がけました。

## Beginner's Campの開発背景
「時間を短縮し、目的に沿ったキャンプ場の選択ができる」ことをテーマに制作することを決めました。<br />

既存のキャンプサイトでは、さまざまな情報が豊富にあるがゆえに、<br />
そこから取捨選択し決めるのは時間が掛かり、結局断念した経験はキャンプに限らず誰もがあると思います。<br />

私もその一人でした。<br />

この課題を解決するため、あらかじめ初心者向けにオススメのキャンプ場を紹介。<br />
オススメだけではなく、ユーザー同士での情報の共有、ランキングがあることで、<br />
多角的に情報を共有でき、時間を短縮させます。<br />
その結果、サイトとユーザーが、より質の高いキャンプ情報を提供できるサービスになればと考えました。<br />

## 【機能一覧 / 詳細】

### 機能一覧まとめ
https://docs.google.com/spreadsheets/d/1OdpAQK21FwGG-HCSthLstctx_0l4XZ8ub2DcF6HWk_Q/edit#gid=0

  - ユーザー基本機能
    - ユーザー新規登録 / ログイン
    - ユーザー一覧、編集、詳細
    - ゲストログイン機能
    - マイページで下記表示可能<br />
（フォロー・フォロワー一覧、投稿一覧、いいねした投稿、予約一覧、ブックマーク一覧）
  - フォロー機能
    - ユーザー同士の「フォロー」機能（非同期通信 / Vue.js axios)
  - 投稿機能（みんなのキャンプ）
    - キャンプ情報投稿一覧、詳細表示、記事投稿、編集、削除機能
    - プレビュー機能
    - いいね機能（非同期通信 / Ajax）
    - コメント機能（非同期通信 / Ajax）
  - タグ付け機能
    - 中間テーブルの概念を学ぶため、gemを未使用
    - カンマで区切り、複数タグ付けができます
    - タグをクリックすると、同じタグの投稿一覧が表示されます
  - ランキング機能
    - みんなのキャンプのいいね数、キャンプ場、キャンプ用品はraty.jsの平均点のTOP3を表示
  ### キャンプ場に関する機能
  - 予約機能
    - DatetimePicker使用（カレンダーで予約日時を選択）
    - 過去の日付を選択できない（カレンダー、手入力も不可）
    - 重複予約できない（チェックイン、アウト日が被ると、エラーメッセージ表示）
    - 予約時間の制限（15～24時まで）
    - 予約日数に応じて利用料金を非同期通信で計算
  - 口コミ機能
    - 口コミ機能投稿、一覧、詳細（raty.js）
    - TOP画面のみ、ユーザーが評価した平均点を表示
  - 検索機能
    - キャンプ場一覧から、キャンプ場の名前検索可能
  - ブックマーク機能
    - 気になったキャンプ場を保存できる (非同期通信 / Vue.js axios)
  - Google Maps
    - Google Maps API
（管理者が投稿した住所をgeocoderで緯度経度を読み取り、地図を表示）
  ### キャンプ用品に関する機能
  - 口コミ機能
    - 口コミ機能投稿、一覧、詳細（raty.js）
    - TOP画面のみ、ユーザーが評価した平均点を表示
### 管理者機能
  - ユーザー一覧表示、詳細
  - 予約一覧表示、詳細
  - 投稿機能
    - キャンプ場投稿
    - キャンプ場投稿一覧、詳細、編集、削除
    - 複数画像アップロード（refile）
  - キャンプ用品投稿
    - キャンプ用品投稿一覧、詳細、編集、削除
  - その他機能
    - ページング機能
    - BgSwitcher（画面スライダー）
    - レスポンシブ対応（PC、スマホ）
    - 多言語化（flash、エラーメッセージをi18nにより日本語化）
  - その他工夫した点
    - bulletでN+1問題を検出
    - WBSで作業工程の管理
    - GitHub Actionsを使った自動デプロイ
    - 予約機能（重複予約、過去日付の予約不可、予約時間の制限、利用日数に応じて料金の計算）

## Qiitaで外部発信もしています。
https://qiita.com/tkht2401

## 使用素材
【画像素材】<br />
https://o-dan.net/ja/<br />
https://www.pakutaso.com/<br />
https://morguefile.com/photos/morguefile/1/camp/pop
