module ActiveRecord
  module Acts
    module Price
      
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        # Specify the column_name that needs to act as price
        # 
        # Valid options:
        # * :validates => true (performs validates_presence_of and validates_numericality_of)
        # * :comma_seperated => true (set and get the price as a comma-seperated value)
        def acts_as_price column_name, options = {}
          validates column_name, :presence => true, :numericality => {:greater_than => 0} if options[:validates] == true
          currency, comma = options[:currency], options[:comma_seperated]
          
          #setters
          define_method("#{column_name}=") do |val|
            begin
              super(((val.to_s.gsub(",", ".").to_f * 100) + 0.5).to_s)
            rescue
              raise "Pease add the column '#{column_name}'"
            end
          end
          alias_method("price=", "#{column_name}=")
          
          define_method("price_in_cents=") do |val|
            self.send("price=", val.to_f / 100)
          end
          alias_method "#{column_name}_in_cents=", "price_in_cents="
          
          #getters
          define_method(column_name) do
            if super().blank? or super() == 0.0
              ""
            else
              if comma
                return_val = sprintf("%.2f", super().to_f / 100).gsub(".", ",")
              else
                return_val = sprintf("%.2f", super().to_f / 100)
              end
              return_val = currency ? "#{currency}. #{return_val}" : return_val
              return_val
            end
          end
          alias_method "price", column_name
          
          define_method("price_in_cents") do
            if currency
              ((send column_name).gsub("#{currency}. ", "").gsub(",", ".").to_f * 100).round
            else
              ((send column_name).gsub(",", ".").to_f * 100).round
            end
          end
          alias_method "#{column_name}_in_cents", "price_in_cents"
          
          define_method("currency") do
            currency
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::Acts::Price)