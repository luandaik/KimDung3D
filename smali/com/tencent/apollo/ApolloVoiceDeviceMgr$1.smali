.class final Lcom/tencent/apollo/ApolloVoiceDeviceMgr$1;
.super Landroid/content/BroadcastReceiver;
.source "ApolloVoiceDeviceMgr.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/apollo/ApolloVoiceDeviceMgr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 236
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 241
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v3, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 243
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 244
    invoke-virtual {v0, v1}, Landroid/bluetooth/BluetoothAdapter;->getProfileConnectionState(I)I

    move-result v0

    if-nez v0, :cond_1

    .line 246
    sput-boolean v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    .line 252
    :goto_0
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->access$000()Landroid/content/Context;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 254
    sget-boolean v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 257
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BroadcastReceiver BluetoothAdapter onReceive bSetValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-boolean v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 259
    const-string v1, "framework"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    :cond_0
    :goto_1
    return-void

    .line 248
    :cond_1
    sput-boolean v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    goto :goto_0

    .line 260
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v3, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->ApolloVoiceGetCurrMode()I

    move-result v0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_4

    move v0, v1

    .line 263
    :goto_2
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceEngine;->GetHeadsetVoipState()Z

    move-result v3

    .line 264
    const-string v4, "HeadSet Callback"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "HeadSet_Plug!!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    const-string v4, "state"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 266
    const-string v4, "state"

    const/4 v5, -0x1

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 267
    packed-switch v4, :pswitch_data_0

    .line 289
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->access$200()Z

    move-result v0

    if-nez v0, :cond_5

    :goto_3
    sput-boolean v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    .line 293
    :cond_3
    :goto_4
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->access$000()Landroid/content/Context;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 295
    sget-boolean v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 298
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BroadcastReceiver ACTION_HEADSET_PLUG onReceive bSetValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-boolean v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 300
    const-string v1, "framework"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_4
    move v0, v2

    .line 261
    goto :goto_2

    .line 269
    :pswitch_0
    sput-boolean v1, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    .line 270
    const-string v0, "HeadSet Callback"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ACTION_HEADSET_PLUG Out! The currVoip Mode Should Be "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->access$100()Z

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    if-eqz v3, :cond_3

    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->access$100()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 274
    invoke-static {v1}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->ApolloVoiceDeviceEnterVoipMode(I)V

    goto :goto_4

    .line 279
    :pswitch_1
    sput-boolean v2, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->mSpeakerphoneOn:Z

    .line 280
    const-string v1, "HeadSet Callback"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACTION_HEADSET_PLUG In! The currVoip Mode is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    if-eqz v0, :cond_3

    .line 284
    invoke-static {}, Lcom/tencent/apollo/ApolloVoiceDeviceMgr;->ApolloVoiceDeviceExitVoipMode()V

    goto :goto_4

    :cond_5
    move v1, v2

    .line 289
    goto :goto_3

    .line 267
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
