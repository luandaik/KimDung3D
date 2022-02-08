.class Lcom/heitao/platform/activity/view/HTCustomerLoginView$14;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTCustomerLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTCustomerLoginView;->doBindPhone(Ljava/lang/String;Ljava/lang/String;)V
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
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    .line 389
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 2
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 401
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 403
    iget-boolean v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v0, :cond_0

    .line 404
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    const-string v1, "htp_bind_success"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 406
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$13(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    .line 410
    :goto_0
    return-void

    .line 408
    :cond_0
    iget-object v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 393
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 395
    iget-object v0, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 396
    return-void
.end method
