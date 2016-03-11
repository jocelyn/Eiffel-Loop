﻿note
	description: "Summary description for {RBOX_TEST_DATABASE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-12-15 13:05:41 GMT (Tuesday 15th December 2015)"
	revision: "8"

class
	RBOX_TEST_DATABASE

inherit
	RBOX_DATABASE
		redefine
			add_song_entry, make_from_file, new_song, extend_with_song, update_mp3_root_location
		end

create
	make

feature {NONE} -- Initialization

	make_from_file (a_xml_database_path: EL_FILE_PATH)
		do
			mp3_root_location := a_xml_database_path.parent.joined_dir_path ("Music")
			Precursor (a_xml_database_path)
		end

feature -- Element change

	extend_with_song (song: RBOX_SONG)
		do
			if song.duration > 10 then
				song.set_duration (song.duration // 10)
			end
			if not song.is_hidden and then not song.mp3_path.exists then
				File_system.make_directory (song.mp3_path.parent)
				File_system.copy (cached_song_file_path (song), song.mp3_path)
			end
			song.set_modification_time (Test_time)
			Precursor (song)
		end

feature -- Factory

	new_song: RBOX_TEST_SONG
		do
			create Result.make (Current)
		end

feature {NONE} -- Build from XML

	add_song_entry
			--
		do
			set_next_context (new_song)
		end

feature {NONE} -- Implementation

	cached_song_file_path (song: RBOX_SONG): EL_FILE_PATH
			-- Path to auto generated mp3 file under build directory
		require
			valid_duration: song.duration > 0
		local
			mp3_writer: EL_WAV_TO_MP3_COMMAND; relative_path, wav_path: EL_FILE_PATH; l_id3_info: EL_ID3_INFO
		do
			relative_path := song.mp3_path.relative_path (mp3_root_location)

			log.put_path_field ("Reading", relative_path)
			log.put_new_line

			Result := Directory.path ("build") + relative_path
			if not Result.exists then
				File_system.make_directory (Result.parent)
				wav_path := Result.with_new_extension ("wav")

				-- Create a unique Random wav file
				Test_wav_generator.set_output_file_path (wav_path)
				Test_wav_generator.set_frequency_lower (100 + (200 * Random.real_item).rounded)
				Random.forth
				Test_wav_generator.set_frequency_upper (600  + (600 * Random.real_item).rounded)
				Random.forth
				Test_wav_generator.set_cycles_per_sec ((1.0 + Random.real_item.to_double).truncated_to_real)
				Random.forth

				if song.duration > 0 then
					Test_wav_generator.set_duration (song.duration * 1000)
				end
				Test_wav_generator.execute

				create mp3_writer.make (wav_path, Result)
				mp3_writer.set_bit_rate_per_channel (48)
				mp3_writer.set_num_channels (1)
				mp3_writer.execute
				File_system.remove_file (wav_path)

				create l_id3_info.make (wav_path.with_new_extension ("mp3"))
				song.write_id3_info (l_id3_info)

			end
		ensure
			file_exists: Result.exists
		end

	update_mp3_root_location
		do
		end

feature {NONE} -- Constants

	Test_wav_generator: EL_WAV_GENERATION_COMMAND
		once
			create Result.make ("")
		end

	Random: RANDOM
		once
			create Result.make
		end

	Test_time: DATE_TIME
		once
			create Result.make (2011, 11, 11, 11, 11, 11)
		end

end