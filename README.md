# Simple-Server-Software
## 作者
作者: tanahiro2010
所属: Zisty

## 実行環境
### Windowsの場合
```cmd
choco install ruby
gem install sinatra
ruby main.rb
```
### Linuxの場合
```bash
apt install ruby
gem install sinatra
ruby main.rb
```

上記のコマンドを実行することで、実行できるようになります
## Server.dataの解説
このファイルは、WebServerの設定をするファイルです。<br>
1行目のindexは
```url
localhost:4567
```
にアクセスされた際に返すファイルパスを指定しています。<br>
ここではhtmlファイルを指定していますが、jsonなどのファイルを返すことも可能です。<br>
2,3行目は、getの後に続くワードにgetされたときに返すファイルを指定しています。<br>
例えば2行目は
```text
get hello = path
```
という構文で書かれています。<br>
この場合は、
```url
localhost:4567/hello
```
にアクセスされた際に返すファイルを指定しています。<br>
post要求バージョンは、現在開発中です（めんどくさいので更新されないかも）

## 実行方法
OSによって違いますが、Windowsならコマンドプロンプト,Linuxやmacならbashを開きます。
そして
```
cd "main.rbがあるフォルダーのパス"
ruby main.rb
```
で実行されます。<br>
そして、main.rbを実行したら、設定ファイルのパスを求められるので
```
Server setting path $ Server.data
```
のように設定ファイルのパスを入力し、エンターを押せば起動完了です。<br>
止めるときは、Ctrl+Cで止めれます。また、main.rbを終了させる際はパス入力を求めるプロンプトに
```text
exit
```
と入力してください