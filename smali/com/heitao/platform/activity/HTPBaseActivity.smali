.class public Lcom/heitao/platform/activity/HTPBaseActivity;
.super Landroid/app/Activity;
.source "HTPBaseActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 18
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 20
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;->setLanguage()V

    .line 21
    return-void
.end method

.method public setLanguage()V
    .locals 7

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 28
    .local v4, "resources":Landroid/content/res/Resources;
    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 29
    .local v0, "config":Landroid/content/res/Configuration;
    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 31
    .local v2, "dm":Landroid/util/DisplayMetrics;
    iget-object v5, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    .line 32
    .local v3, "language":Ljava/lang/String;
    iget-object v5, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v5}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    .line 33
    .local v1, "country":Ljava/lang/String;
    sget-object v5, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    iput-object v5, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 34
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    const-string v6, "zh"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    const-string v6, "tw"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 36
    const-string v5, "chenxx"

    const-string v6, "TRADITIONAL_CHINESE"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    sget-object v5, Ljava/util/Locale;->TRADITIONAL_CHINESE:Ljava/util/Locale;

    iput-object v5, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 39
    :cond_0
    invoke-virtual {v4, v0, v2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 40
    return-void
.end method
