.class Lcom/heitao/platform/activity/view/HTHTLoginView$14;
.super Ljava/lang/Object;
.source "HTHTLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTHTLoginView;->buildBindePhoneView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    .line 413
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/HTHTLoginView$14;)Lcom/heitao/platform/activity/view/HTHTLoginView;
    .locals 1

    .prologue
    .line 413
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 416
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 417
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    const-string v1, "\u63d0\u793a"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 418
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_OK"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/heitao/platform/activity/view/HTHTLoginView$14$1;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$14$1;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView$14;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 427
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_Cancel"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/heitao/platform/activity/view/HTHTLoginView$14$2;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$14$2;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView$14;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 436
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$14;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_cancel_bind_phone"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 437
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 438
    return-void
.end method
