.class Lcom/heitao/platform/common/HTPUtils$3;
.super Ljava/lang/Object;
.source "HTPUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/common/HTPUtils;->doShowDialog(Landroid/content/Context;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$listener:Landroid/content/DialogInterface$OnClickListener;

.field private final synthetic val$message:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/common/HTPUtils$3;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/heitao/platform/common/HTPUtils$3;->val$message:Ljava/lang/String;

    iput-object p3, p0, Lcom/heitao/platform/common/HTPUtils$3;->val$listener:Landroid/content/DialogInterface$OnClickListener;

    .line 368
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 375
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/heitao/platform/common/HTPUtils$3;->val$context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 376
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    const-string v1, "tip"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 377
    iget-object v1, p0, Lcom/heitao/platform/common/HTPUtils$3;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 378
    const-string v1, "OK"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/common/HTPUtils$3;->val$listener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 379
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 380
    return-void
.end method
