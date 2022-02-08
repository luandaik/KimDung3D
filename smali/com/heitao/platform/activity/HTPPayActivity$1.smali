.class Lcom/heitao/platform/activity/HTPPayActivity$1;
.super Landroid/os/Handler;
.source "HTPPayActivity.java"


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
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    .line 156
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 162
    invoke-static {}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->getInstance()Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v2}, Lcom/heitao/platform/activity/HTPPayActivity;->access$0(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPPayActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v3}, Lcom/heitao/platform/activity/HTPPayActivity;->access$1(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/model/HTPPayInfo;

    move-result-object v3

    iget-object v4, p0, Lcom/heitao/platform/activity/HTPPayActivity$1;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v4}, Lcom/heitao/platform/activity/HTPPayActivity;->access$2(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->pay(Landroid/app/Activity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;Lcom/heitao/platform/model/HTPPayInfo;Lcom/heitao/platform/listener/HTPPayListener;)V

    .line 163
    return-void
.end method
