#
# Gererated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc.exe
CCC=g++.exe
CXX=g++.exe
FC=

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=build/Release/Cygwin-Windows

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/org_p2pvpn_tuntap_TunTapWindows.o

# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS} dist/Release/Cygwin-Windows/libtrunk.dll

dist/Release/Cygwin-Windows/libtrunk.dll: ${OBJECTFILES}
	${MKDIR} -p dist/Release/Cygwin-Windows
	${LINK.c} -mno-cygwin -shared -o dist/Release/Cygwin-Windows/libtrunk.dll -fPIC ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/org_p2pvpn_tuntap_TunTapWindows.o: org_p2pvpn_tuntap_TunTapWindows.c 
	${MKDIR} -p ${OBJECTDIR}
	$(COMPILE.c) -O2 -fPIC  -o ${OBJECTDIR}/org_p2pvpn_tuntap_TunTapWindows.o org_p2pvpn_tuntap_TunTapWindows.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/Release
	${RM} dist/Release/Cygwin-Windows/libtrunk.dll

# Subprojects
.clean-subprojects:
