.class Lcom/heitao/platform/activity/view/HTHTLoginView$1;
.super Landroid/os/Handler;
.source "HTHTLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTHTLoginView;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    .line 94
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 97
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 98
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 204
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 100
    :pswitch_1
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINREGISTER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 102
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINREGISTER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 103
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$0(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    .line 104
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getFrameBound()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 105
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v1

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getFrameBound()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 107
    :cond_1
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$3(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$3(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 108
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$3(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 110
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_3

    .line 111
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 113
    :cond_3
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 116
    :pswitch_2
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINREGISTERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 118
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINREGISTERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 119
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$5(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    .line 120
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$6(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_4

    .line 121
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$6(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 123
    :cond_4
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 126
    :pswitch_3
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINBIND:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 128
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINBIND:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 129
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    .line 130
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$8(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_5

    .line 131
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$8(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 133
    :cond_5
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 136
    :pswitch_4
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINFORGET:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 138
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINFORGET:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 139
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$9(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    .line 140
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 141
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 143
    :cond_6
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getFrameBound()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 144
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v1

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getFrameBound()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 146
    :cond_7
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$3(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_8

    .line 147
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$3(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 149
    :cond_8
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 152
    :pswitch_5
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 154
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 155
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$10(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    .line 156
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getFrameBound()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_9

    .line 157
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v1

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getFrameBound()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 159
    :cond_9
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 162
    :pswitch_6
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINT:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 164
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->buildHtLoginView()V

    .line 165
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 166
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINREGISTER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_0

    .line 167
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto/16 :goto_0

    .line 171
    :pswitch_7
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINT:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 173
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->buildHtLoginView()V

    .line 174
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 175
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINFORGET:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_0

    .line 176
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto/16 :goto_0

    .line 180
    :pswitch_8
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINFORGET:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 182
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$9(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    .line 183
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 184
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->initFliper()V

    .line 185
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_0

    .line 186
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto/16 :goto_0

    .line 190
    :pswitch_9
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 193
    :pswitch_a
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 196
    :pswitch_b
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 199
    :pswitch_c
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$11(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 98
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
    .end packed-switch
.end method
