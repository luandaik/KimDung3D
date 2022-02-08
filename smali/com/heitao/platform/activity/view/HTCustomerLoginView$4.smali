.class Lcom/heitao/platform/activity/view/HTCustomerLoginView$4;
.super Ljava/lang/Object;
.source "HTCustomerLoginView.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


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
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$4;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 195
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$4;->this$0:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->access$7(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/EditText;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 196
    const/4 v0, 0x0

    return v0
.end method
