.class Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;
.super Landroid/os/Handler;
.source "HTPhoneLoginView2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView2;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    .line 68
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 71
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 72
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 137
    :cond_0
    :goto_0
    return-void

    .line 74
    :pswitch_0
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 76
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 77
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneRegisterView()V

    .line 78
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 79
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 81
    :cond_1
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 82
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 84
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_3

    .line 85
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 87
    :cond_3
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 90
    :pswitch_1
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEVERFYLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 92
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEVERFYLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 93
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneVerfyLoginView()V

    .line 94
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 95
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 97
    :cond_4
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 98
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 100
    :cond_5
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_6

    .line 101
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 103
    :cond_6
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 106
    :pswitch_2
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    .line 107
    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 106
    if-eq v0, v1, :cond_0

    .line 109
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 110
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneRegisterCompleteView()V

    .line 111
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 112
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 114
    :cond_7
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_8

    .line 115
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 117
    :cond_8
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 120
    :pswitch_3
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneLoginView()V

    .line 121
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 122
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto/16 :goto_0

    .line 125
    :pswitch_4
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneRegisterView()V

    .line 126
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 127
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto/16 :goto_0

    .line 130
    :pswitch_5
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneLoginView()V

    .line 131
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 132
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto/16 :goto_0

    .line 72
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
