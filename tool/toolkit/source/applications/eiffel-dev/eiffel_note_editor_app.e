note
	description: "[
		Fills in default values for note fields for source trees listed in a manifest
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-08-06 15:22:28 GMT (Saturday 6th August 2016)"
	revision: "2"

class
	EIFFEL_NOTE_EDITOR_APP

inherit
	EL_COMMAND_LINE_SUB_APPLICATION [EIFFEL_NOTE_EDITOR_COMMAND]
		redefine
			Option_name, Installer
		end

feature {NONE} -- Implementation

	make_action: PROCEDURE [like command, like default_operands]
		do
			Result := agent command.make
		end

	default_operands: TUPLE [source_manifest_path, license_notes_path: EL_FILE_PATH]
		do
			create Result
			Result.source_manifest_path := ""
			Result.license_notes_path := ""
		end

	argument_specs: ARRAY [like Type_argument_specification]
		do
			Result := <<
				required_existing_path_argument ("sources", "Path to sources manifest file"),
				required_existing_path_argument ("license", "Path to license notes file")
			>>
		end

feature {NONE} -- Constants

	Option_name: STRING = "edit_notes"

	Description: STRING = "[
		Edit the note fields of all classes defined by the source tree manifest argument.
		If the modification date/time has changed, fill in the note fields.
		If changed, sets the date field to be same as time stamp and increments
		revision number.
	]"

	Installer: EL_APPLICATION_INSTALLER_I
		once
			Result := new_context_menu_installer ("Eiffel Loop/Development/Set note field defaults")
		end

	Log_filter: ARRAY [like Type_logging_filter]
			--
		do
			Result := <<
				[{EIFFEL_NOTE_EDITOR_APP}, All_routines],
				[{EIFFEL_NOTE_EDITOR_COMMAND}, All_routines]
			>>
		end

end
