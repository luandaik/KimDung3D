.class public Lcom/heitao/platform/request/HTPLoginParser;
.super Lcom/heitao/platform/request/HTPHttpRequestParser;
.source "HTPLoginParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/heitao/platform/request/HTPHttpRequestParser;-><init>()V

    return-void
.end method


# virtual methods
.method protected onParse(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 14
    invoke-super {p0, p1}, Lcom/heitao/platform/request/HTPHttpRequestParser;->onParse(Lorg/json/JSONObject;)V

    .line 16
    iget-object v2, p0, Lcom/heitao/platform/request/HTPLoginParser;->mHttpEntity:Lcom/heitao/platform/model/HTPHttpEntity;

    iget-boolean v2, v2, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v2, :cond_0

    .line 18
    const-string v2, "data"

    invoke-static {p1, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 20
    .local v0, "dataJsonObject":Lorg/json/JSONObject;
    new-instance v1, Lcom/heitao/platform/model/HTPUser;

    invoke-direct {v1}, Lcom/heitao/platform/model/HTPUser;-><init>()V

    .line 21
    .local v1, "user":Lcom/heitao/platform/model/HTPUser;
    const-string v2, "uid"

    invoke-static {v0, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    .line 22
    const-string v2, "username"

    invoke-static {v0, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    .line 23
    const-string v2, "time"

    invoke-static {v0, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/platform/model/HTPUser;->time:Ljava/lang/String;

    .line 24
    const-string v2, "token"

    invoke-static {v0, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/platform/model/HTPUser;->token:Ljava/lang/String;

    .line 25
    const-string v2, "mobile"

    invoke-static {v0, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    .line 26
    const-string v2, "ltime"

    invoke-static {v0, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/platform/model/HTPUser;->ltime:Ljava/lang/String;

    .line 27
    const-string v2, "qltoken"

    invoke-static {v0, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/heitao/platform/model/HTPUser;->ltoken:Ljava/lang/String;

    .line 29
    iget-object v2, p0, Lcom/heitao/platform/request/HTPLoginParser;->mHttpEntity:Lcom/heitao/platform/model/HTPHttpEntity;

    iput-object v1, v2, Lcom/heitao/platform/model/HTPHttpEntity;->object:Ljava/lang/Object;

    .line 31
    .end local v0    # "dataJsonObject":Lorg/json/JSONObject;
    .end local v1    # "user":Lcom/heitao/platform/model/HTPUser;
    :cond_0
    return-void
.end method
