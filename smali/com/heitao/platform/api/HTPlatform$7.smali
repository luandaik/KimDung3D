.class Lcom/heitao/platform/api/HTPlatform$7;
.super Ljava/lang/Object;
.source "HTPlatform.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform;->versionCheck()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/api/HTPlatform;


# direct methods
.method constructor <init>(Lcom/heitao/platform/api/HTPlatform;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$7;->this$0:Lcom/heitao/platform/api/HTPlatform;

    .line 428
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/api/HTPlatform$7;)Lcom/heitao/platform/api/HTPlatform;
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform$7;->this$0:Lcom/heitao/platform/api/HTPlatform;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 435
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 436
    .local v4, "time":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v8

    iget-object v8, v8, Lcom/heitao/platform/common/HTPDataCenter;->mSecretKey:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 437
    .local v6, "tt":Ljava/lang/String;
    const/4 v7, 0x5

    const/16 v8, 0x15

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 439
    .local v5, "token":Ljava/lang/String;
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 441
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v7

    iget-object v0, v7, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    .line 444
    .local v0, "context":Landroid/content/Context;
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 445
    .local v3, "packageInfo":Landroid/content/pm/PackageInfo;
    const-string v7, "appkey"

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v8

    iget-object v8, v8, Lcom/heitao/platform/common/HTPDataCenter;->mAppKey:Ljava/lang/String;

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    const-string v7, "vcode"

    new-instance v8, Ljava/lang/StringBuilder;

    iget v9, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    const-string v7, "vname"

    iget-object v8, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    const-string v7, "time"

    invoke-interface {v2, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    const-string v7, "token"

    invoke-interface {v2, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    const-string v7, "chid"

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v8

    iget-object v8, v8, Lcom/heitao/platform/common/HTPDataCenter;->mChannelId:Ljava/lang/String;

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 459
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    new-instance v7, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v7}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    const-string v8, "http://api.heitao.com/app/init"

    new-instance v9, Lcom/heitao/platform/api/HTPlatform$7$1;

    invoke-direct {v9, p0}, Lcom/heitao/platform/api/HTPlatform$7$1;-><init>(Lcom/heitao/platform/api/HTPlatform$7;)V

    invoke-virtual {v7, v8, v2, v10, v9}, Lcom/heitao/platform/request/HTPNullResponeParser;->get(Ljava/lang/String;Ljava/util/Map;ZLcom/heitao/platform/listener/HTPRequestListener;)V

    .line 550
    return-void

    .line 452
    :catch_0
    move-exception v1

    .line 455
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 456
    const-string v7, "\u6dfb\u52a0version code/version name/app_identifier/app_name \u53c2\u6570\u5f02\u5e38"

    invoke-static {v7}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method
