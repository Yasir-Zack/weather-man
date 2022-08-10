require 'csv'
filenames_Dubai = Dir.chdir("/home/yasir/weatherman/Dubai_weather") { Dir.entries(".") }
filenames_Murree = Dir.chdir("/home/yasir/weatherman/Murree_weather") { Dir.entries(".") }
filenames_lahore = Dir.chdir("/home/yasir/weatherman/lahore_weather") { Dir.entries(".") }


filenames_Dubai.sort!
filenames_Murree.sort!
filenames_lahore.sort!
# puts filenames_Dubai
# puts "enter  year name"
# year = gets.chomp
year =2011
cities = ["lahore","Dubai","Murree"]
month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

max_temp=-1000 
max_temp_date=""
max_temp_city = ""
min_temp = 1000
min_temp_date = ""
max_humidity = 100
max_humidity_date = ""

file_path = "" 
file_name=""

# countLahore=0
countDubai=0
# countMurree=0
cities.each do |city|
    month.each do |mon|
        
        file_path =  "/home/yasir/weatherman/#{city}_weather/"
        if city == "Dubai"
            # puts "Dubai"
            file_name = "#{city}_weather_#{year}_#{mon}.txt"
            if filenames_Dubai.include?(file_name)
                file_path = file_path << file_name
                # puts file_path
                file = File.open(file_path,"r+")
                file.inspect
                file.read

                #Counting maximum Temperature
                csv = CSV.read(file_path, :headers=>true, :skip_blanks=>true)
                size = csv['Max TemperatureC'].size
                for i in 0...size
                    if max_temp.to_i < csv['Max TemperatureC'][i].to_i
                        max_temp = csv['Max TemperatureC'][i]
                        max_temp_date= csv['GST'][i]
                        puts max_temp_date
                        # puts "max"
                    end
                end

                #counting Minium TemperatureC
                size = csv['Min TemperatureC'].size
                # puts csv['Min TemperatureC']
                for i in 0...size
                    if min_temp.to_i > csv['Min TemperatureC'][i].to_i && csv['Min TemperatureC'][i] != nil
                        min_temp = csv['Min TemperatureC'][i]
                        min_temp_date= csv['GST'][i]
                    end
                end
                 
                #Count Max Humidity FOR Dubai
                size = csv['Max Humidity'].size
                for i in 0...size
                    if max_humidity.to_i < csv['Max Humidity'][i].to_i
                        max_humidity = csv['Max Humidity'][i]
                        max_humidity_date= csv['GST'][i]
                    end
                end
            elsif
                puts "no file exist"  
            end

        elsif city == "lahore"
            #  puts "Lahore"
             file_name = "#{city}_weather_#{year}_#{mon}.txt"
             if filenames_lahore.include?(file_name)
                 file_path = file_path << file_name
                #  file_path
                 file = File.open(file_path,"r+")
                 file.inspect
                 file.read
 
 
                 csv = CSV.read(file_path, :headers=>true, :skip_blanks=>true)
                 size = csv['Max TemperatureC'].size
                 
                 for i in 0...size
                     # puts "in loop"    # ... tells ruby to exclude the last number (here 10 if we .. only then it includes the last num)
                     if max_temp.to_i < csv['Max TemperatureC'][i].to_i
                         max_temp = csv['Max TemperatureC'][i]
                         max_temp_date= csv['PKT'][i]
                         # puts "max"
                     end
                 end

                 size = csv['Min TemperatureC'].size
                # puts csv['Min TemperatureC']
                
                for i in 0...size
                   
                    if min_temp.to_i > csv['Min TemperatureC'][i].to_i && csv['Min TemperatureC'][i] != nil
                        min_temp = csv['Min TemperatureC'][i]
                        min_temp_date= csv['PKT'][i]
                        
                    end
                end
             elsif
                 puts "no file exist"  
             end
        elsif city == "Murree"
            # puts "Murree"
            file_name = "#{city}_weather_#{year}_#{mon}.txt"
            if filenames_Murree.include?(file_name)
                file_path = file_path << file_name
               #  file_path
                file = File.open(file_path,"r+")
                file.inspect
                file.read


                csv = CSV.read(file_path, :headers=>true, :skip_blanks=>true)
                size = csv['Max TemperatureC'].size
                
                for i in 0...size
                    # puts "in loop"    # ... tells ruby to exclude the last number (here 10 if we .. only then it includes the last num)
                    if max_temp.to_i < csv['Max TemperatureC'][i].to_i
                        max_temp = csv['Max TemperatureC'][i]
                        max_temp_date= csv['PKT'][i]
                        # puts "max"
                    end
                end

                size = csv['Min TemperatureC'].size
                # puts csv['Min TemperatureC']
                
                for i in 0...size
                   
                    if min_temp.to_i > csv['Min TemperatureC'][i].to_i && csv['Min TemperatureC'][i] != nil
                        min_temp = csv['Min TemperatureC'][i]
                        min_temp_date= csv['PKT'][i]
                        
                    end
                end
            elsif
                puts "no file exist"  
            end
        end
    end
            # count+=1
        
    # file = File.open(file_open,"r+")
    # puts file.inspect
    # puts file.read
end

puts "The Max_ temperature is : #{max_temp}" 
puts "The Date At that Temp : #{max_temp_date}"
puts "The minium temperature  :: #{min_temp}"
puts "The Maximum Humity is :: #{max_humidity}"
puts "The Max Humidity Date is : #{max_humidity_date}"
