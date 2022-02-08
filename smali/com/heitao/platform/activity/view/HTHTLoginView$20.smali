.class Lcom/heitao/platform/activity/view/HTHTLoginView$20;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTHTLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTHTLoginView;->getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

.field private final synthetic val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTHTLoginView;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$20;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$20;->val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

    .line 520
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 2
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 532
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$20;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 534
    iget-boolean v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v0, :cond_0

    .line 535
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$20;->val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/MyCountDownBt;->start()Landroid/os/CountDownTimer;

    .line 536
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$20;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    const-string v1, "htp_send_verfy_success"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 540
    :goto_0
    return-void

    .line 538
    :cond_0
    iget-object v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 524
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$20;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 526
    iget-object v0, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 527
    return-void
.end method
