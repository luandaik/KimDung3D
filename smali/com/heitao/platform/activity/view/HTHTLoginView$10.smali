.class Lcom/heitao/platform/activity/view/HTHTLoginView$10;
.super Ljava/lang/Object;
.source "HTHTLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTHTLoginView;->buildRegisterView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

.field private final synthetic val$loginPassworded:Landroid/widget/EditText;

.field private final synthetic val$userName:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTHTLoginView;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->val$loginPassworded:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->val$userName:Landroid/widget/EditText;

    .line 344
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 348
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 349
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->val$loginPassworded:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 350
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$16(Lcom/heitao/platform/activity/view/HTHTLoginView;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 351
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->val$userName:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->val$loginPassworded:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$17(Lcom/heitao/platform/activity/view/HTHTLoginView;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;)V

    .line 356
    :goto_0
    return-void

    .line 353
    :cond_0
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$10;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_please_read"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0
.end method
