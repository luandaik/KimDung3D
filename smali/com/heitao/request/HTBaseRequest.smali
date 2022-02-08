.class public Lcom/heitao/request/HTBaseRequest;
.super Ljava/lang/Object;
.source "HTBaseRequest.java"


# instance fields
.field protected mContext:Landroid/content/Context;

.field private mProgressDialog:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    iput-object v0, p0, Lcom/heitao/request/HTBaseRequest;->mContext:Landroid/content/Context;

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/request/HTBaseRequest;->mProgressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static synthetic access$000(Lcom/heitao/request/HTBaseRequest;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseRequest;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$002(Lcom/heitao/request/HTBaseRequest;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseRequest;
    .param p1, "x1"    # Landroid/app/ProgressDialog;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/heitao/request/HTBaseRequest;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object p1
.end method


# virtual methods
.method protected addPublicParsMap(Ljava/util/Map;)Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 94
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object v4, p1

    .line 95
    .local v4, "verifyMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v4, :cond_0

    .line 97
    new-instance v4, Ljava/util/HashMap;

    .end local v4    # "verifyMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 100
    .restart local v4    # "verifyMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v5

    iget-object v0, v5, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    .line 103
    .local v0, "context":Landroid/content/Context;
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 105
    .local v2, "packageInfo":Landroid/content/pm/PackageInfo;
    const-string v5, "vcode"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget v7, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    const-string v5, "vname"

    iget-object v6, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    const-string v5, "app_identifier"

    iget-object v6, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    const-string v5, "app_name"

    iget-object v6, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .end local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    const-string v5, "vcc"

    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v6

    invoke-virtual {v6}, Lcom/heitao/channel/HTChannelDispatcher;->getChannelSDKVersion()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    const-string v5, "vhc"

    const-string v6, "1.1.2"

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    const-string v5, "os_platform"

    const-string v6, "android"

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    const-string v5, "udid"

    invoke-static {}, Lcom/heitao/common/HTDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v5

    iget-object v3, v5, Lcom/heitao/common/HTDataCenter;->mSDKInfo:Lcom/heitao/model/HTSDKInfo;

    .line 125
    .local v3, "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    if-eqz v3, :cond_1

    .line 127
    const-string v5, "chid"

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v6

    iget-object v6, v6, Lcom/heitao/common/HTDataCenter;->mSDKInfo:Lcom/heitao/model/HTSDKInfo;

    iget-object v6, v6, Lcom/heitao/model/HTSDKInfo;->customChannelId:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    :cond_1
    const-string v5, "imei"

    invoke-static {}, Lcom/heitao/common/HTDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    const-string v5, "mac"

    invoke-static {}, Lcom/heitao/common/HTDevice;->getMacAddress()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    const-string v5, "device"

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    const-string v5, "os_platform"

    const-string v6, "android"

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    const-string v5, "os_vname"

    sget-object v6, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const-string v5, "os_vcode"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const-string v5, "resolution"

    invoke-static {}, Lcom/heitao/common/HTDevice;->getResolution()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    const-string v5, "net_env"

    invoke-static {}, Lcom/heitao/common/HTDevice;->getNetworkType()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    const-string v5, "net_market"

    invoke-static {}, Lcom/heitao/common/HTDevice;->getCarrierType()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    const-string v5, "cip"

    invoke-static {}, Lcom/heitao/common/HTDevice;->getIPAddress()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    const-string v5, "os_brand"

    sget-object v6, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    const-string v5, "android_id"

    invoke-static {}, Lcom/heitao/common/HTDevice;->getAndroidId()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    const-string v5, "openudid"

    invoke-static {}, Lcom/heitao/common/HTDevice;->getOpenUDID()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    const-string v6, "debug"

    sget-boolean v5, Lcom/heitao/common/HTConsts;->HTSDK_DEBUG:Z

    if-eqz v5, :cond_2

    const-string v5, "1"

    :goto_1
    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    return-object v4

    .line 110
    .end local v3    # "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    :catch_0
    move-exception v1

    .line 113
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 114
    const-string v5, "\u6dfb\u52a0version code/version name/app_identifier/app_name \u53c2\u6570\u5f02\u5e38"

    invoke-static {v5}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 143
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v3    # "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    :cond_2
    const-string v5, "0"

    goto :goto_1
.end method

.method protected doCancelProgressDialog()V
    .locals 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/request/HTBaseRequest$2;

    invoke-direct {v1, p0}, Lcom/heitao/request/HTBaseRequest$2;-><init>(Lcom/heitao/request/HTBaseRequest;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 85
    return-void
.end method

.method protected doShowProgressDialog(Ljava/lang/String;)V
    .locals 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/heitao/request/HTBaseRequest;->doCancelProgressDialog()V

    .line 41
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/request/HTBaseRequest$1;

    invoke-direct {v1, p0, p1}, Lcom/heitao/request/HTBaseRequest$1;-><init>(Lcom/heitao/request/HTBaseRequest;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 54
    return-void
.end method

.method protected get(Ljava/lang/String;Lcom/heitao/listener/HTRequestListener;)V
    .locals 13
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/heitao/listener/HTRequestListener;

    .prologue
    const/4 v12, 0x1

    .line 154
    invoke-static {p1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 156
    const-string v7, "get\u8bf7\u6c42URL\u4e3a\u7a7a"

    invoke-static {v7}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 218
    :goto_0
    return-void

    .line 160
    :cond_0
    if-nez p2, :cond_1

    .line 162
    const-string v7, "get\u8bf7\u6c42\u76d1\u542c\u4e3a\u7a7a"

    invoke-static {v7}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 165
    :cond_1
    const/4 v3, 0x0

    .line 168
    .local v3, "preUrl":Ljava/net/URL;
    :try_start_0
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "preUrl":Ljava/net/URL;
    .local v4, "preUrl":Ljava/net/URL;
    move-object v3, v4

    .line 175
    .end local v4    # "preUrl":Ljava/net/URL;
    .restart local v3    # "preUrl":Ljava/net/URL;
    :goto_1
    if-nez v3, :cond_2

    .line 177
    const-string v7, "get\u8bf7\u6c42URL\u4e0d\u5408\u6cd5\u6216\u4e3a\u7a7a"

    invoke-static {v7}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 169
    :catch_0
    move-exception v1

    .line 172
    .local v1, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_1

    .line 181
    .end local v1    # "e":Ljava/net/MalformedURLException;
    :cond_2
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 182
    .local v2, "parsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 184
    invoke-virtual {v3}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v12}, Lcom/heitao/common/HTUtils;->parsStringToMap(Ljava/lang/String;Z)Ljava/util/HashMap;

    move-result-object v2

    .line 186
    :cond_3
    const-string v7, "httime"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "heitao"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v2, v12, v12}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;ZZ)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "heitao"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/heitao/common/HTUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 188
    .local v6, "token":Ljava/lang/String;
    const-string v7, "httoken"

    invoke-virtual {v2, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "://"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_4

    const-string v7, ""

    :goto_2
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 191
    .local v5, "requestUrl":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v2, v12}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 193
    new-instance v0, Lcom/loopj/android/http/AsyncHttpClient;

    invoke-direct {v0}, Lcom/loopj/android/http/AsyncHttpClient;-><init>()V

    .line 194
    .local v0, "client":Lcom/loopj/android/http/AsyncHttpClient;
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Lcom/loopj/android/http/AsyncHttpClient;->setURLEncodingEnabled(Z)V

    .line 195
    const/16 v7, 0x2710

    invoke-virtual {v0, v7}, Lcom/loopj/android/http/AsyncHttpClient;->setTimeout(I)V

    .line 196
    new-instance v7, Lcom/heitao/request/HTBaseRequest$3;

    invoke-direct {v7, p0, p2}, Lcom/heitao/request/HTBaseRequest$3;-><init>(Lcom/heitao/request/HTBaseRequest;Lcom/heitao/listener/HTRequestListener;)V

    invoke-virtual {v0, v5, v7}, Lcom/loopj/android/http/AsyncHttpClient;->get(Ljava/lang/String;Lcom/loopj/android/http/ResponseHandlerInterface;)Lcom/loopj/android/http/RequestHandle;

    goto/16 :goto_0

    .line 190
    .end local v0    # "client":Lcom/loopj/android/http/AsyncHttpClient;
    .end local v5    # "requestUrl":Ljava/lang/String;
    :cond_4
    const-string v7, "?"

    goto :goto_2
.end method

.method protected post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/heitao/listener/HTRequestListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/listener/HTRequestListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 227
    .local p2, "args":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 229
    const-string v2, "post\u8bf7\u6c42URL\u4e3a\u7a7a"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 268
    :goto_0
    return-void

    .line 233
    :cond_0
    const/4 v1, 0x0

    .line 234
    .local v1, "params":Lcom/loopj/android/http/RequestParams;
    if-eqz p2, :cond_1

    .line 236
    new-instance v1, Lcom/loopj/android/http/RequestParams;

    .end local v1    # "params":Lcom/loopj/android/http/RequestParams;
    invoke-direct {v1, p2}, Lcom/loopj/android/http/RequestParams;-><init>(Ljava/util/Map;)V

    .line 239
    .restart local v1    # "params":Lcom/loopj/android/http/RequestParams;
    :cond_1
    if-nez p3, :cond_2

    .line 241
    const-string v2, "post\u8bf7\u6c42\u76d1\u542c\u4e3a\u7a7a"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 244
    :cond_2
    new-instance v0, Lcom/loopj/android/http/AsyncHttpClient;

    invoke-direct {v0}, Lcom/loopj/android/http/AsyncHttpClient;-><init>()V

    .line 245
    .local v0, "client":Lcom/loopj/android/http/AsyncHttpClient;
    const/16 v2, 0x2710

    invoke-virtual {v0, v2}, Lcom/loopj/android/http/AsyncHttpClient;->setTimeout(I)V

    .line 246
    new-instance v2, Lcom/heitao/request/HTBaseRequest$4;

    invoke-direct {v2, p0, p3}, Lcom/heitao/request/HTBaseRequest$4;-><init>(Lcom/heitao/request/HTBaseRequest;Lcom/heitao/listener/HTRequestListener;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/loopj/android/http/AsyncHttpClient;->post(Ljava/lang/String;Lcom/loopj/android/http/RequestParams;Lcom/loopj/android/http/ResponseHandlerInterface;)Lcom/loopj/android/http/RequestHandle;

    goto :goto_0
.end method
