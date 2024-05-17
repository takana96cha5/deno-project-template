<h1 align="center">My Workspace</h1>

# How to get started

1. このリポジトリをクローンします。

   ```bash
   git clone https://github.com/takana96cha5/my-workspace.git
   ```

2. `init.sh`スクリプトを実行します。

   ```bash
   cd my-workspace
   ./init.sh
   ```

   このスクリプトは、リポジトリの初期化、`.devcontainer/.env`ファイルの作成、不要なファイルの削除を行います。

3. VSCodeでこのプロジェクトを開きます。

4. VSCodeの左下にある緑色のアイコンをクリックし、"Reopen in Container"を選択します。これにより、DevContainerが構築され、プロジェクトが開かれます。

5. DevContainer内でアプリケーションを実行します。

# ポート番号と設定の調整ガイド

`.devcontainer` ディレクトリ内の `.env` ファイルを編集することで、各サービスのポート番号やその他の設定を調整できます。

- `DENO_VERSION`: Denoのバージョンを指定します。
- `DB_USER`、`DB_PASSWORD`、`DB_NAME`、`DB_HOST`、`DB_PORT`: データベースの接続情報を設定します。
- `PGADMIN_DEFAULT_EMAIL`、`PGADMIN_DEFAULT_PASSWORD`: pgAdminのデフォルトのログイン情報を設定します。
- `ME_CONFIG_MONGODB_ENABLE_ADMIN`: Mongo Expressの管理者権限を有効にするかどうかを設定します。
- `RABBITMQ_USERNAME`、`RABBITMQ_PASSWORD`: RabbitMQのユーザー名とパスワードを設定します。

また、`.devcontainer/docker-compose.yml` ファイル内で各サービスのポートマッピングを調整できます。

`.devcontainer/docker/nginx/conf.d/nginx.conf` ファイル内で、Nginxのプロキシ先のポート番号を実際のアプリケーションのポート番号に合わせて調整してください。

# 開発ワークフローの例

1. 新しい機能やバグ修正のためにGitHubでイシューを作成します。

2. イシューの内容に基づいて新しいブランチを作成します。

   ```bash
   git checkout -b feature/issue-123
   ```

3. 新しい機能を開発したりバグを修正したりします。

4. 変更をコミットします。

   ```bash
   git add .
   git commit -m "Add new feature for issue #123"
   ```

5. 変更をリモートリポジトリにプッシュします。

   ```bash
   git push -u origin feature/issue-123
   ```

6. GitHubでプルリクエストを作成します。

7. コードレビューを受けて、必要に応じて変更を加えます。

8. プルリクエストがマージされたら、ローカルのmainブランチを更新します。

   ```bash
   git checkout main
   git pull
   ```

9. 古いブランチを削除します。

   ```bash
   git branch -d feature/issue-123
   ```

10. 次のタスクに取り掛かります。

# 主要なファイルの役割

- `init.sh`: リポジトリの初期化を行うスクリプトです。`.git`ディレクトリを削除し、`.devcontainer/.env`ファイルを作成し、不要なファイルを削除します。

- `.gitignore`: Gitの追跡対象から除外するファイルやディレクトリを指定するファイルです。

- `.devcontainer/.env.example`: 環境変数の例を示すファイルです。これを`.env`ファイルにコピーして使用します。

- `.devcontainer/devcontainer.json`: VSCode DevContainerの設定ファイルです。使用するDockerComposeファイル、サービス名、ワークスペースのパス、インストールする拡張機能などを指定します。

- `.devcontainer/docker-compose.yml`: DevContainerで使用するサービスを定義するDockerComposeファイルです。

- `.devcontainer/docker/nginx/Dockerfile`: NginxサービスのDockerfileです。

- `.devcontainer/docker/nginx/conf.d/handlecors`: NginxでCORSヘッダーを設定するための設定ファイルです。

- `.devcontainer/docker/nginx/conf.d/handlepreflight`: NginxでOPTIONSリクエストを処理するための設定ファイルです。

- `.devcontainer/docker/nginx/conf.d/nginx.conf`: Nginxの主要な設定ファイルです。リバースプロキシの設定などを行います。

- `.devcontainer/docker/workspace/Dockerfile`: ワークスペースサービスのDockerfileです。Denoやその他の必要なパッケージをインストールします。

これらのファイルが連携して、DevContainerによる開発環境を提供します。
