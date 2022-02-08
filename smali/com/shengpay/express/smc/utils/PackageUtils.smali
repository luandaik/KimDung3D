.class public Lcom/shengpay/express/smc/utils/PackageUtils;
.super Ljava/lang/Object;
.source "PackageUtils.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "PackageUtils"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getApplicationName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVersionCode(Landroid/content/Context;)I
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 10
    const/4 v2, -0x1

    .line 12
    .local v2, "verCode":I
    :try_start_0
    invoke-static {p0}, Lcom/shengpay/express/smc/utils/PackageUtils;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 13
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget v2, v3, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .end local v1    # "name":Ljava/lang/String;
    :goto_0
    return v2

    .line 14
    :catch_0
    move-exception v0

    .line 15
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, "PackageUtils"

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getVersionName(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    const-string v2, ""

    .line 23
    .local v2, "verName":Ljava/lang/String;
    :try_start_0
    invoke-static {p0}, Lcom/shengpay/express/smc/utils/PackageUtils;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 24
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-object v2, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .end local v1    # "name":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 25
    :catch_0
    move-exception v0

    .line 26
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, "PackageUtils"

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
