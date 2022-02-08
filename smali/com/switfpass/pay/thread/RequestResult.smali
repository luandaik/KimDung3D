.class public Lcom/switfpass/pay/thread/RequestResult;
.super Ljava/lang/Object;


# static fields
.field public static final RESULT_BAD_NETWORK:I = -0x1

.field public static final RESULT_CHANK_DATA_ERROR:I = -0x6

.field public static final RESULT_INTERNAL_ERROR:I = -0x2

.field public static final RESULT_INVALID_RECOMMEND:I = 0x1ce

.field public static final RESULT_NO_ERROR:I = 0x0

.field public static final RESULT_READING_ERROR:I = -0x3

.field public static final RESULT_RECOMMEND_NOT_EXIST:I = 0x1cd

.field public static final RESULT_SERVICE_ERROR:I = -0x5

.field public static final RESULT_SOFT_COMMENT:I = 0x1cc

.field public static final RESULT_TIMEOUT_ERROR:I = -0x4

.field public static final RESULT_USERNAME_EXIST:I = 0x1cc

.field public static errorMap:Ljava/util/Map;


# instance fields
.field public arr:Lorg/json/JSONArray;

.field public data:Lorg/json/JSONObject;

.field private message:Ljava/lang/String;

.field public resultCode:I

.field public tag:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v3, 0x1cc

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u7f51\u7edc\u4e0d\u53ef\u7528"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    const/4 v1, -0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u53d1\u751f\u672a\u77e5\u9519\u8bef"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    const/4 v1, -0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u7f51\u7edc\u7e41\u5fd9\uff0c\u8bf7\u7a0d\u5019\u518d\u8bd5\uff01"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    const/4 v1, -0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u8bfb\u53d6\u6570\u636e\u8d85\u65f6"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    const/4 v1, -0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u7f51\u7edc\u8fde\u63a5\u9519\u8bef"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    const/4 v1, -0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u9a8c\u8bc1\u6570\u636e\u5931\u8d25"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u7528\u6237\u540d\u5df2\u7ecf\u5b58\u5728"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    const/16 v1, 0x1cd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u63a8\u8350\u4eba\u4e0d\u5b58\u5728"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    const/16 v1, 0x1ce

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u63a8\u8350\u4eba\u4e0d\u80fd\u63a8\u8350\u4e86"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u5e94\u7528\u4e0d\u5b58\u5728"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/switfpass/pay/thread/RequestResult;->resultCode:I

    return-void
.end method

.method public static getErrorMsg(I)Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static hasError(I)Z
    .locals 1

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/switfpass/pay/thread/RequestResult;->message:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/thread/RequestResult;->message:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/switfpass/pay/thread/RequestResult;->errorMap:Ljava/util/Map;

    iget v1, p0, Lcom/switfpass/pay/thread/RequestResult;->resultCode:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0
.end method

.method public hasError()Z
    .locals 1

    iget v0, p0, Lcom/switfpass/pay/thread/RequestResult;->resultCode:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/thread/RequestResult;->message:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isRetryable()Z
    .locals 1

    iget v0, p0, Lcom/switfpass/pay/thread/RequestResult;->resultCode:I

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/thread/RequestResult;->message:Ljava/lang/String;

    return-void
.end method
