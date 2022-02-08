.class Lcom/heitao/common/activity/HTWebViewActivity$1;
.super Ljava/lang/Object;
.source "HTWebViewActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/common/activity/HTWebViewActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/common/activity/HTWebViewActivity;


# direct methods
.method constructor <init>(Lcom/heitao/common/activity/HTWebViewActivity;)V
    .locals 0

    .prologue
    .line 73
    iput-object p1, p0, Lcom/heitao/common/activity/HTWebViewActivity$1;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity$1;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-static {v0}, Lcom/heitao/common/activity/HTWebViewActivity;->access$000(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/widget/ImageButton;

    move-result-object v0

    if-ne v0, p1, :cond_1

    .line 80
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity$1;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-static {v0}, Lcom/heitao/common/activity/HTWebViewActivity;->access$100(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 94
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity$1;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-static {v0}, Lcom/heitao/common/activity/HTWebViewActivity;->access$200(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/widget/ImageButton;

    move-result-object v0

    if-ne v0, p1, :cond_2

    .line 84
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity$1;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-static {v0}, Lcom/heitao/common/activity/HTWebViewActivity;->access$100(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->goForward()V

    goto :goto_0

    .line 86
    :cond_2
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity$1;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-static {v0}, Lcom/heitao/common/activity/HTWebViewActivity;->access$300(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/widget/ImageButton;

    move-result-object v0

    if-ne v0, p1, :cond_3

    .line 88
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity$1;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-static {v0}, Lcom/heitao/common/activity/HTWebViewActivity;->access$100(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->reload()V

    goto :goto_0

    .line 90
    :cond_3
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity$1;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-static {v0}, Lcom/heitao/common/activity/HTWebViewActivity;->access$400(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/widget/ImageButton;

    move-result-object v0

    if-ne v0, p1, :cond_0

    .line 92
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity$1;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-static {v0}, Lcom/heitao/common/activity/HTWebViewActivity;->access$500(Lcom/heitao/common/activity/HTWebViewActivity;)V

    goto :goto_0
.end method
