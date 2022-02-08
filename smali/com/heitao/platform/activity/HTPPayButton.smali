.class public Lcom/heitao/platform/activity/HTPPayButton;
.super Landroid/widget/LinearLayout;
.source "HTPPayButton.java"


# instance fields
.field private mImageView:Landroid/widget/ImageView;

.field private mIsSelected:Z

.field private mTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 16
    iput-object v0, p0, Lcom/heitao/platform/activity/HTPPayButton;->mImageView:Landroid/widget/ImageView;

    .line 17
    iput-object v0, p0, Lcom/heitao/platform/activity/HTPPayButton;->mTextView:Landroid/widget/TextView;

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/heitao/platform/activity/HTPPayButton;->mIsSelected:Z

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPayButton;->mImageView:Landroid/widget/ImageView;

    .line 17
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPayButton;->mTextView:Landroid/widget/TextView;

    .line 19
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/heitao/platform/activity/HTPPayButton;->mIsSelected:Z

    .line 30
    const-string v1, "layout_inflater"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 31
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const-string v1, "htp_pay_channel_button"

    invoke-static {p1, v1}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 34
    const-string v1, "btn_channel_icon"

    invoke-static {p1, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/heitao/platform/activity/HTPPayButton;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPayButton;->mImageView:Landroid/widget/ImageView;

    .line 35
    const-string v1, "txt_channel_title"

    invoke-static {p1, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/heitao/platform/activity/HTPPayButton;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPayButton;->mTextView:Landroid/widget/TextView;

    .line 36
    return-void
.end method


# virtual methods
.method public getSelected()Z
    .locals 1

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/heitao/platform/activity/HTPPayButton;->mIsSelected:Z

    return v0
.end method

.method public setImageResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 44
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayButton;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 45
    return-void
.end method

.method public setSelected(Z)V
    .locals 2
    .param p1, "isSelected"    # Z

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/heitao/platform/activity/HTPPayButton;->mIsSelected:Z

    .line 63
    iget-boolean v0, p0, Lcom/heitao/platform/activity/HTPPayButton;->mIsSelected:Z

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayButton;->mTextView:Landroid/widget/TextView;

    const-string v1, "#ed6001"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    :goto_0
    return-void

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayButton;->mTextView:Landroid/widget/TextView;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1
    .param p1, "strId"    # Ljava/lang/String;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayButton;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    return-void
.end method
