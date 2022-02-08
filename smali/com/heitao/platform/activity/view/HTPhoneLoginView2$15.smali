.class Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;
.super Ljava/lang/Object;
.source "HTPhoneLoginView2.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneVerfyLoginView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

.field private final synthetic val$phoneET:Landroid/widget/EditText;

.field private final synthetic val$verfyET:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;->val$verfyET:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;->val$phoneET:Landroid/widget/EditText;

    .line 356
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 361
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$7(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 362
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;->val$verfyET:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 363
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;->val$phoneET:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;->val$verfyET:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v1, v2, v3, v4}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$8(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 364
    return-void
.end method
