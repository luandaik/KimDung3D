.class Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;
.super Ljava/lang/Object;
.source "HTLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/activity/view/HTLoginView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field private btn:Landroid/widget/ImageButton;

.field private selected:Landroid/widget/ImageButton;

.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTLoginView;

.field private tv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTLoginView;)V
    .locals 0

    .prologue
    .line 372
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;Landroid/widget/ImageButton;)V
    .locals 0

    .prologue
    .line 375
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->btn:Landroid/widget/ImageButton;

    return-void
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 374
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->tv:Landroid/widget/TextView;

    return-void
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;Landroid/widget/ImageButton;)V
    .locals 0

    .prologue
    .line 373
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->selected:Landroid/widget/ImageButton;

    return-void
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;)Landroid/widget/ImageButton;
    .locals 1

    .prologue
    .line 373
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->selected:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 374
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->tv:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;)Landroid/widget/ImageButton;
    .locals 1

    .prologue
    .line 375
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->btn:Landroid/widget/ImageButton;

    return-object v0
.end method
