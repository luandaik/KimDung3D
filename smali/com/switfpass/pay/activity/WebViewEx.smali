.class public Lcom/switfpass/pay/activity/WebViewEx;
.super Landroid/webkit/WebView;


# static fields
.field private static final aN:[Ljava/lang/String;


# instance fields
.field private aO:Ljava/util/HashMap;

.field private aP:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "getClass"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "hashCode"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "notify"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "notifyAll"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "equals"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "toString"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "wait"

    aput-object v2, v0, v1

    sput-object v0, Lcom/switfpass/pay/activity/WebViewEx;->aN:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aO:Ljava/util/HashMap;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aP:Ljava/lang/String;

    invoke-direct {p0}, Lcom/switfpass/pay/activity/WebViewEx;->e()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aO:Ljava/util/HashMap;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aP:Ljava/lang/String;

    invoke-direct {p0}, Lcom/switfpass/pay/activity/WebViewEx;->e()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aO:Ljava/util/HashMap;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aP:Ljava/lang/String;

    invoke-direct {p0}, Lcom/switfpass/pay/activity/WebViewEx;->e()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/WebViewEx;Landroid/webkit/WebView;)V
    .locals 1

    instance-of v0, p1, Lcom/switfpass/pay/activity/WebViewEx;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/switfpass/pay/activity/WebViewEx;->f()V

    :cond_0
    return-void
.end method

