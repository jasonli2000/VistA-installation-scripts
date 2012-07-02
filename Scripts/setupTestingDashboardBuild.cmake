#Client maintainer: name@email
set(CTEST_SITE "osehra001.rackspace")
set(CTEST_BUILD_NAME "RHEL6.1-GT.M")
set(dashboard_cache "
GTMPROFILE:PATH=$ENV{gtmprofilefile}
VISTA_GLOBALS_DIR:PATH=$ENV{gtmgbldir}
VISTA_ROUTINE_DIR:PATH=$ENV{VistARoutines}
AUTOMATED_UNIT_TESTING:BOOL=ON
INSTALL_MUNIT:BOOL=ON
MUNIT_KIDS_FILE:FILEPATH="$ENV{HOME}/OSEHRA/Dashboards/M-Tools/Utilities XT_7.3_81 not yet released/MUNITKids/XT_7-3_81.KID"
MUNIT_PACKAGE_INSTALL_NAME:STRING=XT*7.3*81
CLEAN_DATABASE:BOOL=ON
USE_XINDEX_WARNINGS_AS_FAILURES:BOOL=ON
VISTA_CPRS_FUNCTIONAL_TESTING:BOOL=ON
 ")
#Where the files from git will be placed
set(CTEST_DASHBOARD_ROOT $ENV{HOME}/OSHERA/Dashboards)

#Path to the Git Executable.
set(CTEST_GIT_COMMAND /usr/bin/git)
include(${CTEST_SCRIPT_DIRECTORY}/../vista_common.cmake)