file(REMOVE_RECURSE
  "wp_nav_odom_report_automoc.cpp"
  "waterplus_map_tools_automoc.cpp"
  "wp_saver_automoc.cpp"
  "wp_manager_automoc.cpp"
  "wp_nav_test_automoc.cpp"
  "wp_nav_remote_automoc.cpp"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/waterplus_map_tools_gencpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
