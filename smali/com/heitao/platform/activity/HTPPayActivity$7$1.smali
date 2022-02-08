.class Lcom/heitao/platform/activity/HTPPayActivity$7$1;
.super Ljava/lang/Object;
.source "HTPPayActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPPayActivity$7;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/platform/activity/HTPPayActivity$7;

.field private final synthetic val$cardMonryButton:Landroid/widget/Button;

.field private final synthetic val$finalItems:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPPayActivity$7;[Ljava/lang/String;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$7$1;->this$1:Lcom/heitao/platform/activity/HTPPayActivity$7;

    iput-object p2, p0, Lcom/heitao/platform/activity/HTPPayActivity$7$1;->val$finalItems:[Ljava/lang/String;

    iput-object p3, p0, Lcom/heitao/platform/activity/HTPPayActivity$7$1;->val$cardMonryButton:Landroid/widget/Button;

    .line 752
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 756
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$7$1;->this$1:Lcom/heitao/platform/activity/HTPPayActivity$7;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity$7;->access$0(Lcom/heitao/platform/activity/HTPPayActivity$7;)Lcom/heitao/platform/activity/HTPPayActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$7$1;->val$finalItems:[Ljava/lang/String;

    aget-object v1, v1, p2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->access$13(Lcom/heitao/platform/activity/HTPPayActivity;I)V

    .line 757
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$7$1;->val$cardMonryButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity$7$1;->val$finalItems:[Ljava/lang/String;

    aget-object v1, v1, p2

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 758
    return-void
.end method
