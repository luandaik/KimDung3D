.class public Lcom/heitao/channel/HTChannel;
.super Lcom/heitao/channel/HTBaseChannel;
.source "HTChannel.java"


# instance fields
.field private mChannelKey:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/heitao/channel/HTBaseChannel;-><init>()V

    .line 36
    const-string v0, "hta"

    iput-object v0, p0, Lcom/heitao/channel/HTChannel;->mChannelKey:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected doCreateFuntionMenu(Z)V
    .locals 1
    .param p1, "isShow"    # Z

    .prologue
    .line 277
    invoke-static {}, Lcom/heitao/platform/api/HTPlatform;->getInstance()Lcom/heitao/platform/api/HTPlatform;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/api/HTPlatform;->showNewWindow()V

    .line 283
    return-void
.end method

.method public doExit()V
    .locals 0

    .prologue
    .line 267
    invoke-super {p0}, Lcom/heitao/channel/HTBaseChannel;->doExit()V

    .line 269
    invoke-virtual {p0}, Lcom/heitao/channel/HTChannel;->doGameExit()V

    .line 270
    return-void
.end method

.method public doLogin(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 130
    .local p1, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-super {p0, p1}, Lcom/heitao/channel/HTBaseChannel;->doLogin(Ljava/util/Map;)V

    .line 132
    invoke-static {}, Lcom/heitao/platform/api/HTPlatform;->getInstance()Lcom/heitao/platform/api/HTPlatform;

    move-result-object v0

    new-instance v1, Lcom/heitao/channel/HTChannel$2;

    invoke-direct {v1, p0}, Lcom/heitao/channel/HTChannel$2;-><init>(Lcom/heitao/channel/HTChannel;)V

    invoke-virtual {v0, v1}, Lcom/heitao/platform/api/HTPlatform;->doLogin(Lcom/heitao/platform/listener/HTPLoginListener;)V

    .line 160
    return-void
.end method

.method public doLogout(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 167
    .local p1, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-super {p0, p1}, Lcom/heitao/channel/HTBaseChannel;->doLogout(Ljava/util/Map;)V

    .line 168
    invoke-static {}, Lcom/heitao/platform/api/HTPlatform;->getInstance()Lcom/heitao/platform/api/HTPlatform;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/api/HTPlatform;->doLogout()V

    .line 169
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/heitao/channel/HTChannel;->doLogoutCompleted(Ljava/util/Map;)V

    .line 171
    return-void
.end method

.method public doPay(Lcom/heitao/model/HTPayInfo;)V
    .locals 5
    .param p1, "payInfo"    # Lcom/heitao/model/HTPayInfo;

    .prologue
    const/4 v4, 0x1

    .line 178
    invoke-super {p0, p1}, Lcom/heitao/channel/HTBaseChannel;->doPay(Lcom/heitao/model/HTPayInfo;)V

    .line 180
    sget-boolean v1, Lcom/heitao/common/HTConsts;->HTSDK_DEBUG:Z

    if-eqz v1, :cond_0

    .line 182
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5f53\u524d\u4e3aDebug\u6a21\u5f0f\uff0c\u9009\u62e9\u91d1\u989d\u4e3a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/channel/HTChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v2, v2, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v3, p0, Lcom/heitao/channel/HTChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v3, v3, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v3, v3

    mul-float/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u5143\uff0c"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u5b9e\u9645\u5145\u503c\u91d1\u989d\u4e3a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u5143\u3002"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/common/HTUtils;->doShowToast(Ljava/lang/String;)V

    .line 183
    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v1, Lcom/heitao/model/HTPayInfo;->price:F

    .line 184
    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iput v4, v1, Lcom/heitao/model/HTPayInfo;->count:I

    .line 187
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 188
    .local v0, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "psid"

    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mServerId:Ljava/lang/String;

    if-nez v1, :cond_1

    const-string v1, ""

    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    const-string v1, "uid"

    iget-object v2, p0, Lcom/heitao/channel/HTChannel;->mUser:Lcom/heitao/model/HTUser;

    iget-object v2, v2, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    const-string v1, "amount"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/heitao/channel/HTChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v3, v3, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v4, p0, Lcom/heitao/channel/HTChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v4, v4, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v4, v4

    mul-float/2addr v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const-string v1, "extinfo"

    iget-object v2, p1, Lcom/heitao/model/HTPayInfo;->cpExtendInfo:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const-string v1, "psname"

    iget-object v2, p0, Lcom/heitao/channel/HTChannel;->mServerName:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    const-string v1, "rolename"

    iget-object v2, p0, Lcom/heitao/channel/HTChannel;->mRoleName:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const-string v1, "level"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/heitao/channel/HTChannel;->mRoleLevel:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    const-string v1, "roleid"

    iget-object v2, p0, Lcom/heitao/channel/HTChannel;->mRoleId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    new-instance v1, Lcom/heitao/channel/HTChannel$3;

    invoke-direct {v1, p0, v0}, Lcom/heitao/channel/HTChannel$3;-><init>(Lcom/heitao/channel/HTChannel;Ljava/util/Map;)V

    invoke-virtual {p0, v1}, Lcom/heitao/channel/HTChannel;->doRunnableOnMainLooper(Ljava/lang/Runnable;)V

    .line 260
    return-void

    .line 188
    :cond_1
    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mServerId:Ljava/lang/String;

    goto :goto_0
.end method

.method public getChannelKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/heitao/channel/HTChannel;->mChannelKey:Ljava/lang/String;

    return-object v0
.end method

.method public getChannelSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    const-string v0, "3.0.0"

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 102
    invoke-super {p0, p1, p2, p3}, Lcom/heitao/channel/HTBaseChannel;->onActivityResult(IILandroid/content/Intent;)V

    .line 103
    return-void
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    new-instance v0, Lcom/heitao/common/HTSDKInfoReader;

    invoke-direct {v0}, Lcom/heitao/common/HTSDKInfoReader;-><init>()V

    invoke-virtual {v0, p1}, Lcom/heitao/common/HTSDKInfoReader;->getSDKInfoFromFile(Landroid/content/Context;)Lcom/heitao/model/HTSDKInfo;

    move-result-object v7

    .line 49
    .local v7, "mSDKInfo":Lcom/heitao/model/HTSDKInfo;
    iget-object v0, v7, Lcom/heitao/model/HTSDKInfo;->extendKey:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 51
    iget-object v0, v7, Lcom/heitao/model/HTSDKInfo;->extendKey:Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/channel/HTChannel;->mChannelKey:Ljava/lang/String;

    .line 54
    :cond_0
    invoke-super {p0, p1}, Lcom/heitao/channel/HTBaseChannel;->onCreate(Landroid/content/Context;)V

    .line 56
    invoke-static {}, Lcom/heitao/platform/api/HTPlatform;->getInstance()Lcom/heitao/platform/api/HTPlatform;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v2

    iget-object v2, v2, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    iget-object v2, v2, Lcom/heitao/model/HTGameInfo;->direction:Lcom/heitao/model/HTGameInfo$HTDirection;

    sget-object v3, Lcom/heitao/model/HTGameInfo$HTDirection;->Portrait:Lcom/heitao/model/HTGameInfo$HTDirection;

    if-ne v2, v3, :cond_1

    sget-object v2, Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;->Portrait:Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;

    :goto_0
    iget-object v3, v7, Lcom/heitao/model/HTSDKInfo;->appKey:Ljava/lang/String;

    iget-object v4, v7, Lcom/heitao/model/HTSDKInfo;->secretKey:Ljava/lang/String;

    iget-object v5, v7, Lcom/heitao/model/HTSDKInfo;->customChannelId:Ljava/lang/String;

    new-instance v6, Lcom/heitao/channel/HTChannel$1;

    invoke-direct {v6, p0}, Lcom/heitao/channel/HTChannel$1;-><init>(Lcom/heitao/channel/HTChannel;)V

    invoke-virtual/range {v0 .. v6}, Lcom/heitao/platform/api/HTPlatform;->init(Landroid/content/Context;Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/listener/HTPLogoutListener;)V

    .line 70
    sget-boolean v0, Lcom/heitao/common/HTConsts;->HTSDK_DEBUG:Z

    invoke-static {v0}, Lcom/heitao/platform/api/HTPlatform;->setDebugEnable(Z)V

    .line 71
    sget-boolean v0, Lcom/heitao/common/HTConsts;->HTSDK_DEBUG:Z

    invoke-static {v0}, Lcom/heitao/platform/api/HTPlatform;->setLogEnable(Z)V

    .line 72
    return-void

    .line 56
    :cond_1
    sget-object v2, Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;->Landscape:Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 91
    invoke-super {p0}, Lcom/heitao/channel/HTBaseChannel;->onDestroy()V

    .line 92
    invoke-static {}, Lcom/heitao/platform/api/HTPlatform;->getInstance()Lcom/heitao/platform/api/HTPlatform;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/api/HTPlatform;->onDestory()V

    .line 93
    return-void
.end method

.method public onEnterGame(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 290
    .local p1, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-super {p0, p1}, Lcom/heitao/channel/HTBaseChannel;->onEnterGame(Ljava/util/Map;)V

    .line 293
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 294
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "sid"

    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mServerId:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, ""

    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    const-string v2, "sname"

    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mServerName:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, ""

    :goto_1
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    const-string v2, "roleid"

    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mRoleId:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, ""

    :goto_2
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    const-string v2, "rolename"

    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mRoleName:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, ""

    :goto_3
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    const-string v1, "rolelevel"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/heitao/channel/HTChannel;->mRoleLevel:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    const-string v2, "isnew"

    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mIsNewRole:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, ""

    :goto_4
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    const-string v1, "uid"

    iget-object v2, p0, Lcom/heitao/channel/HTChannel;->mUser:Lcom/heitao/model/HTUser;

    iget-object v2, v2, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    const-string v1, "stat/role"

    invoke-static {v1, v0}, Lcom/heitao/platform/api/HTPlatform;->statistics(Ljava/lang/String;Ljava/util/Map;)V

    .line 303
    return-void

    .line 294
    :cond_0
    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mServerId:Ljava/lang/String;

    goto :goto_0

    .line 295
    :cond_1
    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mServerName:Ljava/lang/String;

    goto :goto_1

    .line 296
    :cond_2
    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mRoleId:Ljava/lang/String;

    goto :goto_2

    .line 297
    :cond_3
    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mRoleName:Ljava/lang/String;

    goto :goto_3

    .line 299
    :cond_4
    iget-object v1, p0, Lcom/heitao/channel/HTChannel;->mIsNewRole:Ljava/lang/String;

    goto :goto_4
.end method

.method public onGameLevelChanged(I)V
    .locals 0
    .param p1, "newLevel"    # I

    .prologue
    .line 310
    invoke-super {p0, p1}, Lcom/heitao/channel/HTBaseChannel;->onGameLevelChanged(I)V

    .line 311
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 76
    invoke-super {p0}, Lcom/heitao/channel/HTBaseChannel;->onPause()V

    .line 77
    return-void
.end method

.method public onRestart()V
    .locals 0

    .prologue
    .line 97
    invoke-super {p0}, Lcom/heitao/channel/HTBaseChannel;->onRestart()V

    .line 98
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 81
    invoke-super {p0}, Lcom/heitao/channel/HTBaseChannel;->onResume()V

    .line 82
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 86
    invoke-super {p0}, Lcom/heitao/channel/HTBaseChannel;->onStop()V

    .line 87
    return-void
.end method
