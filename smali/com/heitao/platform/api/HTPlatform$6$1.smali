.class Lcom/heitao/platform/api/HTPlatform$6$1;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTPlatform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/platform/api/HTPlatform$6;


# direct methods
.method constructor <init>(Lcom/heitao/platform/api/HTPlatform$6;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$6$1;->this$1:Lcom/heitao/platform/api/HTPlatform$6;

    .line 391
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 2
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    const/4 v1, 0x0

    .line 405
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->dataObject:Lorg/json/JSONObject;

    if-nez v0, :cond_1

    .line 417
    :cond_0
    :goto_0
    return-void

    .line 408
    :cond_1
    iget-object v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->dataObject:Lorg/json/JSONObject;

    if-eqz v0, :cond_2

    .line 410
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v1, p1, Lcom/heitao/platform/model/HTPHttpEntity;->dataObject:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/heitao/platform/common/HTPDataCenter;->mLoginType:Ljava/lang/String;

    .line 411
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v1, p1, Lcom/heitao/platform/model/HTPHttpEntity;->dataObject:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/heitao/platform/common/HTPDataCenter;->menuData:Ljava/lang/String;

    goto :goto_0

    .line 414
    :cond_2
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iput-object v1, v0, Lcom/heitao/platform/common/HTPDataCenter;->mLoginType:Ljava/lang/String;

    .line 415
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iput-object v1, v0, Lcom/heitao/platform/common/HTPDataCenter;->menuData:Ljava/lang/String;

    goto :goto_0
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 397
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "active error,"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/heitao/platform/model/HTPError;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 398
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/heitao/platform/common/HTPDataCenter;->mLoginType:Ljava/lang/String;

    .line 399
    return-void
.end method
