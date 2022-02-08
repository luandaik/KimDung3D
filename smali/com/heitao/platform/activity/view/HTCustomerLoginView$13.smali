.class Lcom/heitao/platform/activity/view/HTCustomerLoginView$13;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTCustomerLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTCustomerLoginView;->getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

.field private final synthetic val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$13;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$13;->val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

    .line 342
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 2
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 354
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$13;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 356
    iget-boolean v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$13;->val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/MyCountDownBt;->start()Landroid/os/CountDownTimer;

    .line 358
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$13;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    const-string v1, "htp_send_verfy_success"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 362
    :goto_0
    return-void

    .line 360
    :cond_0
    iget-object v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 346
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$13;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 348
    iget-object v0, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 349
    return-void
.end method
