note
	description: "Summary description for {RBOX_PLAYLIST_IMPORT_APP}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-09-25 8:47:52 GMT (Sunday 25th September 2016)"
	revision: "2"

class RBOX_PLAYLIST_IMPORT_APP obsolete "Rewrite using music manager task"

inherit
	RBOX_APPLICATION
		redefine
			Option_name, normal_initialize
		end

create
	make

feature {NONE} -- Initialization

	normal_initialize
			--
		do
			Precursor
			m3u_dir := Directory.Working.joined_dir_path ("playlists")
			set_attribute_from_command_opt (m3u_dir, "m3u_dir", "Directory containing playlist to import")
		end

feature -- Basic operations

	normal_run
			--
		do
			create_database
			if database.is_initialized then
				OS.file_list (m3u_dir, "*.m3u").do_all (
					agent (m3u_path: EL_FILE_PATH)
						do
							database.import_m3u_playlist (create {M3U_PLAYLIST_READER}.make (m3u_path))
						end
				)
				if not config.is_dry_run then
					database.playlists.store
				end
			end
		end

feature -- Tests

	test_run
			--
		do
			Test.do_file_tree_test ("rhythmdb", agent test_import_playlist, 1716253197)
		end

	test_import_playlist (data_path: EL_DIR_PATH)
			--
		do
			log.enter ("test_export_playlist")
			normal_initialize
			test_database_dir := data_path
			m3u_dir := test_database_dir
			OS.copy_file (test_database_dir + "empty-playlists.xml", test_database_dir + "playlists.xml")
			normal_run
			log.exit
		end

feature {NONE} -- Implementation

	m3u_dir: EL_DIR_PATH

feature {NONE} -- Constants

	Option_name: STRING = "import_playlists"
			--
	Description: STRING = "Import playlists from directory"

	Log_filter: ARRAY [like Type_logging_filter]
			--
		do
			Result := <<
				[{RBOX_PLAYLIST_IMPORT_APP}, All_routines],
				[{RBOX_SONG}, All_routines]
			>>
		end

end
