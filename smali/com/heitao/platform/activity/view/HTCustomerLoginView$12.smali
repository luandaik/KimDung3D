.class Lcom/heitao/platform/activity/view/HTCustomerLoginView$12;
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

.field private final synthetic val$phoneET:Landroid/widget/EditText;

.field private final synthetic val$verfyET:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$12;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$12;->val$phoneET:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$12;->val$verfyET:Landroid/widget/EditText;

    .line 321
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 324
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$12;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$12;->val$phoneET:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$12;->val$verfyET:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$15(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    return-void
.end method
