.class public Lcom/heitao/platform/activity/HTPQuickLoginActivity;
.super Lcom/heitao/platform/activity/HTPBaseActivity;
.source "HTPQuickLoginActivity.java"


# static fields
.field public static mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;


# instance fields
.field private Container:Landroid/widget/RelativeLayout;

.field private Flag_Switch:Z

.field private accountTv:Landroid/widget/TextView;

.field private local_user:Lcom/heitao/platform/model/HTPDBUser;

.field private mContext:Landroid/content/Context;

.field private mPopupWindow:Landroid/widget/PopupWindow;

.field private mRelative:Landroid/view/View;

.field private mUerName:Ljava/lang/String;

.field private switchBT:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;-><init>()V

    .line 42
    new-instance v0, Lcom/heitao/platform/model/HTPDBUser;

    invoke-direct {v0}, Lcom/heitao/platform/model/HTPDBUser;-><init>()V

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->Flag_Switch:Z

    .line 35
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Z)V
    .locals 0

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->Flag_Switch:Z

    return-void
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V
    .locals 0

    .prologue
    .line 289
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->goToLoginActivity()V

    return-void
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Landroid/widget/PopupWindow;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    return-object v0
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Lcom/heitao/platform/model/HTPDBUser;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    return-object v0
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mUerName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->doQuickLogin(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$6(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V
    .locals 0

    .prologue
    .line 200
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->doLoginGame()V

    return-void
.end method

.method static synthetic access$7(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Z
    .locals 1

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->Flag_Switch:Z

    return v0
.end method

.method static synthetic access$8(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$9(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Lcom/heitao/platform/model/HTPUser;)V
    .locals 0

    .prologue
    .line 260
    invoke-direct {p0, p1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->hideDailog(Lcom/heitao/platform/model/HTPUser;)V

    return-void
.end method

.method private doLoginGame()V
    .locals 6

    .prologue
    .line 201
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v3, v4, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    .line 202
    .local v3, "userName":Ljava/lang/String;
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v1, v4, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    .line 204
    .local v1, "passWord":Ljava/lang/String;
    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 205
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    const-string v5, "htp_account_cannot_null"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 206
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->goToLoginActivity()V

    .line 258
    :goto_0
    return-void

    .line 210
    :cond_0
    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 211
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    const-string v5, "htp_pwd_cannot_null"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 212
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->goToLoginActivity()V

    goto :goto_0

    .line 216
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 217
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "username"

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    const-string v4, "password"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    const-string v2, "http://api.heitao.com/user/login"

    .line 221
    .local v2, "url":Ljava/lang/String;
    new-instance v4, Lcom/heitao/platform/request/HTPLoginParser;

    invoke-direct {v4}, Lcom/heitao/platform/request/HTPLoginParser;-><init>()V

    new-instance v5, Lcom/heitao/platform/activity/HTPQuickLoginActivity$5;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity$5;-><init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V

    invoke-virtual {v4, v2, v0, v5}, Lcom/heitao/platform/request/HTPLoginParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private doQuickLogin(Ljava/lang/String;)V
    .locals 4
    .param p1, "mUserName"    # Ljava/lang/String;

    .prologue
    .line 149
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mUerName:Ljava/lang/String;

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 150
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    const-string v3, "htp_account_cannot_null"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 151
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->goToLoginActivity()V

    .line 198
    :goto_0
    return-void

    .line 155
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 156
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "uid"

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v3, v3, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    const-string v2, "username"

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v3, v3, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    const-string v2, "ltime"

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v3, v3, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    const-string v2, "qltoken"

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    iget-object v3, v3, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    const-string v1, "http://api.heitao.com/user/quicklogin"

    .line 162
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPLoginParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPLoginParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/HTPQuickLoginActivity$4;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity$4;-><init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPLoginParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private goToLoginActivity()V
    .locals 2

    .prologue
    .line 290
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 291
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->startActivity(Landroid/content/Intent;)V

    .line 292
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->finish()V

    .line 293
    return-void
.end method

.method private hideDailog(Lcom/heitao/platform/model/HTPUser;)V
    .locals 4
    .param p1, "user"    # Lcom/heitao/platform/model/HTPUser;

    .prologue
    .line 262
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/heitao/platform/activity/HTPQuickLoginActivity$6;

    invoke-direct {v1, p0, p1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity$6;-><init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Lcom/heitao/platform/model/HTPUser;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 277
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/heitao/platform/activity/HTPQuickLoginActivity$7;

    invoke-direct {v1, p0, p1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity$7;-><init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Lcom/heitao/platform/model/HTPUser;)V

    .line 286
    const-wide/16 v2, 0x352

    .line 277
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 287
    return-void
.end method

.method private initData()V
    .locals 4

    .prologue
    .line 68
    const/4 v2, 0x0

    .line 70
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    :try_start_0
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/heitao/platform/common/HTPDBHelper;->query()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 74
    :goto_0
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 76
    :cond_0
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->goToLoginActivity()V

    .line 83
    :goto_1
    return-void

    .line 71
    :catch_0
    move-exception v1

    .line 72
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0

    .line 79
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/model/HTPDBUser;

    .line 80
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    iput-object v0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->local_user:Lcom/heitao/platform/model/HTPDBUser;

    .line 81
    iget-object v3, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    iput-object v3, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mUerName:Ljava/lang/String;

    goto :goto_1
.end method

.method private showDailog()V
    .locals 10

    .prologue
    const/4 v9, -0x2

    .line 86
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mRelative:Landroid/view/View;

    if-nez v5, :cond_0

    .line 87
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    iget-object v6, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    const-string v7, "htp_quick_login_view"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mRelative:Landroid/view/View;

    .line 89
    :cond_0
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mRelative:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    const-string v7, "htp_quick_title"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->accountTv:Landroid/widget/TextView;

    .line 90
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->accountTv:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    const-string v8, "htp_welcome_back"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mUerName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mRelative:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    const-string v7, "htp_quick_switch_bt"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->switchBT:Landroid/widget/TextView;

    .line 93
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->switchBT:Landroid/widget/TextView;

    new-instance v6, Lcom/heitao/platform/activity/HTPQuickLoginActivity$1;

    invoke-direct {v6, p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity$1;-><init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    new-instance v5, Landroid/widget/PopupWindow;

    iget-object v6, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mRelative:Landroid/view/View;

    invoke-direct {v5, v6, v9, v9}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    iput-object v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    .line 103
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    iget-object v6, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    const-string v7, "QuickLoginAnimation"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getStyleByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 105
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 106
    .local v2, "frame":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 107
    .local v1, "decoreView":Landroid/view/View;
    invoke-virtual {v1, v2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 108
    iget v3, v2, Landroid/graphics/Rect;->top:I

    .line 109
    .local v3, "statusBarHeight":I
    add-int/lit8 v4, v3, 0x50

    .line 113
    .local v4, "windowY":I
    :try_start_0
    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    new-instance v6, Lcom/heitao/platform/activity/HTPQuickLoginActivity$2;

    invoke-direct {v6, p0, v1, v4}, Lcom/heitao/platform/activity/HTPQuickLoginActivity$2;-><init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;Landroid/view/View;I)V

    .line 123
    const-wide/16 v8, 0x64

    .line 113
    invoke-virtual {v5, v6, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 124
    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    new-instance v6, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;

    invoke-direct {v6, p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity$3;-><init>(Lcom/heitao/platform/activity/HTPQuickLoginActivity;)V

    .line 141
    const-wide/16 v8, 0x9c4

    .line 124
    invoke-virtual {v5, v6, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :goto_0
    return-void

    .line 142
    :catch_0
    move-exception v0

    .line 143
    .local v0, "bte":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, -0x1

    .line 52
    invoke-super {p0, p1}, Lcom/heitao/platform/activity/HTPBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    iput-object p0, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    .line 54
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    sput-object v1, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    .line 56
    new-instance v1, Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->Container:Landroid/widget/RelativeLayout;

    .line 57
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 59
    .local v0, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->Container:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->Container:Landroid/widget/RelativeLayout;

    const-string v2, "#80000000"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 61
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->Container:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v1}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->setContentView(Landroid/view/View;)V

    .line 63
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->initData()V

    .line 64
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPQuickLoginActivity;->showDailog()V

    .line 65
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 297
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 298
    const/4 v0, 0x1

    .line 301
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/heitao/platform/activity/HTPBaseActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
