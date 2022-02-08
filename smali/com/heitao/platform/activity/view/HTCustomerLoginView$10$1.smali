.class Lcom/heitao/platform/activity/view/HTCustomerLoginView$10$1;
.super Ljava/lang/Object;
.source "HTCustomerLoginView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10$1;->this$1:Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;

    .line 289
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 292
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 293
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10$1;->this$1:Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;->access$0(Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;)Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$13(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    .line 294
    return-void
.end method
