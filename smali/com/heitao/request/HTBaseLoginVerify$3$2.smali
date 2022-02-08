.class Lcom/heitao/request/HTBaseLoginVerify$3$2;
.super Ljava/lang/Object;
.source "HTBaseLoginVerify.java"

# interfaces
.implements Lcom/heitao/listener/HTRequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTBaseLoginVerify$3;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/request/HTBaseLoginVerify$3;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTBaseLoginVerify$3;)V
    .locals 0

    .prologue
    .line 387
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 434
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTUtils;->doShowToast(Ljava/lang/String;)V

    .line 435
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 7
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 394
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 395
    .local v3, "jsonObject":Lorg/json/JSONObject;
    const-string v4, "errno"

    invoke-static {v3, v4}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v1

    .line 396
    .local v1, "errorCode":I
    const-string v4, "errmsg"

    invoke-static {v3, v4}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 398
    .local v2, "errorMessage":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 401
    iget-object v4, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    iget-object v4, v4, Lcom/heitao/request/HTBaseLoginVerify$3;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v5, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    iget-object v5, v5, Lcom/heitao/request/HTBaseLoginVerify$3;->val$dataObject:Lorg/json/JSONObject;

    const-string v6, "sdk"

    invoke-static {v5, v6}, Lcom/heitao/common/HTJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/heitao/request/HTBaseLoginVerify;->access$602(Lcom/heitao/request/HTBaseLoginVerify;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 404
    iget-object v4, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    iget-object v4, v4, Lcom/heitao/request/HTBaseLoginVerify$3;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v5, p0, Lcom/heitao/request/HTBaseLoginVerify$3$2;->this$1:Lcom/heitao/request/HTBaseLoginVerify$3;

    iget-object v5, v5, Lcom/heitao/request/HTBaseLoginVerify$3;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v5}, Lcom/heitao/request/HTBaseLoginVerify;->access$600(Lcom/heitao/request/HTBaseLoginVerify;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/heitao/request/HTBaseLoginVerify;->parseCompleted(Lorg/json/JSONObject;)V

    .line 427
    .end local v1    # "errorCode":I
    .end local v2    # "errorMessage":Ljava/lang/String;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 408
    .restart local v1    # "errorCode":I
    .restart local v2    # "errorMessage":Ljava/lang/String;
    .restart local v3    # "jsonObject":Lorg/json/JSONObject;
    :cond_0
    const-string v4, "\u63d0\u793a"

    new-instance v5, Lcom/heitao/request/HTBaseLoginVerify$3$2$1;

    invoke-direct {v5, p0}, Lcom/heitao/request/HTBaseLoginVerify$3$2$1;-><init>(Lcom/heitao/request/HTBaseLoginVerify$3$2;)V

    invoke-static {v4, v2, v5}, Lcom/heitao/common/HTUtils;->doShowDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 420
    .end local v1    # "errorCode":I
    .end local v2    # "errorMessage":Ljava/lang/String;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 423
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 425
    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/common/HTUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method