.method private static a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 11

    const/4 v1, 0x0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "if(typeof(window."

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")!=\'undefined\'){"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "    console.log(\'window."

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_js_interface_name is exist!!\');"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "}else {"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "    window."

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "={"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    array-length v4, v3

    move v0, v1

    :goto_1
    if-lt v0, v4, :cond_2

    const-string v0, "    };"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "}"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_2
    aget-object v5, v3, v0

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/switfpass/pay/activity/WebViewEx;->a(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "        "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, ":function("

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    array-length v7, v2

    if-lez v7, :cond_3

    add-int/lit8 v8, v7, -0x1

    move v2, v1

    :goto_2
    if-lt v2, v8, :cond_6

    const-string v2, "arg"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_3
    const-string v2, ") {"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v2

    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-eq v2, v5, :cond_7

    const-string v2, "            return prompt(\'MyApp:\'+"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_3
    const-string v2, "JSON.stringify({"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "obj:\'"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "\',"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "func:\'"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "\',"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "args:["

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-lez v7, :cond_4

    add-int/lit8 v5, v7, -0x1

    move v2, v1

    :goto_4
    if-lt v2, v5, :cond_8

    const-string v2, "arg"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_4
    const-string v2, "]})"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ");"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "        }, "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    :cond_6
    const-string v9, "arg"

    invoke-virtual {p2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ","

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_7
    const-string v2, "            prompt(\'MyApp:\'+"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_8
    const-string v6, "arg"

    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_4
.end method

.method private a(Landroid/webkit/JsPromptResult;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Z
    .locals 8

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aO:Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_0

    invoke-virtual {p1}, Landroid/webkit/JsPromptResult;->cancel()V

    :goto_0
    return v2

    :cond_0
    const/4 v0, 0x0

    if-eqz p4, :cond_7

    array-length v3, p4

    move v5, v3

    :goto_1
    if-lez v5, :cond_1

    new-array v3, v5, [Ljava/lang/Class;

    move v4, v2

    :goto_2
    if-lt v4, v5, :cond_2

    move-object v0, v3

    :cond_1
    :try_start_0
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, p3, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v6, p4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_5

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sget-object v4, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-eq v0, v4, :cond_5

    move v0, v2

    :goto_3
    if-eqz v0, :cond_6

    const-string v0, ""

    :goto_4
    invoke-virtual {p1, v0}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move v0, v1

    :goto_5
    invoke-virtual {p1}, Landroid/webkit/JsPromptResult;->cancel()V

    move v2, v0

    goto :goto_0

    :cond_2
    aget-object v0, p4, v4

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v7, Ljava/lang/Integer;

    if-ne v0, v7, :cond_3

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    :goto_6
    aput-object v0, v3, v4

    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_2

    :cond_3
    const-class v7, Ljava/lang/Boolean;

    if-ne v0, v7, :cond_4

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    goto :goto_6

    :cond_4
    const-class v0, Ljava/lang/String;

    goto :goto_6

    :cond_5
    move v0, v1

    goto :goto_3

    :cond_6
    :try_start_1
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto :goto_4

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    move v0, v2

    goto :goto_5

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move v0, v2

    goto :goto_5

    :cond_7
    move v5, v2

    goto :goto_1
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/WebViewEx;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/switfpass/pay/activity/WebViewEx;->a(Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    move-result v0

    return v0
.end method

.method private static a(Ljava/lang/String;)Z
    .locals 5

    const/4 v0, 0x0

    sget-object v2, Lcom/switfpass/pay/activity/WebViewEx;->aN:[Ljava/lang/String;

    array-length v3, v2

    move v1, v0

    :goto_0
    if-lt v1, v3, :cond_0

    :goto_1
    return v0

    :cond_0
    aget-object v4, v2, v1

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private a(Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 8

    const/4 v0, 0x0

    const-string v1, "MyApp:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "obj"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v1, "func"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v1, "args"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    const/4 v1, 0x0

    if-eqz v5, :cond_1

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lez v6, :cond_1

    new-array v1, v6, [Ljava/lang/Object;

    move v2, v0

    :goto_1
    if-lt v2, v6, :cond_2

    :cond_1
    invoke-direct {p0, p2, v3, v4, v1}, Lcom/switfpass/pay/activity/WebViewEx;->a(Landroid/webkit/JsPromptResult;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    aput-object v7, v1, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_3
    invoke-virtual {p2}, Landroid/webkit/JsPromptResult;->cancel()V

    goto :goto_0
.end method

.method private e()V
    .locals 3

    const/4 v0, 0x0

    new-instance v1, Lcom/switfpass/pay/activity/V;

    invoke-direct {v1, p0, v0}, Lcom/switfpass/pay/activity/V;-><init>(Lcom/switfpass/pay/activity/WebViewEx;B)V

    invoke-super {p0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    new-instance v1, Lcom/switfpass/pay/activity/W;

    invoke-direct {v1, p0, v0}, Lcom/switfpass/pay/activity/W;-><init>(Lcom/switfpass/pay/activity/WebViewEx;B)V

    invoke-super {p0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    if-eqz v0, :cond_1

    invoke-static {}, Lcom/switfpass/pay/activity/WebViewEx;->i()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "searchBoxJavaBridge_"

    invoke-super {p0, v0}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    const-string v0, "accessibility"

    invoke-super {p0, v0}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    const-string v0, "accessibilityTraversal"

    invoke-super {p0, v0}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private f()V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aP:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/switfpass/pay/activity/WebViewEx;->g()V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Lcom/switfpass/pay/activity/WebViewEx;->h()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aP:Ljava/lang/String;

    invoke-direct {p0}, Lcom/switfpass/pay/activity/WebViewEx;->g()V

    goto :goto_0
.end method

.method private g()V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aP:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/WebViewEx;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method private h()Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/switfpass/pay/activity/WebViewEx;->aO:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-nez v1, :cond_0

    iput-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aP:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aO:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "javascript:(function JsAddJavascriptInterface_(){"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    :try_start_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-nez v0, :cond_1

    :goto_2
    const-string v0, "})()"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v0, v3}, Lcom/switfpass/pay/activity/WebViewEx;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method private static i()Z
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lcom/switfpass/pay/activity/WebViewEx;->i()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aO:Ljava/util/HashMap;

    invoke-virtual {v0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public removeJavascriptInterface(Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/switfpass/pay/activity/WebViewEx;->i()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aO:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/switfpass/pay/activity/WebViewEx;->aP:Ljava/lang/String;

    invoke-direct {p0}, Lcom/switfpass/pay/activity/WebViewEx;->f()V

    goto :goto_0
.end method
