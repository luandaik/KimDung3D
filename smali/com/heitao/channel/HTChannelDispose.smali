.class public Lcom/heitao/channel/HTChannelDispose;
.super Ljava/lang/Object;
.source "HTChannelDispose.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;
    }
.end annotation


# instance fields
.field protected final ANTI_ADDICTION_ADULT:I

.field protected final ANTI_ADDICTION_NONAGE:I

.field protected final ANTI_ADDICTION_NONE:I

.field protected final ANTI_ADDICTION_UNSUPPORTED:I

.field protected final REAL_NAME_REGISTER_FAILED:I

.field protected final REAL_NAME_REGISTER_SUCCESS:I

.field public mAntiAddictionListener:Lcom/heitao/listener/HTAntiAddictionListener;

.field protected mCustomOrderData:Lorg/json/JSONObject;

.field protected mCustomOrderNumber:Ljava/lang/String;

.field protected mCustomServerId:Ljava/lang/String;

.field public mExitListener:Lcom/heitao/listener/HTExitListener;

.field public mLoginListener:Lcom/heitao/listener/HTLoginListener;

.field public mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

.field public mPayListener:Lcom/heitao/listener/HTPayListener;

.field public mRealNameRegisterListener:Lcom/heitao/listener/HTRealNameRegisterListener;

.field protected mSDKCustomMap:Ljava/util/Map;
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

.field protected mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

.field protected mUser:Lcom/heitao/model/HTUser;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    .line 41
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKCustomMap:Ljava/util/Map;

    .line 43
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    .line 45
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

    .line 47
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mPayListener:Lcom/heitao/listener/HTPayListener;

    .line 49
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mExitListener:Lcom/heitao/listener/HTExitListener;

    .line 51
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mAntiAddictionListener:Lcom/heitao/listener/HTAntiAddictionListener;

    .line 53
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mRealNameRegisterListener:Lcom/heitao/listener/HTRealNameRegisterListener;

    .line 55
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mCustomOrderNumber:Ljava/lang/String;

    .line 57
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mCustomServerId:Ljava/lang/String;

    .line 59
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mCustomOrderData:Lorg/json/JSONObject;

    .line 61
    sget-object v0, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->orinigModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    .line 64
    const/4 v0, -0x1

    iput v0, p0, Lcom/heitao/channel/HTChannelDispose;->ANTI_ADDICTION_UNSUPPORTED:I

    .line 66
    iput v1, p0, Lcom/heitao/channel/HTChannelDispose;->ANTI_ADDICTION_NONE:I

    .line 68
    iput v2, p0, Lcom/heitao/channel/HTChannelDispose;->ANTI_ADDICTION_NONAGE:I

    .line 70
    const/4 v0, 0x2

    iput v0, p0, Lcom/heitao/channel/HTChannelDispose;->ANTI_ADDICTION_ADULT:I

    .line 73
    iput v2, p0, Lcom/heitao/channel/HTChannelDispose;->REAL_NAME_REGISTER_SUCCESS:I

    .line 75
    iput v1, p0, Lcom/heitao/channel/HTChannelDispose;->REAL_NAME_REGISTER_FAILED:I

    return-void
.end method


# virtual methods
.method protected doAntiAddictionQueryCompleted(I)V
    .locals 1
    .param p1, "result"    # I

    .prologue
    .line 360
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    if-nez v0, :cond_0

    .line 362
    const-string v0, "\u8bf7\u5148\u767b\u5f55\u518d\u8c03\u7528\u8be5\u65b9\u6cd5"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 374
    :goto_0
    return-void

    .line 366
    :cond_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mAntiAddictionListener:Lcom/heitao/listener/HTAntiAddictionListener;

    if-eqz v0, :cond_1

    .line 368
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mAntiAddictionListener:Lcom/heitao/listener/HTAntiAddictionListener;

    invoke-interface {v0, p1}, Lcom/heitao/listener/HTAntiAddictionListener;->onHTAntiAddictionQueryCompleted(I)V

    goto :goto_0

    .line 372
    :cond_1
    const-string v0, "\u672a\u8bbe\u7f6e\u9632\u6c89\u8ff7\u76d1\u542c"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected doClear()V
    .locals 0

    .prologue
    .line 353
    return-void
