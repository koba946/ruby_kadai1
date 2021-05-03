require "csv"

puts "実行する内容を選んでください"
puts "[1]メモ内容の確認　[2]メモ内容の追記　[0]メモの新規作成"

inputs = gets.to_i
#puts "#{inputs}が指定されました"

if inputs === 1 
  puts "メモの内容を確認します"
  puts "----------------------"
  begin
    #csvファイルを読み込んでコンソールに出力するコード
    CSV.foreach("memo.csv") do |memo|
      #行に対する処理
      puts memo
    end
  rescue
    puts "参照するメモがありません。先にメモを作成してください"
  end
elsif inputs == 2
  puts "メモの内容を追記します"
  puts "追記したい内容を入力してください"
  puts "----------------------"
  memo_add = gets
  CSV.open("memo.csv","a") do |test|
    test << [memo_add.chomp]
  end
  puts "追記が完了しました"
elsif inputs == 0
  puts "メモを新しく作成します"
  puts "内容を入力してください" 
  puts "----------------------"
  memo_new = gets
  CSV.open("memo.csv","w") do |test|
    test << [memo_new.chomp]
  end
  puts "新規メモを作成しました"
elsif
  puts "数字の入力が正しくありません"
end
