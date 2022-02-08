.class Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;
.super Landroid/widget/SimpleAdapter;
.source "HTLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/activity/view/HTLoginView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyAdapter"
.end annotation


# instance fields
.field private data:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTLoginView;


# direct methods
.method public constructor <init>(Lcom/heitao/platform/activity/view/HTLoginView;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V
    .locals 6
    .param p2, "context"    # Landroid/content/Context;
    .param p4, "resource"    # I
    .param p5, "from"    # [Ljava/lang/String;
    .param p6, "to"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;I[",
            "Ljava/lang/String;",
            "[I)V"
        }
    .end annotation

    .prologue
    .line 277
    .local p3, "data":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move v3, p4

    move-object v4, p5

    move-object v5, p6

    .line 278
    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 279
    iput-object p3, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->data:Ljava/util/List;

    .line 280
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Ljava/util/List;
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->data:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    return-object v0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 284
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->data:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 289
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 294
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 300
    if-nez p2, :cond_0

    .line 301
    new-instance v0, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-direct {v0, v1}, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;-><init>(Lcom/heitao/platform/activity/view/HTLoginView;)V

    .line 302
    .local v0, "holder":Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$0(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$0(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v2

    const-string v3, "htp_dropdown_item"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 303
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$0(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_pop_delete"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->access$0(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;Landroid/widget/ImageButton;)V

    .line 304
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$0(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_pop_textview"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;Landroid/widget/TextView;)V

    .line 305
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->access$0(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v1

    const-string v2, "htp_pop_selected"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    invoke-static {v0, v1}, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->access$2(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;Landroid/widget/ImageButton;)V

    .line 306
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 310
    :goto_0
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->data:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    const-string v2, "name"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->this$0:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$1(Lcom/heitao/platform/activity/view/HTLoginView;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 311
    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->access$3(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;)Landroid/widget/ImageButton;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 315
    :goto_1
    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->access$4(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;)Landroid/widget/TextView;

    move-result-object v2

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->data:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    const-string v3, "name"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 316
    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->access$4(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$1;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$1;-><init>(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 330
    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->access$5(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;)Landroid/widget/ImageButton;

    move-result-object v1

    new-instance v2, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;

    invoke-direct {v2, p0, p1}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;-><init>(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;I)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 368
    return-object p2

    .line 308
    .end local v0    # "holder":Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;

    .restart local v0    # "holder":Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;
    goto :goto_0

    .line 313
    :cond_1
    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;->access$3(Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;)Landroid/widget/ImageButton;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_1
.end method
