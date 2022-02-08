.class Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTPhoneLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView;->registerPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

.field private final synthetic val$number:Ljava/lang/String;

.field private final synthetic val$passWord:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->val$number:Ljava/lang/String;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->val$passWord:Ljava/lang/String;

    .line 462
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 4
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 477
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$4(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 479
    iget-boolean v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v2, :cond_0

    .line 481
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$4(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v2

    const-string v3, "htp_register_success"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 482
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->val$number:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$14(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;)V

    .line 483
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->val$passWord:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$15(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;)V

    .line 484
    iget-object v1, p1, Lcom/heitao/platform/model/HTPHttpEntity;->object:Ljava/lang/Object;

    check-cast v1, Lcom/heitao/platform/model/HTPUser;

    .line 485
    .local v1, "user":Lcom/heitao/platform/model/HTPUser;
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v2

    iput-object v1, v2, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    .line 487
    new-instance v0, Lcom/heitao/platform/model/HTPDBUser;

    invoke-direct {v0}, Lcom/heitao/platform/model/HTPDBUser;-><init>()V

    .line 488
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    .line 489
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    .line 490
    const-string v2, ""

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    .line 491
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->ltime:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    .line 492
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->ltoken:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    .line 493
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->mobile:Ljava/lang/String;

    .line 494
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/heitao/platform/common/HTPDBHelper;->update(Lcom/heitao/platform/model/HTPDBUser;)V

    .line 495
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$6(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/os/Handler;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 501
    .end local v0    # "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    .end local v1    # "user":Lcom/heitao/platform/model/HTPUser;
    :goto_0
    return-void

    .line 499
    :cond_0
    iget-object v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->message:Ljava/lang/String;

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 468
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$4(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 470
    iget-object v0, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 471
    return-void
.end method
