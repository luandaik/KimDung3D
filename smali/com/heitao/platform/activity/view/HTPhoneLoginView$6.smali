.class Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;
.super Ljava/lang/Object;
.source "HTPhoneLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView;->buildPhoneLoginView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

.field private final synthetic val$passwordET:Landroid/widget/EditText;

.field private final synthetic val$phoneET:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;->val$passwordET:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;->val$phoneET:Landroid/widget/EditText;

    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 244
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$4(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 245
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;->val$passwordET:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 247
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;->val$phoneET:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;->val$passwordET:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v4}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$7(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 248
    return-void
.end method
