.class Lcom/heitao/platform/activity/HTPPayActivity$3;
.super Lcom/heitao/platform/listener/HTPPayListener;
.source "HTPPayActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/activity/HTPPayActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$heitao$platform$pay$center$HTPSDKPayCenter$PayChannel:[I


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPPayActivity;


# direct methods
.method static synthetic $SWITCH_TABLE$com$heitao$platform$pay$center$HTPSDKPayCenter$PayChannel()[I
    .locals 3

    .prologue
    .line 543
    sget-object v0, Lcom/heitao/platform/activity/HTPPayActivity$3;->$SWITCH_TABLE$com$heitao$platform$pay$center$HTPSDKPayCenter$PayChannel:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->values()[Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->alipay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_9

    :goto_1
    :try_start_1
    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->heitao:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_8

    :goto_2
    :try_start_2
    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->mo9:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_7

    :goto_3
    :try_start_3
    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_6

    :goto_4
    :try_start_4
    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->smc:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_5

    :goto_5
    :try_start_5
    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->unionpay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_4

    :goto_6
    :try_start_6
    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wapwx:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_3

    :goto_7
    :try_start_7
    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->weixin:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_2

    :goto_8
    :try_start_8
    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wft:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_1

    :goto_9
    :try_start_9
    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_0

    :goto_a
    sput-object v0, Lcom/heitao/platform/activity/HTPPayActivity$3;->$SWITCH_TABLE$com$heitao$platform$pay$center$HTPSDKPayCenter$PayChannel:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_a

    :catch_1
    move-exception v1

    goto :goto_9

    :catch_2
    move-exception v1

    goto :goto_8

    :catch_3
    move-exception v1

    goto :goto_7

    :catch_4
    move-exception v1

    goto :goto_6

    :catch_5
    move-exception v1

    goto :goto_5

    :catch_6
    move-exception v1

    goto :goto_4

    :catch_7
    move-exception v1

    goto :goto_3

    :catch_8
    move-exception v1

    goto :goto_2

    :catch_9
    move-exception v1

    goto :goto_1
.end method

.method constructor <init>(Lcom/heitao/platform/activity/HTPPayActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    .line 543
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPPayListener;-><init>()V

    return-void
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/HTPPayActivity$3;)Lcom/heitao/platform/activity/HTPPayActivity;
    .locals 1

    .prologue
    .line 543
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    return-object v0
.end method


# virtual methods
.method public onPayCompleted()V
    .locals 6

    .prologue
    .line 608
    const/4 v0, 0x0

    .line 609
    .local v0, "payChannel":Ljava/lang/String;
    invoke-static {}, Lcom/heitao/platform/activity/HTPPayActivity$3;->$SWITCH_TABLE$com$heitao$platform$pay$center$HTPSDKPayCenter$PayChannel()[I

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$0(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    invoke-virtual {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 648
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 651
    if-nez v0, :cond_0

    const-string v0, ""

    .end local v0    # "payChannel":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "pay_success"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 653
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$7(Lcom/heitao/platform/activity/HTPPayActivity;Z)V

    .line 655
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$8(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 657
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$8(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v1

    invoke-virtual {v1}, Lcom/heitao/platform/listener/HTPPayListener;->onPayCompleted()V

    .line 659
    :cond_1
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 660
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lcom/heitao/platform/activity/HTPPayActivity$3$2;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/HTPPayActivity$3$2;-><init>(Lcom/heitao/platform/activity/HTPPayActivity$3;)V

    .line 667
    const-wide/16 v4, 0xc8

    .line 660
    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 669
    return-void

    .line 612
    .restart local v0    # "payChannel":Ljava/lang/String;
    :pswitch_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "alipay"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 613
    goto :goto_0

    .line 615
    :pswitch_1
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "union"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 616
    goto :goto_0

    .line 618
    :pswitch_2
    const-string v0, "Mo9"

    .line 619
    goto :goto_0

    .line 622
    :pswitch_3
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "yeepay_submiteed"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 623
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "yeepay_pay_success"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 625
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$9(Lcom/heitao/platform/activity/HTPPayActivity;)Landroid/widget/PopupWindow;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 627
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$9(Lcom/heitao/platform/activity/HTPPayActivity;)Landroid/widget/PopupWindow;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 630
    :cond_2
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "waiting_for_goods"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 633
    :pswitch_4
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "wechat"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 634
    goto/16 :goto_0

    .line 636
    :pswitch_5
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "heitaoB"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 637
    goto/16 :goto_0

    .line 639
    :pswitch_6
    const-string v0, "\u94f6\u8054"

    .line 640
    goto/16 :goto_0

    .line 642
    :pswitch_7
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "wechat"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 643
    goto/16 :goto_0

    .line 645
    :pswitch_8
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "wechat"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 646
    goto/16 :goto_0

    .line 609
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public onPayFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 6
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    const/4 v5, 0x0

    .line 549
    iget-object v1, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 551
    const/4 v0, 0x0

    .line 552
    .local v0, "payChannel":Ljava/lang/String;
    invoke-static {}, Lcom/heitao/platform/activity/HTPPayActivity$3;->$SWITCH_TABLE$com$heitao$platform$pay$center$HTPSDKPayCenter$PayChannel()[I

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$0(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    invoke-virtual {v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 582
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 585
    if-nez v0, :cond_0

    const-string v0, ""

    .end local v0    # "payChannel":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "pay_failed"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 586
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v1, v5}, Lcom/heitao/platform/activity/HTPPayActivity;->access$7(Lcom/heitao/platform/activity/HTPPayActivity;Z)V

    .line 588
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$8(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 590
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$8(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v1

    invoke-static {}, Lcom/heitao/platform/model/HTPError;->getPayFailError()Lcom/heitao/platform/model/HTPError;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    .line 592
    :cond_1
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 593
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lcom/heitao/platform/activity/HTPPayActivity$3$1;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/HTPPayActivity$3$1;-><init>(Lcom/heitao/platform/activity/HTPPayActivity$3;)V

    .line 600
    const-wide/16 v4, 0xc8

    .line 593
    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 601
    return-void

    .line 555
    .restart local v0    # "payChannel":Ljava/lang/String;
    :pswitch_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "alipay"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 556
    goto :goto_0

    .line 558
    :pswitch_1
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "union"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 559
    goto :goto_0

    .line 561
    :pswitch_2
    const-string v0, "Mo9"

    .line 562
    goto :goto_0

    .line 564
    :pswitch_3
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "yee"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 565
    goto :goto_0

    .line 567
    :pswitch_4
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "wechat"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 568
    goto :goto_0

    .line 570
    :pswitch_5
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "heitaoB"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 571
    goto/16 :goto_0

    .line 573
    :pswitch_6
    const-string v0, "\u94f6\u8054"

    .line 574
    goto/16 :goto_0

    .line 576
    :pswitch_7
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "wechat"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 577
    goto/16 :goto_0

    .line 579
    :pswitch_8
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "wechat"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 580
    goto/16 :goto_0

    .line 552
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method