.end method

.method protected doGameExit()V
    .locals 2

    .prologue
    .line 311
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mExitListener:Lcom/heitao/listener/HTExitListener;

    if-eqz v0, :cond_2

    .line 313
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mExitListener:Lcom/heitao/listener/HTExitListener;

    invoke-interface {v0}, Lcom/heitao/listener/HTExitListener;->onHTGameExit()V

    .line 321
    :goto_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->nativeModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->bothModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-ne v0, v1, :cond_1

    .line 323
    :cond_0
    invoke-static {}, Lcom/heitao/proxy/HTProxy;->doNativeGameExit()V

    .line 326
    :cond_1
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->onHTGameExit()V

    .line 327
    return-void

    .line 317
    :cond_2
    const-string v0, "\u672a\u8bbe\u7f6e\u9000\u51fa\u76d1\u542c"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected doLoginCompleted(Ljava/util/Map;Ljava/util/Map;Z)V
    .locals 3
    .param p3, "isVerify"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, "verifyMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p2, "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p3, :cond_0

    .line 88
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v1

    iget-object v0, v1, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    .line 89
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Lcom/heitao/channel/HTChannelDispose$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/heitao/channel/HTChannelDispose$1;-><init>(Lcom/heitao/channel/HTChannelDispose;Ljava/util/Map;Ljava/util/Map;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 157
    .end local v0    # "context":Landroid/content/Context;
    :goto_0
    return-void

    .line 135
    :cond_0
    new-instance v1, Lcom/heitao/model/HTUser;

    invoke-direct {v1, p2}, Lcom/heitao/model/HTUser;-><init>(Ljava/util/Map;)V

    iput-object v1, p0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    .line 138
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    if-nez v1, :cond_1

    .line 140
    const-string v1, "\u767b\u5f55\u9a8c\u8bc1\u6210\u529f\u7528\u6237\u4fe1\u606f\u4e3a\u7a7a"

    invoke-static {v1}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 143
    :cond_1
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    if-eqz v1, :cond_2

    .line 145
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    invoke-interface {v1, v2, p2}, Lcom/heitao/listener/HTLoginListener;->onHTLoginCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V

    .line 149
    :cond_2
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v2, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->nativeModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-eq v1, v2, :cond_3

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v2, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->bothModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-ne v1, v2, :cond_4

    .line 151
    :cond_3
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    const/4 v2, 0x1

    invoke-static {p2, v2}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/model/HTUser;->custom:Ljava/lang/String;

    .line 152
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    if-nez v1, :cond_5

    const-string v1, ""

    :goto_1
    invoke-static {v1}, Lcom/heitao/proxy/HTProxy;->doNativeLoginCompleted(Ljava/lang/String;)V

    .line 155
    :cond_4
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    invoke-interface {v1, v2}, Lcom/heitao/extension/HTExtensionApi;->onHTLoginCompleted(Lcom/heitao/model/HTUser;)V

    goto :goto_0

    .line 152
    :cond_5
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    invoke-virtual {v1}, Lcom/heitao/model/HTUser;->toEncodeString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method protected doLoginFailed(Lcom/heitao/model/HTError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 166
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    if-eqz v0, :cond_2

    .line 168
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    invoke-interface {v0, p1}, Lcom/heitao/listener/HTLoginListener;->onHTLoginFailed(Lcom/heitao/model/HTError;)V

    .line 176
    :goto_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->nativeModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->bothModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-ne v0, v1, :cond_1

    .line 178
    :cond_0
    if-nez p1, :cond_3

    const-string v0, ""

    :goto_1
    invoke-static {v0}, Lcom/heitao/proxy/HTProxy;->doNativeLoginFailed(Ljava/lang/String;)V

    .line 181
    :cond_1
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0, p1}, Lcom/heitao/extension/HTExtensionApi;->onHTLoginFailed(Lcom/heitao/model/HTError;)V

    .line 182
    return-void

    .line 172
    :cond_2
    const-string v0, "\u672a\u8bbe\u7f6e\u767b\u5f55\u76d1\u542c"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_0

    .line 178
    :cond_3
    invoke-virtual {p1}, Lcom/heitao/model/HTError;->toEncodeString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method protected doLogoutCompleted(Ljava/util/Map;)V
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
    .line 191
    .local p1, "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

    if-eqz v0, :cond_2

    .line 193
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    invoke-interface {v0, v1, p1}, Lcom/heitao/listener/HTLogoutListener;->onHTLogoutCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V

    .line 201
    :goto_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->nativeModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->bothModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-ne v0, v1, :cond_1

    .line 203
    :cond_0
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/proxy/HTProxy;->doNativeLogoutCompleted(Ljava/lang/String;)V

    .line 206
    :cond_1
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->onHTLogoutCompleted()V

    .line 208
    invoke-virtual {p0}, Lcom/heitao/channel/HTChannelDispose;->doClear()V

    .line 209
    return-void

    .line 197
    :cond_2
    const-string v0, "\u672a\u8bbe\u7f6e\u767b\u51fa\u76d1\u542c"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected doLogoutFailed(Lcom/heitao/model/HTError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 218
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

    if-eqz v0, :cond_2

    .line 220
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

    invoke-interface {v0, p1}, Lcom/heitao/listener/HTLogoutListener;->onHTLogoutFailed(Lcom/heitao/model/HTError;)V

    .line 228
    :goto_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->nativeModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->bothModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-ne v0, v1, :cond_1

    .line 230
    :cond_0
    if-nez p1, :cond_3

    const-string v0, ""

    :goto_1
    invoke-static {v0}, Lcom/heitao/proxy/HTProxy;->doNativeLogoutFailed(Ljava/lang/String;)V

    .line 233
    :cond_1
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0, p1}, Lcom/heitao/extension/HTExtensionApi;->onHTLogoutFailed(Lcom/heitao/model/HTError;)V

    .line 234
    return-void

    .line 224
    :cond_2
    const-string v0, "\u672a\u8bbe\u7f6e\u767b\u51fa\u76d1\u542c"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_0

    .line 230
    :cond_3
    invoke-virtual {p1}, Lcom/heitao/model/HTError;->toEncodeString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method protected doPayCompleted(Lcom/heitao/model/HTPayResult;)V
    .locals 5
    .param p1, "result"    # Lcom/heitao/model/HTPayResult;

    .prologue
    const/4 v4, 0x0

    .line 242
    if-eqz p1, :cond_0

    .line 244
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 245
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "custom_order_number"

    iget-object v3, p0, Lcom/heitao/channel/HTChannelDispose;->mCustomOrderNumber:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    const-string v2, "custom_server_id"

    iget-object v3, p0, Lcom/heitao/channel/HTChannelDispose;->mCustomServerId:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    iget-object v0, p1, Lcom/heitao/model/HTPayResult;->custom:Ljava/lang/String;

    .line 249
    .local v0, "custom":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 251
    invoke-static {v1, v4}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v0

    .line 258
    :goto_0
    iput-object v0, p1, Lcom/heitao/model/HTPayResult;->custom:Ljava/lang/String;

    .line 262
    .end local v0    # "custom":Ljava/lang/String;
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispose;->mPayListener:Lcom/heitao/listener/HTPayListener;

    if-eqz v2, :cond_4

    .line 264
    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispose;->mPayListener:Lcom/heitao/listener/HTPayListener;

    invoke-interface {v2, p1}, Lcom/heitao/listener/HTPayListener;->onHTPayCompleted(Lcom/heitao/model/HTPayResult;)V

    .line 272
    :goto_1
    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v3, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->nativeModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-eq v2, v3, :cond_1

    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v3, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->bothModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-ne v2, v3, :cond_2

    .line 274
    :cond_1
    if-nez p1, :cond_5

    const-string v2, ""

    :goto_2
    invoke-static {v2}, Lcom/heitao/proxy/HTProxy;->doNativePayCompleted(Ljava/lang/String;)V

    .line 277
    :cond_2
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v2

    iget-object v2, v2, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    iget-object v3, p0, Lcom/heitao/channel/HTChannelDispose;->mCustomOrderNumber:Ljava/lang/String;

    invoke-interface {v2, p1, v3}, Lcom/heitao/extension/HTExtensionApi;->onHTPayCompleted(Lcom/heitao/model/HTPayResult;Ljava/lang/String;)V

    .line 278
    return-void

    .line 255
    .restart local v0    # "custom":Ljava/lang/String;
    .restart local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1, v4}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 268
    .end local v0    # "custom":Ljava/lang/String;
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    const-string v2, "\u672a\u8bbe\u7f6e\u652f\u4ed8\u76d1\u542c"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_1

    .line 274
    :cond_5
    invoke-virtual {p1}, Lcom/heitao/model/HTPayResult;->toEncodeString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2
