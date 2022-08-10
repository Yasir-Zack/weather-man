require 'csv'
filenames_Dubai = Dir.chdir("/home/yasir/weatherman/Dubai_weather") { Dir.entries(".") }
filenames_Murree = Dir.chdir("/home/yasir/weatherman/Murree_weather") { Dir.entries(".") }
filenames_lahore = Dir.chdir("/home/yasir/weatherman/lahore_weather") { Dir.entries(".") }


filenames_Dubai.sort!
# puts filenames_Dubai
# puts "enter  year name"
# year = gets.chomp
year =2011
cities = ["lahore","Dubai","Murree"]
month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]



max_temp=-1000
max_temp_date=""


# For One File
# file_path = "/home/abdullah126/Desktop/project2/Weather man-20220810T060630Z-001/Weather man/Dubai_weather/" 
# file_name = "#{cities[0]}weather#{year}_#{month[0]}.txt"
#             if filenames_Dubai.include?(file_name) 
#                 file_path = file_path << file_name
#                 # puts file_path
#                 file = File.open(file_path,"r+")
#                 puts file.inspect
#                 puts file.read


                
#                 csv = CSV.read(file_path, :headers=>true)
#                 size = csv['Max TemperatureC'].size
#                 max_temp= csv['Max TemperatureC'][0]

#                 for i in 1...size
#                     puts "in loop"                              # ... tells ruby to exclude the last number (here 10 if we .. only then it includes the last num)
#                     if max_temp.to_i < csv['Max TemperatureC'][i].to_i
#                         max_temp = csv['Max TemperatureC'][i]
#                         max_temp_date= csv['GST'][i]
#                         puts "max"
#                     end
#                 end
#                 puts max_temp 
#                 puts max_temp_date


#             elsif
#                 puts "no file exist"  
#             end



file_path = "" 
file_name=""

countLahore=0
countDubai=0
countMurree=0
cities.each do |city|
    month.each do |mon|
        
        file_path =  "/home/yasir/weatherman/Dubai_weather/"
        if city == "Dubai"
            puts "Dubai"
            countDubai+=1
            file_name = "#{city}_weather_#{year}_#{mon}.txt"
            if filenames_Dubai.include?(file_name)
                file_path = file_path << file_name
                puts file_path
                file = File.open(file_path,"r+")
                puts file.inspect
                puts file.read


                csv = CSV.read(file_path, :headers=>true)
                size = csv['Max TemperatureC'].size
                
                for i in 0...size
                    # puts "in loop"    # ... tells ruby to exclude the last number (here 10 if we .. only then it includes the last num)
                    if max_temp.to_i < csv['Max TemperatureC'][i].to_i
                        max_temp = csv['Max TemperatureC'][i]
                        max_temp_date= csv['GST'][i]
                        # puts "max"
                    end
                end
            elsif
                puts "no file exist"  
            end

        elsif city == "lahore"
            #  puts "Lahore"
            #  countLahore+=1
            #  file_name = "#{city}weather#{year}_#{mon}.txt"
            #  if filenames_lahore.include?(file_name) 
            #      file_path = file_path << file_name
            #      puts file_path
            #      file = File.open(file_path,"r+")
            #      puts file.inspect
            #      puts file.read

            #      csv = CSV.read(file_path, :headers=>true)
            #      size = csv['Max TemperatureC'].size
                 
            #      for i in 0...size
            #          # puts "in loop"    # ... tells ruby to exclude the last number (here 10 if we .. only then it includes the last num)
            #          if max_temp.to_i < csv['Max TemperatureC'][i].to_i
            #              max_temp = csv['Max TemperatureC'][i]
            #              max_temp_date= csv['PKT'][i]
            #              # puts "max"
            #          end
            #      end
            #  elsif
            #      puts "no file exist"  
            #  end
        elsif city == "Murree"
         puts "Murree"
        # countMurree+=1
        # file_open = "#{filenames_Murree}#{city}weather#{year}_#{mon}.txt"
        # if filenames_Murree.include?(file_open) 
        #     puts "sdfdsfs"
        #     file = File.open(file_open,"r+")
        #     puts file.inspect
        #     puts file.read
        # elsif
        #     puts "no file exist"  
        end
    end
            # count+=1
        
    # file = File.open(file_open,"r+")
    # puts file.inspect
    # puts file.read
end

puts max_temp 
puts max_temp_date