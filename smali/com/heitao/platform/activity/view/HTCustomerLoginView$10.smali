.class Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;
.super Ljava/lang/Object;
.source "HTCustomerLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTCustomerLoginView;->buildBindPhoneNumber()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    .line 283
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;)Lcom/heitao/platform/activity/view/HTCustomerLoginView;
    .locals 1

    .prologue
    .line 283
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 286
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 287
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    const-string v1, "\u63d0\u793a"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 288
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_OK"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 289
    new-instance v2, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10$1;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10$1;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;)V

    .line 288
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 296
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_Cancel"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 297
    new-instance v2, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10$2;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10$2;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;)V

    .line 296
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 304
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_cancel_bind_phone"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 305
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 306
    return-void
.end method
