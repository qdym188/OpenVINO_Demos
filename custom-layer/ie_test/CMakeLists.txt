#
# Copyright (C) 2018-2019 Intel Corporation
# SPDX-License-Identifier: Apache-2.0

# ===============================================================================
# Generated file for building library with user generated CPU extensions
#
# Contains implementation of the basic layer methods
#
# Refer to the section "Adding Your Own Kernels to the Inference Engine" in
# OpenVINO* documentation (either online or offline in
# <INSTALL_DIR>/deployment_tools/documentation/docs/index.html an then navigate
# to the corresponding section).
# ===============================================================================

cmake_minimum_required (VERSION 3.10)

set(TARGET_NAME "ie_test")

get_filename_component(CMAKE_PREFIX_PATH "${InferenceEngine_DIR}" ABSOLUTE)

message(STATUS "Looking for inference engine configuration file at: ${CMAKE_PREFIX_PATH}")
find_package(InferenceEngine 1.0)
#find_package(ngraph REQUIRED)

if (NOT InferenceEngine_FOUND)
    message(FATAL_ERROR "Inference Engine was not found")
endif()

SET(SRC main.cpp)
file(GLOB_RECURSE HDR *.hpp)

if(WIN32)
    add_definitions(-DIMPLEMENT_INFERENCE_ENGINE_API)
endif()

set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")

if ("${InferenceEngine_INCLUDE_DIRS}" STREQUAL "")
    message(FATAL_ERROR "InferenceEngine_INCLUDE_DIRS was not set!")
endif()

if ("${InferenceEngine_LIBRARIES}" STREQUAL "")
    message(FATAL_ERROR "InferenceEngine_LIBRARIES was not set!")
endif()

include_directories (PRIVATE
    ${InferenceEngine_INCLUDE_DIRS}
    "/opt/intel/openvino_2021/deployment_tools/inference_engine/include"
    "/opt/intel/openvino_2021/deployment_tools/inference_engine/external/tbb/include"
    "/opt/intel/openvino_2021/deployment_tools/ngraph/include"
)

link_directories(
    "/opt/intel/openvino_2021/deployment_tools/inference_engine/external/tbb/lib"
    "/opt/intel/openvino_2021/deployment_tools/ngraph/lib"
)

#enable_omp()

add_executable(${TARGET_NAME} ${SRC} ${HDR})

target_link_libraries(
    ${TARGET_NAME}
    ${InferenceEngine_LIBRARIES}
    #${intel_omp_lib} 
    tbb
)

target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
set_target_properties(${TARGET_NAME} PROPERTIES COMPILE_PDB_NAME ${TARGET_NAME})

#set_target_cpu_flags(${TARGET_NAME})
