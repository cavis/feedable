Feedable
========

Generate an activity feed from several ActiveRecord models, without the need for extra activity tables!

I always find myself creating "activity" tables to log recently created objects (from multiple tables), so I can display them in a feed somewhere.  This gem removes the need for the extra table/hooks, so you can build rails apps even faster!

Requirements
------------

### Ruby and ActiveRecord

Requires Ruby version **>= 1.9.2** and ActiveRecord version **>= 3.0**


Installation
------------

Feedable should be installed as a gem in your app.

Include the gem in your Gemfile:

    gem "feedable"

Or, if you like to live on the bleeding-edge:

    gem "feedable", :git => "https://github.com/cavis/feedable"


Getting Started
---------------

### In your models, indicate a datetime column to sort by:

    class Alligator < ActiveRecord::Base
      feedable :created_at
    end

    class Grizzly < ActiveRecord::Base
      feedable :last_fed_at
    end


Usage
-----

### In your controller, or wherever you want to sort these records:

    def activity
      @recent_activity = feedable Alligator, Grizzly, :limit => 10
    end

This will return an array of `ActiveRecords`, ordered by the specified datetime columns.  The most recent activity will
be first, with a limit of 10.  Keep reading... the advanced options will explain more about this.


Advanced Options
----------------

Ah, you made it.  Welcome!

When calling `feedable`, the first thing to pass is 1-or-more `ActiveRecord` queries.  *Just make sure* you don't pass in something like `Alligator.all`, as this executes sql right away, and doesn't give `feedable` a chance to interject ordering.

However, you can pass in some fancy shmancy `ActiveRecord` conditions, includes, selects, and joins.

    @recent = feedable Alligator.where('name = ?', 'charles').includes(:garden),
      Grizzly.select('name', 'height'),
      Walleye.joins(:guns).where('guns.type = "smart"'),
      :limit => 10

Note that if you don't pass a limit, you get the default limit of 100 things returned.  Additionally, you can specify an offset to `feedable`:

    @recent = feedable Alligator, Grizzly, :limit => 10, :offset => 20

Finally, even though you usually want activity in a descending datetime order, you can also flip that around:

    @recent = feedable Alligator, Grizzly, :limit => 10, :order => 'desc'
    @oldest = feedable Alligator, Grizzly, :limit => 10, :order => 'asc'


Issues and Contributing
-----------------------

Please, let me know about any bugs/feature-requests via the issues tracker.  And if you'd like to contribute, send me a note!  Thanks.


License
-------

Feedable is free software, and may be redistributed under the MIT-LICENSE.

Thanks for listening!
