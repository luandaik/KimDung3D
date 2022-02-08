.class Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;
.super Ljava/lang/Object;
.source "HTCustomerLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTCustomerLoginView;->buildRegisterView()V
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
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 216
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 217
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$7(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 218
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$9(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 219
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$10(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/EditText;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v3}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$7(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/EditText;

    move-result-object v3

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$11(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;)V

    .line 224
    :goto_0
    return-void

    .line 221
    :cond_0
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_please_read"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method
