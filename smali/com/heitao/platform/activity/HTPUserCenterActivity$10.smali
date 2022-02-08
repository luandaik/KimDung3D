.class Lcom/heitao/platform/activity/HTPUserCenterActivity$10;
.super Ljava/lang/Object;
.source "HTPUserCenterActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPUserCenterActivity;->buildForgetPWDView()V
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
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$10;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    .line 415
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 419
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v0, v0, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 420
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$10;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    const-string v1, "htp_please_bind_phone"

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 424
    :goto_0
    return-void

    .line 422
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$10;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$13(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method
