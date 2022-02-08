.class Lcom/heitao/platform/activity/view/HTCustomerLoginView$5;
.super Ljava/lang/Object;
.source "HTCustomerLoginView.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$5;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    .line 200
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "arg0"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 204
    if-eqz p2, :cond_0

    .line 205
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$5;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$8(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Z)V

    .line 209
    :goto_0
    return-void

    .line 207
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$5;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$8(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Z)V

    goto :goto_0
.end method
