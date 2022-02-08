.class public Lcom/tencent/gcloud/voice/GCloudVoiceEngine;
.super Ljava/lang/Object;
.source "GCloudVoiceEngine.java"


# static fields
.field private static _instance:Lcom/tencent/gcloud/voice/GCloudVoiceEngine;


# instance fields
.field private appContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const-string v0, "GCloudVoice"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/tencent/gcloud/voice/GCloudVoiceEngine;->appContext:Landroid/content/Context;

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/tencent/gcloud/voice/GCloudVoiceEngine;
    .locals 2

    .prologue
    .line 20
    const-class v1, Lcom/tencent/gcloud/voice/GCloudVoiceEngine;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/tencent/gcloud/voice/GCloudVoiceEngine;->_instance:Lcom/tencent/gcloud/voice/GCloudVoiceEngine;

    if-nez v0, :cond_0

    .line 21
    new-instance v0, Lcom/tencent/gcloud/voice/GCloudVoiceEngine;

    invoke-direct {v0}, Lcom/tencent/gcloud/voice/GCloudVoiceEngine;-><init>()V

    sput-object v0, Lcom/tencent/gcloud/voice/GCloudVoiceEngine;->_instance:Lcom/tencent/gcloud/voice/GCloudVoiceEngine;

    .line 23
    :cond_0
    sget-object v0, Lcom/tencent/gcloud/voice/GCloudVoiceEngine;->_instance:Lcom/tencent/gcloud/voice/GCloudVoiceEngine;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 20
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public init(Landroid/content/Context;Landroid/app/Activity;)I
    .locals 1

    .prologue
    .line 30
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 31
    :cond_0
    const/4 v0, -0x1

    .line 36
    :goto_0
    return v0

    .line 34
    :cond_1
    iput-object p1, p0, Lcom/tencent/gcloud/voice/GCloudVoiceEngine;->appContext:Landroid/content/Context;

    .line 35
    invoke-static {p1, p2}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->ApolloVoiceDeviceInit(Landroid/content/Context;Landroid/app/Activity;)V

    .line 36
    const/4 v0, 0x0

    goto :goto_0
.end method
