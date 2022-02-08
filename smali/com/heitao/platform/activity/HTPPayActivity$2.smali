.class Lcom/heitao/platform/activity/HTPPayActivity$2;
.super Ljava/lang/Object;
.source "HTPPayActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/activity/HTPPayActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPPayActivity;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPPayActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    .line 438
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 444
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_pay_left"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_pay_left_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 447
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->access$3(Lcom/heitao/platform/activity/HTPPayActivity;)V

    .line 537
    :cond_1
    :goto_0
    return-void

    .line 449
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_pay_right"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_pay_right_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 454
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_alipay"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_alipay_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_4

    .line 457
    :cond_3
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v1, "alipay"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 458
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_alipay"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "htppbtn_alipay_portrait"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$4(Lcom/heitao/platform/activity/HTPPayActivity;II)V

    .line 459
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->alipay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$5(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;)V

    goto :goto_0

    .line 461
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_unionpay"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_unionpay_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_6

    .line 464
    :cond_5
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v1, "unipay"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 465
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_unionpay"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "htppbtn_unionpay_portrait"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$4(Lcom/heitao/platform/activity/HTPPayActivity;II)V

    .line 466
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->unionpay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$5(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;)V

    goto/16 :goto_0

    .line 468
    :cond_6
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_mo9"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_mo9_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_8

    .line 471
    :cond_7
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v1, "pay_after_playing"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 472
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_mo9"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "htppbtn_mo9_portrait"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$4(Lcom/heitao/platform/activity/HTPPayActivity;II)V

    .line 473
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->mo9:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$5(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;)V

    goto/16 :goto_0

    .line 475
    :cond_8
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_yeepay"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_9

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_yeepay_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_a

    .line 478
    :cond_9
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v1, "yeepay"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 479
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_yeepay"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "htppbtn_yeepay_portrait"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$4(Lcom/heitao/platform/activity/HTPPayActivity;II)V

    .line 480
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$5(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;)V

    goto/16 :goto_0

    .line 482
    :cond_a
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_weixinpay"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_b

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_weixinpay_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_c

    .line 485
    :cond_b
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v1, "wxpay"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 486
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_weixinpay"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "htppbtn_weixinpay_portrait"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$4(Lcom/heitao/platform/activity/HTPPayActivity;II)V

    .line 487
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->weixin:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$5(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;)V

    goto/16 :goto_0

    .line 489
    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_heitao"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_d

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_heitao_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_e

    .line 492
    :cond_d
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v1, "htpay"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 493
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_heitao"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "htppbtn_heitao_portrait"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$4(Lcom/heitao/platform/activity/HTPPayActivity;II)V

    .line 494
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->heitao:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$5(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;)V

    goto/16 :goto_0

    .line 496
    :cond_e
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_smc"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_f

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_smc_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_10

    .line 499
    :cond_f
    const-string v0, "smc"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 500
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_smc"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "htppbtn_smc_portrait"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$4(Lcom/heitao/platform/activity/HTPPayActivity;II)V

    .line 501
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->smc:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$5(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;)V

    goto/16 :goto_0

    .line 503
    :cond_10
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_wft"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_11

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_wft_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_12

    .line 506
    :cond_11
    const-string v0, "wft"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 507
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_wft"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "htppbtn_wft_portrait"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$4(Lcom/heitao/platform/activity/HTPPayActivity;II)V

    .line 508
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wft:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$5(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;)V

    goto/16 :goto_0

    .line 510
    :cond_12
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_wapsft"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_13

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_wapsft_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_14

    .line 513
    :cond_13
    const-string v0, "wap"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 514
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htppbtn_wapsft"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v3, "htppbtn_wapsft_portrait"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$4(Lcom/heitao/platform/activity/HTPPayActivity;II)V

    .line 515
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wapwx:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$5(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;)V

    goto/16 :goto_0

    .line 517
    :cond_14
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_pay_next"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_15

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_pay_next_portrait"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 520
    :cond_15
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v1, "next_step"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 521
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->access$0(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-eq v0, v1, :cond_17

    .line 523
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->access$0(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    if-ne v0, v1, :cond_16

    .line 525
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->access$6(Lcom/heitao/platform/activity/HTPPayActivity;)V

    goto/16 :goto_0

    .line 529
    :cond_16
    invoke-static {}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->getInstance()Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$0(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v3}, Lcom/heitao/platform/activity/HTPPayActivity;->access$1(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/model/HTPPayInfo;

    move-result-object v3

    iget-object v4, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v4}, Lcom/heitao/platform/activity/HTPPayActivity;->access$2(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->pay(Landroid/app/Activity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;Lcom/heitao/platform/model/HTPPayInfo;Lcom/heitao/platform/listener/HTPPayListener;)V

    goto/16 :goto_0

    .line 534
    :cond_17
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$2;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v1, "choose_pay_way"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto/16 :goto_0
.end method
