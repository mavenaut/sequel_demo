Object Relational Models in in Ruby with `sequel`
=================================================

ORM Libraries in Ruby
---------------------

`ActiveRecord` is the most well-known library and a competent data modeler
will **hate** it.  It is 'opinionated' software, which is fine in and of it
self, but its opinions are those of one who wouldn't know a decent data model
if it bit them on the nose.  Unfortunately, those opinions have massively
influenced all ORM libraries in the Ruby space and many others as well.  This
is primarily due to the popularity of Ruby on Rails.

The good news is that there is hope.

`Sequel` is a much more flexible and customizable ORM package for Ruby which
allows for complete and easy customization of the opinions inherited from
`ActiveRecord`.

Data Model
----------

![](ruby_orm.png "Data Model")

`Sequel` Concepts
=================

The whole business of table creation and migration is not covered in this
tutorial since the author thinks that is not in scope for an ORM library.

Distinctions
------------

### Datasets

Datasets are the key concept in `sequel`. They are the tool for all CRUD
access to the database and also the underpinnings of the `SQL::Model` class.

### Models

A model is a representation of the tables, keys and relationships in the
target database.

Why do we have the ugly leading here.

The Basics of `Sequel`
======================

Diagnostic Methods
------------------

`puts` *`dataset`*`.sql`  -- print the SQL query associated with the *dataset*  
`puts` *`party`*`.columns` -- print the column names of the dataset

Tutorial 1
----------

### Setup 

1. As in all things Ruby, you need to `require` the library.

    ~~~ {.ruby .literate}
    require 'sequel'
    ~~~

1.  You need a database connection. **Note:** The database connection variable
must be named **`DB`** for the `SQL::Model` classes to work.

    ~~~ {.ruby .literate}
    DB = Sequel.postgres(
      :adapter=>'postgres',
      :host=>'localhost',
      :user=>'sequel_demo',
      :password=>'sequel_demo',
      :database=>'sequel_demo'
    )
    ~~~

1. A simple pretty printer for the data

    ~~~ {.ruby .literate}
    def row_print(row, type="compact")
      if type == 'compact' then
        row.each { |name, value| printf("%-10.10s %-10.10s  ", name, value) }
        puts
      else
        row.each { |name, value| printf("%-15.15s %s\n", name, value) }
        puts
      end
    end
    ~~~

### Datasets


1. Simple select of all rows in party

    ~~~ {.ruby .literate}
    party = DB[:party]
    puts party.sql
    puts party.columns
    party.each { |row| row_print(row, 'compact') }
    ~~~

    output

	~~~
	SELECT * FROM party;
	~~~
