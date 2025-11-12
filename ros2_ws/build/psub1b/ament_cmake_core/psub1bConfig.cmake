# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_psub1b_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED psub1b_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(psub1b_FOUND FALSE)
  elseif(NOT psub1b_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(psub1b_FOUND FALSE)
  endif()
  return()
endif()
set(_psub1b_CONFIG_INCLUDED TRUE)

# output package information
if(NOT psub1b_FIND_QUIETLY)
  message(STATUS "Found psub1b: 0.0.0 (${psub1b_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'psub1b' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${psub1b_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(psub1b_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${psub1b_DIR}/${_extra}")
endforeach()
