#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "print" for configuration "Debug"
set_property(TARGET print APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(print PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libprintd.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS print )
list(APPEND _IMPORT_CHECK_FILES_FOR_print "${_IMPORT_PREFIX}/lib/libprintd.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
