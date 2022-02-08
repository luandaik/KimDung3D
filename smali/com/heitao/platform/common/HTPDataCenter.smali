.class public Lcom/heitao/platform/common/HTPDataCenter;
.super Ljava/lang/Object;
.source "HTPDataCenter.java"


# static fields
.field private static mInstance:Lcom/heitao/platform/common/HTPDataCenter;


# instance fields
.field public mAppKey:Ljava/lang/String;

.field public mChannelId:Ljava/lang/String;

.field public mContext:Landroid/content/Context;

.field public mDirection:Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;

.field public mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

.field public mLoginType:Ljava/lang/String;

.field public mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

.field public mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

.field public mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

.field public mSecretKey:Ljava/lang/String;

.field public mUser:Lcom/heitao/platform/model/HTPUser;

.field public menuData:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/common/HTPDataCenter;->mInstance:Lcom/heitao/platform/common/HTPDataCenter;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object v1, p0, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    .line 23
    iput-object v1, p0, Lcom/heitao/platform/common/HTPDataCenter;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    .line 25
    iput-object v1, p0, Lcom/heitao/platform/common/HTPDataCenter;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    .line 27
    iput-object v1, p0, Lcom/heitao/platform/common/HTPDataCenter;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 29
    iput-object v1, p0, Lcom/heitao/platform/common/HTPDataCenter;->mAppKey:Ljava/lang/String;

    .line 31
    iput-object v1, p0, Lcom/heitao/platform/common/HTPDataCenter;->mSecretKey:Ljava/lang/String;

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/platform/common/HTPDataCenter;->mChannelId:Ljava/lang/String;

    .line 35
    iput-object v1, p0, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    .line 37
    iput-object v1, p0, Lcom/heitao/platform/common/HTPDataCenter;->mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

    .line 39
    sget-object v0, Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;->Portrait:Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;

    iput-object v0, p0, Lcom/heitao/platform/common/HTPDataCenter;->mDirection:Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;

    .line 42
    iput-object v1, p0, Lcom/heitao/platform/common/HTPDataCenter;->mLoginType:Ljava/lang/String;

    .line 45
    iput-object v1, p0, Lcom/heitao/platform/common/HTPDataCenter;->menuData:Ljava/lang/String;

    .line 16
    return-void
.end method

.method public static getInstance()Lcom/heitao/platform/common/HTPDataCenter;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/heitao/platform/common/HTPDataCenter;->mInstance:Lcom/heitao/platform/common/HTPDataCenter;

    if-nez v0, :cond_0

    .line 51
    new-instance v0, Lcom/heitao/platform/common/HTPDataCenter;

    invoke-direct {v0}, Lcom/heitao/platform/common/HTPDataCenter;-><init>()V

    sput-object v0, Lcom/heitao/platform/common/HTPDataCenter;->mInstance:Lcom/heitao/platform/common/HTPDataCenter;

    .line 54
    :cond_0
    sget-object v0, Lcom/heitao/platform/common/HTPDataCenter;->mInstance:Lcom/heitao/platform/common/HTPDataCenter;

    return-object v0
.end method


# virtual methods
.method public attainChannelFromMETAINF(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    const-string v3, ""

    .line 59
    .local v3, "result":Ljava/lang/String;
    const/4 v5, 0x0

    .line 61
    .local v5, "zipfile":Ljava/util/zip/ZipFile;
    :try_start_0
    new-instance v6, Ljava/util/zip/ZipFile;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v7

    iget-object v7, v7, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .end local v5    # "zipfile":Ljava/util/zip/ZipFile;
    .local v6, "zipfile":Ljava/util/zip/ZipFile;
    :try_start_1
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v1

    .line 63
    .local v1, "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v7

    if-nez v7, :cond_2

    .line 79
    :goto_0
    if-eqz v6, :cond_4

    .line 83
    :try_start_2
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-object v5, v6

    .line 90
    .end local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    .end local v6    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v5    # "zipfile":Ljava/util/zip/ZipFile;
    :cond_1
    :goto_1
    const-string v7, "-"

    invoke-virtual {v3, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 91
    .local v4, "split":[Ljava/lang/String;
    array-length v7, v4

    const/4 v8, 0x3

    if-lt v7, v8, :cond_5

    .line 93
    const/4 v7, 0x0

    aget-object v7, v4, v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x1

    aget-object v8, v4, v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    add-int/lit8 v7, v7, 0x2

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 100
    :goto_2
    return-object v3

    .line 65
    .end local v4    # "split":[Ljava/lang/String;
    .end local v5    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    .restart local v6    # "zipfile":Ljava/util/zip/ZipFile;
    :cond_2
    :try_start_3
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/zip/ZipEntry;

    .line 66
    .local v2, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "META-INF/channel"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 68
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result-object v3

    .line 69
    goto :goto_0

    .line 73
    .end local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    .end local v2    # "entry":Ljava/util/zip/ZipEntry;
    .end local v6    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v5    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/Exception;
    :goto_3
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 79
    if-eqz v5, :cond_1

    .line 83
    :try_start_5
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 84
    :catch_1
    move-exception v0

    .line 86
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 78
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    .line 79
    :goto_4
    if-eqz v5, :cond_3

    .line 83
    :try_start_6
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 89
    :cond_3
    :goto_5
    throw v7

    .line 84
    :catch_2
    move-exception v0

    .line 86
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    .line 84
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v5    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    .restart local v6    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_3
    move-exception v0

    .line 86
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_4
    move-object v5, v6

    .end local v6    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v5    # "zipfile":Ljava/util/zip/ZipFile;
    goto :goto_1

    .line 97
    .end local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    .restart local v4    # "split":[Ljava/lang/String;
    :cond_5
    const-string v3, ""

    goto :goto_2

    .line 78
    .end local v4    # "split":[Ljava/lang/String;
    .end local v5    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v6    # "zipfile":Ljava/util/zip/ZipFile;
    :catchall_1
    move-exception v7

    move-object v5, v6

    .end local v6    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v5    # "zipfile":Ljava/util/zip/ZipFile;
    goto :goto_4

    .line 73
    .end local v5    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v6    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_4
    move-exception v0

    move-object v5, v6

    .end local v6    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v5    # "zipfile":Ljava/util/zip/ZipFile;
    goto :goto_3
.end method

.method public reset()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 107
    iput-object v0, p0, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    .line 108
    iput-object v0, p0, Lcom/heitao/platform/common/HTPDataCenter;->mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

    .line 109
    return-void
.end method
