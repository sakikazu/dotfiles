wc -l **/*.rb
ps aux | grep ruby
updatedb
locate --help

useradd
usermod

### location
/etc/sysconfig/iptables


### topで重い処理が動いてた時、そのプロセスの詳細を知る

$ sudo ls  -al /proc/(調べたいプロセスID)
* exeはプロセスファイルの場所
* cwdはカレントディレクトリパス
* fdの中を表示すればファイルディスクリプタ一覧

?? コマンドはわかるが、そのオプションみたいなのまでわからんと、実際のところはわからんかなー

