####################
##                ##
##  PROJECT NAME  ##
##                ##
####################

project(projectname)


#################################
##                             ##
##  CMAKE / LANGUAGE VERSIONS  ##
##                             ##
#################################

cmake_minimum_required(VERSION 3.13)

enable_language(CXX)
set(CMAKE_CXX_STANDARD 14)

enable_language(C)
set(CMAKE_C_STANDARD 11)


#######################
##                   ##
##  CUSTOM SETTINGS  ##
##                   ##
#######################

set(ENABLE_EXTERNAL ON)
set(ENABLE_SHARED ON)

set(NAME_EXE ${PROJECT_NAME})

set(DIR_BASE ..)


###############################
##                           ##
##  SET DIRECTORY VARIABLES  ##
##                           ##
###############################

if(ENABLE_EXTERNAL)
	set(DIR_EXTERNAL ${DIR_BASE}/thirdparty)
	set(DIR_EXTERNAL_LIB ${DIR_EXTERNAL}/lib)
	set(DIR_EXTERNAL_INCLUDE ${DIR_EXTERNAL}/include)
	set(DIR_EXTERNAL_SRC ${DIR_EXTERNAL}/src)
endif()

if(ENABLE_SHARED)
	set(DIR_SHARED ${DIR_BASE}/shared)
	set(DIR_SHARED_LIB ${DIR_SHARED}/lib)
	set(DIR_SHARED_INCLUDE ${DIR_SHARED}/include)
	set(DIR_SHARED_SRC ${DIR_SHARED}/src)
endif()

set(DIR_SRC src)


###########################
##                       ##
##  INCLUDE DIRECTORIES  ##
##                       ##
###########################

include_directories(${DIR_SRC})
if(ENABLE_SHARED)
	include_directories(${DIR_SHARED_INCLUDE})
endif()
if(ENABLE_EXTERNAL)
	include_directories(${DIR_EXTERNAL_INCLUDE})
endif()


#####################
##                 ##
##  SOURCES FILES  ##
##                 ##
#####################

if(ENABLE_SHARED)
	file(GLOB_RECURSE SOURCES_SHARED ${DIR_SHARED_SRC}/*.c ${DIR_SHARED_SRC}/*.cpp)
endif()
if(ENABLE_EXTERNAL)
	file(GLOB_RECURSE SOURCES_EXTERNAL ${DIR_EXTERNAL_SRC}/*.c ${DIR_EXTERNAL_SRC}/*.cpp)
endif()

#=========================== ADD YOUR SOURCES BELOW ===========================#
set(SOURCES
        ${DIR_SRC}/main.cpp
)
#=========================== ADD YOUR SOURCES ABOVE ===========================#

set(SOURCES_ALL ${SOURCES} ${SOURCES_SHARED} ${SOURCES_EXTERNAL})


#################
##             ##
##  LIBRARIES  ##
##             ##
#################

#=========================== SPECIFY LIBRARIES BELOW ===========================#
#find_library(LIB_ )
#find_package(LIB_ )

set(LIBS_ANY )
set(LIBS_UNIX )
set(LIBS_WIN32 )
set(LIBS_APPLE )
set(LIBS_MINGW )
set(LIBS_MSYS )
set(LIBS_CYGWIN )
#=========================== SPECIFY LIBRARIES ABOVE ===========================#

set(LIBS ${LIBS_ANY})
if (UNIX)
    set(LIBS ${LIBS} ${LIBS_UNIX})
endif(UNIX)
if (WIN32)
    set(LIBS ${LIBS} ${LIBS_})
endif(WIN32)
if (APPLE)
    set(LIBS ${LIBS} ${LIBS_APPLE})
endif(APPLE)
if (MINGW)
    set(LIBS ${LIBS} ${LIBS_MINGW})
endif(MINGW)
if (MSYS)
    set(LIBS ${LIBS} ${LIBS_MSYS})
endif(MSYS)
if (CYGWIN)
    set(LIBS ${LIBS} ${LIBS_CYGWIN})
endif(CYGWIN)


##################
##              ##
##  EXECUTABLE  ##
##              ##
##################

add_executable(${NAME_EXE} ${SOURCES_ALL})
target_link_libraries(${NAME_EXE} ${LIBS})
