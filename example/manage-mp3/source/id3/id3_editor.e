note
	description: "Summary description for {ID3_READER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-08 10:34:12 GMT (Friday 8th July 2016)"
	revision: "1"

class
	ID3_EDITOR

inherit
	EL_COMMAND

	EL_MODULE_LOG

	EL_MODULE_USER_INPUT

create
	make, default_create

feature {EL_COMMAND_LINE_SUB_APPLICATION} -- Initialization

	make (a_media_dir: EL_DIR_PATH; a_edition_name: like edition_name)
		do
			edition_name := a_edition_name
			create file_paths.make (a_media_dir, "*.mp3")
			create id3_edits
			editions_table := new_editions_table
		end

feature -- Basic operations

	execute
		do
			log.enter ("execute")
			editions_table.search (edition_name)
			if editions_table.found then
				across file_paths as mp3_path loop
					editions_table.found_item.call ([create {EL_ID3_INFO}.make_version (mp3_path.item, 2.4), mp3_path.item])
--					if mp3_path.cursor_index \\ 40 = 0 then
--						from until User_input.line ("Press return to continue").is_empty loop
--							lio.put_new_line
--						end
--						lio.put_new_line
--					end
				end
			else
				lio.put_string_field ("Invalid edition name", edition_name)
				lio.put_new_line
			end
			log.exit
		end

feature {NONE} -- Implementation

	new_editions_table: like editions_table
		do
			create Result.make (<<
				["delete_id3_comments", agent id3_edits.delete_id3_comments],
				["set_fields_from_path", agent id3_edits.set_fields_from_path],
				["remove_rbox_id", agent id3_edits.remove_rbox_id]
			>>)
		end

feature {NONE} -- Internal attributes

	editions_table: EL_ZSTRING_HASH_TABLE [PROCEDURE [ID3_EDITS, TUPLE [EL_ID3_INFO, EL_FILE_PATH]]]

	edition_name: ZSTRING

	file_paths: EL_FILE_PATH_LIST

	id3_edits: ID3_EDITS

end