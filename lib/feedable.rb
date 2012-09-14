module Feedable
end

# main function
def feedable(*args)
  opts = { :limit => 100, :offset => 0, :order => :desc }

  # look for options hash (and remove)
  args.delete_if do |x|
    if x.class == Hash
      opts.merge!(x)
    end
  end

  # abort if empty
  clauses = []
  return clauses unless args.length > 0

  # generate clauses from args
  args.each do |q|
    tmp = (q.class == Class) ? q.select('*') : q.clone

    unless tmp.class == ActiveRecord::Relation
      raise "Invalid class #{tmp.klass} - should be an ActiveRecord::Relation"
    end
    unless tmp.attribute_method?(:feedable_col)
      raise "Class #{tmp.klass} isn't feedable!"
    end

    # unset any order, limit and offset
    tmp.order_values = []
    tmp.limit_value = nil
    tmp.offset_value = nil

    # add to unions
    tmp.select_values = ["#{tmp.primary_key} as keyfld", "#{tmp.feedable_col} as dtim", "'#{tmp.klass}' as type"]
    clauses.push tmp.to_sql
  end

  # join together and execute
  unions = clauses.join(' UNION ')
  paging = "order by dtim #{opts[:order]} limit #{opts[:limit]} offset #{opts[:offset]}"
  query = "select * from (#{unions}) " + paging
  all_ids = ActiveRecord::Base.connection.select_all(query)
  all_recs = []

  # fetch the database objects
  args.each do |q|
    q = q.select('*') if (q.class == Class)

    # remove unnecessary clauses
    q.where_values = []
    q.order_values = []
    q.limit_value = nil
    q.offset_value = nil

    # collect ids
    ids = all_ids.select{|x| x['type'] == q.klass.name}.collect{|x| x['keyfld']}
    recs = q.find(ids)

    # attach to the output
    recs.each do |r|
      idx = all_ids.index {|x| x['keyfld'] == r.id && x['type'] == q.klass.name}
      all_recs[idx] = r
    end
  end

  # return just the records, in order
  return all_recs
end

# activerecord "blameable"
if defined?(ActiveRecord)
  require 'feedable/active_record'
else
  raise "feedable only works with active_record"
end
