.class Lcom/heitao/platform/common/HTPUtils$5;
.super Ljava/lang/Object;
.source "HTPUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/common/HTPUtils;->doCancelProgressDialog(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/common/HTPUtils$5;->val$context:Landroid/content/Context;

    .line 429
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 434
    iget-object v1, p0, Lcom/heitao/platform/common/HTPUtils$5;->val$context:Landroid/content/Context;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/heitao/platform/common/HTPUtils$5;->val$context:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 436
    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->access$1()Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->access$1()Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 439
    :try_start_0
    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->access$1()Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 440
    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->access$1()Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->hide()V

    .line 441
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->access$0(Landroid/app/ProgressDialog;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 450
    :cond_0
    :goto_0
    return-void

    .line 442
    :catch_0
    move-exception v0

    .line 443
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "dismiss error"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 444
    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->access$1()Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 445
    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->access$0(Landroid/app/ProgressDialog;)V

    goto :goto_0
.end method
