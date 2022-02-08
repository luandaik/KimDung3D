.class Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;
.super Landroid/os/Handler;
.source "HTCustomerLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTCustomerLoginView;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    .line 77
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 80
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 81
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 117
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 83
    :pswitch_1
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 85
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 86
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$0(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    .line 87
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$1(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_1

    .line 88
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$2(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$1(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 90
    :cond_1
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$2(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto :goto_0

    .line 93
    :pswitch_2
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMERBINDPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 95
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMERBINDPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 96
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$3(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    .line 97
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$4(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_2

    .line 98
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$2(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$4(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 100
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$2(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto :goto_0

    .line 106
    :pswitch_3
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 108
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$0(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    .line 109
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$2(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 110
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMERBINDPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_0

    .line 111
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto/16 :goto_0

    .line 81
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
