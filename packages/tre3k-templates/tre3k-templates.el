;; this is script for create simple templates

(defun tre3k-template-cmake(name_of_project)
  (interactive "sName of project: \n")

  (require 'cmake-mode)                          ;; dpeneds
  
  (setq buffer-name "CMakeLists.txt")
  (new-buff-and-set buffer-name)
    
  (insert "# This file auto genereated in Emacs (c) Kirill Pshenichnyi aka tre3k\n")
  (insert "# ") (timestamp) (insert "\n\n")
    
  (insert "cmake_minimum_required(VERSION 3.18)\n\n")
  (insert "project(")(insert name_of_project)(insert " LANGUAGES CXX)\n\n")
  (insert "set(CMAKE_CXX_STANDARD 17)\nset(CMAKE_CXX_STANDARD_REQUIRED ON)\n\n")

  (insert "# If you need use specific compiler: \n")
  (insert "#set(CMAKE_CXX_COMPILER \"clang++\")\n")
  (insert "# Compiler options: \n")
  (insert "set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} -pthread\")\n")
  (insert "set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} -O3\")\n")
  (insert "set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} -march=native\")\n\n")
  
  (insert "# Include directory\n")
  (insert "set(INCLUDE_PATH \"include/\")\n") 
  (insert "include_directories(${INCLUDE_PATH})\n\n")

  (insert "# If you project use external library\n")
  (insert "#find_library(CONST_EXT_LIB ext_lib)\n\n")

  (insert "# If you need build also the library\n")
  (insert "#add_library(") (insert name_of_project) (insert "_library STATIC ") (insert name_of_project) (insert "_library.cpp ${INCLUDE_PATH}") (insert name_of_project) (insert "_library.h)\n\n")
  (insert "add_executable(") (insert name_of_project) (insert "\n")
  (insert "\tmain.cpp\n")
  (insert "#\tAdd here your project files\n")
  (insert "#\tother-file.cpp ${INCLUDE_PATH}other-file.h\n")
  (insert ")\n\n")

  (insert "# Link with libraries:\n")
  (insert "#target_link_libraries(") (insert name_of_project) (insert "\n")
  (insert "#\t${CONST_EXT_LIB}\n")
  (insert "#\t") (insert name_of_project) (insert "_library\n#)\n")
  
  (cmake-mode) 
  (save-buffer)

  (new-buff-and-set "main.cpp")

  (insert "/* main.cpp ") (timestamp) (insert "\n")
  (insert " * Kirill Pshenichny (c) aka tre3k \n */\n\n")
  (insert "#include <iostream>\n\n")
  (insert "int main(int argc, char **argv) {\n")
  (insert "\tstd::cout << \"Hello ") (insert name_of_project) (insert " prject!\" << std::endl;\n")
  (insert "\treturn 0;\n}\n")
  
  (c-mode)
  (save-buffer)
)

;;(defun timestamp () (insert (format-time-string "%d.%m.%Y %H:%M:%S")))
(defun timestamp () (insert (format-time-string "%d.%m.%Y")))


(defun new-buff-and-set (name)
  (generate-new-buffer name)
  (display-buffer name)
  (delete-window)
  (set-visited-file-name name)
)

(provide 'tre3k-templates)

