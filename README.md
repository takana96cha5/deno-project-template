<h1 align="center">My Workspace</h1>

# 始め方(Getting Started)

1. `<PROJECT_NAME>` を好みのプロジェクト名に置き換えて、以下のコマンドを実行します:

   ```bash
   PROJECT_NAME=<PROJECT_NAME>
   
   WORKSPACE_URL="https://raw.githubusercontent.com/takana96cha5/my-workspace/main/init.sh"
   
   curl -s ${WORKSPACE_URL} | bash -s -- ${PROJECT_NAME}
   ```

   このコマンドは、リポジトリをクローンし、初期化して、指定されたプロジェクト名で新しいディレクトリを作成します。

2. プロジェクトディレクトリに移動します:

   ```bash
   cd ${PROJECT_NAME}
   ```

3. VSCodeでプロジェクトを開きます。

4. VSCodeの左下にある緑色のアイコンをクリックし、"Reopen in Container"を選択します。これにより、DevContainerが構築され、その中でプロジェクトが開かれます。

5. DevContainer内でアプリケーションを実行します。

# ポート番号と設定の調整(Adjusting Port Numbers and Settings)

`.devcontainer` ディレクトリ内の `.env` ファイルを編集することで、各サービスのポート番号やその他の設定を調整できます。

- `DENO_VERSION`: Denoのバージョンを指定します。
- `DB_USER`、`DB_PASSWORD`、`DB_NAME`、`DB_HOST`、`DB_PORT`: データベースの接続情報を設定します。
- `PGADMIN_DEFAULT_EMAIL`、`PGADMIN_DEFAULT_PASSWORD`: pgAdminのデフォルトのログイン情報を設定します。
- `ME_CONFIG_MONGODB_ENABLE_ADMIN`: Mongo Expressの管理者権限を有効にするかどうかを設定します。
- `RABBITMQ_USERNAME`、`RABBITMQ_PASSWORD`: RabbitMQのユーザー名とパスワードを設定します。

また、`.devcontainer/docker-compose.yml` ファイル内で各サービスのポートマッピングを調整できます。

`.devcontainer/docker/nginx/conf.d/nginx.conf` ファイル内で、Nginxのリバースプロキシのポート番号を実際のアプリケーションのポート番号に合わせて調整してください。

# 開発ワークフローの例(Example Development Workflow)

1. 新しい機能やバグ修正のためにGitHubでイシューを作成します。

2. イシューの内容に基づいて新しいブランチを作成します:

   ```bash
   git checkout -b feature/issue-123
   ```

3. 新しい機能を開発したりバグを修正したりします。

4. 変更をコミットします:

   ```bash
   git add .
   git commit -m "Add new feature for issue #123"
   ```

5. 変更をリモートリポジトリにプッシュします:

   ```bash
   git push -u origin feature/issue-123
   ```

6. GitHubでプルリクエストを作成します。

7. コードレビューを受けて、必要に応じて変更を加えます。

8. プルリクエストがマージされたら、ローカルのmainブランチを更新します:

   ```bash
   git checkout main
   git pull
   ```

9. 古いブランチを削除します:

   ```bash
   git branch -d feature/issue-123
   ```

10. 次のタスクに取り掛かります。

# 主要なファイルとその役割(Key Files and Their Roles)

- `init.sh`: リポジトリを初期化し、`.git` ディレクトリを削除し、`.devcontainer/.env` ファイルを作成し、不要なファイルを削除します。

- `.gitignore`: Gitの追跡対象から除外するファイルやディレクトリを指定します。

- `.devcontainer/.env.example`: 環境変数の例を提供します。これを `.env` ファイルにコピーして使用します。

- `.devcontainer/devcontainer.json`: VSCode DevContainerの設定ファイルです。使用するDocker Composeファイル、サービス名、ワークスペースのパス、インストールする拡張機能などを指定します。

- `.devcontainer/docker-compose.yml`: DevContainerで使用するサービスを定義するDocker Composeファイルです。

- `.devcontainer/docker/nginx/Dockerfile`: Nginxサービス用のDockerfileです。

- `.devcontainer/docker/nginx/conf.d/handlecors`: NginxでCORSヘッダーを設定するための設定ファイルです。

- `.devcontainer/docker/nginx/conf.d/handlepreflight`: NginxでOPTIONSリクエストを処理するための設定ファイルです。

- `.devcontainer/docker/nginx/conf.d/nginx.conf`: Nginxの主要な設定ファイルです。リバースプロキシの設定などが含まれます。

- `.devcontainer/docker/workspace/Dockerfile`: ワークスペースサービス用のDockerfileです。Denoやその他の必要なパッケージをインストールします。

これらのファイルが連携して、DevContainerによる開発環境を提供します。
