.class public Lcom/heitao/request/HTBaseLoginVerify;
.super Lcom/heitao/request/HTBaseRequest;
.source "HTBaseLoginVerify.java"


# instance fields
.field private mActivationCodeEditText:Landroid/widget/EditText;

.field private mActivationlistener:Landroid/content/DialogInterface$OnClickListener;

.field private mApkUpdateUrl:Ljava/lang/String;

.field private mAppUpdateInfo:Lcom/heitao/model/HTAppUpdateInfo;

.field protected mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

.field private mErrorCode:I

.field private mErrorMessage:Ljava/lang/String;

.field private mErrorTitle:Ljava/lang/String;

.field private mIsForce:Z

.field protected mLoginVerifyListener:Lcom/heitao/listener/HTLoginVerifyListener;

.field private mOpenType:I

.field private mParsMap:Ljava/util/Map;
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

.field private mSDKJSONObject:Lorg/json/JSONObject;

.field protected mUser:Lcom/heitao/model/HTUser;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 32
    invoke-direct {p0}, Lcom/heitao/request/HTBaseRequest;-><init>()V

    .line 34
    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mParsMap:Ljava/util/Map;

    .line 35
    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mLoginVerifyListener:Lcom/heitao/listener/HTLoginVerifyListener;

    .line 36
    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

    .line 37
    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mAppUpdateInfo:Lcom/heitao/model/HTAppUpdateInfo;

    .line 39
    const/4 v0, -0x1

    iput v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mErrorCode:I

    .line 40
    const-string v0, "\u63d0\u793a"

    iput-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mErrorTitle:Ljava/lang/String;

    .line 41
    const-string v0, "\u767b\u5f55\u9a8c\u8bc1\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u8fde\u63a5\u6216\u7a0d\u540e\u91cd\u8bd5"

    iput-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mErrorMessage:Ljava/lang/String;

    .line 42
    iput-boolean v2, p0, Lcom/heitao/request/HTBaseLoginVerify;->mIsForce:Z

    .line 43
    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mApkUpdateUrl:Ljava/lang/String;

    .line 44
    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    .line 45
    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mSDKJSONObject:Lorg/json/JSONObject;

    .line 46
    iput v2, p0, Lcom/heitao/request/HTBaseLoginVerify;->mOpenType:I

    .line 47
    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mActivationCodeEditText:Landroid/widget/EditText;

    .line 48
    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mActivationlistener:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/heitao/request/HTBaseLoginVerify;)I
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mErrorCode:I

    return v0
.end method

.method static synthetic access$002(Lcom/heitao/request/HTBaseLoginVerify;I)I
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # I

    .prologue
    .line 32
    iput p1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mErrorCode:I

    return p1
.end method

