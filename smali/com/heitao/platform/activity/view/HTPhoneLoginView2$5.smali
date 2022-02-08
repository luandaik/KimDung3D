.class Lcom/heitao/platform/activity/view/HTPhoneLoginView2$5;
.super Ljava/lang/Object;
.source "HTPhoneLoginView2.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneLoginView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$5;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 218
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$5;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$6(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 219
    return-void
.end method
