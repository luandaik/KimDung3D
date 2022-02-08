.class public Lcom/heitao/platform/activity/view/HTLoginView;
.super Ljava/lang/Object;
.source "HTLoginView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;,
        Lcom/heitao/platform/activity/view/HTLoginView$ViewHolder;
    }
.end annotation


# instance fields
.field private activityHandler:Landroid/os/Handler;

.field private baseView:Landroid/view/View;

.field private context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

.field private local_user:Lcom/heitao/platform/model/HTPDBUser;

.field private mPopView:Landroid/widget/PopupWindow;

.field private mUerName:Ljava/lang/String;

.field private nameET:Landroid/widget/EditText;


# direct methods
.method public constructor <init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V
    .locals 1
    .param p1, "context"    # Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Lcom/heitao/platform/model/HTPDBUser;

    invoke-direct {v0}, Lcom/heitao/platform/model/HTPDBUser;-><init>()V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    .line 53
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    .line 54
    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->activityHandler:Landroid/os/Handler;

    .line 55
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    return-object v0
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/view/HTLoginView;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView;->mUerName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$10(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView;->activityHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/view/HTLoginView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 49
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->mUerName:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/view/HTLoginView;Lcom/heitao/platform/model/HTPDBUser;)V
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    return-void
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView;->nameET:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/view/HTLoginView;)Landroid/widget/PopupWindow;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView;->mPopView:Landroid/widget/PopupWindow;

    return-object v0
.end method

