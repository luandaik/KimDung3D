.class Lcom/heitao/platform/activity/view/HTPhoneLoginView2$14;
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

.field private final synthetic val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

.field private final synthetic val$phoneET:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$14;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$14;->val$phoneET:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$14;->val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

    .line 348
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 352
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$14;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$14;->val$phoneET:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "login"

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$14;->val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

    invoke-static {v0, v1, v2, v3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$9(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    .line 353
    return-void
.end method
