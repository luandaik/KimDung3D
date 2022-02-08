.class Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;
.super Landroid/widget/ViewFlipper;
.source "HTPhoneLoginView2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView2;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

.field private final synthetic val$context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Landroid/content/Context;Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->val$context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    .line 139
    invoke-direct {p0, p2}, Landroid/widget/ViewFlipper;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public showNext()V
    .locals 4

    .prologue
    .line 143
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->val$context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->val$context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v3, "htp_slideout_left"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 144
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->val$context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->val$context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v3, "htp_slidein_left"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 145
    invoke-super {p0}, Landroid/widget/ViewFlipper;->showNext()V

    .line 146
    return-void
.end method

.method public showPrevious()V
    .locals 4

    .prologue
    .line 150
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->val$context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->val$context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v3, "htp_slideout_right"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 151
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->val$context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;->val$context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v3, "htp_slidein_right"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 152
    invoke-super {p0}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 153
    return-void
.end method
