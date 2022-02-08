.class Lcom/heitao/platform/activity/view/HTLoginView$1;
.super Ljava/lang/Object;
.source "HTLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTLoginView;->createView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTLoginView;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTLoginView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 77
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$0(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 78
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 79
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 80
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 81
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$8(Lcom/heitao/platform/activity/view/HTLoginView;Ljava/lang/String;)V

    .line 87
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 83
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 84
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$9(Lcom/heitao/platform/activity/view/HTLoginView;)V

    goto :goto_0
.end method
