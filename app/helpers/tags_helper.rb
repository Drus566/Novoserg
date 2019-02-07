module TagsHelper
    def elimination_exist_elems(own, all)
        @result = Array.new
        all.each do |e|
            unless own.include?(e)
                @result<<(e)   
            end
        end
        @result 
    end
end