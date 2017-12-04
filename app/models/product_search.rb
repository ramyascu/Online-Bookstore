# model for search funtionality

class ProductSearch
    attr_reader :name, :description, :min_price, :max_price

    def initialize(params)

        # Initialize parameters for search query
        params ||= {}

        # Convert name and description to strings
        @name = params[:name].to_s
        @description = params[:description].to_s

        # Parse min_price and max_price to integers. If empty or error, the default
        # values will be set to nil.
        @min_price = parsed_price(params[:min_price], nil)
        @max_price = parsed_price(params[:max_price], nil)
    end


    def scope
        current_list = Product.order(:name)

        # Filter based on max price, if it is specified
        if !@max_price.nil? and @max_price > 0
            current_list = current_list.where('price <= ?', @max_price)
        end

        # Filter based on min price, if it is specified
        if !@min_price.nil? and @min_price > 0
            current_list = current_list.where('price >= ?', @min_price)
        end

        # Filter based on name (search for string occurrane anywhere in name)
        if @name.length > 0
            current_list = current_list.where('name LIKE ?', '%'+@name+'%')
        end

        # Filter based on description (search for string occurrane anywhere in description)
        if @description.length > 0
            current_list = current_list.where('description LIKE ?', '%'+@description+'%')
        end

        return current_list.order(:name)
    end

    private

    # Private method to parse a given string to an integer. If there is error in parsing
    # or if the string is empty, then return the default value
    def parsed_price(price_string, default)
        if price_string.nil?
            return nil
        else
            return price_string.to_i
        end
    rescue 
        default
    end

end
