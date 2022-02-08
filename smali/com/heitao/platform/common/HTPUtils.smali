.class public Lcom/heitao/platform/common/HTPUtils;
.super Ljava/lang/Object;
.source "HTPUtils.java"


# static fields
.field private static mProgressDialog:Landroid/app/ProgressDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/common/HTPUtils;->mProgressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static DownloadMapToParsString(Ljava/util/Map;Z)Ljava/lang/String;
    .locals 7
    .param p1, "isEncode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 200
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 202
    :cond_0
    const/4 v2, 0x0

    .line 223
    :cond_1
    return-object v2

    .line 205
    :cond_2
    const-string v2, ""

    .line 207
    .local v2, "string":Ljava/lang/String;
    const/4 v0, 0x0

    .line 208
    .local v0, "index":I
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 210
    .local v1, "key":Ljava/lang/String;
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 211
    .local v3, "value":Ljava/lang/String;
    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 213
    const-string v3, ""

    .line 215
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz p1, :cond_4

    invoke-static {v3}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .end local v3    # "value":Ljava/lang/String;
    :cond_4
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 216
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-eq v0, v5, :cond_5

    .line 218
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "&"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 220
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static synthetic access$0(Landroid/app/ProgressDialog;)V
    .locals 0

    .prologue
    .line 37
    sput-object p0, Lcom/heitao/platform/common/HTPUtils;->mProgressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static synthetic access$1()Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/heitao/platform/common/HTPUtils;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method public static doCancelProgressDialog(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 424
    sget-object v0, Lcom/heitao/platform/common/HTPUtils;->mProgressDialog:Landroid/app/ProgressDialog;

    if-nez v0, :cond_0

    .line 452
    :goto_0
    return-void

    .line 429
    :cond_0
    new-instance v0, Lcom/heitao/platform/common/HTPUtils$5;

    invoke-direct {v0, p0}, Lcom/heitao/platform/common/HTPUtils$5;-><init>(Landroid/content/Context;)V

    invoke-static {p0, v0}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static doOpenUrl(Ljava/lang/String;)V
    .locals 3
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 231
    invoke-static {p0}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 233
    const-string v2, "doOpenUrl \u6253\u5f00URL\u4e3a\u7a7a"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 242
    :goto_0
    return-void

    .line 237
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 238
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 239
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 240
    .local v0, "content_url":Landroid/net/Uri;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 241
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v2

    iget-object v2, v2, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public static doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 272
    if-nez p0, :cond_0

    .line 274
    const-string v1, "init_context_null"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 280
    :goto_0
    return-void

    .line 278
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 279
    .local v0, "mainHandler":Landroid/os/Handler;
    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public static doShowDialog(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 339
    new-instance v0, Lcom/heitao/platform/common/HTPUtils$2;

    invoke-direct {v0, p0, p1}, Lcom/heitao/platform/common/HTPUtils$2;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 361
    return-void
.end method

.method public static doShowDialog(Landroid/content/Context;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 368
    new-instance v0, Lcom/heitao/platform/common/HTPUtils$3;

    invoke-direct {v0, p0, p1, p2}, Lcom/heitao/platform/common/HTPUtils$3;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    invoke-static {p0, v0}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 382
    return-void
.end method

.method public static doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 416
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    return-void
.end method

.method public static doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 391
    invoke-static {p0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 393
    new-instance v0, Lcom/heitao/platform/common/HTPUtils$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/heitao/platform/common/HTPUtils$4;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 407
    return-void
.end method

.method public static doShowToast(Ljava/lang/String;)V
    .locals 2
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 322
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v0, v1, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    .line 323
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Lcom/heitao/platform/common/HTPUtils$1;

    invoke-direct {v1, v0, p0}, Lcom/heitao/platform/common/HTPUtils$1;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 332
    return-void
.end method

.method public static genTokenFromTimestamp(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "timeStamp"    # Ljava/lang/String;

    .prologue
    .line 479
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v2

    iget-object v2, v2, Lcom/heitao/platform/common/HTPDataCenter;->mSecretKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 480
    .local v0, "retValue":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 481
    const/4 v1, 0x5

    const/16 v2, 0x15

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 482
    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 484
    return-object v0
.end method

.method public static getAnimByR(Landroid/content/Context;Ljava/lang/String;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "paramName"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "anim"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 91
    .local v0, "id":I
    return v0
.end method

.method public static getAutoCreateUserName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 460
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    .line 461
    .local v0, "timeString":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ht"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x7

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getColorByR(Landroid/content/Context;Ljava/lang/String;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "paramName"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "color"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 86
    .local v0, "id":I
    return v0
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 5

    .prologue
    .line 576
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v4

    iget-object v0, v4, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    .line 577
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_1

    .line 579
    const-string v4, "device_id_context_null"

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 580
    const-string v1, ""

    .line 603
    :cond_0
    :goto_0
    return-object v1

    .line 583
    :cond_1
    const/4 v1, 0x0

    .line 586
    .local v1, "deviceId":Ljava/lang/String;
    :try_start_0
    const-string v4, "phone"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 587
    .local v3, "manager":Landroid/telephony/TelephonyManager;
    if-eqz v3, :cond_2

    .line 589
    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 598
    .end local v3    # "manager":Landroid/telephony/TelephonyManager;
    :cond_2
    :goto_1
    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 600
    const-string v1, ""

    goto :goto_0

    .line 592
    :catch_0
    move-exception v2

    .line 595
    .local v2, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static getDevicesInfo(Landroid/content/Context;)Ljava/util/Map;
    .locals 18
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 501
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 503
    .local v8, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, ""

    .line 504
    .local v7, "imei":Ljava/lang/String;
    const-string v12, ""

    .line 505
    .local v12, "resolution":Ljava/lang/String;
    const-string v9, ""

    .line 506
    .local v9, "nettype":Ljava/lang/String;
    const-string v15, "unknown_carrier"

    invoke-static {v15}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 507
    .local v3, "carrier":Ljava/lang/String;
    const-string v5, ""

    .line 508
    .local v5, "displayname":Ljava/lang/String;
    const-string v14, ""

    .line 509
    .local v14, "version":Ljava/lang/String;
    const-string v6, ""

    .line 513
    .local v6, "identifier":Ljava/lang/String;
    :try_start_0
    const-string v15, "phone"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/telephony/TelephonyManager;

    .line 514
    .local v13, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v13}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v7

    .line 515
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 517
    move-object/from16 v0, p0

    check-cast v0, Landroid/app/Activity;

    move-object v15, v0

    invoke-virtual {v15}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v15

    invoke-interface {v15}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    .line 518
    .local v4, "display":Landroid/view/Display;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/view/Display;->getWidth()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "*"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v4}, Landroid/view/Display;->getHeight()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 520
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v11

    .line 521
    .local v11, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v11, v15, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    .line 522
    .local v2, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    invoke-virtual {v11, v2}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v15

    move-object v0, v15

    check-cast v0, Ljava/lang/String;

    move-object v5, v0

    .line 524
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v16

    const/16 v17, 0x0

    invoke-virtual/range {v15 .. v17}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v10

    .line 525
    .local v10, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v14, v10, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 527
    invoke-virtual {v13}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    .line 528
    .local v1, "IMSI":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 530
    const-string v15, "46000"

    invoke-virtual {v1, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_0

    const-string v15, "46002"

    invoke-virtual {v1, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_0

    const-string v15, "46007"

    invoke-virtual {v1, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 532
    :cond_0
    const-string v15, "ccmc"

    invoke-static {v15}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 548
    :cond_1
    :goto_0
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 555
    .end local v1    # "IMSI":Ljava/lang/String;
    .end local v2    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .end local v4    # "display":Landroid/view/Display;
    .end local v10    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v11    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v13    # "tm":Landroid/telephony/TelephonyManager;
    :goto_1
    const-string v15, "imei"

    invoke-interface {v8, v15, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 556
    const-string v15, "device"

    sget-object v16, Landroid/os/Build;->MODEL:Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-interface {v8, v15, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    const-string v15, "osversion"

    sget-object v16, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-interface {v8, v15, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    const-string v15, "ispirated"

    const-string v16, "0"

    move-object/from16 v0, v16

    invoke-interface {v8, v15, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    const-string v15, "resolution"

    invoke-interface {v8, v15, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 560
    const-string v15, "nettype"

    invoke-interface {v8, v15, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 561
    const-string v15, "carrier"

    invoke-interface {v8, v15, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 562
    const-string v15, "displayname"

    invoke-interface {v8, v15, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 563
    const-string v15, "version"

    invoke-interface {v8, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    const-string v15, "identifier"

    invoke-interface {v8, v15, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 565
    const-string v15, "devicetoken"

    const-string v16, ""

    move-object/from16 v0, v16

    invoke-interface {v8, v15, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    return-object v8

    .line 534
    .restart local v1    # "IMSI":Ljava/lang/String;
    .restart local v2    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v4    # "display":Landroid/view/Display;
    .restart local v10    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v11    # "packageManager":Landroid/content/pm/PackageManager;
    .restart local v13    # "tm":Landroid/telephony/TelephonyManager;
    :cond_2
    :try_start_1
    const-string v15, "46001"

    invoke-virtual {v1, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_3

    const-string v15, "46006"

    invoke-virtual {v1, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 536
    :cond_3
    const-string v15, "unicom"

    invoke-static {v15}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 537
    goto :goto_0

    .line 538
    :cond_4
    const-string v15, "46003"

    invoke-virtual {v1, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_5

    const-string v15, "46005"

    invoke-virtual {v1, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 540
    :cond_5
    const-string v15, "egame"

    invoke-static {v15}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 541
    goto :goto_0

    .line 544
    :cond_6
    const-string v15, "unknown_carrier"

    invoke-static {v15}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    goto :goto_0

    .line 550
    .end local v1    # "IMSI":Ljava/lang/String;
    .end local v2    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .end local v4    # "display":Landroid/view/Display;
    .end local v10    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v11    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v13    # "tm":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v15

    goto :goto_1
.end method

.method public static getDrawByR(Landroid/content/Context;Ljava/lang/String;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "paramName"    # Ljava/lang/String;

    .prologue
    .line 100
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "drawable"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 102
    .local v0, "id":I
    return v0
.end method

.method public static getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "paramName"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "layout"

    .line 61
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 60
    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 63
    .local v0, "id":I
    return v0
.end method

.method public static final getMD5(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x10

    .line 287
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    .line 289
    .local v5, "unencodedPassword":[B
    const/4 v4, 0x0

    .line 293
    .local v4, "md":Ljava/security/MessageDigest;
    :try_start_0
    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 300
    invoke-virtual {v4}, Ljava/security/MessageDigest;->reset()V

    .line 301
    invoke-virtual {v4, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 302
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    .line 303
    .local v2, "encodedPassword":[B
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 305
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v6, v2

    if-lt v3, v6, :cond_0

    .line 314
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v2    # "encodedPassword":[B
    .end local v3    # "i":I
    .end local p0    # "string":Ljava/lang/String;
    :goto_1
    return-object p0

    .line 295
    .restart local p0    # "string":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 297
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_1

    .line 307
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v2    # "encodedPassword":[B
    .restart local v3    # "i":I
    :cond_0
    aget-byte v6, v2, v3

    and-int/lit16 v6, v6, 0xff

    if-ge v6, v8, :cond_1

    .line 309
    const-string v6, "0"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 311
    :cond_1
    aget-byte v6, v2, v3

    and-int/lit16 v6, v6, 0xff

    int-to-long v6, v6

    invoke-static {v6, v7, v8}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 305
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static getRandomPassword()Ljava/lang/String;
    .locals 3

    .prologue
    .line 470
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    const v2, 0xdbba0

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    const v2, 0x186a0

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "paramName"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "string"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 51
    .local v0, "id":I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getStringByR(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "paramName"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "string"

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v3

    iget-object v3, v3, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 46
    .local v0, "id":I
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getStyleByR(Landroid/content/Context;Ljava/lang/String;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "paramName"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "style"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 113
    .local v0, "id":I
    return v0
.end method

.method public static getUDID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 492
    invoke-static {}, Lcom/heitao/platform/openudid/HTPOpenUDID_manager;->getOpenUDID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getViewByR(Landroid/content/Context;Ljava/lang/String;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "paramName"    # Ljava/lang/String;

    .prologue
    .line 72
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 74
    .local v0, "id":I
    return v0
.end method

.method public static isNullOrEmpty(Ljava/lang/String;)Z
    .locals 1
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 248
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 250
    :cond_0
    const/4 v0, 0x1

    .line 253
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPhoneNumber(Ljava/lang/String;)Z
    .locals 2
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 260
    const-string v0, "[1][358]\\d{9}"

    .line 261
    .local v0, "telRegex":Ljava/lang/String;
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const-string v1, ""

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 263
    :cond_0
    const/4 v1, 0x0

    .line 265
    :goto_0
    return v1

    :cond_1
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public static mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;
    .locals 6
    .param p1, "isEncode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 172
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 174
    :cond_0
    const/4 v2, 0x0

    .line 190
    :cond_1
    return-object v2

    .line 177
    :cond_2
    const-string v2, ""

    .line 179
    .local v2, "string":Ljava/lang/String;
    const/4 v0, 0x0

    .line 180
    .local v0, "index":I
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 182
    .local v1, "key":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz p1, :cond_4

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 183
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-eq v0, v3, :cond_3

    .line 185
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "&"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 187
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 182
    :cond_4
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    goto :goto_1
.end method

.method public static parsStringToMap(Ljava/lang/String;Z)Ljava/util/HashMap;
    .locals 13
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "isDecode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    const/4 v8, 0x0

    .line 124
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-gtz v7, :cond_2

    .line 126
    :cond_0
    const/4 v3, 0x0

    .line 160
    :cond_1
    :goto_0
    return-object v3

    .line 129
    :cond_2
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 131
    .local v3, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    const-string v7, "&"

    invoke-virtual {p0, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 132
    .local v2, "keyValues":[Ljava/lang/String;
    array-length v9, v2

    move v7, v8

    :goto_1
    if-ge v7, v9, :cond_1

    aget-object v5, v2, v7

    .line 134
    .local v5, "string":Ljava/lang/String;
    const-string v10, "="

    invoke-virtual {v5, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 135
    .local v4, "str":[Ljava/lang/String;
    array-length v10, v4

    if-ne v10, v12, :cond_3

    .line 137
    const/4 v10, 0x0

    aget-object v1, v4, v10

    .line 138
    .local v1, "key":Ljava/lang/String;
    const-string v10, ""

    invoke-virtual {v3, v1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .end local v1    # "key":Ljava/lang/String;
    :cond_3
    array-length v10, v4

    const/4 v11, 0x2

    if-ne v10, v11, :cond_6

    .line 142
    const/4 v10, 0x0

    aget-object v1, v4, v10

    .line 143
    .restart local v1    # "key":Ljava/lang/String;
    const/4 v10, 0x1

    aget-object v6, v4, v10

    .line 144
    .local v6, "value":Ljava/lang/String;
    invoke-static {v6}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    const-string v6, ""

    .end local v6    # "value":Ljava/lang/String;
    :cond_4
    :goto_2
    invoke-virtual {v3, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .end local v1    # "key":Ljava/lang/String;
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 144
    .restart local v1    # "key":Ljava/lang/String;
    .restart local v6    # "value":Ljava/lang/String;
    :cond_5
    if-eqz p1, :cond_4

    invoke-static {v6}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_2

    .line 148
    .end local v1    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_6
    const-string v10, ""

    invoke-virtual {v3, v5, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 152
    .end local v2    # "keyValues":[Ljava/lang/String;
    .end local v4    # "str":[Ljava/lang/String;
    .end local v5    # "string":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 156
    .local v0, "e":Ljava/lang/Exception;
    const-string v7, "parsStringToMap_error"

    invoke-static {v7}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-array v9, v12, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v8

    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 157
    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    goto :goto_0
.end method

.method public static snapshoot(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 14
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "strName"    # Ljava/lang/String;

    .prologue
    .line 613
    const/4 v1, 0x0

    .line 614
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v9

    .line 616
    .local v9, "view":Landroid/view/View;
    const/4 v11, 0x1

    invoke-virtual {v9, v11}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 618
    invoke-virtual {v9}, Landroid/view/View;->buildDrawingCache()V

    .line 620
    invoke-virtual {v9}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 623
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 625
    .local v6, "frame":Landroid/graphics/Rect;
    invoke-virtual {v9, v6}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 626
    iget v8, v6, Landroid/graphics/Rect;->top:I

    .line 629
    .local v8, "stautsHeight":I
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v11

    invoke-interface {v11}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/Display;->getWidth()I

    move-result v10

    .line 631
    .local v10, "width":I
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v11

    invoke-interface {v11}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/Display;->getHeight()I

    move-result v7

    .line 637
    .local v7, "height":I
    const/4 v11, 0x0

    const/4 v12, 0x0

    sub-int v13, v7, v8

    :try_start_0
    invoke-static {v1, v11, v12, v10, v13}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 646
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v11

    const-string v12, "game_register_photo"

    invoke-static {v12}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v0, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 647
    .local v0, "appDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_0

    .line 649
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 652
    :cond_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 653
    .local v3, "file":Ljava/io/File;
    const/4 v4, 0x0

    .line 656
    .local v4, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 657
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .local v5, "fos":Ljava/io/FileOutputStream;
    if-eqz v5, :cond_1

    .line 659
    :try_start_2
    sget-object v11, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v12, 0x5a

    invoke-virtual {v1, v11, v12, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 660
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 661
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 678
    :cond_1
    :try_start_3
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-static {v11, v12, p1, v13}, Landroid/provider/MediaStore$Images$Media;->insertImage(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_3

    .line 686
    new-instance v11, Landroid/content/Intent;

    const-string v12, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v11}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 688
    const/4 v11, 0x1

    .end local v0    # "appDir":Ljava/io/File;
    .end local v3    # "file":Ljava/io/File;
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    :goto_0
    return v11

    .line 639
    :catch_0
    move-exception v2

    .line 641
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 642
    const/4 v11, 0x0

    goto :goto_0

    .line 664
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "appDir":Ljava/io/File;
    .restart local v3    # "file":Ljava/io/File;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v2

    .line 666
    .local v2, "e":Ljava/io/FileNotFoundException;
    :goto_1
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 667
    const/4 v11, 0x0

    goto :goto_0

    .line 669
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v2

    .line 671
    .local v2, "e":Ljava/io/IOException;
    :goto_2
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 672
    const/4 v11, 0x0

    goto :goto_0

    .line 680
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v2

    .line 682
    .local v2, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 683
    const/4 v11, 0x0

    goto :goto_0

    .line 669
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    :catch_4
    move-exception v2

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 664
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_5
    move-exception v2

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1
.end method
