note
	description: "Summary description for {EL_TEXT_IMP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EL_TEXT_IMP

inherit
	EL_TEXT_I
		undefine
			text_length, selected_text
		redefine
			make, interface, on_change_actions
		end

	EV_TEXT_IMP
		redefine
			make, interface, on_change_actions
		end

create
	make

feature {NONE} -- Initialization

	make
		do
			Precursor {EV_TEXT_IMP}
			Precursor {EL_TEXT_I}
		end

feature {NONE} -- Event handling

	on_change_actions
		do
			Precursor {EV_TEXT_IMP}
			Precursor {EL_TEXT_I}
		end

feature {EV_ANY, EV_ANY_I} -- Implementation

	interface: detachable EL_TEXT note option: stable attribute end;

end