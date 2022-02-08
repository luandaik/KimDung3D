.class Lcom/heitao/request/HTPayOrderNumber$2;
.super Ljava/lang/Object;
.source "HTPayOrderNumber.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTPayOrderNumber;->doShowTryDialog(ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/HTPayOrderNumber;

.field final synthetic val$code:I

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTPayOrderNumber;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 143
    iput-object p1, p0, Lcom/heitao/request/HTPayOrderNumber$2;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iput p2, p0, Lcom/heitao/request/HTPayOrderNumber$2;->val$code:I

    iput-object p3, p0, Lcom/heitao/request/HTPayOrderNumber$2;->val$title:Ljava/lang/String;

    iput-object p4, p0, Lcom/heitao/request/HTPayOrderNumber$2;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 147
    const-string v1, "\u91cd\u8bd5"

    .line 149
    .local v1, "buttonTitle":Ljava/lang/String;
    iget v2, p0, Lcom/heitao/request/HTPayOrderNumber$2;->val$code:I

    const/16 v3, 0x753a

    if-ne v2, v3, :cond_0

    .line 151
    const-string v2, "\u5145\u503c\u5173\u95ed"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V

    .line 152
    const-string v1, "\u7ee7\u7eed\u6e38\u620f"

    .line 155
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/heitao/request/HTPayOrderNumber$2;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iget-object v2, v2, Lcom/heitao/request/HTPayOrderNumber;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 156
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/heitao/request/HTPayOrderNumber$2;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 157
    iget-object v2, p0, Lcom/heitao/request/HTPayOrderNumber$2;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 158
    new-instance v2, Lcom/heitao/request/HTPayOrderNumber$2$1;

    invoke-direct {v2, p0}, Lcom/heitao/request/HTPayOrderNumber$2$1;-><init>(Lcom/heitao/request/HTPayOrderNumber$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 176
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 177
    return-void
.end method
