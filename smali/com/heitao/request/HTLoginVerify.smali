.class public Lcom/heitao/request/HTLoginVerify;
.super Lcom/heitao/request/HTBaseLoginVerify;
.source "HTLoginVerify.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/heitao/request/HTBaseLoginVerify;-><init>()V

    return-void
.end method


# virtual methods
.method public doLoginVerify(Ljava/util/Map;Lcom/heitao/listener/HTLoginVerifyListener;)V
    .locals 0
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
    .line 16
    .local p1, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-super {p0, p1, p2}, Lcom/heitao/request/HTBaseLoginVerify;->doLoginVerify(Ljava/util/Map;Lcom/heitao/listener/HTLoginVerifyListener;)V

    .line 17
    return-void
.end method

.method protected parseCompleted(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "sdkJSONObject"    # Lorg/json/JSONObject;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/heitao/request/HTLoginVerify;->mLoginVerifyListener:Lcom/heitao/listener/HTLoginVerifyListener;

    if-eqz v0, :cond_0

    .line 28
    iget-object v0, p0, Lcom/heitao/request/HTLoginVerify;->mLoginVerifyListener:Lcom/heitao/listener/HTLoginVerifyListener;

    iget-object v1, p0, Lcom/heitao/request/HTLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/heitao/listener/HTLoginVerifyListener;->onHTLoginVerifyCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V

    .line 30
    :cond_0
    return-void
.end method
