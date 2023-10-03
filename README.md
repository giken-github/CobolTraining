# COBOL言語研修用環境

DevContainerを利用したCOBOL言語研修用のテンプレートリポジトリです。

## 使用できるツール

* [GnuCOBOL 3.2](https://sourceforge.net/projects/gnucobol/)
* [OpenCobol ESQL 1.3](https://github.com/opensourcecobol/Open-COBOL-ESQL)
* [esqlOC](https://sourceforge.net/p/gnucobol/contrib/HEAD/tree/trunk/)
* [GCSORT](https://sourceforge.net/p/gnucobol/contrib/HEAD/tree/trunk/)

## 必要なアプリ

* [Visual Studio Code](https://code.visualstudio.com/)
  * [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) 拡張もインストールしてください。
* Docker
  * Windows/Macをご利用の方は、[Docker Desktop](https://www.docker.com/products/docker-desktop/)をインストールしてください。
* Git
  * Windowsをご利用の方は、[Git for Windows](https://gitforwindows.org/)をインストールしてください。

## 使い方

1. 本リポジトリを適当なフォルダにクローンします。
2. VSCodeを開きクローンしたフォルダを開きます。
3. コマンドパレット(Ctrl + Shift + p)から「開発コンテナ―: コンテナ―で再度開く」を選択
4. エクスプローラにファイルが表示され、操作できるようになったら準備完了です。

### 初回のみ

1. ターミナル(Ctrl + Shift + @) を開き、以下のコマンドを実行する。

``` sh
sudo .envbuilder/builder/build.sh
```

## License

MIT
