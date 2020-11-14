require 'date'
require 'active_support/all'

#
# 各管理サーバーのファイルをバックアップする
#
# created at: 2020/11/13
#
class Backup
  LOCAL_BAK_DIR = '~/bak'.freeze

  HM = 'habit-machine'.freeze
  ADAN = 'adan'.freeze
  GASSPRICE = 'gassprice'.freeze

  DELETE_DAY = 5 # この数分の前の日のファイルを削除する

  IS_DRY_RUN = false # trueならコマンドを実行しない

  def main
    deleted_date = get_deleted_date

    output_label(HM)
    exec_cmd("mkdir -p #{LOCAL_BAK_DIR}/#{HM}")
    backupfilepath = exec_cmd("ssh mysakura \"/usr/local/site/#{HM}/current/lib/backup4mysql.sh\"") { |result| result.chomp }
    exec_cmd("scp -p mysakura:#{backupfilepath} #{LOCAL_BAK_DIR}/#{HM}")
    exec_cmd("rsync -av --delete mysakura:/usr/local/site/#{HM}/shared/public/upload #{LOCAL_BAK_DIR}/#{HM}")
    delete_old_file("habitm_#{deleted_date}.sql.gz")

    output_label(ADAN)
    exec_cmd("mkdir -p #{LOCAL_BAK_DIR}/#{ADAN}")
    backupfilepath = exec_cmd("ssh mysakura \"/usr/local/site/#{ADAN}/current/lib/backup4mysql.sh\"") { |result| result.chomp }
    exec_cmd("scp -p mysakura:#{backupfilepath} #{LOCAL_BAK_DIR}/#{ADAN}")
    exec_cmd("rsync -av --delete mysakura:/usr/local/site/#{ADAN}/shared/public/upload #{LOCAL_BAK_DIR}/#{ADAN}")
    delete_old_file("adan_v4_#{deleted_date}.sql.gz")

    # gassprice
    # ファイルのバックアップはなし
    output_label(GASSPRICE)
    exec_cmd("mkdir -p #{LOCAL_BAK_DIR}/#{GASSPRICE}")
    backupfilepath = exec_cmd("ssh sakura \"/home/gassuser/gassprice/current/lib/backup4mysql.sh\"") { |result| result.chomp }
    exec_cmd("scp -p sakura:#{backupfilepath} #{LOCAL_BAK_DIR}/#{GASSPRICE}")
    delete_old_file("gassprice_#{deleted_date}.sql.gz")
  end

  def output_label(project)
    puts "\n\n###### #{project}"
  end

  def get_deleted_date
    target_day = Date.today - DELETE_DAY.day
    short_year = target_day.year.to_s.slice(2, 2)
    md = target_day.strftime("%m%d")
    "#{short_year}#{md}"
  end

  # TODO: やっぱりこれだと、スクリプトが実行されない時が続くと、削除されないファイルも溜まっていくので、以前のものはすべて、としたい
  def delete_old_file(file)
    File.delete(file)
  rescue StandardError => e
    puts "[ERR] #{e.message}"
  end

  def exec_cmd(cmd)
    stdout = if IS_DRY_RUN
               puts "dry run: #{cmd}"
               'test'
             else
               `#{cmd}`
             end
    yield stdout if block_given?
  end
end

b = Backup.new
b.main


# KNOWHOW

### rsync
# -a : アーカイブ。ディレクトリ再帰的、パーミッションなどの属性保持、シンボリックリンクはそのまま、など対象をそのままコピー
# -v : コピーしたファイル名やバイト数などの転送情報を出力
# -e : sshのオプション（ポートや秘密鍵）を指定する
# --delete : 転送元に存在しないファイルは削除

