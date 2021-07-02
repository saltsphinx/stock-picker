def pick_stock array
    lowest_price_array, highest_pric_array = array.sort.weak_strong
    soonest_day_array, latest_day_array = array.weak_norm

    buy_price_index = get_buying_index(lowest_price_array, soonest_day_array, array)
    #I'm creating this^ variable with the belief that one of the items in lowest_price_array will always be included in soonest_day_array

    sell_price_index = get_selling_index(highest_pric_array, soonest_day_array, latest_day_array, buy_price_index, array)

    p lowest_price_array, highest_pric_array, soonest_day_array, latest_day_array
    [buy_price_index, sell_price_index]
end

def get_buying_index lowest_array, soonest_array, array
    lowest_array.each do |price|
        if soonest_array.include?(price)
            return array.index(price)
        end
    end
end

def get_selling_index highest_array, soonest_array, latest_array, buy_index, array
    highest_array.each do |price|
        if soonest_array.include?(price) && soonest_array.index(price) > buy_index
            return array.index(price)
        else
            highest_array.each do |price|
                if latest_array.include?(price)
                    return array.index(price)
                end
            end
        end
    end
end

class Array
    def weak_norm
        if self.even?
            weak_arr = self.first(self.length / 2)
            norm_arr = self.last(self.length / 2)
            p "even, array length = #{self.length}, weak = #{weak_arr.length}, normal = #{norm_arr.length}"
            return weak_arr, norm_arr
        else
            weak_arr = self.first(((self.length / 2.0) - 1).round)
            norm_arr = self.last((self.length / 2.0).round)
            p "odd, array length = #{self.length}, weak = #{weak_arr.length}, normal = #{norm_arr.length}"
            return weak_arr, norm_arr
        end
    end

    def weak_strong
        if self.length % 2 == 0
            weak_arr = self.first(self.length / 2)
            strong_arr = self.last(self.length / 2)
            p "even, array length = #{self.length}, weak = #{weak_arr.length}, strong = #{strong_arr.length}"
            return weak_arr, strong_arr.reverse
        else
            weak_arr = self.first(((self.length / 2.0) - 1).round)
            strong_arr = self.last((self.length / 2.0).round)
            p "odd, array length = #{self.length}, weak = #{weak_arr.length}, strong = #{strong_arr.length}"
            return weak_arr, strong_arr.reverse
        end
    end
end
pick_stock [17,3,6,9,15,8,6,1,10]