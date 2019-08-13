cmake_minimum_required(VERSION 3.13)
project(projectname)
set(CMAKE_CXX_STANDARD 14)

set(ENABLE_EXTERNAL OFF)
set(ENABLE_SHARED OFF)

###############################
##                           ##
##  SET DIRECTORY VARIABLES  ##
##                           ##
###############################

if(ENABLE_EXTERNAL)
	set(DIR_EXTERNAL thirdparty)
	set(DIR_EXTERNAL_LIB ${DIR_EXTERNAL}/lib)
	set(DIR_EXTERNAL_INCLUDE ${DIR_EXTERNAL}/include)
	set(DIR_EXTERNAL_SRC ${DIR_EXTERNAL}/src)
endif()

if(ENABLE_SHARED)
	set(DIR_SHARED ../../shared)
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

set(SOURCES
        ${DIR_SRC}/main.cpp
)

set(SOURCES_ALL ${SOURCES} ${SOURCES_SHARED} ${SOURCES_EXTERNAL})


#################
##             ##
##  LIBRARIES  ##
##             ##
#################

#find_library(LIB_ )
#find_package(LIB_ )

set(LIBS ) 


##################
##              ##
##  EXECUTABLE  ##
##              ##
##################

add_executable(${PROJECT_NAME} ${SOURCES_ALL})
target_link_libraries(${PROJECT_NAME} ${LIBS})
