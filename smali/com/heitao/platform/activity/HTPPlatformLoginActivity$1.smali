.class Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;
.super Landroid/os/Handler;
.source "HTPPlatformLoginActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    .line 109
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x1

    .line 112
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 113
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    if-nez v0, :cond_1

    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->empty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 187
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 116
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :pswitch_1
    goto :goto_0

    .line 119
    :pswitch_2
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->FIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 121
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->FIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 122
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$0(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Z)V

    goto :goto_0

    .line 125
    :pswitch_3
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->NOTFIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 127
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 128
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0, v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$1(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Z)V

    goto :goto_0

    .line 131
    :pswitch_4
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINT:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 133
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINT:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 134
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$2(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V

    goto :goto_0

    .line 137
    :pswitch_5
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 139
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 140
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$3(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V

    goto :goto_0

    .line 143
    :pswitch_6
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 145
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 146
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$4(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V

    goto :goto_0

    .line 149
    :pswitch_7
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->FIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 151
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINT:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_2

    .line 152
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 154
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0, v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$0(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Z)V

    .line 155
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$5(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)Lcom/heitao/platform/activity/view/HTHTLoginView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$5(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)Lcom/heitao/platform/activity/view/HTHTLoginView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->initFliper()V

    goto/16 :goto_0

    .line 160
    :pswitch_8
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->FIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 162
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_3

    .line 163
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 165
    :cond_3
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0, v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$0(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Z)V

    goto/16 :goto_0

    .line 168
    :pswitch_9
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->FIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-eq v0, v1, :cond_0

    .line 170
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_4

    .line 171
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 173
    :cond_4
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0, v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$0(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Z)V

    goto/16 :goto_0

    .line 179
    :pswitch_a
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$6(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V

    goto/16 :goto_0

    .line 182
    :pswitch_b
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->finish()V

    goto/16 :goto_0

    .line 116
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method
