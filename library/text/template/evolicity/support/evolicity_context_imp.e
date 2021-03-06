note
	description: "[
		A createable Evolicity context where you add variables in the following ways:
		
		* from a table of strings using `make_from_string_table'
		* from a table of referenceable objects using `make_from_object_table'
		* Calling `put_variable' or `put_integer'
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-25 8:39:32 GMT (Monday 25th July 2016)"
	revision: "1"

class
	EVOLICITY_CONTEXT_IMP

inherit
	EVOLICITY_CONTEXT

create
	make, make_from_string_table, make_from_object_table

feature {NONE} -- Initialization

	make
			--
		do
			create objects
			objects.compare_objects
		end

	make_from_string_table (table: HASH_TABLE [READABLE_STRING_GENERAL, STRING])

		do
			create objects.make_equal (table.capacity)
			from table.start until table.after loop
				put_variable (table.item_for_iteration, table.key_for_iteration)
				table.forth
			end
		end

	make_from_object_table (object_table: like objects)
			--
		do
			create objects.make_equal (object_table.capacity)
			objects.merge (object_table)
		end

feature -- Access

	objects: EVOLICITY_OBJECT_TABLE [ANY]

end
