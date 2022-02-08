.class Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;
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

.field private final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    iput p2, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->val$position:I

    .line 330
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 333
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView;->access$5(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/PopupWindow;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/PopupWindow;->dismiss()V

    .line 335
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v5

    .line 336
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$0(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Ljava/util/List;

    move-result-object v4

    iget v6, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->val$position:I

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    const-string v6, "name"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/heitao/platform/common/HTPDBHelper;->queryWithUserName(Ljava/lang/String;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v1

    .line 338
    .local v1, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    if-eqz v1, :cond_0

    .line 339
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/heitao/platform/common/HTPDBHelper;->delete(Lcom/heitao/platform/model/HTPDBUser;)I

    move-result v3

    .line 340
    .local v3, "returnId":I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    .line 341
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView;->access$0(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v4

    const-string v5, "htp_del_account_failed"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 365
    .end local v3    # "returnId":I
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-virtual {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->notifyDataSetChanged()V

    .line 366
    return-void

    .line 343
    .restart local v3    # "returnId":I
    :cond_1
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/heitao/platform/common/HTPDBHelper;->query()Ljava/util/List;

    move-result-object v2

    .line 344
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/heitao/platform/activity/view/HTLoginView;->access$6(Lcom/heitao/platform/activity/view/HTLoginView;Ljava/util/List;)V

    .line 346
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView;->access$0(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    move-result-object v4

    const-string v5, "htp_del_account_success"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 348
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_2

    .line 350
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/EditText;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 351
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    const-string v5, ""

    invoke-static {v4, v5}, Lcom/heitao/platform/activity/view/HTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTLoginView;Ljava/lang/String;)V

    .line 352
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v4

    const-string v5, ""

    iput-object v5, v4, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    .line 353
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v4

    const-string v5, ""

    iput-object v5, v4, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    .line 354
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v4

    const-string v5, ""

    iput-object v5, v4, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    .line 355
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v4

    const-string v5, ""

    iput-object v5, v4, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    .line 356
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView;->access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v4

    const-string v5, ""

    iput-object v5, v4, Lcom/heitao/platform/model/HTPDBUser;->mobile:Ljava/lang/String;

    goto/16 :goto_0

    .line 358
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/model/HTPDBUser;

    .line 359
    .local v0, "currentUser":Lcom/heitao/platform/model/HTPDBUser;
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/heitao/platform/activity/view/HTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTLoginView;Ljava/lang/String;)V

    .line 360
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/heitao/platform/activity/view/HTLoginView;->access$3(Lcom/heitao/platform/activity/view/HTLoginView;Lcom/heitao/platform/model/HTPDBUser;)V

    .line 361
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter$2;->this$1:Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;->access$1(Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;)Lcom/heitao/platform/activity/view/HTLoginView;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/activity/view/HTLoginView;->access$4(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/EditText;

    move-result-object v4

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method
