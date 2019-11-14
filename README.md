# はじめて実行される方へ
careerWalkをgit cloneし, careerWalkディレクトリに移動したら以下コマンドを打ってください. 
Dockerのビルドやデータベースの作成をします.

#### MacOS
```
~$ sh init.sh
```
#### Linux(Windows10にLinuxを入れてる人も)
```
~$ sudo sh init.sh
~$ sudo chown -R $USER:$USER .
```

ビルドが問題なく終わったら下記コマンドでコンテナを立ち上げてください.
```
~$ sudo docker-compose up
```
[localhost](http://127.0.0.1)にアクセスするとcareerWalkが表示されるはずです.
もしエラーが出たりうまくできない場合, エラー文とOSを教えてください. 
尚DockerについてDocBaseで詳しくまとめているので見ておいてください.
