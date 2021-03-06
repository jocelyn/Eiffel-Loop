# Eiffel-Loop Contents
## Submission for 99-bottles-of-beer.net
Eiffel submission for [www.99-bottles-of-beer.net](http://www.99-bottles-of-beer.net/).

This website contains sample programs for over 1500 languages and variations, all of which print the lyrics of the song "99 Bottles of Beer".
## Eiffel remote object test server (EROS)
Example program demonstrating the use of the EROS library. EROS is an acronym for **E**iffel **R**emote **O**bject **S**erver. It uses an XML remote procedure call protocol.
## EROS test clients
Example program demonstrating how a client can call a server created with the EROS library. EROS is an acronym for **E**iffel **R**emote **O**bject **S**erver. It uses an XML remote procedure call protocol.
## Eiffel to Java
Demonstration program for the Eiffel-Loop Java interface library. This library provides a useful layer of abstraction over the Eiffel Software JNI interface.
## Rhythmbox MP3 Collection Manager
This is a full-blown MP3 collection manager that is designed to work in conjunction with the [Rhythmbox media player](https://wiki.gnome.org/Apps/Rhythmbox) and has a number of features of particular interest to Tango DJs.

**Manger Syntax**


````
el_rhythmbox -manager -config <task-configuration>.pyx
````
**Features**


* Integrates with the GNOME desktop and the [GNOME terminal](https://en.wikipedia.org/wiki/GNOME_Terminal) so you can drag and drop task configuration files on to either a [desktop launcher](https://developer.gnome.org/integration-guide/stable/desktop-files.html.en) or the GNOME terminal.
* Automatically add album art to MP3 files from a directory based on album name or artist name.
* Collate songs into a directory structure according to song tags:


````
<genre>/<artist-name>/<song-title>.<unique id>.mp3
````
* Import videos in various formats as MP3 files automatically adding ID3 tags according to folder location. Includes facility for mapping video segments to individual MP3 files.
* Replace songs marked as duplicated, updating all playlists and removing replaced song from collection.
* Display all ID3 tag comments
* Create [tango cortinas](https://en.wikipedia.org/wiki/Cortina_(tango)) to act as breaks between a set of dance songs.
* Delete all ID3 tag comments except for the Rhythmbox 'c0' comment. (Gets rid of iTune identifiers etc.)
* Remove all UFID fields from ID3 tags
* Store playlists in a special format that can be easily edited in a text editor to add DJ event information.
* Publish playlists augmented with DJ event information to a website using an Evolicity HTML template.
* Display [MusicBrainz info](https://en.wikipedia.org/wiki/MusicBrainz) for any songs that have it.
* Display songs with incomplete [TXXX ID3](http://id3.org/id3v2.3.0#Declared_ID3v2_frames) tags (User defined text).
* Archive songs placed in a special "Archive" playlist. This removes them from the main Rhythmbox collection but does not delete them.
* Append field "album-artist" into main 'c0' comment.
* Replace 'c0' comment with album-artist info
* Synchronize all (or selected genres) of music with connected device.
* Export all playlists and associated MP3 to external device
* Has a trick where the beats-per-minute ID3 field can be used to generate a silent pause after particular songs in a playlist.
* Writes a unique audio signature into the MusicBrainz track id to facilitate foolproof device synchronization.

**Manual**

For details on how to use, read the [source documentation notes](http://www.eiffel-loop.com/example/manage-mp3/source/sub-applications/rhythmbox_music_manager_app.html).

**Download**

Download the latest executable for *Ubuntu 14.04* or *Linux Mint 17.x* at the bottom of [this page](https://github.com/finnianr/Eiffel-Loop/releases/latest). You also need the following command line tools to be installed: `sox, swgen, avconv, lame, gvfs-mount`.

Warning: **Use at your own risk.** It is recommended that you have a backup of your MP3 collection and rhythmbox configuration files (Usually in `$HOME/.local/share/rhythmbox`). The developer does not take any responsibility for any data loss that may occur as a result of using *el_rhythmbox*.


## Vision-2 Extensions Demo

## Development Toolkit Program
A "Swiss-army knife" of useful Eiffel command line development tools. The most useful ones are listed here with command line switchs:

[`EIFFEL_REPOSITORY_PUBLISHER_APP`](http://www.eiffel-loop.com/tool/toolkit/source/applications/eiffel-dev/eiffel_repository_publisher_app.html)

`-publish_repository`: publishes an Eiffel code repository as a website with module descriptions.

[`EIFFEL_NOTE_EDITOR_APP`](http://www.eiffel-loop.com/tool/toolkit/source/applications/eiffel-dev/eiffel_note_editor_app.html)

`-edit_notes`: Add default values to note fields using a source tree manifest.

[`EIFFEL_FEATURE_EDITOR_APP`](http://www.eiffel-loop.com/tool/toolkit/source/applications/eiffel-dev/eiffel_feature_editor_app.html)

`-feature_edit`: expands Eiffel shorthand code in source file and reorders feature blocks alphabetically.

[`CRYPTO_APP`](http://www.eiffel-loop.com/tool/toolkit/source/applications/crypto_app.html)

`-crypto`: menu driven shell of useful cryptographic operations.

**Download**

Download binary of [`el_toolkit`](https://github.com/finnianr/Eiffel-Loop/releases/latest) for *Ubuntu 14.04* or *Linux Mint 17.x*.


## Development Testing

## Audio Processing Classes

## Data Structures

## Math Classes

## Persistency Classes

## Runtime Classes

## Text Processing Classes

## Miscellaneous Utility Classes

## Image Utilities

## HTML Viewer (based on Vision-2)

## Vision-2 GUI Extensions
Provides many extensions to the Eiffel Software [Vision-2 cross-platform GUI library](https://www.eiffel.org/doc/solutions/EiffelVision%202) and the [Smart Docking library](https://dev.eiffel.com/Smart_Docking_library).

**Features**


* Advanced pixel buffer rendering with transparencies and anti-aliasing using the [Cairo](https://cairographics.org/) and [Pangocairo](http://www.pango.org/) 2D graphics library. See class [`EL_DRAWABLE_PIXEL_BUFFER`](http://www.eiffel-loop.com/library/graphic/toolkit/vision2-x/interface/widgets/primitives/pixmap/el_drawable_pixel_buffer.html)
* Drop-down combo boxes linked to data containers conforming to [`FINITE`](https://archive.eiffel.com/doc/online/eiffel50/intro/studio/index-09A/base/structures/storage/finite_flat.html)` [G]` and initialized with a value of type *G*, and a selection change agent of type `PROCEDURE [ANY, TUPLE [G]]`. See class [`EL_DROP_DOWN_BOX`](http://www.eiffel-loop.com/library/graphic/toolkit/vision2-x/interface/widgets/primitives/drop-downs/el_drop_down_box.html)
* Drop-down combo boxes with localized display strings. See class [`EL_LOCALE_STRING_DROP_DOWN_BOX`](http://www.eiffel-loop.com/library/graphic/toolkit/vision2-x/interface/widgets/primitives/drop-downs/el_locale_string_drop_down_box.html)
* Drop down combo box for months of year specified as integers and displayed with English names and a localized variant [`EL_LOCALE_MONTH_DROP_DOWN_BOX`](http://www.eiffel-loop.com/library/graphic/toolkit/vision2-x/interface/widgets/primitives/drop-downs/el_locale_month_drop_down_box.html)

These features are only the tip of the ice-berg.


## Windows Eiffel Library Extensions

## C/C++ and MS COM objects

## Java
A high-level framework for wrapping Java classes that adds a useful layer of abstraction to Eiffel Software's  interface to the JNI ([Java Native Interface](https://en.wikipedia.org/wiki/Java_Native_Interface)) called [eiffel2java](https://www.eiffel.org/doc/solutions/Eiffel2Java).

**Features**
* Better Java environment discovery for initialization.
* Automates composition of JNI call signature strings.
* Automates cleanup of Java objects.

The framework is based on the concept of a Java agent that is similar to an Eiffel agent. You will find classes: [`JAVA_FUNCTION`](http://www.eiffel-loop.com/library/language_interface/Java/java_agents/java_static_function.html) and  [`JAVA_PROCEDURE`](http://www.eiffel-loop.com/library/language_interface/Java/java_agents/java_procedure.html) that inherit [`JAVA_ROUTINE`](http://www.eiffel-loop.com/library/language_interface/Java/java_agents/java_routine.html). These agent classes automatically generate correct JNI call signatures. The library allows the creation of recursively wrapped classes where the arguments and return types to wrapped routines are themselves wrapped classes.

[See here](http://www.eiffel-loop.com/example/eiffel2java/source/class-index.html) for an example of it's use.


## Matlab
**Status:** No longer maintained

[Matlab](http://uk.mathworks.com/products/matlab/) is a popular math orientated scripting language. This interface was developed with Matlab Version 6.5, VC++ 8.0 Express Edition and Windows XP SP2.
## Praat-script
**Status:** No longer maintained

[Praat](http://www.fon.hum.uva.nl/praat) is a free tool for doing acoustic and phonetic analysis and has it's own scripting language, Praat-script.

The `el_toolkit` utility has an option for converting the source code of Praat ver. 4.4 to compile with MSC. (Praat compiles "out of the box" with the mingw compiler, but at the time EiffelStudio didn't support mingw)

Developed with VC++ 8.0 Express Edition, Windows XP SP2, Praat source code version 4.4.30. The conversion tool will not work with later versions of Praat.


## Python

## Basic Networking Classes
Extensions for ISE network sockets and a class for obtaining the MAC address of network devices on both Windows and Linux.
## Adobe Flash interface for Laabhair
**Status:** No longer maintained

Eiffel interface to [Flash ActionScript objects](https://github.com/finnianr/Eiffel-Loop/blob/master/Flash_library/eiffel_loop/laabhair) used in the **Laabhair** digital signal processing framework. This framework allows you to create applications that process speech with a [Praat](http://www.fon.hum.uva.nl/praat) script in real time and create visual representations of the the data in Flash. Depends on the Eiffel-Loop Praat-script interface library.

Developed on Windows XP SP2 with Flash Professional 8 IDE, EiffelStudio 6.1,  VC++ 8.0 Express Edition.

Laabhair was developed at the [Digital Media Centre at the Dublin Institute of Technology](http://dmc.dit.ie/)




## Eiffel Remote Object Server (EROS)
An implementation of an experimental XML orientated remote procedure call protocol.

**ECF Instructions**

When including the ECF `eros.ecf` in your project it is necessary to define a custom variable `eros_server_enabled`. To build a server application set the value to `true`. To build a client application set value to `false`.




## File Transfer Protocol (FTP)
Classes for uploading files to a server and managing server directory structure.
## PayPal Payments Standard Button Manager API
An Eiffel interface to the [PayPal Payments Standard Button Manager NVP HTTP API](https://developer.paypal.com/docs/classic/button-manager/integration-guide/).
## Hypertext Transfer Protocol (HTTP)
Classes for interacting with a HTTP server. Supports the following HTTP commands: HEAD, POST, GET.
## HTTP Servlet Services
Classes for creating single and multi-threaded HTTP servlet services that extend the [Goanna servlet library](http://goanna.sourceforge.net/).
## Eiffel CHAIN Orientated Binary Database
Implements "in-memory" database tables based on an interface defined by the kernel Eiffel class [`CHAIN`](https://archive.eiffel.com/doc/online/eiffel50/intro/studio/index-09A/base/structures/list/chain_chart.html). There are two table types:


1. Monolithic tables which can only be saved to disk as a whole and any new items which have not been saved will be lost.
2. Transactional tables where the effects of the table item operations: *extend, replace or delete*,  are immediately committed to disk in an editions table file. When the editions file gets too large, the editions are consolidated into the main table file.

Monolithic tables are implemented by class: [`EL_STORABLE_CHAIN`](http://www.eiffel-loop.com/library/persistency/database/binary-db/el_storable_chain.html) which takes a generic paramter of type [`EL_STORABLE`](http://www.eiffel-loop.com/library/base/utility/memory/el_storable.html).

This class defines the basic database *CRUD* concept of **C**reate, **R**ead, **U**pdate and **D**elete:

**Create:** is implemented by the `{EL_STORABLE_CHAIN}.extend` procedure.

**Read:** is implemented by the `{EL_STORABLE_CHAIN}.item` function.

**Update:** is implemented by the `{EL_STORABLE_CHAIN}.replace` procedure.

**Delete:** is implemented by the `{EL_STORABLE}.delete` procedure.

Transactional tables are implemented using the [`EL_RECOVERABLE_STORABLE_CHAIN`](http://www.eiffel-loop.com/library/persistency/database/binary-db/el_recoverable_storable_chain.html) class which inherits [`EL_STORABLE_CHAIN`](http://www.eiffel-loop.com/library/persistency/database/binary-db/el_storable_chain.html). It is called 'recoverable' because if the power suddenly goes off on your PC, the table is fully recoverable from the editions file. 

**ENCRYPTION**

AES encryption is supported for both monolithic and transactional tables.

**RELATIONAL CAPABILITIES**

Some experimental relational capabilities have been added in a private project but these classes have not yet found their way into Eiffel-Loop.

**EXAMPLES** Unfortunately the only examples are in a private commercial project. But if there is enough popular demand, the author will open source some of them.


## Search Engine Classes

## Windows Registry Access
This library adds a layer of abstraction to the Windows registry classes found the in the [Eiffel Windows Library WEL](https://www.eiffel.org/resources/libraries/wel). This abstraction layer makes it much easier and more intuitive to search, read and edit Windows registry  keys and data. See [this article](https://room.eiffel.com/article/windows_registry_access_made_easy) on Eiffel room.


## Eiffel CHAIN-based XML Database

## XML and Pyxis Document Scanning and Object Building (eXpat)
Classes for scanning XML and [Pyxis](https://room.eiffel.com/node/527) documents using a common interface. Pyxis is a more readable XML equivalent that resembles Python code.

This interface also includes a way of building Eiffel objects from element contexts defined by relative Xpaths. Although this is only a very partial implementation of Xpath, it is still very useful.

The XML implementation is based on a modified GOBO wrapper for the [eXpat XML parser](http://expat.sourceforge.net/) (written in C). The Pyxis implementation is pure Eiffel.


## XML Document Scanning and Object Building (VTD-XML)
Classes for scanning XML documents and building Eiffel objects from XML contexts defined by relative Xpaths. Based on the [VTD-XML parser](http://vtd-xml.sourceforge.net/). This is a full implemenation of Xpath 1.0.

VTD-XML uses a very fast and efficient method of building a compressed representation of an XML object using [virtual token descriptors](http://vtd-xml.sourceforge.net/VTD.html).

Using the Eiffel API is considerably easier and more intuitive to use than the original Java or C version of VTD-XML.

A substantial C-bridge was developed to make Eiffel work better with VTD-XML. The original VTX-XML code was forked to make it possible to compile it with the MSC compiler. This fork is found under `contrib/C`.


## OpenOffice Spreadsheet
Classes for parsing [OpenDocument Flat XML spreadsheets](http://www.datypic.com/sc/odf/e-office_spreadsheet.html) using [VTD-XML](http://vtd-xml.sourceforge.net/).
## Multi-application Management
**Introduction** This library accomplishes two goals:


1. Manage a collection of small (and possibility related) "mini-applications" as a single Eiffel application.
2. Implement the concept of a self-installing/uninstalling application on multiple-platforms.

**"Swiss-army-knife applications"**

Creating a new project application in Eiffel is expensive both in terms of time to create a new ECF and project directory structure, and in terms of diskspace. If all you want to do is create a small utility to do some relatively minor task, it makes sense to include it with a other such utilities in a single application. But you need some framework to manage all these sub-applications. In this package, the two classes [`EL_MULTI_APPLICATION_ROOT`](http://www.eiffel-loop.com/library/runtime/app-manage/el_multi_application_root.html) and [`EL_SUB_APPLICATION`](http://www.eiffel-loop.com/library/runtime/app-manage/sub-app/el_sub_application.html) provide this capability.

**Command line sub-applications**

The following features exist for creating command line applications:


* The class [`EL_COMMAND_LINE_SUB_APPLICATION`](http://www.eiffel-loop.com/library/runtime/app-manage/sub-app/el_command_line_sub_application.html) provides a smart way of mapping command line arguments to the arguments of a creation procedure with automatic string conversion according to type.
* Built-in help system with usage help.
* Create menu driven command line shells.

**Installer Features**
* Define system menu entries and desktop shortcuts for both Windows and the Linux XDG desktop entry standard.
* Define application sub menus
* Define application menu launchers
* Define launcher as file context Nautilus action script. (A similar feature for Windows not yet implemented)
* Define dekstop menu icons
* Install application resources and program files
* Uninstall application resources and program files

**Resource Management** The library provides a system of managing application resources like graphics, help files etc.




## Eiffel Thread Extensions

## Multi-threaded Logging

## OS Command Wrapping

## Development Testing Classes

## AES Encryption Extensions
Extensions to Colin LeMahieu's [AES encryption library](https://github.com/EiffelSoftware/EiffelStudio/tree/master/Src/contrib/library/text/encryption/eel). Includes a class for reading and writing encrypted files using [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard) cipher [block chains](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation).
## RSA Public-key Encryption Extensions
Extends Colin LeMahieu's arbitrary precision integer library to conform to some RSA standards. The most important is the ability to read key-pairs conforming to the [X509 PKCS1 standard](https://en.wikipedia.org/wiki/X.509#Sample_X.509_certificates). The top level class to access these facilities is [`EL_MODULE_X509_COMMAND`](http://www.eiffel-loop.com/library/text/encryption/rsa/x509/el_module_x509_command.html).

The private key reader however uses a non-standard encryption scheme. It assumes the file is encrypted using the Eiffel-Loop utility contained in `el_toolkit`. See class [`CRYPTO_APP`](http://www.eiffel-loop.com/tool/toolkit/source/applications/crypto_app.html) for details.






## Internationalization

## Evolicity Text Substitution Engine
**Evolicity** is a text substitution language that was inspired by the [Velocity text substitution language](http://velocity.apache.org/) for Java. *Evolicity* provides a way to merge the data from Eiffel objects into a text template. The template can be either supplied externally or hard-coded into an Eiffel class. The language includes, substitution variables, conditional statements and loops. Substitution variables have a BASH like syntax. Conditionals and loops have an Eiffel like syntax.

The text of this web page was generated by the [Eiffel-view repository publisher](http://www.eiffel-loop.com/tool/toolkit/source/applications/eiffel-dev/eiffel_repository_publisher_app.html) using the following combination of *Evolicity* templates:


1. [doc-config/main-template.html.evol](https://github.com/finnianr/Eiffel-Loop/blob/master/doc-config/main-template.html.evol)
2. [doc-config/site-map-content.html.evol](https://github.com/finnianr/Eiffel-Loop/blob/master/doc-config/site-map-content.html.evol)
3. [doc-config/directory-tree-content.html.evol](https://github.com/finnianr/Eiffel-Loop/blob/master/doc-config/directory-tree-content.html.evol)
4. [doc-config/eiffel-source-code.html.evol](https://github.com/finnianr/Eiffel-Loop/blob/master/doc-config/eiffel-source-code.html.evol)

To make an Eiffel class serializable with *Evolicity* you inherit from class [`EVOLICITY_SERIALIZEABLE`](http://www.eiffel-loop.com/library/text/template/evolicity/serialization/evolicity_serializeable.html). Read the class notes for details on how to use. You can also access the substitution engine directly from the shared instance in class [`EL_MODULE_EVOLICITY_TEMPLATES`](http://www.eiffel-loop.com/library/text/template/evolicity/el_module_evolicity_templates.html)

**Features**


* Templates are compiled to an intermediate byte code stored in `.evc` files. This saves time consuming lexing operations on large templates.
* Has a class [`EVOLICITY_CACHEABLE_SERIALIZEABLE`](http://www.eiffel-loop.com/library/text/template/evolicity/serialization/evolicity_cacheable_serializeable.html) for caching the substituted output. Useful for generating pages on a web-server.




## Application License Management
This contains a few basic classes for constructing an application license manager. The most important is a way to obtain a unique machine ID using a combination of the CPU model name and MAC address either from the network card or wifi card. 

The principle developer of Eiffel-loop has developed a sophisticated license management system using RSA public key cryptography, however it is not available as open source. If you are interested to license this system for your company, please contact the developer. It has been used for the [My Ching](http://myching.software) software product.


## Performance Benchmarking and Command Shell

## ZLib Compression

## Override of ES GUI Toolkits

## Override of ES Eiffel to Java Interface

