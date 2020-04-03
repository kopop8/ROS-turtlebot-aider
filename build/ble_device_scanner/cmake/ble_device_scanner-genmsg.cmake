# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ble_device_scanner: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ible_device_scanner:/home/pieter/turtlebot_ws/src/ble_device_scanner/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ble_device_scanner_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg" NAME_WE)
add_custom_target(_ble_device_scanner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ble_device_scanner" "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg" ""
)

get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg" NAME_WE)
add_custom_target(_ble_device_scanner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ble_device_scanner" "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg" "ble_device_scanner/DeviceTuple"
)

get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg" NAME_WE)
add_custom_target(_ble_device_scanner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ble_device_scanner" "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg" "ble_device_scanner/Device:ble_device_scanner/DeviceTuple"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_device_scanner
)
_generate_msg_cpp(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg"
  "${MSG_I_FLAGS}"
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_device_scanner
)
_generate_msg_cpp(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg"
  "${MSG_I_FLAGS}"
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg;/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_device_scanner
)

### Generating Services

### Generating Module File
_generate_module_cpp(ble_device_scanner
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_device_scanner
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ble_device_scanner_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ble_device_scanner_generate_messages ble_device_scanner_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_cpp _ble_device_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_cpp _ble_device_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_cpp _ble_device_scanner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ble_device_scanner_gencpp)
add_dependencies(ble_device_scanner_gencpp ble_device_scanner_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ble_device_scanner_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_device_scanner
)
_generate_msg_eus(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg"
  "${MSG_I_FLAGS}"
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_device_scanner
)
_generate_msg_eus(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg"
  "${MSG_I_FLAGS}"
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg;/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_device_scanner
)

### Generating Services

### Generating Module File
_generate_module_eus(ble_device_scanner
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_device_scanner
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ble_device_scanner_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ble_device_scanner_generate_messages ble_device_scanner_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_eus _ble_device_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_eus _ble_device_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_eus _ble_device_scanner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ble_device_scanner_geneus)
add_dependencies(ble_device_scanner_geneus ble_device_scanner_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ble_device_scanner_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_device_scanner
)
_generate_msg_lisp(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg"
  "${MSG_I_FLAGS}"
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_device_scanner
)
_generate_msg_lisp(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg"
  "${MSG_I_FLAGS}"
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg;/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_device_scanner
)

### Generating Services

### Generating Module File
_generate_module_lisp(ble_device_scanner
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_device_scanner
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ble_device_scanner_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ble_device_scanner_generate_messages ble_device_scanner_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_lisp _ble_device_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_lisp _ble_device_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_lisp _ble_device_scanner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ble_device_scanner_genlisp)
add_dependencies(ble_device_scanner_genlisp ble_device_scanner_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ble_device_scanner_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_device_scanner
)
_generate_msg_nodejs(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg"
  "${MSG_I_FLAGS}"
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_device_scanner
)
_generate_msg_nodejs(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg"
  "${MSG_I_FLAGS}"
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg;/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_device_scanner
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ble_device_scanner
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_device_scanner
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ble_device_scanner_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ble_device_scanner_generate_messages ble_device_scanner_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_nodejs _ble_device_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_nodejs _ble_device_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_nodejs _ble_device_scanner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ble_device_scanner_gennodejs)
add_dependencies(ble_device_scanner_gennodejs ble_device_scanner_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ble_device_scanner_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_device_scanner
)
_generate_msg_py(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg"
  "${MSG_I_FLAGS}"
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_device_scanner
)
_generate_msg_py(ble_device_scanner
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg"
  "${MSG_I_FLAGS}"
  "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg;/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_device_scanner
)

### Generating Services

### Generating Module File
_generate_module_py(ble_device_scanner
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_device_scanner
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ble_device_scanner_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ble_device_scanner_generate_messages ble_device_scanner_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/DeviceTuple.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_py _ble_device_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Device.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_py _ble_device_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pieter/turtlebot_ws/src/ble_device_scanner/msg/Devices.msg" NAME_WE)
add_dependencies(ble_device_scanner_generate_messages_py _ble_device_scanner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ble_device_scanner_genpy)
add_dependencies(ble_device_scanner_genpy ble_device_scanner_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ble_device_scanner_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_device_scanner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_device_scanner
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ble_device_scanner_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_device_scanner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_device_scanner
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ble_device_scanner_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_device_scanner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_device_scanner
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ble_device_scanner_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_device_scanner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_device_scanner
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ble_device_scanner_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_device_scanner)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_device_scanner\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_device_scanner
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ble_device_scanner_generate_messages_py std_msgs_generate_messages_py)
endif()
