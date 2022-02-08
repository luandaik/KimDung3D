.class Lcom/heitao/platform/activity/view/HTPhoneLoginView$3;
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


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$3;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 217
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$3;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->access$5(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 218
    return-void
.end method
