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
          comma = options[:comma_seperated]
          
          #setters
          define_method("#{column_name}=") do |val|
            super((val.to_s.gsub(",", ".").to_f * 100).to_s)
          end
          alias_method("price=", "#{column_name}=")
          
          define_method("price_in_cents=") do |val|
            self.send("price=", val.to_f / 100)
          end
          alias_method "#{column_name}_in_cents=", "price_in_cents="
          
          #getters
          define_method(column_name) do
            if super == 0.0
              ""
            else
              if comma
                sprintf("%.2f", super.to_f / 100).gsub(".", ",")
              else
                sprintf("%.2f", super.to_f / 100)
              end
            end
          end
          alias_method "price", column_name
          
          define_method("price_in_cents") do
            ((send column_name).gsub(",", ".").to_f * 100).to_s.to_i
          end
          alias_method "#{column_name}_in_cents", "price_in_cents"
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::Acts::Price)