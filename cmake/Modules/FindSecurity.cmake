# Find Security.framework
# This will define :
#
# SECURITY_FOUND
# SECURITY_LIBRARIES
# SECURITY_LDFLAGS
# SECURITY_HAS_SSLCREATECONTEXT
#

FIND_PATH(SECURITY_INCLUDE_DIR NAMES Security/Security.h)
FIND_LIBRARY(SECURITY_LIBRARIES NAMES Security)
IF (SECURITY_INCLUDE_DIR AND SECURITY_LIBRARIES)
	IF (NOT Security_FIND_QUIETLY)
		MESSAGE("-- Found Security ${SECURITY_LIBRARIES}")
	ENDIF()
	SET(SECURITY_FOUND TRUE)
	SET(SECURITY_LDFLAGS "-framework Security")
	CHECK_LIBRARY_EXISTS("${SECURITY_LIBRARIES}" SSLCreateContext "Security/SecureTransport.h" SECURITY_HAS_SSLCREATECONTEXT)
ENDIF ()

IF (Security_FIND_REQUIRED AND NOT SECURITY_FOUND)
	MESSAGE(FATAL "-- Security not found")
ENDIF()

MARK_AS_ADVANCED(
	SECURITY_INCLUDE_DIR
	SECURITY_LIBRARIES
)
