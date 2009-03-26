Find with Example
=================

Find records using an example object. Can either be a Hash or an ActiveRecord
model object:

    User.find_with_example(User.new(:status => "registered"))
    User.find_with_example(:status => "registered")

Will find all records matching the data.

Just for fun.

License
=======

MIT, (c) 2009 Mathias Meyer