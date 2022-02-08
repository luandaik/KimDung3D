.class public Lcom/tencent/apollo/ApolloVoiceDeviceMgr;
.super Landroid/telephony/PhoneStateListener;
.source "ApolloVoiceDeviceMgr.java"


# static fields
.field private static Instance:Lcom/tencent/apollo/ApolloVoiceDeviceMgr; = null

.field private static mCurrVoipState:Z = false

.field private static mHeadSetReceiver:Landroid/content/BroadcastReceiver; = null

.field protected static mIsOpenCommuntication:Z = false

.field protected static mSpeakerphoneOn:Z = false

.field private static mainActivity:Landroid/app/Activity; = null

.field private static mctx:Landroid/content/Context; = null

.field private static final tag:Ljava/lang/String; = "GCloudVoice"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 27
    :try_start_0
    const-string v0, "GCloudVoice"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    :goto_0
    sput-object v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    .line 38
    sput-object v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->Instance:Lcom/tencent/apollo/ApolloVoiceDeviceMgr;

    .line 39
    sput-object v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mainActivity:Landroid/app/Activity;

    .line 228
    sput-boolean v4, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    .line 229
    sput-boolean v3, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mIsOpenCommuntication:Z

    .line 230
    sput-boolean v3, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mCurrVoipState:Z

    .line 236
    new-instance v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr$1;

    invoke-direct {v0}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr$1;-><init>()V

    sput-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mHeadSetReceiver:Landroid/content/BroadcastReceiver;

    return-void

    .line 28
    :catch_0
    move-exception v0

    .line 30
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "load library GCloudVoice failed!!!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 31
    invoke-static {v4}, Ljava/lang/System;->exit(I)V

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    .line 42
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 43
    sput-object p1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    .line 45
    :cond_0
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 47
    const-string v1, "GCloudVoice"

    const-string v2, "jingle Listen Phone Call"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    const/16 v1, 0x20

    invoke-virtual {v0, p0, v1}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 49
    return-void
.end method

.method public static ApolloVoiceDeviceEnterVoipMode(I)V
    .locals 3

    .prologue
    .line 154
    const-string v0, "GCloudVoice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "apolloVoice ApolloVoiceDeviceEnterVoipMode nMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-nez v0, :cond_1

    .line 168
    :cond_0
    :goto_0
    return-void

    .line 157
    :cond_1
    if-lez p0, :cond_2

    .line 158
    const/4 v0, 0x1

    sput-boolean v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mIsOpenCommuntication:Z

    .line 162
    :goto_1
    sget-boolean v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mIsOpenCommuntication:Z

    if-eqz v0, :cond_0

    .line 163
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 165
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 166
    sget-boolean v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    goto :goto_0

    .line 160
    :cond_2
    const/4 v0, 0x0

    sput-boolean v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mIsOpenCommuntication:Z

    goto :goto_1
.end method

.method public static ApolloVoiceDeviceExitVoipMode()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 107
    const-string v0, "GCloudVoice"

    const-string v3, "apolloVoice ApolloVoiceDeviceExitVoipMode"

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-nez v0, :cond_1

    .line 123
    :cond_0
    :goto_0
    return-void

    .line 110
    :cond_1
    sget-boolean v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mIsOpenCommuntication:Z

    if-ne v1, v0, :cond_2

    .line 111
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    const-string v3, "audio"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 113
    if-eqz v0, :cond_0

    .line 115
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->setMode(I)V

    .line 116
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->IsHeadSet()Z

    move-result v3

    if-nez v3, :cond_3

    :goto_1
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 122
    :cond_2
    sput-boolean v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mIsOpenCommuntication:Z

    goto :goto_0

    :cond_3
    move v1, v2

    .line 116
    goto :goto_1
.end method

.method public static ApolloVoiceDeviceInit(Landroid/content/Context;Landroid/app/Activity;)V
    .locals 2

    .prologue
    .line 52
    const-string v0, "GCloudVoice"

    const-string v1, "GCloudVoice ApolloVoiceDeviceInit"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-eqz v0, :cond_1

    .line 77
    :cond_0
    :goto_0
    return-void

    .line 55
    :cond_1
    sput-object p0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    .line 57
    sput-object p1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mainActivity:Landroid/app/Activity;

    .line 59
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->registerHeadsetPlugReceiver()V

    .line 60
    sget-boolean v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mIsOpenCommuntication:Z

    if-eqz v0, :cond_2

    .line 61
    const-string v0, "audio"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 63
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 64
    sget-boolean v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 67
    :cond_2
    invoke-static {p0}, Lcom/tencent/apollo/ApolloVoiceConfig;->SetContext(Landroid/content/Context;)V

    .line 68
    invoke-static {p0}, Lcom/tencent/apollo/ApolloVoiceNetStatus;->SetContext(Landroid/content/Context;)V

    .line 70
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->Instance:Lcom/tencent/apollo/ApolloVoiceDeviceMgr;

    if-nez v0, :cond_0

    .line 71
    const-string v0, "GCloudVoice"

    const-string v1, "new DeviceMgr!!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    new-instance v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;

    invoke-direct {v0, p0}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->Instance:Lcom/tencent/apollo/ApolloVoiceDeviceMgr;

    .line 73
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->Instance:Lcom/tencent/apollo/ApolloVoiceDeviceMgr;

    if-eqz v0, :cond_0

    .line 74
    const-string v0, "GCloudVoice"

    const-string v1, "ApolloVoiceDeviceMgr Init Succ!!!!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static ApolloVoiceDeviceRefresh()V
    .locals 2

    .prologue
    .line 91
    const-string v0, "GCloudVoice"

    const-string v1, "apolloVoice ApolloVoiceDeviceRefresh"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-nez v0, :cond_1

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 94
    :cond_1
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 96
    if-eqz v0, :cond_0

    .line 98
    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v1

    .line 101
    if-nez v1, :cond_2

    const/4 v1, 0x1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static ApolloVoiceDeviceUninit()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 80
    sput-object v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mainActivity:Landroid/app/Activity;

    .line 81
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 82
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->unregisterHeadsetPlugReceiver()V

    .line 83
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 85
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 86
    sput-object v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    .line 88
    :cond_0
    return-void
