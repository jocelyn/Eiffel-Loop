note
	description: "Summary description for {EL_DESKTOP_UNINSTALL_APP_INSTALLER_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-24 12:14:32 GMT (Friday 24th January 2014)"
	revision: "3"

class
	EL_DESKTOP_UNINSTALL_APP_INSTALLER_IMPL

inherit
	EL_DESKTOP_APPLICATION_INSTALLER_I
		redefine
			make
		end

	EL_MODULE_BUILD_INFO

	EL_MODULE_STRING

	EL_MS_WINDOWS_DIRECTORIES

	EL_MODULE_WIN_REGISTRY

create
	make, default_create

feature {NONE} -- Initialization

	make (a_interface: like interface)
			--
		do
			Precursor (a_interface)
			uninstall_reg_path := HKLM_uninstall_path.joined_dir_path (display_name)
		end

feature -- Status query

	launcher_exists: BOOLEAN
			-- Program listed in Control Panel/Programs and features
		do
			Result := Win_registry.has_key (uninstall_reg_path)
		end

feature -- Basic operations

	install
			-- Add program to list in Control Panel/Programs and features
		local
			ico_icon_path, command_path: EL_FILE_PATH
		do
			command_path := Execution.Application_bin_path + launcher.command
			ico_icon_path := launcher.icon_path.with_new_extension ("ico")

			set_uninstall_registry_entry ("DisplayIcon", ico_icon_path)
			set_uninstall_registry_entry ("DisplayName", display_name)
			set_uninstall_registry_entry ("Comments", launcher.comment)
			set_uninstall_registry_entry ("DisplayVersion", Build_info.version_string)
			set_uninstall_registry_entry ("InstallLocation", Execution.Application_installation_dir)
			set_uninstall_registry_entry ("Publisher", Build_info.installation_sub_directory.steps.first)
			set_uninstall_registry_entry (
				"UninstallString", String.joined_words (<< String.quoted (command_path), launcher.command_args >>)
			)

			set_uninstall_registry_integer_entry ("EstimatedSize", estimated_size)
			set_uninstall_registry_integer_entry ("NoModify", 1)
			set_uninstall_registry_integer_entry ("NoRepair", 1)
		end

	uninstall
			-- Remove program from list in Control Panel/Programs and features
		local
			unistall_reg_node: POINTER
		do
			if launcher_exists then
				Win_registry.remove_key (HKLM_uninstall_path, display_name)
			end
		end

feature {NONE} -- Implementation

	set_uninstall_registry_entry (name, value: EL_ASTRING)
		do
			Win_registry.set_string (uninstall_reg_path, name, value)
		end

	set_uninstall_registry_integer_entry (name: EL_ASTRING; value: INTEGER)
		do
			Win_registry.set_integer (uninstall_reg_path, name, value)
		end

	estimated_size: INTEGER
			-- estimated size of install in KiB
		local
			directory_size_cmd: EL_DIRECTORY_INFO_COMMAND
		do
			create directory_size_cmd.make (Execution.Application_installation_dir)
			directory_size_cmd.execute
			Result := (directory_size_cmd.size / 1024.0).rounded
		end

	display_name: EL_ASTRING
		do
			Result := launcher.name
		end

	uninstall_reg_path: EL_DIR_PATH

feature {NONE} -- Constants

	HKLM_uninstall_path: EL_DIR_PATH
		once
			Result := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
		end

end