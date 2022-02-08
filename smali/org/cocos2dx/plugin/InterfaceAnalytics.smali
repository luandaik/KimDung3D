.class public interface abstract Lorg/cocos2dx/plugin/InterfaceAnalytics;
.super Ljava/lang/Object;
.source "InterfaceAnalytics.java"


# static fields
.field public static final PluginType:I = 0x2


# virtual methods
.method public abstract getPluginVersion()Ljava/lang/String;
.end method

.method public abstract getSDKVersion()Ljava/lang/String;
.end method

.method public abstract logError(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract logEvent(Ljava/lang/String;)V
.end method

.method public abstract logEvent(Ljava/lang/String;Ljava/util/Hashtable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract logTimedEventBegin(Ljava/lang/String;)V
.end method

.method public abstract logTimedEventEnd(Ljava/lang/String;)V
.end method

.method public abstract setCaptureUncaughtException(Z)V
.end method

.method public abstract setDebugMode(Z)V
.end method

.method public abstract setSessionContinueMillis(I)V
.end method

.method public abstract startSession(Ljava/lang/String;)V
.end method

.method public abstract stopSession()V
.end method