.end method

.method protected doPayFailed(Lcom/heitao/model/HTError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 287
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mPayListener:Lcom/heitao/listener/HTPayListener;

    if-eqz v0, :cond_2

    .line 289
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mPayListener:Lcom/heitao/listener/HTPayListener;

    invoke-interface {v0, p1}, Lcom/heitao/listener/HTPayListener;->onHTPayFailed(Lcom/heitao/model/HTError;)V

    .line 297
    :goto_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->nativeModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->bothModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-ne v0, v1, :cond_1

    .line 299
    :cond_0
    if-nez p1, :cond_3

    const-string v0, ""

    :goto_1
    invoke-static {v0}, Lcom/heitao/proxy/HTProxy;->doNativePayFailed(Ljava/lang/String;)V

    .line 302
    :cond_1
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0, p1}, Lcom/heitao/extension/HTExtensionApi;->onHTPayFailed(Lcom/heitao/model/HTError;)V

    .line 303
    return-void

    .line 293
    :cond_2
    const-string v0, "\u672a\u8bbe\u7f6e\u652f\u4ed8\u76d1\u542c"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_0

    .line 299
    :cond_3
    invoke-virtual {p1}, Lcom/heitao/model/HTError;->toEncodeString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method protected doRealNameRegisterCompleted(I)V
    .locals 1
    .param p1, "result"    # I

    .prologue
    .line 381
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mRealNameRegisterListener:Lcom/heitao/listener/HTRealNameRegisterListener;

    if-eqz v0, :cond_0

    .line 383
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mRealNameRegisterListener:Lcom/heitao/listener/HTRealNameRegisterListener;

    invoke-interface {v0, p1}, Lcom/heitao/listener/HTRealNameRegisterListener;->onHTRealNameRegisterComplete(I)V

    .line 389
    :goto_0
    return-void

    .line 387
    :cond_0
    const-string v0, "\u672a\u8bbe\u7f6e\u5b9e\u540d\u8ba4\u8bc1\u76d1\u542c"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected doThirdPartyExit()V
    .locals 2

    .prologue
    .line 335
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mExitListener:Lcom/heitao/listener/HTExitListener;

    if-eqz v0, :cond_2

    .line 337
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mExitListener:Lcom/heitao/listener/HTExitListener;

    invoke-interface {v0}, Lcom/heitao/listener/HTExitListener;->onHTThirdPartyExit()V

    .line 345
    :goto_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->nativeModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->bothModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-ne v0, v1, :cond_1

    .line 347
    :cond_0
    invoke-static {}, Lcom/heitao/proxy/HTProxy;->doNativeThirdPartyExit()V

    .line 350
    :cond_1
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    invoke-interface {v0}, Lcom/heitao/extension/HTExtensionApi;->onHTThirdPartyExit()V

    .line 351
    return-void

    .line 341
    :cond_2
    const-string v0, "\u672a\u8bbe\u7f6e\u9000\u51fa\u76d1\u542c"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_0
.end method
