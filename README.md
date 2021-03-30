# README

本番導入前に色々な技術を試しています

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
