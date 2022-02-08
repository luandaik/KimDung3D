.class final Lcom/heitao/common/HTUtils$2;
.super Ljava/lang/Object;
.source "HTUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/common/HTUtils;->doShowDialog(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 234
    iput-object p1, p0, Lcom/heitao/common/HTUtils$2;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/heitao/common/HTUtils$2;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lcom/heitao/common/HTUtils$2;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 240
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/heitao/common/HTUtils$2;->val$context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 241
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lcom/heitao/common/HTUtils$2;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 242
    iget-object v1, p0, Lcom/heitao/common/HTUtils$2;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 243
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 244
    const-string v1, "\u786e\u5b9a"

    new-instance v2, Lcom/heitao/common/HTUtils$2$1;

    invoke-direct {v2, p0}, Lcom/heitao/common/HTUtils$2$1;-><init>(Lcom/heitao/common/HTUtils$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 253
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 254
    return-void
.end method
