note
	description: "Summary description for {EL_STATE_MACHINE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-20 5:56:55 GMT (Wednesday 20th July 2016)"
	revision: "1"

class
	EL_STATE_MACHINE [G]

feature {NONE} -- Initialization

	make
		do
			state := agent final
			create tuple
		end

feature -- Basic operations

	traverse (initial: like state; sequence: LINEAR [G])
			--
		local
			final_state: EL_PROCEDURE
		do
			create final_state.make (agent final)

			from
				item_number := 0; sequence.start; state := initial
			until
				sequence.after or final_state.same_procedure (state)
			loop
				item_number := item_number + 1
				call (sequence.item)
				sequence.forth
			end
		end

feature {NONE} -- Implementation

	item_number: INTEGER

	call (item: G)
		-- call state procedure with item
		do
			tuple.put_reference (item, 1)
			state.set_operands (tuple)
			state.apply
		end

	frozen final (item: G)
			--
		do
		end

	state: PROCEDURE [like Current, TUPLE [G]]

	tuple: TUPLE [G]

end
