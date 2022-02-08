.class public Lcom/tencent/apollo/ApolloVoiceEngine;
.super Ljava/lang/Object;
.source "ApolloVoiceEngine.java"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 8
    :try_start_0
    const-string v0, "GCloudVoice"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    :goto_0
    return-void

    .line 9
    :catch_0
    move-exception v0

    .line 11
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "load library GCloudVoice failed!!!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 12
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final native GetHeadsetVoipState()Z
.end method

.method public static final native Pause()I
.end method

.method public static final native Resume()I
.end method
