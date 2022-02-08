.class Lcom/heitao/platform/activity/HTPUserCenterActivity$7;
.super Landroid/widget/ViewFlipper;
.source "HTPUserCenterActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPUserCenterActivity;->initFliper()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/content/Context;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    .line 346
    invoke-direct {p0, p2}, Landroid/widget/ViewFlipper;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public showNext()V
    .locals 4

    .prologue
    .line 350
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    .line 351
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$14(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    const-string v3, "htp_slideout_left"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 350
    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 352
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$14(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    const-string v3, "htp_slidein_left"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 353
    invoke-super {p0}, Landroid/widget/ViewFlipper;->showNext()V

    .line 354
    return-void
.end method

.method public showPrevious()V
    .locals 4

    .prologue
    .line 358
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    .line 359
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$14(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    const-string v3, "htp_slideout_right"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 358
    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 360
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;

    move-result-object v0

    .line 361
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$14(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    const-string v3, "htp_slidein_right"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 360
    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 362
    invoke-super {p0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 363
    return-void
.end method
