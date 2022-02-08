.class Lcom/heitao/platform/activity/HTPQuickLoginActivity$2;
.super Ljava/lang/Object;
.source "HTPQuickLoginActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPQuickLoginActivity;->showDailog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

.field private final synthetic val$decoreView:Landroid/view/View;

.field private final synthetic val$windowY:I


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Landroid/view/View;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$2;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$2;->val$decoreView:Landroid/view/View;

    iput p3, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$2;->val$windowY:I

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 118
    :try_start_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$2;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$2(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Landroid/widget/PopupWindow;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$2;->val$decoreView:Landroid/view/View;

    const/16 v3, 0x30

    const/4 v4, 0x0

    iget v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$2;->val$windowY:I

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :goto_0
    return-void

    .line 119
    :catch_0
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$2;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$1(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V

    goto :goto_0
.end method
