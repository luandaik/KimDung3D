.class Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTPSDKPayCenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->pay(Landroid/app/Activity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;Lcom/heitao/platform/model/HTPPayInfo;Lcom/heitao/platform/listener/HTPPayListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

.field private final synthetic val$activity:Landroid/app/Activity;

.field private final synthetic val$listener:Lcom/heitao/platform/listener/HTPPayListener;

.field private final synthetic val$payInfo:Lcom/heitao/platform/model/HTPPayInfo;


# direct methods
.method constructor <init>(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;Landroid/app/Activity;Lcom/heitao/platform/listener/HTPPayListener;Lcom/heitao/platform/model/HTPPayInfo;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    iput-object p2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    iput-object p4, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$payInfo:Lcom/heitao/platform/model/HTPPayInfo;

    .line 211
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 6
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 229
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$activity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 230
    iget-boolean v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v2, :cond_9

    .line 232
    const/4 v1, 0x0

    .line 235
    .local v1, "params":Ljava/lang/Object;
    :try_start_0
    iget-object v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->dataObject:Lorg/json/JSONObject;

    const-string v3, "params"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 244
    .end local v1    # "params":Ljava/lang/Object;
    :goto_0
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-static {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    sget-object v3, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-eq v2, v3, :cond_1

    if-nez v1, :cond_1

    .line 246
    const-string v2, "params is null"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 309
    :cond_0
    :goto_1
    return-void

    .line 237
    .restart local v1    # "params":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 240
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 241
    const/4 v1, 0x0

    goto :goto_0

    .line 251
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "params":Ljava/lang/Object;
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "params="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 254
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-static {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    sget-object v3, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->alipay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v2, v3, :cond_2

    .line 257
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$payInfo:Lcom/heitao/platform/model/HTPPayInfo;

    check-cast v1, Ljava/lang/String;

    iget-object v4, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-static {v2, v3, v1, v4}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->pay(Landroid/app/Activity;Lcom/heitao/platform/model/HTPPayInfo;Ljava/lang/String;Lcom/heitao/platform/listener/HTPPayListener;)V

    goto :goto_1

    .line 259
    :cond_2
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-static {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    sget-object v3, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->unionpay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v2, v3, :cond_3

    .line 262
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$payInfo:Lcom/heitao/platform/model/HTPPayInfo;

    check-cast v1, Ljava/lang/String;

    iget-object v4, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-static {v2, v3, v1, v4}, Lcom/heitao/platform/pay/unionpay/HTPSDKUnionPay;->pay(Landroid/app/Activity;Lcom/heitao/platform/model/HTPPayInfo;Ljava/lang/String;Lcom/heitao/platform/listener/HTPPayListener;)V

    goto :goto_1

    .line 264
    :cond_3
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-static {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    sget-object v3, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->mo9:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v2, v3, :cond_4

    .line 267
    invoke-static {}, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->getInstance()Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$activity:Landroid/app/Activity;

    iget-object v4, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$payInfo:Lcom/heitao/platform/model/HTPPayInfo;

    check-cast v1, Ljava/lang/String;

    iget-object v5, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v2, v3, v4, v1, v5}, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->pay(Landroid/app/Activity;Lcom/heitao/platform/model/HTPPayInfo;Ljava/lang/String;Lcom/heitao/platform/listener/HTPPayListener;)V

    goto :goto_1

    .line 269
    :cond_4
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-static {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    sget-object v3, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v2, v3, :cond_5

    .line 272
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    if-eqz v2, :cond_0

    .line 274
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v2}, Lcom/heitao/platform/listener/HTPPayListener;->onPayCompleted()V

    goto :goto_1

    .line 277
    :cond_5
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-static {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    sget-object v3, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->weixin:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v2, v3, :cond_6

    .line 280
    invoke-static {}, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->getInstance()Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$activity:Landroid/app/Activity;

    iget-object v4, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$payInfo:Lcom/heitao/platform/model/HTPPayInfo;

    check-cast v1, Lorg/json/JSONObject;

    iget-object v5, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v2, v3, v4, v1, v5}, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->pay(Landroid/app/Activity;Lcom/heitao/platform/model/HTPPayInfo;Lorg/json/JSONObject;Lcom/heitao/platform/listener/HTPPayListener;)V

    goto/16 :goto_1

    .line 282
    :cond_6
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-static {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    sget-object v3, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->heitao:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-eq v2, v3, :cond_0

    .line 286
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-static {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    sget-object v3, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->smc:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v2, v3, :cond_7

    .line 289
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$activity:Landroid/app/Activity;

    check-cast v1, Lorg/json/JSONObject;

    iget-object v3, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-static {v2, v1, v3}, Lcom/heitao/platform/pay/smc/HTPSmcPAy;->pay(Landroid/app/Activity;Lorg/json/JSONObject;Lcom/heitao/platform/listener/HTPPayListener;)V

    goto/16 :goto_1

    .line 291
    :cond_7
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-static {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    sget-object v3, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wft:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v2, v3, :cond_8

    .line 294
    invoke-static {}, Lcom/heitao/platform/pay/wft/HTPWftPAy;->getInstance()Lcom/heitao/platform/pay/wft/HTPWftPAy;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$activity:Landroid/app/Activity;

    check-cast v1, Lorg/json/JSONObject;

    iget-object v4, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v2, v3, v1, v4}, Lcom/heitao/platform/pay/wft/HTPWftPAy;->pay(Landroid/app/Activity;Lorg/json/JSONObject;Lcom/heitao/platform/listener/HTPPayListener;)V

    goto/16 :goto_1

    .line 296
    :cond_8
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->this$0:Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    invoke-static {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->access$0(Lcom/heitao/platform/pay/center/HTPSDKPayCenter;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    sget-object v3, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wapwx:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v2, v3, :cond_0

    .line 299
    invoke-static {}, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->getInstance()Lcom/heitao/platform/pay/smc/HTPSMCWXPay;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$activity:Landroid/app/Activity;

    check-cast v1, Lorg/json/JSONObject;

    iget-object v4, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v2, v3, v1, v4}, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->pay(Landroid/app/Activity;Lorg/json/JSONObject;Lcom/heitao/platform/listener/HTPPayListener;)V

    goto/16 :goto_1

    .line 304
    :cond_9
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    if-eqz v2, :cond_0

    .line 306
    iget-object v2, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    iget-object v3, p1, Lcom/heitao/platform/model/HTPHttpEntity;->message:Ljava/lang/String;

    invoke-static {v3}, Lcom/heitao/platform/model/HTPError;->getCustomError(Ljava/lang/String;)Lcom/heitao/platform/model/HTPError;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto/16 :goto_1
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 217
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 219
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    if-eqz v0, :cond_0

    .line 221
    iget-object v0, p0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$1;->val$listener:Lcom/heitao/platform/listener/HTPPayListener;

    iget-object v1, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/model/HTPError;->getCustomError(Ljava/lang/String;)Lcom/heitao/platform/model/HTPError;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    .line 223
    :cond_0
    return-void
.end method
