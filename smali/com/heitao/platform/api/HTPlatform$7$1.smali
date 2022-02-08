.class Lcom/heitao/platform/api/HTPlatform$7$1;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTPlatform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform$7;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/platform/api/HTPlatform$7;


# direct methods
.method constructor <init>(Lcom/heitao/platform/api/HTPlatform$7;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$7$1;->this$1:Lcom/heitao/platform/api/HTPlatform$7;

    .line 459
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/api/HTPlatform$7$1;)Lcom/heitao/platform/api/HTPlatform$7;
    .locals 1

    .prologue
    .line 459
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform$7$1;->this$1:Lcom/heitao/platform/api/HTPlatform$7;

    return-object v0
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 14
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 473
    if-nez p1, :cond_1

    .line 548
    :cond_0
    :goto_0
    return-void

    .line 476
    :cond_1
    iget-object v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->dataObject:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    .line 480
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p1, Lcom/heitao/platform/model/HTPHttpEntity;->dataObject:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "update_info"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 481
    .local v10, "update_info":Ljava/lang/String;
    invoke-static {v10}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 482
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 484
    .local v8, "responseObject":Lorg/json/JSONObject;
    const-string v0, "update_type"

    invoke-static {v8, v0}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 485
    .local v2, "update_type":Ljava/lang/String;
    const-string v0, "update_url"

    invoke-static {v8, v0}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 486
    .local v5, "update_url":Ljava/lang/String;
    const-string v0, "update_msg"

    invoke-static {v8, v0}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 487
    .local v11, "update_msg":Ljava/lang/String;
    const-string v0, "update_title"

    invoke-static {v8, v0}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 488
    .local v13, "update_title":Ljava/lang/String;
    const-string v0, "update_and_open_way"

    invoke-static {v8, v0}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 489
    .local v4, "update_and_open_way":Ljava/lang/String;
    const-string v0, "update_ok_btn_text"

    invoke-static {v8, v0}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 490
    .local v12, "update_ok_btn_text":Ljava/lang/String;
    const-string v0, "update_cancel_btn_text"

    invoke-static {v8, v0}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 492
    .local v9, "update_cancel_btn_text":Ljava/lang/String;
    new-instance v6, Lcom/heitao/platform/common/HTAppUpdateInfo;

    invoke-direct {v6}, Lcom/heitao/platform/common/HTAppUpdateInfo;-><init>()V

    .line 493
    .local v6, "mAppUpdateInfo":Lcom/heitao/platform/common/HTAppUpdateInfo;
    const-string v0, "0.0"

    iput-object v0, v6, Lcom/heitao/platform/common/HTAppUpdateInfo;->versionName:Ljava/lang/String;

    .line 494
    const/4 v0, 0x0

    iput v0, v6, Lcom/heitao/platform/common/HTAppUpdateInfo;->versionCode:I

    .line 495
    iput-object v11, v6, Lcom/heitao/platform/common/HTAppUpdateInfo;->content:Ljava/lang/String;

    .line 496
    iput-object v5, v6, Lcom/heitao/platform/common/HTAppUpdateInfo;->apkURL:Ljava/lang/String;

    .line 497
    const-string v0, "1"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 498
    const/4 v0, 0x1

    iput-boolean v0, v6, Lcom/heitao/platform/common/HTAppUpdateInfo;->isForce:Z

    .line 503
    :goto_1
    new-instance v3, Lcom/heitao/platform/activity/view/version/HTAlertDailog;

    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform$7$1;->this$1:Lcom/heitao/platform/api/HTPlatform$7;

    invoke-static {v0}, Lcom/heitao/platform/api/HTPlatform$7;->access$0(Lcom/heitao/platform/api/HTPlatform$7;)Lcom/heitao/platform/api/HTPlatform;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v0

    invoke-direct {v3, v0, v13, v11}, Lcom/heitao/platform/activity/view/version/HTAlertDailog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    .local v3, "dailog":Lcom/heitao/platform/activity/view/version/HTAlertDailog;
    new-instance v0, Lcom/heitao/platform/api/HTPlatform$7$1$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/heitao/platform/api/HTPlatform$7$1$1;-><init>(Lcom/heitao/platform/api/HTPlatform$7$1;Ljava/lang/String;Lcom/heitao/platform/activity/view/version/HTAlertDailog;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/common/HTAppUpdateInfo;)V

    invoke-virtual {v3, v12, v0, v2}, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->setPositiveButton(Ljava/lang/String;Landroid/view/View$OnClickListener;Ljava/lang/String;)V

    .line 531
    const-string v0, "2"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 532
    new-instance v0, Lcom/heitao/platform/api/HTPlatform$7$1$2;

    invoke-direct {v0, p0, v3}, Lcom/heitao/platform/api/HTPlatform$7$1$2;-><init>(Lcom/heitao/platform/api/HTPlatform$7$1;Lcom/heitao/platform/activity/view/version/HTAlertDailog;)V

    invoke-virtual {v3, v9, v0}, Lcom/heitao/platform/activity/view/version/HTAlertDailog;->setNegativeButton(Ljava/lang/String;Landroid/view/View$OnClickListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 544
    .end local v2    # "update_type":Ljava/lang/String;
    .end local v3    # "dailog":Lcom/heitao/platform/activity/view/version/HTAlertDailog;
    .end local v4    # "update_and_open_way":Ljava/lang/String;
    .end local v5    # "update_url":Ljava/lang/String;
    .end local v6    # "mAppUpdateInfo":Lcom/heitao/platform/common/HTAppUpdateInfo;
    .end local v8    # "responseObject":Lorg/json/JSONObject;
    .end local v9    # "update_cancel_btn_text":Ljava/lang/String;
    .end local v10    # "update_info":Ljava/lang/String;
    .end local v11    # "update_msg":Ljava/lang/String;
    .end local v12    # "update_ok_btn_text":Ljava/lang/String;
    .end local v13    # "update_title":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 546
    .local v7, "e":Ljava/lang/Exception;
    const-string v0, "version check Exception:"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 500
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v2    # "update_type":Ljava/lang/String;
    .restart local v4    # "update_and_open_way":Ljava/lang/String;
    .restart local v5    # "update_url":Ljava/lang/String;
    .restart local v6    # "mAppUpdateInfo":Lcom/heitao/platform/common/HTAppUpdateInfo;
    .restart local v8    # "responseObject":Lorg/json/JSONObject;
    .restart local v9    # "update_cancel_btn_text":Ljava/lang/String;
    .restart local v10    # "update_info":Ljava/lang/String;
    .restart local v11    # "update_msg":Ljava/lang/String;
    .restart local v12    # "update_ok_btn_text":Ljava/lang/String;
    .restart local v13    # "update_title":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    :try_start_1
    iput-boolean v0, v6, Lcom/heitao/platform/common/HTAppUpdateInfo;->isForce:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 465
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "version check error,"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/heitao/platform/model/HTPError;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 467
    return-void
.end method
