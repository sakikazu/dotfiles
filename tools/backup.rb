#
# 各管理サーバーのファイルをバックアップする
#
# created at: 2020/11/13
#

LOCAL_BAK_DIR = '~/bak'.freeze

HM = 'habit-machine'.freeze
puts "###### #{HM}"
system("mkdir -p #{LOCAL_BAK_DIR}/#{HM}")
backupfilepath = `ssh mysakura \"/usr/local/site/#{HM}/current/lib/backup4mysql.sh\"`
backupfilepath.chomp!
system("scp -p mysakura:#{backupfilepath} #{LOCAL_BAK_DIR}/#{HM}")
system("rsync -av --delete mysakura:/usr/local/site/#{HM}/shared/public/upload #{LOCAL_BAK_DIR}/#{HM}")

ADAN = 'adan'.freeze
puts "###### #{ADAN}"
system("mkdir -p #{LOCAL_BAK_DIR}/#{ADAN}")
backupfilepath = `ssh mysakura \"/usr/local/site/#{ADAN}/current/lib/backup4mysql.sh\"`
backupfilepath.chomp!
system("scp -p mysakura:#{backupfilepath} #{LOCAL_BAK_DIR}/#{ADAN}")
system("rsync -av --delete mysakura:/usr/local/site/#{ADAN}/shared/public/upload #{LOCAL_BAK_DIR}/#{ADAN}")

# gassprice
# ファイルのバックアップはなし
GASSPRICE = 'gassprice'.freeze
puts "###### #{GASSPRICE}"
system("mkdir -p #{LOCAL_BAK_DIR}/#{GASSPRICE}")
backupfilepath = `ssh sakura \"/home/gassuser/gassprice/current/lib/backup4mysql.sh\"`
backupfilepath.chomp!
system("scp -p sakura:#{backupfilepath} #{LOCAL_BAK_DIR}/#{GASSPRICE}")

# # パス無しにしている理由は、gassuserなので、このMacのsakikazuにひもづいているキーチェーンが効かないためにsshエラーなると考えられるため
# # それと、このsshのUserをgassuserにしていたら、このMacのsakikazuディレクトリに書き込みできなかったので、リモートサーバー側もsakikazuにして成功した

# - gasspriceのパスワード問題解決
# shの方はコメント書いてリンクは削除
# これをgithubに入れる


# KNOWHOW

### rsync
# -a : アーカイブ。ディレクトリ再帰的、パーミッションなどの属性保持、シンボリックリンクはそのまま、など対象をそのままコピー
# -v : コピーしたファイル名やバイト数などの転送情報を出力
# -e : sshのオプション（ポートや秘密鍵）を指定する
# --delete : 転送元に存在しないファイルは削除


# OLD

# echo '# Koisos (uploadディレクトリのみ)'
# target='koisos'
# rsync -av --delete -e 'ssh -p 30022' sakikazu@mysakura:/usr/local/site/$target/public/upload "$localbackdir""$target"/

# echo '# Nichiko (uploadsディレクトリのみ)'
# target='nichiko'
# rsync -av --delete -e 'ssh -p 30022' sakikazu@mysakura:/usr/local/site/$target/public/uploads "$localbackdir""$target"/

# echo '# Matabunkai (uploadsディレクトリのみ)'
# target='matabunkai'
# rsync -av --delete -e 'ssh -p 30022' sakikazu@mysakura:/usr/local/site/$target/public/uploads "$localbackdir""$target"/

