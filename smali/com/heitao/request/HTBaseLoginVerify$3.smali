.class Lcom/heitao/request/HTBaseLoginVerify$3;
.super Ljava/lang/Object;
.source "HTBaseLoginVerify.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTBaseLoginVerify;->doActivate(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/HTBaseLoginVerify;

.field final synthetic val$confirm:Ljava/lang/String;

.field final synthetic val$dataObject:Lorg/json/JSONObject;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$otherButton:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTBaseLoginVerify;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 352
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iput-object p2, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->val$message:Ljava/lang/String;

    iput-object p4, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->val$confirm:Ljava/lang/String;

    iput-object p5, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->val$otherButton:Ljava/lang/String;

    iput-object p6, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->val$dataObject:Lorg/json/JSONObject;

    iput-object p7, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 358
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 359
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "doActivate which="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 361
    packed-switch p2, :pswitch_data_0

    .line 452
    :goto_0
    return-void

    .line 365
    :pswitch_0
    iget-object v2, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v2}, Lcom/heitao/request/HTBaseLoginVerify;->access$1100(Lcom/heitao/request/HTBaseLoginVerify;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 366
    .local v0, "code":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 368
    const-string v2, "\u63d0\u793a"

    const-string v3, "\u6fc0\u6d3b\u7801\u8f93\u5165\u4e0d\u80fd\u4e3a\u7a7a\uff01"

    new-instance v4, Lcom/heitao/request/HTBaseLoginVerify$3$1;

    invoke-direct {v4, p0}, Lcom/heitao/request/HTBaseLoginVerify$3$1;-><init>(Lcom/heitao/request/HTBaseLoginVerify$3;)V

    invoke-static {v2, v3, v4}, Lcom/heitao/common/HTUtils;->doShowDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    goto :goto_0

    .line 382
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 383
    .local v1, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "cardno"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    const-string v2, "puid"

    iget-object v3, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v3, v3, Lcom/heitao/request/HTBaseLoginVerify;->mUser:Lcom/heitao/model/HTUser;

    iget-object v3, v3, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    new-instance v2, Lcom/heitao/request/HTRequest;

    invoke-direct {v2}, Lcom/heitao/request/HTRequest;-><init>()V

    const-string v3, "activate"

    new-instance v4, Lcom/heitao/request/HTBaseLoginVerify$3$2;

    invoke-direct {v4, p0}, Lcom/heitao/request/HTBaseLoginVerify$3$2;-><init>(Lcom/heitao/request/HTBaseLoginVerify$3;)V

    invoke-virtual {v2, v3, v1, v4}, Lcom/heitao/request/HTRequest;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V

    goto :goto_0

    .line 440
    .end local v0    # "code":Ljava/lang/String;
    .end local v1    # "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :pswitch_1
    iget-object v2, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->val$url:Ljava/lang/String;

    invoke-static {v2}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 442
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 446
    :cond_1
    iget-object v2, p0, Lcom/heitao/request/HTBaseLoginVerify$3;->val$url:Ljava/lang/String;

    invoke-static {v2}, Lcom/heitao/common/HTUtils;->doOpenUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 361
    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
