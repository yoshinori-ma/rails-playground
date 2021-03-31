# README

本番導入前に色々な技術を試しています

# before push
```bash
bundle exec rubocop --auto-correct

# どうしても解決しない場合
# rubocop.yml にて除外設定を書くか、以下のコマンドで todo に追加
bundle exec rubocop --auto-gen-config --exclude-limit=99999 --no-offense-counts --no-auto-gen-timestamp
```

# 導入技術
# Rubocop
- 初回導入時の方法
  - エラーリストアップ
  - 一旦 todo で抱えこむ
  - 少しずつ解消していく
- 特定のチェックを強くしたい
  - ex) Time.now を error にしたかった

# RSpec
- 導入だけ
- CI で回すのが目的

# GitHubActions
- CI/CD を CircleCI から移行したかった
- TOKEN の扱いが楽...
- マネージドな Action が多くて楽(CircleCI も orbs たくさんあるけど)  
- Rubocop → RSpec → ECS deploy までやる予定

# Dependabot
- 導入というか設定しました
- 適宜マージしていく予定
