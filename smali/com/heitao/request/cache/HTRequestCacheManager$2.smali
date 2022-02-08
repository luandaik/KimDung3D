.class Lcom/heitao/request/cache/HTRequestCacheManager$2;
.super Ljava/lang/Object;
.source "HTRequestCacheManager.java"

# interfaces
.implements Lcom/heitao/listener/HTRequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/cache/HTRequestCacheManager;->retry(Lcom/heitao/request/cache/HTRequestCache;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/cache/HTRequestCacheManager;

.field final synthetic val$requestCache:Lcom/heitao/request/cache/HTRequestCache;


# direct methods
.method constructor <init>(Lcom/heitao/request/cache/HTRequestCacheManager;Lcom/heitao/request/cache/HTRequestCache;)V
    .locals 0

    .prologue
    .line 328
    iput-object p1, p0, Lcom/heitao/request/cache/HTRequestCacheManager$2;->this$0:Lcom/heitao/request/cache/HTRequestCacheManager;

    iput-object p2, p0, Lcom/heitao/request/cache/HTRequestCacheManager$2;->val$requestCache:Lcom/heitao/request/cache/HTRequestCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 360
    iget-object v0, p0, Lcom/heitao/request/cache/HTRequestCacheManager$2;->this$0:Lcom/heitao/request/cache/HTRequestCacheManager;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/model/HTError;->getCustomError(Ljava/lang/String;)Lcom/heitao/model/HTError;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/request/cache/HTRequestCacheManager$2;->val$requestCache:Lcom/heitao/request/cache/HTRequestCache;

    invoke-static {v0, v1, v2}, Lcom/heitao/request/cache/HTRequestCacheManager;->access$000(Lcom/heitao/request/cache/HTRequestCacheManager;Lcom/heitao/model/HTError;Lcom/heitao/request/cache/HTRequestCache;)V

    .line 361
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 8
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 335
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 336
    .local v3, "jsonObject":Lorg/json/JSONObject;
    const-string v4, "errno"

    invoke-static {v3, v4}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v1

    .line 337
    .local v1, "errorCode":I
    const-string v4, "errmsg"

    invoke-static {v3, v4}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 338
    .local v2, "errorMessage":Ljava/lang/String;
    if-nez v1, :cond_0

    const-string v4, "errno"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 340
    iget-object v4, p0, Lcom/heitao/request/cache/HTRequestCacheManager$2;->this$0:Lcom/heitao/request/cache/HTRequestCacheManager;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/heitao/request/cache/HTRequestCacheManager$2;->val$requestCache:Lcom/heitao/request/cache/HTRequestCache;

    invoke-static {v4, v5, v6}, Lcom/heitao/request/cache/HTRequestCacheManager;->access$000(Lcom/heitao/request/cache/HTRequestCacheManager;Lcom/heitao/model/HTError;Lcom/heitao/request/cache/HTRequestCache;)V

    .line 354
    .end local v1    # "errorCode":I
    .end local v2    # "errorMessage":Ljava/lang/String;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 344
    .restart local v1    # "errorCode":I
    .restart local v2    # "errorMessage":Ljava/lang/String;
    .restart local v3    # "jsonObject":Lorg/json/JSONObject;
    :cond_0
    iget-object v4, p0, Lcom/heitao/request/cache/HTRequestCacheManager$2;->this$0:Lcom/heitao/request/cache/HTRequestCacheManager;

    new-instance v5, Lcom/heitao/model/HTError;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v2}, Lcom/heitao/model/HTError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, p0, Lcom/heitao/request/cache/HTRequestCacheManager$2;->val$requestCache:Lcom/heitao/request/cache/HTRequestCache;

    invoke-static {v4, v5, v6}, Lcom/heitao/request/cache/HTRequestCacheManager;->access$000(Lcom/heitao/request/cache/HTRequestCacheManager;Lcom/heitao/model/HTError;Lcom/heitao/request/cache/HTRequestCache;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 347
    .end local v1    # "errorCode":I
    .end local v2    # "errorMessage":Ljava/lang/String;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 350
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 352
    iget-object v4, p0, Lcom/heitao/request/cache/HTRequestCacheManager$2;->this$0:Lcom/heitao/request/cache/HTRequestCacheManager;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/heitao/model/HTError;->getCustomError(Ljava/lang/String;)Lcom/heitao/model/HTError;

    move-result-object v5

    iget-object v6, p0, Lcom/heitao/request/cache/HTRequestCacheManager$2;->val$requestCache:Lcom/heitao/request/cache/HTRequestCache;

    invoke-static {v4, v5, v6}, Lcom/heitao/request/cache/HTRequestCacheManager;->access$000(Lcom/heitao/request/cache/HTRequestCacheManager;Lcom/heitao/model/HTError;Lcom/heitao/request/cache/HTRequestCache;)V

    goto :goto_0
.end method
