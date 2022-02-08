.class Lcom/heitao/platform/activity/view/HTLoginView$3;
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
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView$3;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 103
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$3;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$0(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v2

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 104
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$3;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 107
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/heitao/platform/common/HTPDBHelper;->query()Ljava/util/List;

    move-result-object v1

    .line 108
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_0

    .line 109
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$3;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v2, v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$6(Lcom/heitao/platform/activity/view/HTLoginView;Ljava/util/List;)V

    .line 110
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$3;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$5(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/PopupWindow;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v2

    if-nez v2, :cond_1

    .line 111
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$3;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$5(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/PopupWindow;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView$3;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v3}, Lcom/heitao/platform/activity/view/HTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;)V

    .line 116
    :cond_0
    :goto_0
    return-void

    .line 113
    :cond_1
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$3;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$5(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/PopupWindow;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->dismiss()V

    goto :goto_0
.end method
