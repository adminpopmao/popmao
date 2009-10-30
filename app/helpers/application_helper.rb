# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # 判断字符串长度，包括中文
  def getlen(str)
    str.split(//e).length
  end

  # 显示时间
  def show_time(from_time, format_time="%Y-%m-%d %H:%M:%S", to_time=Time.now)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_minutes = (((to_time - from_time).abs)/60).round

    case distance_in_minutes
      when 0..1           then (distance_in_minutes==0) ?  "几秒钟前" :  "一分钟前"
      when 2..59          then "#{distance_in_minutes} "+ "分钟前"
      when 60..90         then  "一小时前"
      when 90..1440       then "#{(distance_in_minutes.to_f / 60.0).round} "+ "小时前"
      when 1440..2160     then  "一天前"
      when 2160..2880     then "#{(distance_in_minutes.to_f / 1440.0).round} "+ "天前"
      else from_time.strftime(format_time)
    end
  end

  # 取得所有的论坛
  def get_all_forum
    Forum.find(:all, :conditions=>'parent_id > 0')
  end

  # 
  def say_hello
    case Time.now.hour
      when 0..4  then '深夜好!'
      when 4..8  then '早上好!'
      when 8..11 then '上午好!'
      when 11..13 then '中午好!'
      when 13..17 then '下午好!'
      when 17..19 then '傍晚好!'
      when 19..24 then '晚上好!'
    end
  end

  def set_title
    page_title = '江海社区'
    if @controller.controller_name.downcase == 'forums' and @controller.action_name.downcase == 'index' or @controller.action_name.downcase == 'show'
      page_title = @topic.subject + "_" + @forum.name + '_江海社区'
    end
    if @controller.controller_name.downcase == 'topics' and @controller.action_name.downcase == 'new'
      page_title = "新建帖子_#{@forum.name}_江海社区"
    end
    page_title
  end

  def show_house(user)
    case user.prestige
      when -9999999..0 then "无房户"
      when 0..51 then '单身公寓'
      when 51..101 then '舒适小套'
      when 101..401 then '舒适中套'
      when 401..801 then '舒适大套'
      when 801..1201 then '宽敞大套房'
      when 1201..2501 then '个性排屋'
      when 2501..5001 then '温情小院别墅'
      when 5001..8001 then '惬意花园别墅'
      when 8001..10001 then '怡人山地别墅'
      when 10001..13001 then '十里庄园'
      when 13001..17001 then '百里大庄园'
      when 17001..50001 then '威加一方之城堡'
      when 50001..1000001 then '威加四海之宫殿'
      when 1000001..2147483647 then '天下之大莫非王土'
    end
  end

end
