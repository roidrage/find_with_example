module ActiveRecord
  class Base
    def self.find_with_example(example)
      if example.is_a?(Hash)
        attributes = example
      else
        attributes = example.attributes
      end
      
      attributes.reject! {|key, attr| !column_names.include?(key.to_s)}
      non_nil_attributes = attributes.select {|key, attr| !attr.nil?}
      conditions_sql = non_nil_attributes.map {|key, attr| "#{key.to_s} = ?"}.join(" AND ")
      conditions_attrs = non_nil_attributes.map {|key, attr| attr}
      find(:all, :conditions => [conditions_sql, *conditions_attrs])
    end
  end
end
  