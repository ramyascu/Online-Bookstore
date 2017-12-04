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
        # values will be set to 0.
        @min_price = parsed_price(params[:min_price], 0)
        @max_price = parsed_price(params[:max_price], 0)
    end


    def scope
        current_list = Product.order(:name)

        # Filter based on max price, if it is specified
        if @max_price > 0
            current_list = current_list.where('price <= ?', @max_price)
        end

        # Filter based on min price, if it is specified
        if @min_price > 0
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
        price_string.to_i
    rescue 
        default
    end

end
