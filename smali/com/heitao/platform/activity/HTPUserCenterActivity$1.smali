.class Lcom/heitao/platform/activity/HTPUserCenterActivity$1;
.super Landroid/os/Handler;
.source "HTPUserCenterActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPUserCenterActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    .line 90
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v1, 0x1

    .line 93
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 94
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 206
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 96
    :pswitch_1
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->CHANGE_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    if-eq v0, v1, :cond_0

    .line 98
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->CHANGE_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/UserCenterStack;->push(Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;)Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 99
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$1(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    .line 100
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$2(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$2(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 101
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$2(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 103
    :cond_1
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$4(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$4(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 104
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$4(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 106
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$5(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_3

    .line 107
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$5(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 109
    :cond_3
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 112
    :pswitch_2
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FORGET_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    if-eq v0, v1, :cond_0

    .line 114
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FORGET_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/UserCenterStack;->push(Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;)Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 115
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$6(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    .line 116
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$7(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_4

    .line 117
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$7(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 119
    :cond_4
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 122
    :pswitch_3
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FIND_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    if-eq v0, v1, :cond_0

    .line 124
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FIND_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/UserCenterStack;->push(Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;)Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 125
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$8(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    .line 126
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$9(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_5

    .line 127
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$9(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 129
    :cond_5
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 132
    :pswitch_4
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BIND_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    if-eq v0, v1, :cond_0

    .line 134
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BIND_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/UserCenterStack;->push(Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;)Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 135
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$10(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    .line 136
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$5(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$5(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 137
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$5(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 139
    :cond_6
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$4(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$4(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 140
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$4(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 142
    :cond_7
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$2(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_8

    .line 143
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$2(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 145
    :cond_8
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 148
    :pswitch_5
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BINDE_NEW_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    if-eq v0, v1, :cond_0

    .line 150
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BINDE_NEW_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/UserCenterStack;->push(Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;)Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 151
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$11(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    .line 152
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$5(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$5(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 153
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$5(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 155
    :cond_9
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$2(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$2(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 156
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$2(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->removeView(Landroid/view/View;)V

    .line 158
    :cond_a
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$4(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_b

    .line 159
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$4(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 161
    :cond_b
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto/16 :goto_0

    .line 164
    :pswitch_6
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$12(Lcom/heitao/platform/activity/HTPUserCenterActivity;Z)V

    .line 165
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->pop()Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 166
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    goto/16 :goto_0

    .line 171
    :pswitch_7
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$12(Lcom/heitao/platform/activity/HTPUserCenterActivity;Z)V

    .line 172
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->pop()Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 173
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    goto/16 :goto_0

    .line 178
    :pswitch_8
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$12(Lcom/heitao/platform/activity/HTPUserCenterActivity;Z)V

    .line 179
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->pop()Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 180
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    goto/16 :goto_0

    .line 185
    :pswitch_9
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$1(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    .line 186
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 187
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->pop()Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    goto/16 :goto_0

    .line 190
    :pswitch_a
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$6(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    .line 191
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 192
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->pop()Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    goto/16 :goto_0

    .line 195
    :pswitch_b
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$12(Lcom/heitao/platform/activity/HTPUserCenterActivity;Z)V

    .line 196
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->pop()Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 197
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->pop()Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 198
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->pop()Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 199
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    goto/16 :goto_0

    .line 94
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_0
        :pswitch_b
        :pswitch_a
    .end packed-switch
.end method
