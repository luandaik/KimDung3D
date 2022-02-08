.class Lcom/heitao/platform/activity/view/HTPhoneLoginView$9;
.super Ljava/lang/Object;
.source "HTPhoneLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView;->buildPhoneRegisterView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

.field private final synthetic val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

.field private final synthetic val$phoneET:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$9;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$9;->val$phoneET:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$9;->val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

    .line 280
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 284
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$9;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$9;->val$phoneET:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "reg"

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$9;->val$countDownBt:Lcom/heitao/platform/activity/view/MyCountDownBt;

    invoke-static {v0, v1, v2, v3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$8(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    .line 285
    return-void
.end method