.end method

.method public static ApolloVoiceGetCurrMode()I
    .locals 2

    .prologue
    .line 144
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 146
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 148
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result v0

    .line 150
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x2

    goto :goto_0
.end method

.method public static HaveMicrophonePermission()Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 309
    sget-object v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-nez v2, :cond_0

    .line 337
    :goto_0
    return v0

    .line 322
    :cond_0
    const-string v2, "GCloudVoice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "buildVersion = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v2, v3, :cond_2

    .line 325
    sget-object v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    const-string v3, "android.permission.RECORD_AUDIO"

    invoke-static {v2, v3}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_1

    .line 328
    const-string v2, "GCloudVoice"

    const-string v3, "No microphone permission"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    sget-object v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mainActivity:Landroid/app/Activity;

    new-array v1, v1, [Ljava/lang/String;

    const-string v3, "android.permission.RECORD_AUDIO"

    aput-object v3, v1, v0

    const/16 v3, 0x64

    invoke-static {v2, v1, v3}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_0

    .line 332
    :cond_1
    const-string v0, "GCloudVoice"

    const-string v2, "Hava microphone permission"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 333
    goto :goto_0

    :cond_2
    move v0, v1

    .line 337
    goto :goto_0
.end method

.method private static IsHeadSet()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 126
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-eqz v0, :cond_1

    .line 128
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    const-string v2, "audio"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 130
    if-nez v0, :cond_0

    move v0, v1

    .line 140
    :goto_0
    return v0

    .line 134
    :cond_0
    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v0

    .line 135
    if-eqz v0, :cond_1

    .line 136
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    .line 140
    goto :goto_0
.end method

.method public static SetpreVoipMode(I)V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 233
    if-ne p0, v0, :cond_0

    :goto_0
    sput-boolean v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mCurrVoipState:Z

    .line 234
    return-void

    .line 233
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic access$000()Landroid/content/Context;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100()Z
    .locals 1

    .prologue
    .line 22
    sget-boolean v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mCurrVoipState:Z

    return v0
.end method

.method static synthetic access$200()Z
    .locals 1

    .prologue
    .line 22
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->IsHeadSet()Z

    move-result v0

    return v0
.end method

.method private static registerHeadsetPlugReceiver()V
    .locals 4

    .prologue
    .line 210
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 226
    :goto_0
    return-void

    .line 213
    :cond_0
    :try_start_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 214
    const-string v1, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 215
    sget-object v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    sget-object v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mHeadSetReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 218
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 220
    sget-object v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    sget-object v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mHeadSetReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 221
    :catch_0
    move-exception v0

    .line 222
    const-string v1, "GCloudVoice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Registe headset failed!!! The exception is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static unregisterHeadsetPlugReceiver()V
    .locals 4

    .prologue
    .line 197
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 207
    :goto_0
    return-void

    .line 200
    :cond_0
    :try_start_0
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    sget-object v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mHeadSetReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 201
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    sget-object v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mHeadSetReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 202
    :catch_0
    move-exception v0

    .line 203
    const-string v1, "GCloudVoice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Registe headset failed!!! The exception is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 4

    .prologue
    .line 172
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 194
    :goto_0
    return-void

    .line 174
    :cond_0
    const-string v0, "GCloudVoice"

    const-string v1, "onCallStateChanged Begin"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mctx:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 178
    invoke-super {p0, p1, p2}, Landroid/telephony/PhoneStateListener;->onCallStateChanged(ILjava/lang/String;)V

    .line 179
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 181
    :pswitch_0
    const-string v1, "GCloudVoice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "jingle phone state idle, the speaker mode is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-boolean v3, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    sget-boolean v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 184
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceEngine;->Resume()I

    goto :goto_0

    .line 187
    :pswitch_1
    const-string v0, "GCloudVoice"

    const-string v1, "jingle phone state listening"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 190
    :pswitch_2
    const-string v0, "GCloudVoice"

    const-string v1, "jingle phone state coming call"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceEngine;->Pause()I

    goto :goto_0

    .line 179
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
