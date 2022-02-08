.class Lcom/heitao/platform/activity/HTPPlatformLoginActivity$3;
.super Ljava/lang/Object;
.source "HTPPlatformLoginActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->showDailog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    .line 361
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 365
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$3;->this$0:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->access$8(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)Landroid/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 366
    return-void
.end method
