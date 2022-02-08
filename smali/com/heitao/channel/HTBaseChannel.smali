.class public Lcom/heitao/channel/HTBaseChannel;
.super Lcom/heitao/channel/HTChannelDispose;
.source "HTBaseChannel.java"


# instance fields
.field protected mContext:Landroid/content/Context;

.field protected mEnterGameParsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mIsLogined:Z

.field protected mIsNewRole:Ljava/lang/String;

.field protected mIsShowFunctionMenu:Z

.field protected mLoginCustomMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mLogoutCustomMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mPayInfo:Lcom/heitao/model/HTPayInfo;

.field protected mRoleId:Ljava/lang/String;

.field protected mRoleLevel:I

.field protected mRoleName:Ljava/lang/String;

.field protected mSDKInfo:Lcom/heitao/model/HTSDKInfo;

.field protected mServerId:Ljava/lang/String;

.field protected mServerName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 29
    invoke-direct {p0}, Lcom/heitao/channel/HTChannelDispose;-><init>()V

    .line 31
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mContext:Landroid/content/Context;

    .line 34
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mLoginCustomMap:Ljava/util/Map;

    .line 36
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mLogoutCustomMap:Ljava/util/Map;

    .line 38
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/heitao/channel/HTBaseChannel;->mIsShowFunctionMenu:Z

    .line 48
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mServerId:Ljava/lang/String;

    .line 50
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mServerName:Ljava/lang/String;

    .line 52
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleName:Ljava/lang/String;

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/heitao/channel/HTBaseChannel;->mIsLogined:Z

    .line 58
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mSDKInfo:Lcom/heitao/model/HTSDKInfo;

    return-void
.end method


# virtual methods
.method public doAntiAddictionQuery()V
    .locals 2

    .prologue
    .line 516
    const-string v0, "doAntiAddictionQuery=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 518
    const/4 v0, 0x1

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v1

    iget v1, v1, Lcom/heitao/common/HTDataCenter;->mIsAntiAddiction:I

    if-ne v0, v1, :cond_0

    .line 521
    invoke-virtual {p0}, Lcom/heitao/channel/HTBaseChannel;->onAntiAddictionQuery()V

    .line 527
    :goto_0
    return-void

    .line 525
    :cond_0
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/heitao/channel/HTBaseChannel;->doAntiAddictionQueryCompleted(I)V

    goto :goto_0
.end method

.method protected doAntiAddictionQueryCompleted(I)V
    .locals 4
    .param p1, "result"    # I

    .prologue
    .line 539
    invoke-super {p0, p1}, Lcom/heitao/channel/HTChannelDispose;->doAntiAddictionQueryCompleted(I)V

    .line 541
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v2

    iget v2, v2, Lcom/heitao/common/HTDataCenter;->mIsAntiAddiction:I

    if-ne v1, v2, :cond_0

    .line 544
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 545
    .local v0, "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "uid"

    iget-object v2, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    iget-object v2, v2, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    const-string v1, "is_adult"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    new-instance v1, Lcom/heitao/request/HTStatistics;

    invoke-direct {v1}, Lcom/heitao/request/HTStatistics;-><init>()V

    const-string v2, "certification"

    invoke-virtual {v1, v2, v0}, Lcom/heitao/request/HTStatistics;->doSendData(Ljava/lang/String;Ljava/util/Map;)V

    .line 550
    .end local v0    # "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-void
.end method

.method protected doClear()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 567
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    .line 568
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mSDKCustomMap:Ljava/util/Map;

    .line 570
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mLoginCustomMap:Ljava/util/Map;

    .line 571
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mLogoutCustomMap:Ljava/util/Map;

    .line 572
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mEnterGameParsMap:Ljava/util/Map;

    .line 574
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    .line 576
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleId:Ljava/lang/String;

    .line 577
    const/4 v0, 0x0

    iput v0, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleLevel:I

    .line 578
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleName:Ljava/lang/String;

    .line 579
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mIsNewRole:Ljava/lang/String;

    .line 580
    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mServerId:Ljava/lang/String;

    .line 581
    return-void
.end method

.method protected doCreateFuntionMenu(Z)V
    .locals 0
    .param p1, "isShow"    # Z

    .prologue
    .line 360
    return-void