.method static synthetic access$6(Lcom/heitao/platform/activity/view/HTLoginView;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 251
    invoke-direct {p0, p1}, Lcom/heitao/platform/activity/view/HTLoginView;->initPopView(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$7(Lcom/heitao/platform/activity/view/HTLoginView;)Lcom/heitao/platform/model/HTPDBUser;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    return-object v0
.end method

.method static synthetic access$8(Lcom/heitao/platform/activity/view/HTLoginView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lcom/heitao/platform/activity/view/HTLoginView;->doQuickLogin(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$9(Lcom/heitao/platform/activity/view/HTLoginView;)V
    .locals 0

    .prologue
    .line 176
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTLoginView;->doLoginGame()V

    return-void
.end method

.method private doLoginGame()V
    .locals 7

    .prologue
    .line 177
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v3, v4, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    .line 178
    .local v3, "userName":Ljava/lang/String;
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v1, v4, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    .line 180
    .local v1, "passWord":Ljava/lang/String;
    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 181
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_account_cannot_null"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 236
    :goto_0
    return-void

    .line 185
    :cond_0
    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 186
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_pwd_cannot_null"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 190
    :cond_1
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v6, "htp_is_logining"

    invoke-static {v5, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 192
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 193
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "username"

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const-string v4, "password"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    const-string v2, "http://api.heitao.com/user/login"

    .line 197
    .local v2, "url":Ljava/lang/String;
    new-instance v4, Lcom/heitao/platform/request/HTPLoginParser;

    invoke-direct {v4}, Lcom/heitao/platform/request/HTPLoginParser;-><init>()V

    new-instance v5, Lcom/heitao/platform/activity/view/HTLoginView$5;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTLoginView$5;-><init>(Lcom/heitao/platform/activity/view/HTLoginView;)V

    invoke-virtual {v4, v2, v0, v5}, Lcom/heitao/platform/request/HTPLoginParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private doQuickLogin(Ljava/lang/String;)V
    .locals 5
    .param p1, "mUserName"    # Ljava/lang/String;

    .prologue
    .line 121
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->mUerName:Ljava/lang/String;

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 122
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v3, "htp_account_cannot_null"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 174
    :goto_0
    return-void

    .line 126
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_is_logining"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 128
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 129
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "uid"

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v3, v3, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    const-string v2, "username"

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v3, v3, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    const-string v2, "ltime"

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v3, v3, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    const-string v2, "qltoken"

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v3, v3, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    const-string v1, "http://api.heitao.com/user/quicklogin"

    .line 135
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPLoginParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPLoginParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTLoginView$4;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTLoginView$4;-><init>(Lcom/heitao/platform/activity/view/HTLoginView;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPLoginParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private initPopView(Ljava/util/List;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/heitao/platform/model/HTPDBUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    const/4 v13, 0x2

    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 252
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 253
    .local v3, "listMap":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 260
    new-instance v0, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_dropdown_item"

    invoke-static {v1, v4}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    .line 261
    new-array v5, v13, [Ljava/lang/String;

    const-string v1, "name"

    aput-object v1, v5, v12

    const-string v1, "drawable"

    aput-object v1, v5, v11

    const/4 v1, 0x3

    new-array v6, v1, [I

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v10, "htp_pop_selected"

    invoke-static {v1, v10}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    aput v1, v6, v12

    .line 262
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v10, "htp_pop_textview"

    invoke-static {v1, v10}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    aput v1, v6, v11

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v10, "htp_pop_delete"

    invoke-static {v1, v10}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    aput v1, v6, v13

    move-object v1, p0

    .line 260
    invoke-direct/range {v0 .. v6}, Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;-><init>(Lcom/heitao/platform/activity/view/HTLoginView;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 263
    .local v0, "dropDownAdapter":Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;
    new-instance v8, Landroid/widget/ListView;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-direct {v8, v1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 264
    .local v8, "listView":Landroid/widget/ListView;
    invoke-virtual {v8, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 265
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "PopViewDividerColor"

    invoke-static {v2, v4}, Lcom/heitao/platform/common/HTPUtils;->getColorByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 266
    invoke-virtual {v8, v11}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 267
    invoke-virtual {v8, v12}, Landroid/widget/ListView;->setCacheColorHint(I)V

    .line 268
    new-instance v1, Landroid/widget/PopupWindow;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->nameET:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getWidth()I

    move-result v2

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->baseView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    invoke-direct {v1, v8, v2, v4, v11}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->mPopView:Landroid/widget/PopupWindow;

    .line 269
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->mPopView:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v11}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 270
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->mPopView:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v11}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 271
    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTLoginView;->mPopView:Landroid/widget/PopupWindow;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_popview_bg"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 272
    return-void

    .line 253
    .end local v0    # "dropDownAdapter":Lcom/heitao/platform/activity/view/HTLoginView$MyAdapter;
    .end local v8    # "listView":Landroid/widget/ListView;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/heitao/platform/model/HTPDBUser;

    .line 254
    .local v7, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 255
    .local v9, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "name"

    iget-object v4, v7, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-virtual {v9, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    const-string v2, "drawable"

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_del_acount"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v9, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method


# virtual methods
.method public createView()V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 63
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->baseView:Landroid/view/View;

    if-nez v3, :cond_0

    .line 64
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v3}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_login_view"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->baseView:Landroid/view/View;

    .line 67
    :cond_0
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->baseView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_login_account_et"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->nameET:Landroid/widget/EditText;

    .line 68
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->nameET:Landroid/widget/EditText;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 69
    invoke-virtual {p0}, Lcom/heitao/platform/activity/view/HTLoginView;->setAccount()V

    .line 71
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->baseView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "ht_fast_login_btn"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 72
    .local v1, "fastLogin":Landroid/widget/Button;
    new-instance v3, Lcom/heitao/platform/activity/view/HTLoginView$1;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTLoginView$1;-><init>(Lcom/heitao/platform/activity/view/HTLoginView;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->baseView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "other_login_btn"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 91
    .local v2, "orherLogin":Landroid/widget/Button;
    new-instance v3, Lcom/heitao/platform/activity/view/HTLoginView$2;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTLoginView$2;-><init>(Lcom/heitao/platform/activity/view/HTLoginView;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTLoginView;->baseView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_drop_icon_image"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 99
    .local v0, "arrowIcon":Landroid/widget/ImageView;
    new-instance v3, Lcom/heitao/platform/activity/view/HTLoginView$3;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTLoginView$3;-><init>(Lcom/heitao/platform/activity/view/HTLoginView;)V

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 118
    return-void
.end method

.method public getFrameBound()Landroid/view/View;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView;->baseView:Landroid/view/View;

    return-object v0
.end method

.method public setAccount()V
    .locals 4

    .prologue
    .line 240
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/heitao/platform/common/HTPDBHelper;->query()Ljava/util/List;

    move-result-object v1

    .line 241
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_0

    .line 242
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/model/HTPDBUser;

    .line 243
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTLoginView;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    .line 244
    iget-object v2, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    iput-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->mUerName:Ljava/lang/String;

    .line 245
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->nameET:Landroid/widget/EditText;

    if-eqz v2, :cond_0

    .line 246
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTLoginView;->nameET:Landroid/widget/EditText;

    iget-object v3, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 249
    .end local v0    # "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    :cond_0
    return-void
.end method
