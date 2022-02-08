.class Lcom/heitao/platform/activity/HTPUserCenterActivity$4;
.super Ljava/lang/Object;
.source "HTPUserCenterActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPUserCenterActivity;->setBaseView(Z)V
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
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$4;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    .line 302
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 306
    sget-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    invoke-virtual {v0}, Lcom/heitao/platform/listener/HTPLogoutListener;->onLogoutCompleted()V

    .line 307
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/common/HTPDataCenter;->reset()V

    .line 308
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$4;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->finish()V

    .line 309
    return-void
.end method
