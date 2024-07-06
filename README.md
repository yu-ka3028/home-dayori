# home-dayori
![](app/assets/images/OPG画像.png)
毎日お疲れさまです。
このアプリは、ラジオリスナーになった気分で気軽に投稿し、他人の投稿へ投票ができます。
あなたの送った褒め便りが、誰かの励みになるかもしれません。

---
## 開発の経緯
離脱しやすいと言われるプログラミング学習の継続は他人と比べて落ち込みがち、生活リズムを崩しがちでした。
１日３分だけでも自身へ使う時間を確保し、１日に区切りをつけることでほっと一息ついて、焦りや不安から向上心へ変えられた自身の体験をアプリにしてみました。

---
## サービス構想
- 自分が「ラジオ好き　✖️ 10年日記継続」から、あえてユーザー名ではなくその日の気分で決めるラジオネームでの投稿
- BeOpenってハードル高かった。Openってネガティブやマウントで相手を不快にさせないか・・・開ききれない。だから「今日の自分を褒める」に絞った投稿サービス
- 1日の振り返りをネガティブで終わらず、なんとかポジティブにしてみる（言霊ってある）
- 毎日1個は自分を褒めて自己肯定感UP！！ダラダラ引きずって過ごさず1日を整理して終える！！
- 他者と比較し劣った部分を追いがちな日常に、自分をz・肯定することで投稿したユーザーへホッとする時間を提供できる。
- 自分を肯定し優しくすることで自然と他人にも優しくなれる、優しい世界な投稿アプリ。
  

---
## 使用技術
- フロントエンド：TailwindCSS,DaisyUI
- バックエンド：Ruby on Rails,
- データベース：Mysql2
- デプロイ：Heroku
- 開発環境：Docker

##　選定理由
- バックエンドは、Rails基礎カリキュラムの復習が目的の１つであったためRuby on Railsを選定。
- フロントは、アプリ作成が初挑戦のため作成スピードの重視。また、どんなコンポーネントがユーザーフレンドな実装なのか体験し、自分なりにカスタマイズできるDaisyUIを選定。
- DBはお安いものを
- デプロイはherokuに挑戦したかったため
- 環境もDockerは挑戦したかったため

---
## 機能

### バドラン締切までに実装した機能
- ユーザー登録機能

- 投稿機能
　　- ラジオネームと本文

- 投稿編集機能（投稿ユーザーと管理者のみ）

- 投稿削除機能（投稿ユーザーと管理者のみ）

- ゲストユーザーの投稿前に内容確認機能
  - （投稿編集・削除ができないため）
  
- 投稿一覧の閲覧機能
  - （スクロールで見れるようスマホ目線で実装したがレスポンシブ対応微妙にできていない・・・）

- 投票機能
  - ゲストアカウントはCoolieで判定
  - ログインアカウントはユーザーで判定

- Xでのシェア機能
  - 投稿時はTopページのURL
  - 投票時は投稿内容のURL


### 今後実装したい機能（検討中）


- (+α)表彰機能

- 連続投稿記録機能

- 今日の気分記録機能

- 投稿一覧画面の工夫（最新、投票順、キーワードの曖昧検索やタグ実装）

- どんなネガティブもポジティブにまとめるAIによる入力サポート

- 投稿内容サポート機能（アプリキャラクターの柴犬が「今日の体への投資は？継続できたことは？みんなの投稿見て随時追加」）

- AIによるコメント機能（ユーザーからはできないが、アプリキャラクターの柴犬からコメント）

 
---
### デザイン

- React勉強予定なのでできることあれば
