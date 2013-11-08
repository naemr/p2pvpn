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
OBJECTDIR=build/Debug/Cygwin-Windows

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/org_p2pvpn_tuntap_TunTapWindows.o

# C Compiler Flags
CFLAGS=-mno-cygwin -Wl,--add-stdcall-alias -shared -m32

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS} dist/Debug/Cygwin-Windows/libTunTapWindows.dll

dist/Debug/Cygwin-Windows/libTunTapWindows.dll: ${OBJECTFILES}
	${MKDIR} -p dist/Debug/Cygwin-Windows
	${LINK.c} -mno-cygwin -shared -o dist/Debug/Cygwin-Windows/libTunTapWindows.dll -fPIC ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/org_p2pvpn_tuntap_TunTapWindows.o: org_p2pvpn_tuntap_TunTapWindows.c 
	${MKDIR} -p ${OBJECTDIR}
	$(COMPILE.c) -g -IC\:/Programme/Java/jdk1.6.0_07/include -IC\:/Programme/Java/jdk1.6.0_07/include/win32 -fPIC  -o ${OBJECTDIR}/org_p2pvpn_tuntap_TunTapWindows.o org_p2pvpn_tuntap_TunTapWindows.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/Debug
	${RM} dist/Debug/Cygwin-Windows/libTunTapWindows.dll

# Subprojects
.clean-subprojects:
