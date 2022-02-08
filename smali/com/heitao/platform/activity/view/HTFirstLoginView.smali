.class public Lcom/heitao/platform/activity/view/HTFirstLoginView;
.super Ljava/lang/Object;
.source "HTFirstLoginView.java"


# instance fields
.field private activityHandler:Landroid/os/Handler;

.field private baseView:Landroid/view/View;

.field private context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;


# direct methods
.method public constructor <init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V
    .locals 0
    .param p1, "context"    # Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    .line 31
    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->activityHandler:Landroid/os/Handler;

    .line 33
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/HTFirstLoginView;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->activityHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private getActive(Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;)V
    .locals 11
    .param p1, "one"    # Landroid/widget/RelativeLayout;
    .param p2, "two"    # Landroid/widget/RelativeLayout;
    .param p3, "three"    # Landroid/widget/RelativeLayout;
    .param p4, "four"    # Landroid/widget/RelativeLayout;

    .prologue
    .line 78
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v9

    iget-object v9, v9, Lcom/heitao/platform/common/HTPDataCenter;->mLoginType:Ljava/lang/String;

    invoke-static {v9}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 81
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v9

    iget-object v9, v9, Lcom/heitao/platform/common/HTPDataCenter;->mLoginType:Ljava/lang/String;

    invoke-direct {v1, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 83
    .local v1, "dataJsonObject":Lorg/json/JSONObject;
    const-string v9, "login_info"

    invoke-static {v1, v9}, Lcom/heitao/platform/common/HTPJSONHelper;->getJSONArray(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 84
    .local v0, "arryOBJ":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-lt v3, v9, :cond_0

    .line 116
    .end local v0    # "arryOBJ":Lorg/json/JSONArray;
    .end local v1    # "dataJsonObject":Lorg/json/JSONObject;
    .end local v3    # "i":I
    :goto_1
    return-void

    .line 85
    .restart local v0    # "arryOBJ":Lorg/json/JSONArray;
    .restart local v1    # "dataJsonObject":Lorg/json/JSONObject;
    .restart local v3    # "i":I
    :cond_0
    invoke-static {v0, v3}, Lcom/heitao/platform/common/HTPJSONHelper;->getJSONObject(Lorg/json/JSONArray;I)Lorg/json/JSONObject;

    move-result-object v5

    .line 86
    .local v5, "object":Lorg/json/JSONObject;
    const-string v9, "id"

    invoke-static {v5, v9}, Lcom/heitao/platform/common/HTPJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    .line 87
    .local v4, "id":I
    const/4 v9, 0x1

    if-ne v4, v9, :cond_2

    .line 88
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 84
    :cond_1
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 89
    :cond_2
    const/4 v9, 0x2

    if-ne v4, v9, :cond_4

    .line 90
    const/4 v9, 0x0

    invoke-virtual {p2, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 92
    iget-object v9, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v10, "htp_unrecomend_phone"

    invoke-static {v9, v10}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v9

    invoke-virtual {p2, v9}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 91
    check-cast v8, Landroid/widget/RelativeLayout;

    .line 94
    .local v8, "unRecomend":Landroid/widget/RelativeLayout;
    iget-object v9, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v10, "htp_recomend_phone"

    invoke-static {v9, v10}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v9

    invoke-virtual {p2, v9}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 93
    check-cast v7, Landroid/widget/RelativeLayout;

    .line 95
    .local v7, "recomend":Landroid/widget/RelativeLayout;
    const-string v9, "recommend"

    invoke-static {v5, v9}, Lcom/heitao/platform/common/HTPJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v6

    .line 96
    .local v6, "re":I
    const/4 v9, 0x1

    if-ne v6, v9, :cond_3

    .line 97
    const/4 v9, 0x0

    invoke-virtual {v7, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 98
    const/4 v9, 0x4

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 109
    .end local v0    # "arryOBJ":Lorg/json/JSONArray;
    .end local v1    # "dataJsonObject":Lorg/json/JSONObject;
    .end local v3    # "i":I
    .end local v4    # "id":I
    .end local v5    # "object":Lorg/json/JSONObject;
    .end local v6    # "re":I
    .end local v7    # "recomend":Landroid/widget/RelativeLayout;
    .end local v8    # "unRecomend":Landroid/widget/RelativeLayout;
    :catch_0
    move-exception v2

    .line 110
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 100
    .end local v2    # "e":Lorg/json/JSONException;
    .restart local v0    # "arryOBJ":Lorg/json/JSONArray;
    .restart local v1    # "dataJsonObject":Lorg/json/JSONObject;
    .restart local v3    # "i":I
    .restart local v4    # "id":I
    .restart local v5    # "object":Lorg/json/JSONObject;
    .restart local v6    # "re":I
    .restart local v7    # "recomend":Landroid/widget/RelativeLayout;
    .restart local v8    # "unRecomend":Landroid/widget/RelativeLayout;
    :cond_3
    const/4 v9, 0x4

    :try_start_1
    invoke-virtual {v7, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 101
    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_2

    .line 103
    .end local v6    # "re":I
    .end local v7    # "recomend":Landroid/widget/RelativeLayout;
    .end local v8    # "unRecomend":Landroid/widget/RelativeLayout;
    :cond_4
    const/4 v9, 0x3

    if-ne v4, v9, :cond_5

    .line 104
    const/4 v9, 0x0

    invoke-virtual {p3, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_2

    .line 105
    :cond_5
    const/4 v9, 0x4

    if-ne v4, v9, :cond_1

    .line 106
    const/4 v9, 0x0

    invoke-virtual {p4, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 113
    .end local v0    # "arryOBJ":Lorg/json/JSONArray;
    .end local v1    # "dataJsonObject":Lorg/json/JSONObject;
    .end local v3    # "i":I
    .end local v4    # "id":I
    .end local v5    # "object":Lorg/json/JSONObject;
    :cond_6
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_1
.end method


# virtual methods
.method public createView()V
    .locals 8

    .prologue
    .line 40
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->baseView:Landroid/view/View;

    if-nez v5, :cond_0

    .line 41
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v5}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_first_login_view"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->baseView:Landroid/view/View;

    .line 43
    :cond_0
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->baseView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "first_login_ht_login_btn"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 44
    .local v1, "HTLogin":Landroid/widget/Button;
    new-instance v5, Lcom/heitao/platform/activity/view/HTFirstLoginView$1;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTFirstLoginView$1;-><init>(Lcom/heitao/platform/activity/view/HTFirstLoginView;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->baseView:Landroid/view/View;

    .line 52
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_customer_login"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 51
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 53
    .local v0, "CustomerLogin":Landroid/widget/RelativeLayout;
    new-instance v5, Lcom/heitao/platform/activity/view/HTFirstLoginView$2;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTFirstLoginView$2;-><init>(Lcom/heitao/platform/activity/view/HTFirstLoginView;)V

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->baseView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_phone_login"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    .line 61
    .local v2, "PhoneLogin":Landroid/widget/RelativeLayout;
    new-instance v5, Lcom/heitao/platform/activity/view/HTFirstLoginView$3;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTFirstLoginView$3;-><init>(Lcom/heitao/platform/activity/view/HTFirstLoginView;)V

    invoke-virtual {v2, v5}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->baseView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_wx_login"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    .line 69
    .local v4, "wxLogin":Landroid/widget/RelativeLayout;
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->baseView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_qq_login"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout;

    .line 70
    .local v3, "qqLogin":Landroid/widget/RelativeLayout;
    invoke-direct {p0, v0, v2, v4, v3}, Lcom/heitao/platform/activity/view/HTFirstLoginView;->getActive(Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;)V

    .line 71
    return-void
.end method

.method public getFrameBound()Landroid/view/View;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView;->baseView:Landroid/view/View;

    return-object v0
.end method
