.class Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$3;
.super Ljava/lang/Object;
.source "HTPFloatMenuWindow.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->buildMenu(Landroid/app/Activity;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

.field private final synthetic val$activity:Landroid/app/Activity;

.field private final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$3;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$3;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$3;->val$url:Ljava/lang/String;

    .line 481
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 485
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$3;->val$activity:Landroid/app/Activity;

    const-class v2, Lcom/heitao/platform/activity/HTUserWebViewActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 486
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "url"

    iget-object v2, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$3;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 487
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$3;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 488
    return-void
.end method
