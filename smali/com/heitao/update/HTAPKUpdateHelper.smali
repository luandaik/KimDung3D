.class public Lcom/heitao/update/HTAPKUpdateHelper;
.super Ljava/lang/Object;
.source "HTAPKUpdateHelper.java"


# static fields
.field private static final DOWNLOADING:I = 0x0

.field private static final DOWNLOAD_END:I = 0x1

.field private static final DOWNLOAD_ERROR:I = 0x2

.field static handler:Landroid/os/Handler;

.field private static mAPKSavePath:Ljava/lang/String;

.field private static mAppUpdateInfo:Lcom/heitao/model/HTAppUpdateInfo;

.field private static mContext:Landroid/content/Context;

.field private static mProgress:I

.field private static mProgressDialog:Landroid/app/ProgressDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 33
    sput-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 34
    const/4 v0, 0x0

    sput v0, Lcom/heitao/update/HTAPKUpdateHelper;->mProgress:I

    .line 35
    sput-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mContext:Landroid/content/Context;

    .line 36
    sput-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mAppUpdateInfo:Lcom/heitao/model/HTAppUpdateInfo;

    .line 37
    sput-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mAPKSavePath:Ljava/lang/String;

    .line 39
    new-instance v0, Lcom/heitao/update/HTAPKUpdateHelper$1;

    invoke-direct {v0}, Lcom/heitao/update/HTAPKUpdateHelper$1;-><init>()V

    sput-object v0, Lcom/heitao/update/HTAPKUpdateHelper;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()I
    .locals 1

    .prologue
    .line 27
    sget v0, Lcom/heitao/update/HTAPKUpdateHelper;->mProgress:I

    return v0
.end method

.method static synthetic access$002(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 27
    sput p0, Lcom/heitao/update/HTAPKUpdateHelper;->mProgress:I

    return p0
.end method

.method static synthetic access$100()Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/heitao/update/HTAPKUpdateHelper;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$200()Landroid/content/Context;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/heitao/update/HTAPKUpdateHelper;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/heitao/update/HTAPKUpdateHelper;->mAPKSavePath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400()Lcom/heitao/model/HTAppUpdateInfo;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/heitao/update/HTAPKUpdateHelper;->mAppUpdateInfo:Lcom/heitao/model/HTAppUpdateInfo;

    return-object v0
.end method

.method private static deleteApk()V
    .locals 2

    .prologue
    .line 179
    :try_start_0
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mAPKSavePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 180
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 182
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    :cond_0
    :goto_0
    return-void

    .line 185
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static downloadAPK(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/model/HTAppUpdateInfo;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "apkSavePath"    # Ljava/lang/String;
    .param p2, "appUpdateInfo"    # Lcom/heitao/model/HTAppUpdateInfo;

    .prologue
    const/4 v3, 0x0

    .line 99
    if-nez p2, :cond_0

    .line 101
    const-string v1, "\u4e0b\u8f7d\u4fe1\u606f\u4e3a\u7a7a"

    invoke-static {v1}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 173
    :goto_0
    return-void

    .line 105
    :cond_0
    sput-object p0, Lcom/heitao/update/HTAPKUpdateHelper;->mContext:Landroid/content/Context;

    .line 106
    sput-object p2, Lcom/heitao/update/HTAPKUpdateHelper;->mAppUpdateInfo:Lcom/heitao/model/HTAppUpdateInfo;

    .line 107
    sput-object p1, Lcom/heitao/update/HTAPKUpdateHelper;->mAPKSavePath:Ljava/lang/String;

    .line 109
    invoke-static {}, Lcom/heitao/update/HTAPKUpdateHelper;->deleteApk()V

    .line 111
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 113
    .local v0, "manager":Landroid/net/ConnectivityManager;
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 114
    sget-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mProgressDialog:Landroid/app/ProgressDialog;

    const-string v2, "\u6e38\u620f\u66f4\u65b0"

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 115
    sget-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mProgressDialog:Landroid/app/ProgressDialog;

    sget-object v2, Lcom/heitao/update/HTAPKUpdateHelper;->mAppUpdateInfo:Lcom/heitao/model/HTAppUpdateInfo;

    iget-object v2, v2, Lcom/heitao/model/HTAppUpdateInfo;->content:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 116
    sget-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 117
    sget-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 118
    sget-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 119
    sget-object v1, Lcom/heitao/update/HTAPKUpdateHelper;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 121
    new-instance v1, Lcom/heitao/update/HTAPKUpdateHelper$2;

    invoke-direct {v1, v0}, Lcom/heitao/update/HTAPKUpdateHelper$2;-><init>(Landroid/net/ConnectivityManager;)V

    invoke-virtual {v1}, Lcom/heitao/update/HTAPKUpdateHelper$2;->start()V

    goto :goto_0
.end method

.method public static installAPK(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "apkFilePath"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 74
    .local v4, "intent":Landroid/content/Intent;
    const/high16 v5, 0x10000000

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 75
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 78
    .local v3, "file":Ljava/io/File;
    :try_start_0
    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 79
    .local v0, "data":Landroid/net/Uri;
    const-string v5, "application/vnd.android.package-archive"

    invoke-virtual {v4, v0, v5}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 80
    invoke-virtual {p0, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .end local v0    # "data":Landroid/net/Uri;
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v2

    .line 84
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 85
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 86
    .local v1, "dialog":Landroid/app/AlertDialog$Builder;
    const-string v5, "\u5b89\u88c5\u5931\u8d25"

    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 87
    const-string v5, "\u66f4\u65b0\u6587\u4ef6\u4e0d\u5b58\u5728\u6216\u8005\u5df2\u7ecf\u635f\u574f\uff01"

    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 88
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method
