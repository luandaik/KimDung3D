.class Lcom/heitao/platform/activity/HTPPayActivity$8;
.super Ljava/lang/Object;
.source "HTPPayActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPPayActivity;->showPopupWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPPayActivity;

.field private final synthetic val$CHAButton:Landroid/widget/Button;

.field private final synthetic val$CHLButton:Landroid/widget/Button;

.field private final synthetic val$CHUButton:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPPayActivity;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHLButton:Landroid/widget/Button;

    iput-object p3, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHUButton:Landroid/widget/Button;

    iput-object p4, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHAButton:Landroid/widget/Button;

    .line 765
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 770
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_yeepay_CHL"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 772
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHLButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htp_pay_yeepay_chl_selected"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 773
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHUButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htp_pay_yeepay_chu"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 774
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHAButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htp_pay_yeepay_cha"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 776
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHL:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$14(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;)V

    .line 798
    :goto_0
    return-void

    .line 778
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_yeepay_CHU"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 780
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHLButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htp_pay_yeepay_chl"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 781
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHUButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htp_pay_yeepay_chu_selected"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 782
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHAButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htp_pay_yeepay_cha"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 784
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHU:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$14(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;)V

    goto :goto_0

    .line 786
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_yeepay_CHA"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 788
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHLButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htp_pay_yeepay_chl"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 789
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHUButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htp_pay_yeepay_chu"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 790
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->val$CHAButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "htp_pay_yeepay_cha_selected"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 792
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHA:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$14(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;)V

    goto :goto_0

    .line 796
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$8;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$14(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;)V

    goto/16 :goto_0
.end method
