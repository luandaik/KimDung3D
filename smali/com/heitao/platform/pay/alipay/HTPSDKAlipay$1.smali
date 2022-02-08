.class Lcom/heitao/platform/pay/alipay/HTPSDKAlipay$1;
.super Landroid/os/Handler;
.source "HTPSDKAlipay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 52
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 56
    :pswitch_0
    const-string v2, "msg.what case SDK_PAY_FLAG"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 58
    new-instance v0, Lcom/heitao/platform/pay/alipay/Result;

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/heitao/platform/pay/alipay/Result;-><init>(Ljava/lang/String;)V

    .line 59
    .local v0, "resultObj":Lcom/heitao/platform/pay/alipay/Result;
    iget-object v1, v0, Lcom/heitao/platform/pay/alipay/Result;->resultStatus:Ljava/lang/String;

    .line 62
    .local v1, "resultStatus":Ljava/lang/String;
    const-string v2, "alipay_callback"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 65
    const-string v2, "9000"

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 67
    invoke-static {}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->access$0()Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 69
    invoke-static {}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->access$0()Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v2

    invoke-virtual {v2}, Lcom/heitao/platform/listener/HTPPayListener;->onPayCompleted()V

    goto :goto_0

    .line 76
    :cond_1
    const-string v2, "8000"

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 78
    invoke-static {}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->access$0()Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 80
    invoke-static {}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->access$0()Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v2

    invoke-static {}, Lcom/heitao/platform/model/HTPError;->getPayConfirmingError()Lcom/heitao/platform/model/HTPError;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0

    .line 85
    :cond_2
    invoke-static {}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->access$0()Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 87
    invoke-static {}, Lcom/heitao/platform/pay/alipay/HTPSDKAlipay;->access$0()Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v2

    invoke-static {}, Lcom/heitao/platform/model/HTPError;->getPayFailError()Lcom/heitao/platform/model/HTPError;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0

    .line 95
    .end local v0    # "resultObj":Lcom/heitao/platform/pay/alipay/Result;
    .end local v1    # "resultStatus":Ljava/lang/String;
    :pswitch_1
    const-string v2, "msg.what case SDK_CHECK_FLAG"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 98
    const-string v2, "inspection_result"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 52
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
