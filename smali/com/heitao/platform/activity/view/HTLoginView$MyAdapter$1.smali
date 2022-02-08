.class Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$1;
.super Ljava/lang/Object;
.source "HTLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$1;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    .line 316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 319
    check-cast p1, Landroid/widget/TextView;

    .end local p1    # "v":Landroid/view/View;
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 320
    .local v1, "userName":Ljava/lang/String;
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/heitao/platform/common/HTPDBHelper;->queryWithUserName(Ljava/lang/String;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v0

    .line 321
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    if-eqz v0, :cond_0

    .line 322
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$1;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v2

    iget-object v3, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/heitao/platform/activity/view/HTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTLoginView;Ljava/lang/String;)V

    .line 323
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$1;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/heitao/platform/activity/view/HTLoginView;->access$3(Lcom/heitao/platform/activity/view/HTLoginView;Lcom/heitao/platform/model/HTPDBUser;)V

    .line 324
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$1;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/EditText;

    move-result-object v2

    iget-object v3, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 326
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$1;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$5(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/PopupWindow;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->dismiss()V

    .line 327
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$1;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->notifyDataSetChanged()V

    .line 328
    return-void
.end method
