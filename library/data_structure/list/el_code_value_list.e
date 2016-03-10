note
	description: "Summary description for {EL_CODE_VALUE_LIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EL_CODE_VALUE_LIST [G]

inherit
	FIXED_LIST [G]
		rename
			make as make_list
		end

create
	make

feature {NONE} -- Initialization

	make (a_default_item: like default_item; a: ARRAY [G])
		do
			default_item := a_default_item
			make_from_array (a)
			capacity := a.count
			compare_objects
		end

feature -- Access

	code_8 (value: like item): NATURAL_8
		require
			valid_size: count <= {NATURAL_8}.Max_value
		do
			start; search (value)
			if not exhausted then
				Result := index.to_natural_8
			end
		end

	code_8_item (code: NATURAL_8): like item
		require
			valid_size: code <= count
		do
			if valid_index (code) then
				Result := i_th (code)
			else
				Result := default_item
			end
		end

	default_item: like item
end