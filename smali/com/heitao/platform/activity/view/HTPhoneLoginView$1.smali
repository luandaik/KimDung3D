.class Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;
.super Landroid/os/Handler;
.source "HTPhoneLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    .line 69
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 72
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 73
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 150
    :cond_0
    :goto_0
    return-void

    .line 75
    :pswitch_0
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 77
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 78
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->buildPhoneRegisterView()V

    .line 79
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 80
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 83
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 85
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_3

    .line 86
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 88
    :cond_3
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 91
    :pswitch_1
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEVERFYLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 93
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEVERFYLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 94
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->buildPhoneVerfyLoginView()V

    .line 95
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 96
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 98
    :cond_4
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 99
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 101
    :cond_5
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_6

    .line 102
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 104
    :cond_6
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 107
    :pswitch_2
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    .line 108
    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 107
    if-eq v0, v1, :cond_0

    .line 110
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 111
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->buildPhoneRegisterCompleteView()V

    .line 112
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 113
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 115
    :cond_7
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_8

    .line 116
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 118
    :cond_8
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 121
    :pswitch_3
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 123
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->buildPhoneLoginView()V

    .line 124
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 125
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_0

    .line 126
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto/16 :goto_0

    .line 130
    :pswitch_4
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 132
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->buildPhoneRegisterView()V

    .line 133
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 134
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_0

    .line 135
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto/16 :goto_0

    .line 139
    :pswitch_5
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 141
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->buildPhoneLoginView()V

    .line 142
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 143
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEVERFYLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_0

    .line 144
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto/16 :goto_0

    .line 73
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method
