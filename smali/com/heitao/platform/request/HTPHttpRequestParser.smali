.class public Lcom/heitao/platform/request/HTPHttpRequestParser;
.super Lcom/heitao/platform/request/HTPHttpRequest;
.source "HTPHttpRequestParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lcom/heitao/platform/request/HTPHttpRequest;-><init>()V

    return-void
.end method


# virtual methods
.method protected onParse(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 13
    const-string v1, "errno"

    const/4 v2, -0x1

    invoke-static {p1, v1, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;I)I

    move-result v0

    .line 14
    .local v0, "code":I
    iget-object v1, p0, Lcom/heitao/platform/request/HTPHttpRequestParser;->mHttpEntity:Lcom/heitao/platform/model/HTPHttpEntity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/platform/model/HTPHttpEntity;->code:Ljava/lang/String;

    .line 15
    iget-object v1, p0, Lcom/heitao/platform/request/HTPHttpRequestParser;->mHttpEntity:Lcom/heitao/platform/model/HTPHttpEntity;

    const-string v2, "errmsg"

    invoke-static {p1, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/platform/model/HTPHttpEntity;->message:Ljava/lang/String;

    .line 16
    iget-object v2, p0, Lcom/heitao/platform/request/HTPHttpRequestParser;->mHttpEntity:Lcom/heitao/platform/model/HTPHttpEntity;

    if-nez v0, :cond_1

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, v2, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    .line 17
    iget-object v1, p0, Lcom/heitao/platform/request/HTPHttpRequestParser;->mHttpEntity:Lcom/heitao/platform/model/HTPHttpEntity;

    iput-object p1, v1, Lcom/heitao/platform/model/HTPHttpEntity;->jsonObject:Lorg/json/JSONObject;

    .line 19
    const-string v1, "data"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 21
    iget-object v1, p0, Lcom/heitao/platform/request/HTPHttpRequestParser;->mHttpEntity:Lcom/heitao/platform/model/HTPHttpEntity;

    const-string v2, "data"

    invoke-static {p1, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/platform/model/HTPHttpEntity;->dataObject:Lorg/json/JSONObject;

    .line 23
    :cond_0
    return-void

    .line 16
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
