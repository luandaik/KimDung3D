.class final Lcom/heitao/common/HTUtils$4;
.super Ljava/lang/Object;
.source "HTUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/common/HTUtils;->doShowDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$buttonTitle:Ljava/lang/String;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$listener:Landroid/content/DialogInterface$OnClickListener;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    .prologue
    .line 293
    iput-object p1, p0, Lcom/heitao/common/HTUtils$4;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/heitao/common/HTUtils$4;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lcom/heitao/common/HTUtils$4;->val$message:Ljava/lang/String;

    iput-object p4, p0, Lcom/heitao/common/HTUtils$4;->val$buttonTitle:Ljava/lang/String;

    iput-object p5, p0, Lcom/heitao/common/HTUtils$4;->val$listener:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 299
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/heitao/common/HTUtils$4;->val$context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 300
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lcom/heitao/common/HTUtils$4;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 301
    iget-object v1, p0, Lcom/heitao/common/HTUtils$4;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 302
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 303
    iget-object v1, p0, Lcom/heitao/common/HTUtils$4;->val$buttonTitle:Ljava/lang/String;

    iget-object v2, p0, Lcom/heitao/common/HTUtils$4;->val$listener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 304
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 305
    return-void
.end method