.method static synthetic access$100(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mErrorTitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mParsMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$102(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mErrorTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/heitao/request/HTBaseLoginVerify;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mActivationCodeEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/heitao/request/HTBaseLoginVerify;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mActivationlistener:Landroid/content/DialogInterface$OnClickListener;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 32
    invoke-direct/range {p0 .. p5}, Lcom/heitao/request/HTBaseLoginVerify;->doActivateDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    return-void
.end method

.method static synthetic access$200(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mErrorMessage:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mErrorMessage:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/heitao/request/HTBaseLoginVerify;)Z
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget-boolean v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mIsForce:Z

    return v0
.end method

.method static synthetic access$302(Lcom/heitao/request/HTBaseLoginVerify;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # Z

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mIsForce:Z

    return p1
.end method

.method static synthetic access$400(Lcom/heitao/request/HTBaseLoginVerify;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mApkUpdateUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mApkUpdateUrl:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/heitao/request/HTBaseLoginVerify;)I
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mOpenType:I

    return v0
.end method

.method static synthetic access$502(Lcom/heitao/request/HTBaseLoginVerify;I)I
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # I

    .prologue
    .line 32
    iput p1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mOpenType:I

    return p1
.end method

.method static synthetic access$600(Lcom/heitao/request/HTBaseLoginVerify;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mSDKJSONObject:Lorg/json/JSONObject;

    return-object v0
.end method

.method static synthetic access$602(Lcom/heitao/request/HTBaseLoginVerify;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mSDKJSONObject:Lorg/json/JSONObject;

    return-object p1
.end method

.method static synthetic access$700(Lcom/heitao/request/HTBaseLoginVerify;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # Ljava/lang/String;
    .param p6, "x6"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct/range {p0 .. p6}, Lcom/heitao/request/HTBaseLoginVerify;->doActivate(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/heitao/request/HTBaseLoginVerify;)Lcom/heitao/model/HTAppUpdateInfo;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mAppUpdateInfo:Lcom/heitao/model/HTAppUpdateInfo;

    return-object v0
.end method

.method static synthetic access$802(Lcom/heitao/request/HTBaseLoginVerify;Lcom/heitao/model/HTAppUpdateInfo;)Lcom/heitao/model/HTAppUpdateInfo;
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # Lcom/heitao/model/HTAppUpdateInfo;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mAppUpdateInfo:Lcom/heitao/model/HTAppUpdateInfo;

    return-object p1
.end method

.method static synthetic access$900(Lcom/heitao/request/HTBaseLoginVerify;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTBaseLoginVerify;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/request/HTBaseLoginVerify;->doShowDialog(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private doActivate(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "dataObject"    # Lorg/json/JSONObject;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "confirm"    # Ljava/lang/String;
    .param p5, "otherButton"    # Ljava/lang/String;
    .param p6, "url"    # Ljava/lang/String;

    .prologue
    .line 351
    new-instance v0, Lcom/heitao/request/HTBaseLoginVerify$3;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p1

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/heitao/request/HTBaseLoginVerify$3;-><init>(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mActivationlistener:Landroid/content/DialogInterface$OnClickListener;

    .line 455
    iget-object v5, p0, Lcom/heitao/request/HTBaseLoginVerify;->mActivationlistener:Landroid/content/DialogInterface$OnClickListener;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    invoke-direct/range {v0 .. v5}, Lcom/heitao/request/HTBaseLoginVerify;->doActivateDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    .line 456
    return-void
.end method

.method private doActivateDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "confirm"    # Ljava/lang/String;
    .param p4, "otherButton"    # Ljava/lang/String;
    .param p5, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 463
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mActivationCodeEditText:Landroid/widget/EditText;

    .line 464
    new-instance v1, Landroid/widget/EditText;

    iget-object v2, p0, Lcom/heitao/request/HTBaseLoginVerify;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mActivationCodeEditText:Landroid/widget/EditText;

    .line 465
    iget-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mActivationCodeEditText:Landroid/widget/EditText;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 467
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 468
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 469
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 470
    iget-object v1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mActivationCodeEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 471
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 472
    invoke-static {p3}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p3, "\u786e\u5b9a"

    .end local p3    # "confirm":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0, p3, p5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 473
    invoke-static {p4}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p4, "\u53d6\u6d88"

    .end local p4    # "otherButton":Ljava/lang/String;
    :cond_1
    invoke-virtual {v0, p4, p5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 474
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 475
    return-void
.end method

.method private doShowDialog(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "code"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 235
    invoke-virtual {p0}, Lcom/heitao/request/HTBaseLoginVerify;->doCancelProgressDialog()V

    .line 237
    iget-object v0, p0, Lcom/heitao/request/HTBaseLoginVerify;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/request/HTBaseLoginVerify$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/heitao/request/HTBaseLoginVerify$2;-><init>(Lcom/heitao/request/HTBaseLoginVerify;ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 336
    return-void
.end method


# virtual methods
.method public doLoginVerify(Ljava/util/Map;Lcom/heitao/listener/HTLoginVerifyListener;)V
    .locals 5
    .param p2, "listener"    # Lcom/heitao/listener/HTLoginVerifyListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/listener/HTLoginVerifyListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify;->mParsMap:Ljava/util/Map;

    .line 56
    iput-object p2, p0, Lcom/heitao/request/HTBaseLoginVerify;->mLoginVerifyListener:Lcom/heitao/listener/HTLoginVerifyListener;

    .line 57
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v3

    iget-object v3, v3, Lcom/heitao/common/HTDataCenter;->mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

    iput-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify;->mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

    .line 59
    iget-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify;->mLoginVerifyListener:Lcom/heitao/listener/HTLoginVerifyListener;

    if-nez v3, :cond_0

    .line 61
    const-string v3, "\u672a\u8bbe\u7f6e\u767b\u5f55\u9a8c\u8bc1\u56de\u8c03\u76d1\u542c"

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 64
    :cond_0
    const-string v3, "\u767b\u5f55\u9a8c\u8bc1\u4e2d\u00b7\u00b7\u00b7"

    invoke-virtual {p0, v3}, Lcom/heitao/request/HTBaseLoginVerify;->doShowProgressDialog(Ljava/lang/String;)V

    .line 66
    const-string v0, "http://smi.heitao.com/"

    .line 67
    .local v0, "baseLoginVerifyUrl":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 69
    const-string v3, "\u8bf7\u5148\u8bbe\u7f6eSDK\u8bf7\u6c42URL"

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 70
    invoke-virtual {p0}, Lcom/heitao/request/HTBaseLoginVerify;->doCancelProgressDialog()V

    .line 225
    :goto_0
    return-void

    .line 74
    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 76
    :cond_2
    const-string v3, "\u767b\u5f55\u9a8c\u8bc1\u53c2\u6570\u4e3a\u7a7a"

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 77
    invoke-virtual {p0}, Lcom/heitao/request/HTBaseLoginVerify;->doCancelProgressDialog()V

    goto :goto_0

    .line 82
    :cond_3
    invoke-virtual {p0, p1}, Lcom/heitao/request/HTBaseLoginVerify;->addPublicParsMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 83
    const-string v3, "pn"

    invoke-static {}, Lcom/heitao/common/HTDevice;->getPhoneNumber()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v4

    iget-object v4, v4, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    iget-object v4, v4, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/login/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v4

    invoke-virtual {v4}, Lcom/heitao/channel/HTChannelDispatcher;->getChannelKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 86
    .local v2, "requestUrl":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {p1, v4}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 87
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u767b\u5f55\u9a8c\u8bc1\u5f00\u59cb\u8bf7\u6c42\uff0crequestUrl="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 90
    move-object v1, v2

    .line 92
    .local v1, "finalRequestUrl":Ljava/lang/String;
    new-instance v3, Lcom/heitao/request/HTBaseLoginVerify$1;

    invoke-direct {v3, p0, v1}, Lcom/heitao/request/HTBaseLoginVerify$1;-><init>(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;)V

    invoke-virtual {p0, v2, v3}, Lcom/heitao/request/HTBaseLoginVerify;->get(Ljava/lang/String;Lcom/heitao/listener/HTRequestListener;)V

    goto/16 :goto_0
.end method

.method protected parseCompleted(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "sdkJSONObject"    # Lorg/json/JSONObject;

    .prologue
    .line 344
    return-void
.end method
