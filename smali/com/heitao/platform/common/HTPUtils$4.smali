.class Lcom/heitao/platform/common/HTPUtils$4;
.super Ljava/lang/Object;
.source "HTPUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$message:Ljava/lang/String;

.field private final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/common/HTPUtils$4;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/heitao/platform/common/HTPUtils$4;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lcom/heitao/platform/common/HTPUtils$4;->val$message:Ljava/lang/String;

    .line 393
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 399
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/heitao/platform/common/HTPUtils$4;->val$context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->access$0(Landroid/app/ProgressDialog;)V

    .line 400
    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->access$1()Landroid/app/ProgressDialog;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/common/HTPUtils$4;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 401
    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->access$1()Landroid/app/ProgressDialog;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/common/HTPUtils$4;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 402
    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->access$1()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 403
    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->access$1()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 404
    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->access$1()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 405
    return-void
.end method
