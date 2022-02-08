.class Lcom/heitao/platform/activity/HTPPayActivity$9;
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

.field private final synthetic val$cardNoEditText:Landroid/widget/EditText;

.field private final synthetic val$cardPWDEditText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPPayActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->val$cardNoEditText:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->val$cardPWDEditText:Landroid/widget/EditText;

    .line 811
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 816
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_yeepay_ok"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 818
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->access$12(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    if-eq v0, v1, :cond_0

    .line 820
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->val$cardNoEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 821
    .local v3, "cardNo":Ljava/lang/String;
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->val$cardPWDEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 823
    .local v4, "cardPWD":Ljava/lang/String;
    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 825
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v1, "card_num_cannot_null"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 842
    .end local v3    # "cardNo":Ljava/lang/String;
    .end local v4    # "cardPWD":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 829
    .restart local v3    # "cardNo":Ljava/lang/String;
    .restart local v4    # "cardPWD":Ljava/lang/String;
    :cond_1
    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 831
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v1, "card_pwd_cannot_null"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 835
    :cond_2
    invoke-static {}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->getInstance()Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$12(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    move-result-object v2

    iget-object v5, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v5}, Lcom/heitao/platform/activity/HTPPayActivity;->access$15(Lcom/heitao/platform/activity/HTPPayActivity;)I

    move-result v5

    iget-object v6, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v6}, Lcom/heitao/platform/activity/HTPPayActivity;->access$1(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/model/HTPPayInfo;

    move-result-object v6

    iget-object v7, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v7}, Lcom/heitao/platform/activity/HTPPayActivity;->access$2(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v7

    invoke-virtual/range {v0 .. v7}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->yeepay(Landroid/app/Activity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;Ljava/lang/String;Ljava/lang/String;ILcom/heitao/platform/model/HTPPayInfo;Lcom/heitao/platform/listener/HTPPayListener;)V

    goto :goto_0

    .line 838
    .end local v3    # "cardNo":Ljava/lang/String;
    .end local v4    # "cardPWD":Ljava/lang/String;
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v2, "btn_yeepay_cancel"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 840
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$9;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->access$9(Lcom/heitao/platform/activity/HTPPayActivity;)Landroid/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    goto :goto_0
.end method
