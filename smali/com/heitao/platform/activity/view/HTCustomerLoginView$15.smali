.class Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTCustomerLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTCustomerLoginView;->checkRegisterInputPrams(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$password:Ljava/lang/String;

.field private final synthetic val$userName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->val$userName:Ljava/lang/String;

    iput-object p4, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->val$password:Ljava/lang/String;

    .line 457
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 6
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 468
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->val$context:Landroid/content/Context;

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 470
    iget-boolean v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v2, :cond_0

    .line 471
    iget-object v1, p1, Lcom/heitao/platform/model/HTPHttpEntity;->object:Ljava/lang/Object;

    check-cast v1, Lcom/heitao/platform/model/HTPUser;

    .line 472
    .local v1, "user":Lcom/heitao/platform/model/HTPUser;
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v2

    iput-object v1, v2, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    .line 474
    new-instance v0, Lcom/heitao/platform/model/HTPDBUser;

    invoke-direct {v0}, Lcom/heitao/platform/model/HTPDBUser;-><init>()V

    .line 475
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    .line 476
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    .line 477
    const-string v2, ""

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    .line 478
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->ltime:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    .line 479
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->ltoken:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    .line 480
    iget-object v2, v1, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    iput-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->mobile:Ljava/lang/String;

    .line 481
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/heitao/platform/common/HTPDBHelper;->update(Lcom/heitao/platform/model/HTPDBUser;)V

    .line 483
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->val$context:Landroid/content/Context;

    check-cast v2, Landroid/app/Activity;

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".png"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/heitao/platform/common/HTPUtils;->snapshoot(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v2

    invoke-static {v3, v2}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$16(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Z)V

    .line 485
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->val$userName:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$17(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Ljava/lang/String;)V

    .line 486
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->val$password:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$18(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Ljava/lang/String;)V

    .line 487
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$12(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/os/Handler;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 491
    .end local v0    # "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    .end local v1    # "user":Lcom/heitao/platform/model/HTPUser;
    :goto_0
    return-void

    .line 489
    :cond_0
    iget-object v2, p1, Lcom/heitao/platform/model/HTPHttpEntity;->message:Ljava/lang/String;

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 461
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 462
    iget-object v0, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 463
    return-void
.end method
