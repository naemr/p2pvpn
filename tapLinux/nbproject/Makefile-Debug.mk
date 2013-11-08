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
CC=gcc
CCC=
CXX=
FC=

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=build/Debug/GNU-Linux-x86

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/org_p2pvpn_tuntap_TunTapLinux.o

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
.build-conf: ${BUILD_SUBPROJECTS} dist/Debug/GNU-Linux-x86/libTunTapLinux.so

dist/Debug/GNU-Linux-x86/libTunTapLinux.so: ${OBJECTFILES}
	${MKDIR} -p dist/Debug/GNU-Linux-x86
	${LINK.c} -shared -o dist/Debug/GNU-Linux-x86/libTunTapLinux.so -fPIC ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/org_p2pvpn_tuntap_TunTapLinux.o: org_p2pvpn_tuntap_TunTapLinux.c 
	${MKDIR} -p ${OBJECTDIR}
	$(COMPILE.c) -g -I/usr/lib/jvm/java-6-sun-1.6.0.07/include/linux -I/usr/lib/jvm/java-6-sun-1.6.0.07/include -I/usr/lib/jvm/java-6-sun-1.6.0.03/include/linux -I/usr/lib/jvm/java-6-sun-1.6.0.03/include -fPIC  -o ${OBJECTDIR}/org_p2pvpn_tuntap_TunTapLinux.o org_p2pvpn_tuntap_TunTapLinux.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/Debug
	${RM} dist/Debug/GNU-Linux-x86/libTunTapLinux.so

# Subprojects
.clean-subprojects:
