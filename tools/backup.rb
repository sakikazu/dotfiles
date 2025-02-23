# frozen_string_literal: true

require 'date'
require 'active_support/all'

#
# 各管理サーバーのDBとファイルをバックアップする
#
# NOTE: このスクリプトでDBバックアップ実行まで行うため、リモートサーバー側にcron設定など不要
#
# created at: 2020/11/13
#
class Backup
  LOCAL_BAK_DIR = '~/bak'

  MY_HOST_ALIAS = 'mysakura'
  MY_REMOTE_BASE_DIR = '/home/ubuntu/web'

  HM = 'habit-machine'
  ADAN = 'adan'
  GASSPRICE = 'gassprice'

  DELETE_DAY = 5 # この数分の前の日のファイルを削除する

  # is_dry_run: trueならコマンドを実行しない
  def initialize(is_dry_run: false)
    @is_dry_run = is_dry_run
  end

  def execute
    for_habit_machine
    for_adan
    for_gassprice
  end

  def for_habit_machine
    output_label(HM)
    exec_cmd("mkdir -p #{LOCAL_BAK_DIR}/#{HM}")
    backupfilepath = exec_cmd("ssh #{MY_HOST_ALIAS} \"#{MY_REMOTE_BASE_DIR}/#{HM}/current/lib/backup4mysql.sh\"") { |result| result.chomp }
    exec_cmd("scp -p #{MY_HOST_ALIAS}:#{backupfilepath} #{LOCAL_BAK_DIR}/#{HM}")
    exec_cmd("rsync -av --delete #{MY_HOST_ALIAS}:#{MY_REMOTE_BASE_DIR}/#{HM}/shared/storage #{LOCAL_BAK_DIR}/#{HM}")
    delete_old_file("habitm_#{deleted_date}.sql.gz")
  end

  def for_adan
    output_label(ADAN)
    exec_cmd("mkdir -p #{LOCAL_BAK_DIR}/#{ADAN}")
    backupfilepath = exec_cmd("ssh #{MY_HOST_ALIAS} \"#{MY_REMOTE_BASE_DIR}/#{ADAN}/current/lib/backup4mysql.sh\"") { |result| result.chomp }
    exec_cmd("scp -p #{MY_HOST_ALIAS}:#{backupfilepath} #{LOCAL_BAK_DIR}/#{ADAN}")
    exec_cmd("rsync -av --delete #{MY_HOST_ALIAS}:#{MY_REMOTE_BASE_DIR}/#{ADAN}/shared/public/upload #{LOCAL_BAK_DIR}/#{ADAN}")
    delete_old_file("adan_v4_#{deleted_date}.sql.gz")
  end

  def for_gassprice
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

  def deleted_date
    target_day = Date.today - DELETE_DAY.day
    short_year = target_day.year.to_s.slice(2, 2)
    md = target_day.strftime("%m%d")
    "#{short_year}#{md}"
  end

  # TODO: やっぱりこれだと、スクリプトが実行されない日があると削除されないファイルも溜まっていくので、以前のものはすべて、としたい
  def delete_old_file(file)
    File.delete(file)
  rescue StandardError => e
    puts "[ERR] #{e.message}"
  end

  def exec_cmd(cmd)
    stdout = if @is_dry_run
               puts "dry run: #{cmd}"
               ''
             else
               `#{cmd}`
             end
    puts "... #{stdout}" unless stdout.empty?

    # TODO: 現状filepathをchompして返すためのyieldよね？わかりづらすぎるのでリファクタリング
    yield stdout if block_given?
  end

  class << self
    def show_help
      puts "\n#### Usage ####\n"
      puts ' -h: help'
      puts ' --dry-run: コマンドを実行しない予行練習'
      puts
    end
  end
end

options = {}
ARG_HELP = '-h'.freeze
ARG_DRY_RUN = '--dry-run'.freeze
unless ARGV.empty?
  ARGV.each do |arg|
    unless [ARG_HELP, ARG_DRY_RUN].include?(arg)
      raise ArgumentError, "`#{arg}` is unable"
    end
  end
  if ARGV.include?(ARG_HELP)
    Backup.show_help
    exit
  elsif ARGV.include?(ARG_DRY_RUN)
    options[:is_dry_run] = true
  end
end
puts "\n--- backup start! for #{Date.today}\n"
b = Backup.new(**options)
b.execute
puts "\n--- backup finish! for #{Date.today}\n"


# KNOWHOW

### rsync
# -a : アーカイブ。ディレクトリ再帰的、パーミッションなどの属性保持、シンボリックリンクはそのまま、など対象をそのままコピー
# -v : コピーしたファイル名やバイト数などの転送情報を出力
# -e : sshのオプション（ポートや秘密鍵）を指定する
# --delete : 転送元に存在しないファイルは削除

