.class Lcom/heitao/platform/activity/view/HTHTLoginView$9;
.super Ljava/lang/Object;
.source "HTHTLoginView.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTHTLoginView;->buildRegisterView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$9;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    .line 332
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "arg0"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 336
    if-eqz p2, :cond_0

    .line 337
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$9;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$15(Lcom/heitao/platform/activity/view/HTHTLoginView;Z)V

    .line 341
    :goto_0
    return-void

    .line 339
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$9;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$15(Lcom/heitao/platform/activity/view/HTHTLoginView;Z)V

    goto :goto_0
.end method
