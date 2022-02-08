.class public Lorg/cocos2dx/TerransForce/TFWebView;
.super Ljava/lang/Object;
.source "TFWebView.java"


# static fields
.field private static m_activity:Landroid/app/Activity;

.field private static m_instance:Lorg/cocos2dx/TerransForce/TFWebView;


# instance fields
.field private m_webLayout:Landroid/widget/LinearLayout;

.field private m_webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/TerransForce/TFWebView;

    .prologue
    .line 13
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_webLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$002(Lorg/cocos2dx/TerransForce/TFWebView;Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/TerransForce/TFWebView;
    .param p1, "x1"    # Landroid/widget/LinearLayout;

    .prologue
    .line 13
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_webLayout:Landroid/widget/LinearLayout;

    return-object p1
.end method

.method static synthetic access$100()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/TerransForce/TFWebView;

    .prologue
    .line 13
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$202(Lorg/cocos2dx/TerransForce/TFWebView;Landroid/webkit/WebView;)Landroid/webkit/WebView;
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/TerransForce/TFWebView;
    .param p1, "x1"    # Landroid/webkit/WebView;

    .prologue
    .line 13
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_webView:Landroid/webkit/WebView;

    return-object p1
.end method

.method public static display(Z)V
    .locals 1
    .param p0, "bShow"    # Z

    .prologue
    .line 239
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    if-nez v0, :cond_0

    .line 241
    new-instance v0, Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/TFWebView;-><init>()V

    sput-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    .line 243
    :cond_0
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-virtual {v0, p0}, Lorg/cocos2dx/TerransForce/TFWebView;->showWebview(Z)V

    .line 244
    return-void
.end method

.method public static displayWebView(IIII)V
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 155
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    if-nez v0, :cond_0

    .line 157
    new-instance v0, Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/TFWebView;-><init>()V

    sput-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    .line 159
    :cond_0
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/cocos2dx/TerransForce/TFWebView;->_displayWebView(IIII)V

    .line 160
    return-void
.end method

.method public static getTFWebView()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/TFWebView;-><init>()V

    sput-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    .line 31
    :cond_0
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    return-object v0
.end method

.method public static onDestroy()V
    .locals 1

    .prologue
    .line 252
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    if-nez v0, :cond_0

    .line 257
    :goto_0
    return-void

    .line 256
    :cond_0
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-virtual {v0}, Lorg/cocos2dx/TerransForce/TFWebView;->destroyWebview()V

    goto :goto_0
.end method

.method public static removeWebView()V
    .locals 1

    .prologue
    .line 207
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    if-nez v0, :cond_0

    .line 214
    :goto_0
    return-void

    .line 212
    :cond_0
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-virtual {v0}, Lorg/cocos2dx/TerransForce/TFWebView;->_removeWebView()V

    .line 213
    const/4 v0, 0x0

    sput-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    goto :goto_0
.end method

.method public static setActivity(Landroid/app/Activity;)V
    .locals 0
    .param p0, "ac"    # Landroid/app/Activity;

    .prologue
    .line 23
    sput-object p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_activity:Landroid/app/Activity;

    .line 24
    return-void
.end method

.method public static updateURL(Ljava/lang/String;)V
    .locals 1
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 173
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    if-nez v0, :cond_0

    .line 175
    new-instance v0, Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/TFWebView;-><init>()V

    sput-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    .line 177
    :cond_0
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_instance:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-virtual {v0, p0}, Lorg/cocos2dx/TerransForce/TFWebView;->update_URL(Ljava/lang/String;)V

    .line 178
    return-void
.end method


# virtual methods
.method public _displayWebView(IIII)V
    .locals 7
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 38
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_activity:Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 39
    const-string v0, "Vincent"

    const-string v1, "showWebView m_activity is null."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    :goto_0
    sget-object v6, Lorg/cocos2dx/TerransForce/TFWebView;->m_activity:Landroid/app/Activity;

    new-instance v0, Lorg/cocos2dx/TerransForce/TFWebView$1;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/cocos2dx/TerransForce/TFWebView$1;-><init>(Lorg/cocos2dx/TerransForce/TFWebView;IIII)V

    invoke-virtual {v6, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 152
    return-void

    .line 41
    :cond_0
    const-string v0, "Vincent"

    const-string v1, "showWebView m_activity is ok."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public _removeWebView()V
    .locals 2

    .prologue
    .line 182
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_webLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_webView:Landroid/webkit/WebView;

    if-nez v0, :cond_1

    .line 204
    :cond_0
    :goto_0
    return-void

    .line 184
    :cond_1
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_activity:Landroid/app/Activity;

    new-instance v1, Lorg/cocos2dx/TerransForce/TFWebView$3;

    invoke-direct {v1, p0}, Lorg/cocos2dx/TerransForce/TFWebView$3;-><init>(Lorg/cocos2dx/TerransForce/TFWebView;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public destroyWebview()V
    .locals 1

    .prologue
    .line 247
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 249
    :cond_0
    return-void
.end method

.method public showWebview(Z)V
    .locals 2
    .param p1, "bShow"    # Z

    .prologue
    .line 218
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_webLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView;->m_webView:Landroid/webkit/WebView;

    if-nez v0, :cond_1

    .line 236
    :cond_0
    :goto_0
    return-void

    .line 220
    :cond_1
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_activity:Landroid/app/Activity;

    new-instance v1, Lorg/cocos2dx/TerransForce/TFWebView$4;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/TerransForce/TFWebView$4;-><init>(Lorg/cocos2dx/TerransForce/TFWebView;Z)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public update_URL(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 163
    const-string v0, "Vincent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateURL:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    sget-object v0, Lorg/cocos2dx/TerransForce/TFWebView;->m_activity:Landroid/app/Activity;

    new-instance v1, Lorg/cocos2dx/TerransForce/TFWebView$2;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/TerransForce/TFWebView$2;-><init>(Lorg/cocos2dx/TerransForce/TFWebView;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 171
    return-void
.end method
