FROM ruby:3.2

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# 作業ディレクトリを作成
WORKDIR /app/api

# GemfileとGemfile.lockを先にコピー（キャッシュを効かせるため）
COPY ./api/Gemfile ./api/Gemfile.lock ./

# bundlerインストールと依存解決
RUN gem install bundler && bundle install

# その他ファイルをコピー
COPY ./api .

# ポート3000を開放
EXPOSE 3000

# サーバー起動コマンド
CMD ["rails", "server", "-b", "0.0.0.0"]
