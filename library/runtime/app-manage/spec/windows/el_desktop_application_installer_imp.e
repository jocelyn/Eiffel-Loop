note
	description: "Windows implementation of `EL_DESKTOP_APPLICATION_INSTALLER_I' interface"

	notes: "[
		In Windows 2000, Windows XP, and Windows Server 2003, the folder is located in %userprofile%\Start Menu for individual users, 
		or %allusersprofile%\Start Menu for all users collectively.
		
		In Windows Vista and Windows 7, the folder is located in %appdata%\Microsoft\Windows\Start Menu for individual users, 
		or %programdata%\Microsoft\Windows\Start Menu for all users collectively.
		
		The folder name Start Menu has a different name on non-English versions of Windows. 
		Thus for example on German versions of Windows XP it is %userprofile%\Startmen�.
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-06-24 10:59:57 GMT (Friday 24th June 2016)"
	revision: "1"

class
	EL_DESKTOP_APPLICATION_INSTALLER_IMP

inherit
	EL_DESKTOP_APPLICATION_INSTALLER_I
		redefine
			make
		end

	EL_APPLICATION_INSTALLER_IMP
		undefine
			application_command
		end

	EL_MS_WINDOWS_DIRECTORIES

create
	make

feature {NONE} -- Initialization

	make (a_application: EL_SUB_APPLICATION; a_submenu_path: like submenu_path; a_launcher: EL_DESKTOP_LAUNCHER)
			--

		do
			Precursor (a_application, a_submenu_path, a_launcher)
			application_menu_dir := Start_menu_programs_dir.joined_dir_steps (submenu_path_steps)
			shortcut_path := application_menu_dir + shortcut_name
		end

feature -- Status query

	launcher_exists: BOOLEAN
			--
		do
			Result := shortcut_path.exists
		end

feature -- Basic operations

	add_menu_entry
			--
		local
			shortcut: EL_SHELL_LINK
			ico_icon_path, command_path: EL_FILE_PATH
		do
			command_path := Directory.Application_bin + launcher.command
			ico_icon_path := launcher.icon_path.with_new_extension ("ico")

			if not application_menu_dir.exists then
				File_system.make_directory (application_menu_dir)
			end
			create shortcut.make
			shortcut.set_command_arguments (launcher.command_args)
			shortcut.set_target_path (command_path)
			shortcut.set_icon_location (ico_icon_path, 1)
			shortcut.set_description (launcher.comment)
			across << shortcut_path, desktop_shortcut_path >> as l_path loop
				if not l_path.item.is_empty then
					shortcut.save (l_path.item)
				end
			end
		end

	remove_menu_entry
			--
		do
			across << shortcut_path, desktop_shortcut_path >> as l_path loop
				if l_path.item.exists then
					File_system.remove_file (l_path.item)
				end
			end
			File_system.delete_empty_branch (application_menu_dir)
		end

feature {NONE} -- Implementation

	desktop_shortcut_path: EL_FILE_PATH
		do
			if has_desktop_launcher then
				Result := Desktop_common + shortcut_name
			else
				create Result
			end
		end

	shortcut_name: ZSTRING
		do
			Result := launcher.name + ".lnk"
		end

	submenu_path_steps: EL_PATH_STEPS
		do
			create Result.make_with_count (submenu_path.count)
			across submenu_path as submenu loop
				Result.extend (submenu.item.name)
			end
		end

feature {NONE} -- Internal attributes

	shortcut_path: EL_FILE_PATH

	application_menu_dir: EL_DIR_PATH

end