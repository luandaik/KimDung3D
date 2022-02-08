.class Lcom/heitao/platform/activity/HTPPayActivity$6;
.super Ljava/lang/Object;
.source "HTPPayActivity.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPPayActivity;->showPopupWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPPayActivity;

.field private final synthetic val$layoutParams:Landroid/view/WindowManager$LayoutParams;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPPayActivity;Landroid/view/WindowManager$LayoutParams;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$6;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPPayActivity$6;->val$layoutParams:Landroid/view/WindowManager$LayoutParams;

    .line 700
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 2

    .prologue
    .line 706
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$6;->val$layoutParams:Landroid/view/WindowManager$LayoutParams;

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->alpha:F

    .line 707
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$6;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$6;->val$layoutParams:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 708
    return-void
.end method
