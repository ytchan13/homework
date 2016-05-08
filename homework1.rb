# homework1
# 剪刀石頭布
# 先要使用者輸入剪刀石頭或布的其中一個選項
# 接下來讓電腦亂數選出一個選項
# 比較兩個選項，決定誰贏誰輸
# 輸出結果
# 問使用者是否再玩一次

def result(res,vans)
  if res == "W"
    puts "Congratulation!! You Won!! The computer answer is #{vans}"
  else
    puts "Sorry!! You Lost!! The computer answer is #{vans}"
  end
end

def judge(users,comps)
  if users == comps
    puts "平手唷！再來一次吧！！"
  else
    if comps == "R"
      case users
      when "P"
        result("W","#{comps}")
      else
        result("L","#{comps}")
      end
    elsif comps == "P"
      case users
      when "S"
        result("W","#{comps}")
      else
        result("L","#{comps}")
      end
    else
      case users
      when "R"
        result("W","#{comps}")
      else
        result("L","#{comps}")
      end 
    end
   end 
end

begin #可以美化輸出
  puts "|===============================================|" 
  puts "|Welcome to Rock Paper Scissors!!!              |"
  puts "|===============================================|"

  begin 
    puts "please choose one of the following: R / P / S"
    user_input = gets.chomp.upcase
  end while !["R", "P", "S"].include?(user_input) 

  #接下來請把剩下的部份寫出來...

  arr = ["R","P","S"]
  ans = arr.sample

  judge(user_input,ans)

  #問使用者是否還要再玩 
  begin
    puts "Play Again?: Y / N"
    continue = gets.chomp.upcase
  end while !["Y", "N"].include?(continue)

end while continue == "Y"
# 若使用者回答 "N"，印出離開的訊息，不是就回到迴圈的上層繼續玩
#puts "Good Bye! Thanks for playing!"