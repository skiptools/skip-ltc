cmake_minimum_required(VERSION 3.1)

project(tomcrypt, LANGUAGES C)

file(GLOB_RECURSE SOURCES libtomcrypt/*.c)
add_library(tomcrypt SHARED ${SOURCES})
include_directories(tomcrypt PUBLIC libtomcrypt/headers/)

# these should match the definitions in the Package.swift
# so the Android build and the Swift build options match
#add_compile_definitions(HAVE_GETHOSTUUID=0)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -frtti -fexceptions")

# we use LTC_NO_ASM in the Package.swift cSettings, but we can enable -maes for android
# failure to do so results in the compile error:
# tomcrypt/ciphers/aes/aesni.c:150:26: error: always_inline function '_mm_aesimc_si128' requires target feature 'aes', but would be inlined into function 'aesni_setup' that is compiled without support for 'aes'
#target_compile_options(tomcrypt PRIVATE -maes)
