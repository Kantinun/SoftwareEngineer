# Project 3.15
require 'time'
class Time
    def humanize
        in_words = {12=>"twelve", 11 => "eleven", 10 => "ten", 9 => "nine",
        8 => "eight", 7 => "seven", 6 => "six", 5 => "five", 4 => "four",
        3 => "three", 2 => "two", 1 => "one", 0 => 12}
        hour = self.hour > 12 ? self.hour-12 : self.hour 
       

        if self.min < 15  # 0-14 min.
            puts "About #{in_words[hour]}"
        elsif self.min < 30 # 15-29 min.
            puts "About #{in_words[hour]}:30"
        elsif self.min < 45 # 30-44 min.
            puts "About half past #{in_words[hour]}"
        elsif self.hour == 23 # 11:45-59 pm.
            puts "About midnight"
        else # 45-59 min.
            puts "About a quarter til #{in_words[hour+1]}"
        end

    end
end

sample = ["10:47 pm", "10:31 pm", "10:07 pm", "23:58", "00:29"]
sample.each {|t| 
    puts t
    puts Time.parse(t).humanize
}
# OUTPUT
# 10:47 pm
# About a quarter til eleven

# 10:31 pm
# About half past ten

# 10:07 pm
# About ten

# 23:58
# About midnight

# 00:29
# About 12:30
