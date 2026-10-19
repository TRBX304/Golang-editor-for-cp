# ローカルジャッジ(Go)

JS版ローカルジャッジのGo版。WindowsのNode.jsから、Windowsに入れたGoの `go build` を直接呼ぶ(WSLは使わない)。
画面は http://localhost:2437(JS版の2434、C/C++版の2435、Java版の2436と同時に起動できる)。

## 必要なもの

- Node.js 18以上(JS版で使っているもの)
- Go(go1.27.2 で使用)
  - コマンドプロンプトで `go version` が通ればOK
  - インストール直後は、開き直したウィンドウでないと PATH が反映されない
  - go.mod は不要。gcc も不要(`CGO_ENABLED=0` でビルドする)

## 起動

`start.bat` をダブルクリック。起動ログに go のバージョンが出る。

## JS版から増えたもの

- コンパイル段階と **CE** 判定。go build のエラーはテストケース欄の上に表示
- よく出るコンパイルエラー(使っていない変数・import、`{` の改行位置など)にひとこと説明を表示
- 同じコードを再実行するときはコンパイルを省略
- REのとき、panic の内容(index out of range、integer divide by zero など)にひとこと説明を表示。スタックトレースは `Main.go:行番号` の形に短縮
- 入力が多くて `fmt.Scan` がTLEになったときは、`bufio` を使うようヒントを表示
- エディタのインデントはタブ(gofmtと同じ)
- ヘッダーにGopherを表示(`frontend/gopher.png` があるとき。ないときは「Go」の文字)

## 注意

- 1行目は `package main`、`func main()` が必要(AtCoderと同じ)
- 使っていない変数・import はコンパイルエラーになる(Goの仕様)
- 最初のコンパイルは標準ライブラリのビルドで数秒〜十数秒かかる。2回目以降は速い
- コンパイル直後の最初のケースは、Windows Defenderのスキャンで実行時間が少し長めに出ることがある
- `GOTOOLCHAIN=local` で実行するので、別バージョンのGoを自動でダウンロードしない
- Gopherのイラストは Renée French 作、CC BY 4.0
