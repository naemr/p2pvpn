#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <sys/socket.h>
#include <linux/ioctl.h>
#include <linux/if.h>
#include <linux/if_tun.h>

#include <jni.h>
#include "org_p2pvpn_tuntap_TunTapLinux.h"

void setFdDev(JNIEnv *env, jobject this, int fd, char* dev) {
    jfieldID jfd, jdev; 
    jclass jclass; 
    jstring jstr;
    
    jclass = (*env)->GetObjectClass(env, this); 
    
    jfd = (*env)->GetFieldID(env, jclass, "fd", "I"); 
    (*env)->SetIntField(env, this, jfd , fd);
    
    jstr = (*env)->NewStringUTF(env, dev);
    jdev = (*env)->GetFieldID(env, jclass, "dev", "Ljava/lang/String;"); 
    (*env)->SetObjectField(env, this, jdev , jstr);
}

int getFd(JNIEnv *env, jobject this) {
    jfieldID jfd; 
    jclass jclass; 

    jclass = (*env)->GetObjectClass(env, this); 
    
    jfd = (*env)->GetFieldID(env, jclass, "fd", "I"); 
    return (*env)->GetIntField(env, this, jfd);
}

/*
 * Class:     jtuntap_TunTap
 * Method:    openTun
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_org_p2pvpn_tuntap_TunTapLinux_openTun(JNIEnv *env, jobject this) {
    struct ifreq ifr;
    int fd;
    
    if ((fd = open("/dev/net/tun", O_RDWR)) < 0) {
        printf("error: open\n");
        return 1;
    }
    
    memset(&ifr, 0, sizeof(ifr));
    
    ifr.ifr_flags = IFF_TAP | IFF_NO_PI;
    
    if (ioctl(fd, TUNSETIFF, (void*)&ifr) < 0) {
        close(fd);
        printf("error: ioctl\n");
        return 1;
    }
    
    setFdDev(env, this, fd, ifr.ifr_name);
    
    return 0;
}

/*
 * Class:     jtuntap_TunTap
 * Method:    close
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_org_p2pvpn_tuntap_TunTapLinux_close(JNIEnv *env, jobject this) {
    close(getFd(env, this));
}

/*
 * Class:     jtuntap_TunTap
 * Method:    write
 * Signature: ([BI)V
 */
JNIEXPORT void JNICALL Java_org_p2pvpn_tuntap_TunTapLinux_write(JNIEnv *env, jobject this, jbyteArray jb, jint len) {
    int fd;
    jbyte *b;
    
    fd = getFd(env, this);
    b = (*env)->GetByteArrayElements(env, jb, NULL);
    
    write(fd, b, len);
    
    (*env)->ReleaseByteArrayElements(env, jb, b, JNI_ABORT);
}

/*
 * Class:     jtuntap_TunTap
 * Method:    read
 * Signature: ([B)I
 */
JNIEXPORT jint JNICALL Java_org_p2pvpn_tuntap_TunTapLinux_read(JNIEnv *env, jobject this, jbyteArray jb) {
    int fd;
    jbyte *b;
    int len;
    
    fd = getFd(env, this);
    b = (*env)->GetByteArrayElements(env, jb, NULL);
    
    len = read(fd, b, (*env)->GetArrayLength(env, jb));
    
    (*env)->ReleaseByteArrayElements(env, jb, b, 0);
    return len;
}