.end method

.method public doExit()V
    .locals 1

    .prologue
    .line 334
    const-string v0, "doExit=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 336
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->doExit()V

    .line 337
    return-void
.end method

.method public doLogin(Ljava/util/Map;)V
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
    .line 210
    .local p1, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "doLogin=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 211
    if-eqz p1, :cond_0

    .line 213
    iput-object p1, p0, Lcom/heitao/channel/HTBaseChannel;->mLoginCustomMap:Ljava/util/Map;

    .line 216
    :cond_0
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->doLogin()V

    .line 217
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
    .line 224
    .local p1, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "doLogout=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 225
    if-eqz p1, :cond_0

    .line 227
    iput-object p1, p0, Lcom/heitao/channel/HTBaseChannel;->mLogoutCustomMap:Ljava/util/Map;

    .line 230
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/heitao/channel/HTBaseChannel;->mIsLogined:Z

    .line 233
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->doLogout()V

    .line 234
    return-void
.end method

.method public doPay(Lcom/heitao/model/HTPayInfo;)V
    .locals 7
    .param p1, "payInfo"    # Lcom/heitao/model/HTPayInfo;

    .prologue
    .line 241
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    if-nez v3, :cond_0

    .line 243
    const-string v3, "\u672a\u767b\u5f55\u72b6\u6001\u4e0d\u80fd\u8fdb\u884c\u652f\u4ed8"

    invoke-static {v3}, Lcom/heitao/common/HTUtils;->doShowToast(Ljava/lang/String;)V

    .line 246
    :cond_0
    if-eqz p1, :cond_5

    .line 248
    iput-object p1, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    .line 251
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "http://smi.heitao.com/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v5

    iget-object v5, v5, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    iget-object v5, v5, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/pay/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/heitao/channel/HTBaseChannel;->getChannelKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->callbackUrl:Ljava/lang/String;

    .line 253
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v3, v3, Lcom/heitao/model/HTPayInfo;->rate:I

    if-gtz v3, :cond_1

    .line 255
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    const/16 v4, 0xa

    iput v4, v3, Lcom/heitao/model/HTPayInfo;->rate:I

    .line 258
    :cond_1
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget-object v3, v3, Lcom/heitao/model/HTPayInfo;->productId:Ljava/lang/String;

    invoke-static {v3}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 260
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v5

    iget-object v5, v5, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    iget-object v5, v5, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v5, v5, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v6, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v6, v6, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->productId:Ljava/lang/String;

    .line 263
    :cond_2
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget-object v3, v3, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    invoke-static {v3}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 265
    const/4 v2, 0x0

    .line 268
    .local v2, "payType":I
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget-object v3, v3, Lcom/heitao/model/HTPayInfo;->custom:Ljava/lang/String;

    invoke-direct {v0, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 269
    .local v0, "customJsonObject":Lorg/json/JSONObject;
    const-string v3, "is_pay_month"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 278
    .end local v0    # "customJsonObject":Lorg/json/JSONObject;
    :goto_0
    if-eqz v2, :cond_3

    .line 280
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget-object v5, v5, Lcom/heitao/model/HTPayInfo;->productId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->productId:Ljava/lang/String;

    .line 284
    :cond_3
    packed-switch v2, :pswitch_data_0

    .line 318
    .end local v2    # "payType":I
    :cond_4
    :goto_1
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget-object v3, v3, Lcom/heitao/model/HTPayInfo;->description:Ljava/lang/String;

    invoke-static {v3}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 320
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u8d2d\u4e70"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget-object v5, v5, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->description:Ljava/lang/String;

    .line 324
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "doPay=>\tpayInfo="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/heitao/model/HTPayInfo;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 326
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v3

    iget-object v3, v3, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    iget-object v4, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    invoke-interface {v3, v4}, Lcom/heitao/extension/HTExtensionApi;->doPay(Lcom/heitao/model/HTPayInfo;)V

    .line 327
    return-void

    .line 271
    .restart local v2    # "payType":I
    :catch_0
    move-exception v1

    .line 274
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 275
    const/4 v2, 0x0

    goto :goto_0

    .line 287
    .end local v1    # "e":Lorg/json/JSONException;
    :pswitch_0
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v5, v5, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v6, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v6, v6, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    iget-object v6, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v6, v6, Lcom/heitao/model/HTPayInfo;->rate:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget-object v5, v5, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    goto :goto_1

    .line 290
    :pswitch_1
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v5, v5, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v6, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v6, v6, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\u5143\u6708\u5361"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    .line 291
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    const-string v4, "\u6708\u5361"

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    goto/16 :goto_1

    .line 294
    :pswitch_2
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v5, v5, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v6, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v6, v6, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\u5143\u5468\u5361"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    .line 295
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    const-string v4, "\u5468\u5361"

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    goto/16 :goto_1

    .line 298
    :pswitch_3
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v5, v5, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v6, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v6, v6, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\u5143\u5b63\u5361"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    .line 299
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    const-string v4, "\u5b63\u5361"

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    goto/16 :goto_1

    .line 302
    :pswitch_4
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v5, v5, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v6, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v6, v6, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\u5143\u5e74\u5361"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    .line 303
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    const-string v4, "\u5e74\u5361"

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    goto/16 :goto_1

    .line 306
    :pswitch_5
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v5, v5, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v6, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v6, v6, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\u5143\u7ec8\u8eab\u5361"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    .line 307
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    const-string v4, "\u7ec8\u8eab\u5361"

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    goto/16 :goto_1

    .line 310
    :pswitch_6
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v5, v5, Lcom/heitao/model/HTPayInfo;->price:F

    iget-object v6, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    iget v6, v6, Lcom/heitao/model/HTPayInfo;->count:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\u5143\u798f\u5229"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    .line 311
    iget-object v3, p0, Lcom/heitao/channel/HTBaseChannel;->mPayInfo:Lcom/heitao/model/HTPayInfo;

    const-string v4, "\u798f\u5229"

    iput-object v4, v3, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    goto/16 :goto_1

    .line 284
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public doRealNameRegister()V
    .locals 1

    .prologue
    .line 508
    const-string v0, "doRealNameRegister=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 509
    return-void
.end method

.method protected doRunnableOnMainLooper(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 559
    iget-object v0, p0, Lcom/heitao/channel/HTBaseChannel;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 560
    return-void
.end method

.method public doSendData(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 466
    .local p2, "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 468
    :cond_0
    new-instance p2, Ljava/util/HashMap;

    .end local p2    # "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 471
    .restart local p2    # "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    const-string v0, "psid"

    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mServerId:Ljava/lang/String;

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    const-string v0, "psname"

    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mServerName:Ljava/lang/String;

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    const-string v1, "uid"

    iget-object v0, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    if-nez v0, :cond_2

    const-string v0, ""

    :goto_0
    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    const-string v1, "puid"

    iget-object v0, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    if-nez v0, :cond_3

    const-string v0, ""

    :goto_1
    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    const-string v0, "rolename"

    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleName:Ljava/lang/String;

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    const-string v0, "roleid"

    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleId:Ljava/lang/String;

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    new-instance v0, Lcom/heitao/request/HTStatistics;

    invoke-direct {v0}, Lcom/heitao/request/HTStatistics;-><init>()V

    invoke-virtual {v0, p1, p2}, Lcom/heitao/request/HTStatistics;->doSendData(Ljava/lang/String;Ljava/util/Map;)V

    .line 479
    return-void

    .line 473
    :cond_2
    iget-object v0, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    iget-object v0, v0, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    goto :goto_0

    .line 474
    :cond_3
    iget-object v0, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    iget-object v0, v0, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    goto :goto_1
.end method

.method public getChannelKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 191
    const-string v0, "getChannelKey=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 192
    const-string v0, "base"

    return-object v0
.end method

.method public getChannelSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 201
    const-string v0, "getChannelSDKVersion=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 202
    const-string v0, "base"

    return-object v0
.end method

.method public isLogined()Z
    .locals 1

    .prologue
    .line 439
    const-string v0, "isLogined=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 440
    iget-object v0, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 165
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onActivityResult=> requestCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\tresultCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 166
    return-void
.end method

.method protected onAntiAddictionQuery()V
    .locals 1

    .prologue
    .line 531
    const-string v0, "\u91cd\u5199onAntiAddictionQuery\u8bf7\u52ff\u8c03\u7528super\uff0c\u4e0d\u91cd\u5199\u9ed8\u8ba4\u8fd4\u56de\u5df2\u6210\u5e74"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 532
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/heitao/channel/HTBaseChannel;->doAntiAddictionQueryCompleted(I)V

    .line 533
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onConfigurationChanged=> newConfig="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 171
    return-void
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/heitao/channel/HTBaseChannel;->mContext:Landroid/content/Context;

    .line 65
    const-string v4, "onCreate=>"

    invoke-static {v4}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 67
    new-instance v3, Lcom/heitao/common/HTSDKInfoReader;

    invoke-direct {v3}, Lcom/heitao/common/HTSDKInfoReader;-><init>()V

    .line 68
    .local v3, "sdInfoReader":Lcom/heitao/common/HTSDKInfoReader;
    invoke-virtual {v3, p1}, Lcom/heitao/common/HTSDKInfoReader;->getSDKInfoFromFile(Landroid/content/Context;)Lcom/heitao/model/HTSDKInfo;

    move-result-object v4

    iput-object v4, p0, Lcom/heitao/channel/HTBaseChannel;->mSDKInfo:Lcom/heitao/model/HTSDKInfo;

    .line 70
    iget-object v4, p0, Lcom/heitao/channel/HTBaseChannel;->mSDKInfo:Lcom/heitao/model/HTSDKInfo;

    if-nez v4, :cond_2

    .line 72
    const-string v4, "\u8bfb\u53d6SDK\u914d\u7f6e\u4fe1\u606f\u5931\u8d25\uff0c\u5982\u679c\u914d\u7f6e\u4fe1\u606f\u4f4d\u4e8emanifest\u6587\u4ef6\u8bf7\u5ffd\u7565\uff0c\u5426\u5219\u5c06\u5bfc\u81f4\u7a0b\u5e8f\u65e0\u6cd5\u6b63\u5e38\u8fd0\u884c"

    invoke-static {v4}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 82
    :goto_0
    :try_start_0
    iget-object v4, p0, Lcom/heitao/channel/HTBaseChannel;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x80

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 83
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v4, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v5, "ht_proxy_join_model"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 84
    .local v2, "joinModel":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 86
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, "origin"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 88
    sget-object v4, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->orinigModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    iput-object v4, p0, Lcom/heitao/channel/HTBaseChannel;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    .line 100
    :cond_0
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u63a5\u5165\u6a21\u5f0f="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "joinModel":Ljava/lang/String;
    :goto_2
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v4

    iget-object v4, v4, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v4, p1}, Lcom/heitao/extension/HTExtensionApi;->onCreate(Landroid/content/Context;)V

    .line 113
    new-instance v4, Lcom/heitao/request/HTStatistics;

    invoke-direct {v4}, Lcom/heitao/request/HTStatistics;-><init>()V

    const-string v5, "init"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lcom/heitao/request/HTStatistics;->doSendData(Ljava/lang/String;Ljava/util/Map;)V

    .line 115
    sget-boolean v4, Lcom/heitao/common/HTConsts;->HTSDK_DEBUG:Z

    if-eqz v4, :cond_1

    .line 117
    const-string v4, "\u73b0\u5728\u6b63\u5728\u4f7f\u7528\u8c03\u8bd5\u6a21\u5f0f"

    invoke-static {v4}, Lcom/heitao/common/HTUtils;->doShowToast(Ljava/lang/String;)V

    .line 119
    :cond_1
    return-void

    .line 76
    :cond_2
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v4

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mSDKInfo:Lcom/heitao/model/HTSDKInfo;

    iput-object v5, v4, Lcom/heitao/common/HTDataCenter;->mSDKInfo:Lcom/heitao/model/HTSDKInfo;

    .line 77
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SDKInfo="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/heitao/channel/HTBaseChannel;->mSDKInfo:Lcom/heitao/model/HTSDKInfo;

    invoke-virtual {v5}, Lcom/heitao/model/HTSDKInfo;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 90
    .restart local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v2    # "joinModel":Ljava/lang/String;
    :cond_3
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, "native"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 92
    sget-object v4, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->nativeModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    iput-object v4, p0, Lcom/heitao/channel/HTBaseChannel;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 102
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "joinModel":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 105
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 107
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u89e3\u6790\u63a5\u5165\u6a21\u5f0f\u5f02\u5e38\uff0cerror="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 108
    sget-object v4, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->orinigModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    iput-object v4, p0, Lcom/heitao/channel/HTBaseChannel;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    goto :goto_2

    .line 94
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v2    # "joinModel":Ljava/lang/String;
    :cond_4
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, "origin|native"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 96
    sget-object v4, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->bothModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    iput-object v4, p0, Lcom/heitao/channel/HTBaseChannel;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 151
    const-string v0, "onDestroy=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 153
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->onDestroy()V

    .line 154
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
    .local p1, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v3, 0x1

    .line 367
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onEnterGame=>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 368
    iput-object p1, p0, Lcom/heitao/channel/HTBaseChannel;->mEnterGameParsMap:Ljava/util/Map;

    .line 370
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mEnterGameParsMap:Ljava/util/Map;

    if-eqz v1, :cond_0

    .line 372
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mEnterGameParsMap:Ljava/util/Map;

    const-string v2, "cp_server_id"

    invoke-static {v1, v2}, Lcom/heitao/common/HTMapHelper;->getString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mServerId:Ljava/lang/String;

    .line 373
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mEnterGameParsMap:Ljava/util/Map;

    const-string v2, "cp_server_name"

    invoke-static {v1, v2}, Lcom/heitao/common/HTMapHelper;->getString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mServerName:Ljava/lang/String;

    .line 374
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mEnterGameParsMap:Ljava/util/Map;

    const-string v2, "role_id"

    invoke-static {v1, v2}, Lcom/heitao/common/HTMapHelper;->getString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleId:Ljava/lang/String;

    .line 375
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mEnterGameParsMap:Ljava/util/Map;

    const-string v2, "role_name"

    invoke-static {v1, v2}, Lcom/heitao/common/HTMapHelper;->getString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleName:Ljava/lang/String;

    .line 376
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mEnterGameParsMap:Ljava/util/Map;

    const-string v2, "role_level"

    invoke-static {v1, v2}, Lcom/heitao/common/HTMapHelper;->getInt(Ljava/util/Map;Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleLevel:I

    .line 377
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mEnterGameParsMap:Ljava/util/Map;

    const-string v2, "is_new_role"

    invoke-static {v1, v2}, Lcom/heitao/common/HTMapHelper;->getString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mIsNewRole:Ljava/lang/String;

    .line 380
    :cond_0
    iput-boolean v3, p0, Lcom/heitao/channel/HTBaseChannel;->mIsLogined:Z

    .line 381
    iget-boolean v1, p0, Lcom/heitao/channel/HTBaseChannel;->mIsShowFunctionMenu:Z

    if-eqz v1, :cond_1

    .line 384
    invoke-virtual {p0, v3}, Lcom/heitao/channel/HTBaseChannel;->doCreateFuntionMenu(Z)V

    .line 388
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 389
    .local v0, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "psid"

    iget-object v2, p0, Lcom/heitao/channel/HTBaseChannel;->mServerId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    const-string v1, "psname"

    iget-object v2, p0, Lcom/heitao/channel/HTBaseChannel;->mServerName:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    const-string v2, "uid"

    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    if-nez v1, :cond_3

    const-string v1, ""

    :goto_1
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    const-string v2, "puid"

    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    if-nez v1, :cond_4

    const-string v1, ""

    :goto_2
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    const-string v1, "rolename"

    iget-object v2, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleName:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    const-string v1, "level"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleLevel:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    const-string v1, "roleid"

    iget-object v2, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    const-string v1, "isnew"

    iget-object v2, p0, Lcom/heitao/channel/HTBaseChannel;->mIsNewRole:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    new-instance v1, Lcom/heitao/request/HTStatistics;

    invoke-direct {v1}, Lcom/heitao/request/HTStatistics;-><init>()V

    invoke-virtual {v1, v0}, Lcom/heitao/request/HTStatistics;->doStatisticsRoleInfo(Ljava/util/Map;)V

    .line 400
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v1, p1}, Lcom/heitao/extension/HTExtensionApi;->onEnterGame(Ljava/util/Map;)V

    .line 401
    return-void

    .line 367
    .end local v0    # "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    const-string v1, ""

    goto/16 :goto_0

    .line 391
    .restart local v0    # "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    iget-object v1, v1, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    goto :goto_1

    .line 392
    :cond_4
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    iget-object v1, v1, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    goto :goto_2
.end method

.method public onGameLevelChanged(I)V
    .locals 4
    .param p1, "newLevel"    # I

    .prologue
    .line 448
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGameLevelChanged=>\tnewLevel="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 449
    iput p1, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleLevel:I

    .line 451
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v1, p1}, Lcom/heitao/extension/HTExtensionApi;->onGameLevelChanged(I)V

    .line 454
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 455
    .local v0, "args":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "rolelevel"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleLevel:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    const-string v1, "gamelevelchange"

    invoke-virtual {p0, v1, v0}, Lcom/heitao/channel/HTBaseChannel;->doSendData(Ljava/lang/String;Ljava/util/Map;)V

    .line 457
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onNewIntent=> intent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 123
    const-string v0, "onPause=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 125
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->onPause()V

    .line 126
    return-void
.end method

.method public onPlayerRoleNameChanged(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 4
    .param p1, "isCreate"    # Ljava/lang/Boolean;
    .param p2, "roleName"    # Ljava/lang/String;

    .prologue
    .line 488
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPlayerRoleNameChanged=>\tisCreate="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\troleName="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 489
    iput-object p2, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleName:Ljava/lang/String;

    .line 491
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 493
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 495
    .local v0, "userMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "rolelevel"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleLevel:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mRoleId:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mServerId:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/heitao/channel/HTBaseChannel;->mServerName:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 498
    const-string v1, "rolenamechange"

    invoke-virtual {p0, v1, v0}, Lcom/heitao/channel/HTBaseChannel;->doSendData(Ljava/lang/String;Ljava/util/Map;)V

    .line 501
    .end local v0    # "userMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-void
.end method

.method public onRestart()V
    .locals 1

    .prologue
    .line 158
    const-string v0, "onRestart=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 160
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->onRestart()V

    .line 161
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 130
    const-string v0, "onResume=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 132
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->onResume()V

    .line 133
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 137
    const-string v0, "onStart=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 139
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->onStart()V

    .line 140
    return-void
.end method

.method public onStartGame()Z
    .locals 1

    .prologue
    .line 408
    const-string v0, "onStartGame=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 410
    iget-object v0, p0, Lcom/heitao/channel/HTBaseChannel;->mUser:Lcom/heitao/model/HTUser;

    if-nez v0, :cond_0

    .line 412
    new-instance v0, Lcom/heitao/channel/HTBaseChannel$1;

    invoke-direct {v0, p0}, Lcom/heitao/channel/HTBaseChannel$1;-><init>(Lcom/heitao/channel/HTBaseChannel;)V

    invoke-virtual {p0, v0}, Lcom/heitao/channel/HTBaseChannel;->doRunnableOnMainLooper(Ljava/lang/Runnable;)V

    .line 428
    const/4 v0, 0x0

    .line 431
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 144
    const-string v0, "onStop=>"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 146
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->onStop()V

    .line 147
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .param p1, "hasFocus"    # Z

    .prologue
    .line 175
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onWindowFocusChanged=> hasFocus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 176
    return-void
.end method

.method public setShowFunctionMenu(Z)V
    .locals 2
    .param p1, "show"    # Z

    .prologue
    .line 345
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setShowFunctionMenu=>\t\tshow="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 346
    iput-boolean p1, p0, Lcom/heitao/channel/HTBaseChannel;->mIsShowFunctionMenu:Z

    .line 348
    iget-boolean v0, p0, Lcom/heitao/channel/HTBaseChannel;->mIsLogined:Z

    if-eqz v0, :cond_0

    .line 350
    iget-boolean v0, p0, Lcom/heitao/channel/HTBaseChannel;->mIsShowFunctionMenu:Z

    invoke-virtual {p0, v0}, Lcom/heitao/channel/HTBaseChannel;->doCreateFuntionMenu(Z)V

    .line 352
    :cond_0
    return-void
.end method
