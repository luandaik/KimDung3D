.class public Lcom/heitao/platform/model/HTPError;
.super Ljava/lang/Object;
.source "HTPError.java"


# static fields
.field public static mContext:Landroid/content/Context;


# instance fields
.field public code:I

.field public message:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "_code"    # I
    .param p2, "_message"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lcom/heitao/platform/model/HTPError;->code:I

    .line 19
    iput-object p2, p0, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    .line 20
    return-void
.end method

.method public static getCustomError(Ljava/lang/String;)Lcom/heitao/platform/model/HTPError;
    .locals 2
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 27
    new-instance v0, Lcom/heitao/platform/model/HTPError;

    const/16 v1, -0x2710

    invoke-direct {v0, v1, p0}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public static getLoginCancelError()Lcom/heitao/platform/model/HTPError;
    .locals 3

    .prologue
    .line 43
    new-instance v0, Lcom/heitao/platform/model/HTPError;

    const/16 v1, -0x4e20

    const-string v2, "login_cancel"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public static getNotLoginError()Lcom/heitao/platform/model/HTPError;
    .locals 3

    .prologue
    .line 35
    new-instance v0, Lcom/heitao/platform/model/HTPError;

    const/16 v1, -0x2711

    const-string v2, "not_login"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public static getPayCancelError()Lcom/heitao/platform/model/HTPError;
    .locals 3

    .prologue
    .line 51
    new-instance v0, Lcom/heitao/platform/model/HTPError;

    const/16 v1, -0x7530

    const-string v2, "pay_cancel"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public static getPayConfirmingError()Lcom/heitao/platform/model/HTPError;
    .locals 3

    .prologue
    .line 75
    new-instance v0, Lcom/heitao/platform/model/HTPError;

    const/16 v1, -0x7533

    const-string v2, "pay_info_identifying"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public static getPayFailError()Lcom/heitao/platform/model/HTPError;
    .locals 3

    .prologue
    .line 67
    new-instance v0, Lcom/heitao/platform/model/HTPError;

    const/16 v1, -0x7532

    const-string v2, "pay_fail"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public static getPayInfoError()Lcom/heitao/platform/model/HTPError;
    .locals 3

    .prologue
    .line 59
    new-instance v0, Lcom/heitao/platform/model/HTPError;

    const/16 v1, -0x7531

    const-string v2, "pay_info_error"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public static getRequestFailedError()Lcom/heitao/platform/model/HTPError;
    .locals 3

    .prologue
    .line 91
    new-instance v0, Lcom/heitao/platform/model/HTPError;

    const/16 v1, -0x2713

    const-string v2, "request_fail"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public static getRequestParseError()Lcom/heitao/platform/model/HTPError;
    .locals 3

    .prologue
    .line 83
    new-instance v0, Lcom/heitao/platform/model/HTPError;

    const/16 v1, -0x2712

    const-string v2, "analysis_error"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "code="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/heitao/platform/model/HTPError;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&message="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
