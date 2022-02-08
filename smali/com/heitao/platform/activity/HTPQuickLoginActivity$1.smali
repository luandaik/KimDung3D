.class Lcom/heitao/platform/activity/HTPQuickLoginActivity$1;
.super Ljava/lang/Object;
.source "HTPQuickLoginActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 97
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$0(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Z)V

    .line 98
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity$1;->this$0:Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->access$1(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V

    .line 99
    return-void
.end method
