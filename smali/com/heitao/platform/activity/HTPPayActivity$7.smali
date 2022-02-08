.class Lcom/heitao/platform/activity/HTPPayActivity$7;
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

.field private final synthetic val$cardMonryButton:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPPayActivity;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$7;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPPayActivity$7;->val$cardMonryButton:Landroid/widget/Button;

    .line 724
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/HTPPayActivity$7;)Lcom/heitao/platform/activity/HTPPayActivity;
    .locals 1

    .prologue
    .line 724
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$7;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 13
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 731
    const/4 v5, 0x0

    .line 732
    .local v5, "items":[Ljava/lang/String;
    iget-object v6, p0, Lcom/heitao/platform/activity/HTPPayActivity$7;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v6}, Lcom/heitao/platform/activity/HTPPayActivity;->access$12(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    move-result-object v6

    sget-object v7, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHL:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    if-ne v6, v7, :cond_1

    .line 734
    const/4 v6, 0x7

    new-array v1, v6, [Ljava/lang/String;

    const-string v6, "10"

    aput-object v6, v1, v8

    const-string v6, "20"

    aput-object v6, v1, v9

    const-string v6, "30"

    aput-object v6, v1, v10

    const-string v6, "50"

    aput-object v6, v1, v11

    const-string v6, "100"

    aput-object v6, v1, v12

    const/4 v6, 0x5

    const-string v7, "300"

    aput-object v7, v1, v6

    const/4 v6, 0x6

    const-string v7, "500"

    aput-object v7, v1, v6

    .line 735
    .local v1, "CHLs":[Ljava/lang/String;
    move-object v5, v1

    .line 748
    .end local v1    # "CHLs":[Ljava/lang/String;
    :cond_0
    :goto_0
    move-object v4, v5

    .line 750
    .local v4, "finalItems":[Ljava/lang/String;
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v6, p0, Lcom/heitao/platform/activity/HTPPayActivity$7;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-direct {v3, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 751
    .local v3, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v6, p0, Lcom/heitao/platform/activity/HTPPayActivity$7;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    const-string v7, "choose_card_amount"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 752
    new-instance v6, Lcom/heitao/platform/activity/HTPPayActivity$7$1;

    iget-object v7, p0, Lcom/heitao/platform/activity/HTPPayActivity$7;->val$cardMonryButton:Landroid/widget/Button;

    invoke-direct {v6, p0, v4, v7}, Lcom/heitao/platform/activity/HTPPayActivity$7$1;-><init>(Lcom/heitao/platform/activity/HTPPayActivity$7;[Ljava/lang/String;Landroid/widget/Button;)V

    invoke-virtual {v3, v4, v6}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 760
    invoke-virtual {v3, v8}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 761
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/AlertDialog;->show()V

    .line 762
    return-void

    .line 737
    .end local v3    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v4    # "finalItems":[Ljava/lang/String;
    :cond_1
    iget-object v6, p0, Lcom/heitao/platform/activity/HTPPayActivity$7;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v6}, Lcom/heitao/platform/activity/HTPPayActivity;->access$12(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    move-result-object v6

    sget-object v7, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHU:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    if-ne v6, v7, :cond_2

    .line 739
    const/4 v6, 0x6

    new-array v2, v6, [Ljava/lang/String;

    const-string v6, "20"

    aput-object v6, v2, v8

    const-string v6, "30"

    aput-object v6, v2, v9

    const-string v6, "50"

    aput-object v6, v2, v10

    const-string v6, "100"

    aput-object v6, v2, v11

    const-string v6, "300"

    aput-object v6, v2, v12

    const/4 v6, 0x5

    const-string v7, "500"

    aput-object v7, v2, v6

    .line 740
    .local v2, "CHUs":[Ljava/lang/String;
    move-object v5, v2

    .line 741
    goto :goto_0

    .line 742
    .end local v2    # "CHUs":[Ljava/lang/String;
    :cond_2
    iget-object v6, p0, Lcom/heitao/platform/activity/HTPPayActivity$7;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v6}, Lcom/heitao/platform/activity/HTPPayActivity;->access$12(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    move-result-object v6

    sget-object v7, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHA:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    if-ne v6, v7, :cond_0

    .line 744
    new-array v0, v10, [Ljava/lang/String;

    const-string v6, "50"

    aput-object v6, v0, v8

    const-string v6, "100"

    aput-object v6, v0, v9

    .line 745
    .local v0, "CHAs":[Ljava/lang/String;
    move-object v5, v0

    goto :goto_0
.end method
