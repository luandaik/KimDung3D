.class Lcom/heitao/platform/activity/HTPUserCenterActivity$21;
.super Lcom/heitao/platform/listener/HTPRequestListener;
.source "HTPUserCenterActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPUserCenterActivity;->doBindPhone(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

.field private final synthetic val$dbUser:Lcom/heitao/platform/model/HTPDBUser;

.field private final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Lcom/heitao/platform/model/HTPDBUser;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->val$dbUser:Lcom/heitao/platform/model/HTPDBUser;

    iput-object p3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->val$number:Ljava/lang/String;

    .line 731
    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPRequestListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
    .locals 2
    .param p1, "httpEntity"    # Lcom/heitao/platform/model/HTPHttpEntity;

    .prologue
    .line 743
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$14(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 745
    iget-boolean v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->isCompleted:Z

    if-eqz v0, :cond_0

    .line 746
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    const-string v1, "htp_bind_success"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 748
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->val$dbUser:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->val$number:Ljava/lang/String;

    iput-object v1, v0, Lcom/heitao/platform/model/HTPDBUser;->mobile:Ljava/lang/String;

    .line 749
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->val$number:Ljava/lang/String;

    iput-object v1, v0, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    .line 750
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->val$dbUser:Lcom/heitao/platform/model/HTPDBUser;

    invoke-virtual {v0, v1}, Lcom/heitao/platform/common/HTPDBHelper;->update(Lcom/heitao/platform/model/HTPDBUser;)V

    .line 751
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$13(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 755
    :goto_0
    return-void

    .line 753
    :cond_0
    iget-object v0, p1, Lcom/heitao/platform/model/HTPHttpEntity;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 1
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 735
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$14(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V

    .line 737
    iget-object v0, p1, Lcom/heitao/platform/model/HTPError;->message:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 738
    return-void
.end method
