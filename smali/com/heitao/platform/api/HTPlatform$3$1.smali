.class Lcom/heitao/platform/api/HTPlatform$3$1;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTPlatform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/platform/api/HTPlatform$3;


# direct methods
.method constructor <init>(Lcom/heitao/platform/api/HTPlatform$3;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$3$1;->this$1:Lcom/heitao/platform/api/HTPlatform$3;

    .line 259
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 3
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 283
    const-string v1, "index complete"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->i(Ljava/lang/String;)V

    .line 284
    iget-object v1, p0, Lcom/heitao/platform/api/HTPlatform$3$1;->this$1:Lcom/heitao/platform/api/HTPlatform$3;

    invoke-static {v1}, Lcom/heitao/platform/api/HTPlatform$3;->access$0(Lcom/heitao/platform/api/HTPlatform$3;)Lcom/heitao/platform/api/HTPlatform;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 286
    iget-boolean v1, p1, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v1, :cond_0

    .line 288
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/heitao/platform/api/HTPlatform$3$1;->this$1:Lcom/heitao/platform/api/HTPlatform$3;

    invoke-static {v1}, Lcom/heitao/platform/api/HTPlatform$3;->access$0(Lcom/heitao/platform/api/HTPlatform$3;)Lcom/heitao/platform/api/HTPlatform;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 289
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "data"

    iget-object v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->dataObject:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 290
    iget-object v1, p0, Lcom/heitao/platform/api/HTPlatform$3$1;->this$1:Lcom/heitao/platform/api/HTPlatform$3;

    invoke-static {v1}, Lcom/heitao/platform/api/HTPlatform$3;->access$0(Lcom/heitao/platform/api/HTPlatform$3;)Lcom/heitao/platform/api/HTPlatform;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 296
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 294
    :cond_0
    const-string v1, "init_fail"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 265
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "index error,"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/heitao/platform/model/HTPError;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->i(Ljava/lang/String;)V

    .line 266
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform$3$1;->this$1:Lcom/heitao/platform/api/HTPlatform$3;

    invoke-static {v0}, Lcom/heitao/platform/api/HTPlatform$3;->access$0(Lcom/heitao/platform/api/HTPlatform$3;)Lcom/heitao/platform/api/HTPlatform;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 267
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    :goto_0
    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 269
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/heitao/platform/api/HTPlatform$3$1$1;

    invoke-direct {v1, p0}, Lcom/heitao/platform/api/HTPlatform$3$1$1;-><init>(Lcom/heitao/platform/api/HTPlatform$3$1;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 277
    return-void

    .line 267
    :cond_0
    const-string v0, "\u521d\u59cb\u5316\u652f\u4ed8\u5931\u8d25"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
