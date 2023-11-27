# サービス名「DeskTech Connect」
## サービス概要
自分が今使っているデスク環境を共有できるアプリで、ユーザーは投稿から様々なガジェットや周辺機器の情報を得る事ができるアプリです。
## 想定されるユーザー層
  - ガジェット好きのユーザー
  - 何か新しいガジェットなどを知りたい・買いたいユーザー
## サービスコンセプト
まず私がガジェット好きであることがこのサービスを作りたい理由です。元々、ITの世界やPC関連のガジェットには全く興味がありませんでしたが、私が新卒入社した2020年に丁度コロナが流行り、ほぼテレワークでの業務となってしまっていた中で、何か自分のモチベが上がるような環境づくりはできないか、と考えた結果、自分好みのデスク環境を構築することで仕事のモチベを上げていました。そこからどっぷりハマり、Youtube等で色々な情報を漁るようになりました。しかし、大体のWebサイトなどは1つの商品単体のみの紹介のみが多いので、このガジェットとこの機器を組み合わせるとかっこいいよね！可愛いね！といったような感情があまり見えてきませんでした。そこで、このサービスで自身のデスク環境を投稿して共有することで、こういう組み合わせの仕方もあるんだ！のような体験を提供することができるのでは、と思い、このサービスの開発に至りました。
昨今ではテレワークを継続して取り入れている企業もあり、テレワーク環境を整えるためにガジェット類を揃えたりするユーザー、Youtubeでも頻繁に自身のガジェットの商品レビューの動画が更新されていることから一定数の需要を満たすことができると考えています。
## サービスの利用イメージ
  - 投稿機能
    1. 自身のデスク環境を登録する画面を開く
    2. アプリ側で大まかにジャンルを設定しておく（デスク、キーボード、モニター、マウス、その他機器、等）
    3. 各ジャンルをAPIで検索を行い該当の商品を選択（この時メーカーや金額なども一緒に取得）
        - 該当商品がない場合は、自分で情報を入力して登録することも可能とする
    4. 最後に、実際のデスク写真をアップロードし、投稿完了
  - コメント機能
    - 投稿に対してコメントをする事ができる
  - ジャンル・メーカー・商品キーワード・金額の絞り込み・タグから検索する
  - 検索機能
    - マルチ検索機能
    - オートコンプリート機能
    - タグ検索
  - いいね！機能
    - 他ユーザーが投稿したデスク環境をいいね！をする事ができる。
    - いいね！を押した投稿は後から確認できるようにする。
  - マイデスク機能
    - 他ユーザーが投稿したデスク内の商品で気に入った商品があった場合は、マイデスクに追加しておく事で自分好みのデスクを備忘録として残しておく事ができる機能
    - お気に入りデスク機能とは違い、商品を個々に追加することができるため、これから独自の組み合わせでデスク環境を整えたい、といったときに便利
## 実装を予定している機能
  - MVP
    - ユーザー登録機能
    - ログイン/ログアウト機能
    - 投稿機能
        - 楽天API又との連携で商品検索・登録する機能
        - 実際のデスク写真の画像保存
    - いいね！機能
    - 人気投稿ランキング（いいね！の数をカウント）
    - Xアカウントとの連携ログイン
    - マルチ検索機能
    - オートコンプリート検索
- 本リリース
    - マイデスク機能
    - ジャンル別人気ランキング
    - 投稿シェア機能（X）
## 機能の実装方針予定
  - Ruby3系
  - Ruby on Rails7系
  - TailwindCSS
  - PostgreSQL
  - heroku
  - 楽天市場ショッピングAPI
  - X API
  - gem
    - carrierwave
    - sorcery
## 差別化、売りのポイント
Youtubeやガジェット紹介サイトは、単一の商品を紹介しているのみで、どういう組合せでデスクを作っているのかを紹介していることは少なく、企業に勤めている社員のデスクを紹介しているWebブログのようなサイトがありますが、どのメーカーなのか等の情報が載っていることは少ないです。このアプリであれば、他者がどのようなデスク環境を使っているのかを一元的に見る事ができる点で差別化ができていると思います。また、一部の動画配信ではデスクツアーの類の動画もありますが、同じような動画を何個も見る必要が無く、短い時間で情報の入手ができます。
## 追加サービスの案・追加機能の案
  - レコメンド機能
    - 自分が投稿したデスクに対して、似たような組み合わせのデスクがあれば、「関連する投稿」のような形で表示するようにする
    - 通常の投稿詳細ページで、似たような商品投稿がある場合に表示する
  - 各商品に対するレビュー機能
    - 簡単なレビュー機能を追加する。（例：コストパフォーマンスや機能性などを1〜5段階評価など）
## 画面遷移図
Figma：https://www.figma.com/file/1ykhFs9VneuzQD1Nb06XT3/Web%E3%82%A2%E3%83%97%E3%83%AA_%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=sCeXxhnOsxsjeQ4d-1
## ER図
https://gyazo.com/1d2b142cb4a3e6d3270280412e2f838f