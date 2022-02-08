.class Lcom/heitao/platform/activity/view/HTPhoneLoginView$18;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTPhoneLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView;->doPhoneLogin(Ljava/lang/String;Ljava/lang/String;Z)V
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
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$18;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    .line 537
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 4
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 552
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$18;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$4(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 554
    iget-boolean v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v2, :cond_2

    .line 557
    iget-object v1, p1, Lcom/heitao/platform/model/HTPHttpEntity;->object:Ljava/lang/Object;

    check-cast v1, Lcom/heitao/platform/model/HTPUser;

    .line 558
    .local v1, "user":Lcom/heitao/platform/model/HTPUser;
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v2

    iput-object v1, v2, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    .line 560
    new-instance v0, Lcom/heitao/platform/model/HTPDBUser;

    invoke-direct {v0}, Lcom/heitao/platform/model/HTPDBUser;-><init>()V

    .line 561
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    .line 562
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    .line 563
    const-string v2, ""

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    .line 564
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->ltime:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    .line 565
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->ltoken:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    .line 566
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->mobile:Ljava/lang/String;

    .line 568
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/heitao/platform/common/HTPDBHelper;->update(Lcom/heitao/platform/model/HTPDBUser;)V

    .line 569
    sget-object v2, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    if-eqz v2, :cond_0

    .line 570
    sget-object v2, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    invoke-virtual {v2, v1}, Lcom/heitao/platform/listener/HTPLoginListener;->onLoginCompleted(Lcom/heitao/platform/model/HTPUser;)V

    .line 572
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$18;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$5(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 573
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$18;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$5(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/os/Handler;

    move-result-object v2

    const/16 v3, 0xf

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 580
    .end local v0    # "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    .end local v1    # "user":Lcom/heitao/platform/model/HTPUser;
    :cond_1
    :goto_0
    return-void

    .line 578
    :cond_2
    iget-object v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->message:Ljava/lang/String;

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 543
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$18;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$4(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 545
    iget-object v0, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 546
    return-void
.end method
