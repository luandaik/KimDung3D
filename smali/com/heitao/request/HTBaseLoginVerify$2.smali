.class Lcom/heitao/request/HTBaseLoginVerify$2;
.super Ljava/lang/Object;
.source "HTBaseLoginVerify.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTBaseLoginVerify;->doShowDialog(ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/HTBaseLoginVerify;

.field final synthetic val$code:I

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTBaseLoginVerify;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 238
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iput p2, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->val$code:I

    iput-object p3, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->val$title:Ljava/lang/String;

    iput-object p4, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/16 v5, 0x7532

    const/16 v4, 0x7531

    .line 242
    const-string v1, "\u786e\u5b9a"

    .line 244
    .local v1, "buttonTitle":Ljava/lang/String;
    iget v2, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->val$code:I

    const/16 v3, 0x7530

    if-ne v2, v3, :cond_0

    .line 246
    const-string v2, "\u767b\u5f55token\u8d85\u65f6"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V

    .line 247
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v2

    invoke-virtual {v2, v6, v6}, Lcom/heitao/channel/HTChannelDispatcher;->doLogin(Ljava/lang/String;Lcom/heitao/listener/HTLoginListener;)V

    .line 334
    :goto_0
    return-void

    .line 250
    :cond_0
    iget v2, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->val$code:I

    if-ne v2, v4, :cond_3

    .line 252
    const-string v2, "\u767b\u5f55\u9650\u5236"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V

    .line 260
    :cond_1
    :goto_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    iget-object v2, v2, Lcom/heitao/request/HTBaseLoginVerify;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 261
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 262
    iget-object v2, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 263
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 264
    new-instance v2, Lcom/heitao/request/HTBaseLoginVerify$2$1;

    invoke-direct {v2, p0}, Lcom/heitao/request/HTBaseLoginVerify$2$1;-><init>(Lcom/heitao/request/HTBaseLoginVerify$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 297
    iget-object v2, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->this$0:Lcom/heitao/request/HTBaseLoginVerify;

    invoke-static {v2}, Lcom/heitao/request/HTBaseLoginVerify;->access$300(Lcom/heitao/request/HTBaseLoginVerify;)Z

    move-result v2

    if-nez v2, :cond_4

    iget v2, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->val$code:I

    if-ne v2, v5, :cond_4

    .line 299
    const-string v2, "\u53d6\u6d88"

    new-instance v3, Lcom/heitao/request/HTBaseLoginVerify$2$2;

    invoke-direct {v3, p0}, Lcom/heitao/request/HTBaseLoginVerify$2$2;-><init>(Lcom/heitao/request/HTBaseLoginVerify$2;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 333
    :cond_2
    :goto_2
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 254
    .end local v0    # "alertDialog":Landroid/app/AlertDialog$Builder;
    :cond_3
    iget v2, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->val$code:I

    if-ne v2, v5, :cond_1

    .line 256
    const-string v2, "\u6709\u65b0\u7248\u672c"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V

    .line 257
    const-string v1, "\u7acb\u5373\u66f4\u65b0"

    goto :goto_1

    .line 314
    .restart local v0    # "alertDialog":Landroid/app/AlertDialog$Builder;
    :cond_4
    iget v2, p0, Lcom/heitao/request/HTBaseLoginVerify$2;->val$code:I

    if-ne v2, v4, :cond_2

    .line 316
    const-string v2, "\u53d6\u6d88"

    new-instance v3, Lcom/heitao/request/HTBaseLoginVerify$2$3;

    invoke-direct {v3, p0}, Lcom/heitao/request/HTBaseLoginVerify$2$3;-><init>(Lcom/heitao/request/HTBaseLoginVerify$2;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2
.end method
