.class Lcom/heitao/platform/activity/view/HTHTLoginView$7;
.super Ljava/lang/Object;
.source "HTHTLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTHTLoginView;->buildHtLoginView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

.field private final synthetic val$loginPasswordedEt:Landroid/widget/EditText;

.field private final synthetic val$userNameEt:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTHTLoginView;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$7;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$7;->val$loginPasswordedEt:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$7;->val$userNameEt:Landroid/widget/EditText;

    .line 303
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 308
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$7;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 309
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$7;->val$loginPasswordedEt:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 311
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$7;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$7;->val$userNameEt:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$7;->val$loginPasswordedEt:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$14(Lcom/heitao/platform/activity/view/HTHTLoginView;Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    return-void
.end method
