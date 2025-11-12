# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_psub1a_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED psub1a_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(psub1a_FOUND FALSE)
  elseif(NOT psub1a_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(psub1a_FOUND FALSE)
  endif()
  return()
endif()
set(_psub1a_CONFIG_INCLUDED TRUE)

# output package information
if(NOT psub1a_FIND_QUIETLY)
  message(STATUS "Found psub1a: 0.0.0 (${psub1a_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'psub1a' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${psub1a_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(psub1a_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${psub1a_DIR}/${_extra}")
endforeach()
