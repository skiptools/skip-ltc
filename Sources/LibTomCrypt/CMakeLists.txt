cmake_minimum_required(VERSION 3.3)

project(tomcrypt LANGUAGES C)

file(GLOB_RECURSE SOURCES libtomcrypt/*.c)
add_library(tomcrypt SHARED ${SOURCES})
include_directories(tomcrypt PUBLIC libtomcrypt/headers/)

# these should match the definitions in the Package.swift
# so the Android build and the Swift build options match
#add_compile_definitions(HAVE_GETHOSTUUID=0)

message("CMAKE FINDING LIBRARY FOR ABI: ${ANDROID_ABI} in: ${CMAKE_PARENT_SOURCE_DIR} for build type: ${CMAKE_BUILD_TYPE}")

if(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(BUILD_MODE "Release")
elseif(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
    set(BUILD_MODE "Release")
elseif(CMAKE_BUILD_TYPE STREQUAL "MinSizeRel")
    set(BUILD_MODE "Release")
elseif(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(BUILD_MODE "Debug")
else()
    message(WARNING "CMAKE_BUILD_TYPE is set to an unsupported value: ${CMAKE_BUILD_TYPE}. Defaulting to Debug.")
    set(BUILD_MODE "Debug")
endif()

string(TOLOWER "${BUILD_MODE}" BUILD_MODE_LOWER)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -frtti -fexceptions")

# we use LTC_NO_ASM in the Package.swift cSettings, but we can enable -maes for android
# failure to do so results in the compile error:
# tomcrypt/ciphers/aes/aesni.c:150:26: error: always_inline function '_mm_aesimc_si128' requires target feature 'aes', but would be inlined into function 'aesni_setup' that is compiled without support for 'aes'
#target_compile_options(tomcrypt PRIVATE -maes)

# support 16 KB page sizes: https://developer.android.com/guide/practices/page-sizes
target_link_options(${CMAKE_PROJECT_NAME} PRIVATE "-Wl,-z,max-page-size=16384")
