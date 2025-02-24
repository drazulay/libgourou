get_filename_component(DIRNAME "${CMAKE_CURRENT_SOURCE_DIR}" NAME)
set(LIBRARY_NAME "${PROJECT_NAME_NO_PREFIX}_${DIRNAME}")

set(Header_Files
        "drmprocessorclientimpl.h"
        "utils_common.h"
)
source_group("Header Files" FILES "${Header_Files}")

set(Source_Files
        "acsmdownloader.cpp"
        "adept_activate.cpp"
        "adept_loan_mgt.cpp"
        "adept_remove.cpp"
        "drmprocessorclientimpl.cpp"
        "launcher.cpp"
        "utils_common.cpp"
)
source_group("Source Files" FILES "${Source_Files}")

add_library("${LIBRARY_NAME}" "${Header_Files}" "${Source_Files}")

find_package(OpenSSL REQUIRED)
find_package(libzip CONFIG REQUIRED)
find_package(CURL REQUIRED)

target_link_libraries(
        "${LIBRARY_NAME}"
        PRIVATE
        "${PROJECT_NAME_NO_PREFIX}_compiler_flags"
        "${PROJECT_NAME_NO_PREFIX}_include"
        "libzip::zip"
        "OpenSSL::SSL"
        "CURL::libcurl"
)

include(GNUInstallDirs)
target_include_directories(
        "${LIBRARY_NAME}"
        PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>"
        "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)

include(GenerateExportHeader)
set(_export_file "${CMAKE_CURRENT_BINARY_DIR}/${LIBRARY_NAME}_export.h")
generate_export_header("${LIBRARY_NAME}" EXPORT_FILE_NAME "${_export_file}")

# setup the version numbering
set_property(TARGET "${LIBRARY_NAME}" PROPERTY VERSION "${${PROJECT_NAME}_VERSION}")
set_property(TARGET "${LIBRARY_NAME}" PROPERTY SOVERSION "${${PROJECT_NAME}_VERSION_MAJOR}")

# install rules
install(FILES "${_export_file}" ${Header_Files}
        DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")
