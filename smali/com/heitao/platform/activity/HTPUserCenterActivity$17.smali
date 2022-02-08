.class Lcom/heitao/platform/activity/HTPUserCenterActivity$17;
.super Ljava/lang/Object;
.source "HTPUserCenterActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPUserCenterActivity;->buildBindNewPhoneView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

.field private final synthetic val$newPhoneET:Landroid/widget/EditText;

.field private final synthetic val$oldPhoneET:Landroid/widget/EditText;

.field private final synthetic val$verfyET:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;->val$verfyET:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;->val$oldPhoneET:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;->val$newPhoneET:Landroid/widget/EditText;

    .line 534
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 539
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-static {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$14(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 540
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;->val$verfyET:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 541
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;->this$0:Lcom/heitao/platform/activity/HTPUserCenterActivity;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;->val$oldPhoneET:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;->val$newPhoneET:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    .line 542
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;->val$verfyET:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    .line 541
    invoke-static {v1, v2, v3, v4}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->access$19(Lcom/heitao/platform/activity/HTPUserCenterActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 543
    return-void
.end method
