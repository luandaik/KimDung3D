.class public Lcom/unionpay/WebViewJavascriptBridge;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field _messageHandler:Lcom/unionpay/ab;

.field _messageHandlers:Ljava/util/Map;

.field _responseCallbacks:Ljava/util/Map;

.field _uniqueId:J

.field mContext:Landroid/app/Activity;

.field mWebView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/unionpay/ab;)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/unionpay/WebViewJavascriptBridge;->mContext:Landroid/app/Activity;

    iput-object p2, p0, Lcom/unionpay/WebViewJavascriptBridge;->mWebView:Landroid/webkit/WebView;

    iput-object p3, p0, Lcom/unionpay/WebViewJavascriptBridge;->_messageHandler:Lcom/unionpay/ab;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->_messageHandlers:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->_responseCallbacks:Ljava/util/Map;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->_uniqueId:J

    iget-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    iget-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->mWebView:Landroid/webkit/WebView;

    const-string v1, "_WebViewJavascriptBridge"

    invoke-virtual {v0, p0, v1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->mWebView:Landroid/webkit/WebView;

    new-instance v1, Lcom/unionpay/aa;

    invoke-direct {v1, p0, v2}, Lcom/unionpay/aa;-><init>(Lcom/unionpay/WebViewJavascriptBridge;B)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->mWebView:Landroid/webkit/WebView;

    new-instance v1, Lcom/unionpay/z;

    invoke-direct {v1, p0, v2}, Lcom/unionpay/z;-><init>(Lcom/unionpay/WebViewJavascriptBridge;B)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    return-void
.end method

.method private _callbackJs(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "responseId"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "responseData"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/unionpay/WebViewJavascriptBridge;->_dispatchMessage(Ljava/util/Map;)V

    return-void
.end method

.method private _dispatchMessage(Ljava/util/Map;)V
    .locals 4

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "test"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "sending:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/utils/g;->a(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "javascript:WebViewJavascriptBridge._handleMessageFromJava(\'%s\');"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-direct {p0, v0}, Lcom/unionpay/WebViewJavascriptBridge;->doubleEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/WebViewJavascriptBridge;->mContext:Landroid/app/Activity;

    new-instance v2, Lcom/unionpay/x;

    invoke-direct {v2, p0, v0}, Lcom/unionpay/x;-><init>(Lcom/unionpay/WebViewJavascriptBridge;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private _sendData(Ljava/lang/String;Lcom/unionpay/ac;Ljava/lang/String;)V
    .locals 6

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "data"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "java_cb_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lcom/unionpay/WebViewJavascriptBridge;->_uniqueId:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/unionpay/WebViewJavascriptBridge;->_uniqueId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/WebViewJavascriptBridge;->_responseCallbacks:Ljava/util/Map;

    invoke-interface {v2, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "callbackId"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz p3, :cond_1

    const-string v1, "handlerName"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-direct {p0, v0}, Lcom/unionpay/WebViewJavascriptBridge;->_dispatchMessage(Ljava/util/Map;)V

    return-void
.end method

.method static synthetic access$200(Lcom/unionpay/WebViewJavascriptBridge;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/unionpay/WebViewJavascriptBridge;->_callbackJs(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 4

    const-string v1, ""

    :try_start_0
    new-instance v0, Ljava/util/Scanner;

    const-string v2, "UTF-8"

    invoke-direct {v0, p0, v2}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    const-string v2, "\\A"

    invoke-virtual {v0, v2}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Scanner;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/util/Scanner;->next()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    return-object v0

    :catch_0
    move-exception v0

    move-object v3, v0

    move-object v0, v1

    move-object v1, v3

    :goto_2
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_2

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method private doubleEscapeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v0, "\\"

    const-string v1, "\\\\"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\""

    const-string v2, "\\\""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\'"

    const-string v2, "\\\'"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\n"

    const-string v2, "\\n"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\r"

    const-string v2, "\\r"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u000c"

    const-string v2, "\\f"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private loadWebViewJavascriptBridgeJs(Landroid/webkit/WebView;)V
    .locals 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "res/webviewjavascriptbridge.js"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/WebViewJavascriptBridge;->convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "javascript:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public _handleMessageFromJs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->_responseCallbacks:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/ac;

    invoke-interface {v0, p3}, Lcom/unionpay/ac;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->_responseCallbacks:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    if-eqz p4, :cond_3

    new-instance v0, Lcom/unionpay/y;

    invoke-direct {v0, p0, p4}, Lcom/unionpay/y;-><init>(Lcom/unionpay/WebViewJavascriptBridge;Ljava/lang/String;)V

    move-object v1, v0

    :goto_1
    if-eqz p5, :cond_1

    iget-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->_messageHandlers:Ljava/util/Map;

    invoke-interface {v0, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/ab;

    if-nez v0, :cond_2

    const-string v0, "test"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "WVJB Warning: No handler for "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/utils/g;->b(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->_messageHandler:Lcom/unionpay/ab;

    :cond_2
    :try_start_0
    iget-object v2, p0, Lcom/unionpay/WebViewJavascriptBridge;->mContext:Landroid/app/Activity;

    new-instance v3, Lcom/unionpay/w;

    invoke-direct {v3, p0, v0, p1, v1}, Lcom/unionpay/w;-><init>(Lcom/unionpay/WebViewJavascriptBridge;Lcom/unionpay/ab;Ljava/lang/String;Lcom/unionpay/ac;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "test"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "WebViewJavascriptBridge: WARNING: java handler threw. "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/unionpay/utils/g;->b(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_3
    move-object v1, v0

    goto :goto_1
.end method

.method public callHandler(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Lcom/unionpay/WebViewJavascriptBridge;->callHandler(Ljava/lang/String;Ljava/lang/String;Lcom/unionpay/ac;)V

    return-void
.end method

.method public callHandler(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/unionpay/WebViewJavascriptBridge;->callHandler(Ljava/lang/String;Ljava/lang/String;Lcom/unionpay/ac;)V

    return-void
.end method

.method public callHandler(Ljava/lang/String;Ljava/lang/String;Lcom/unionpay/ac;)V
    .locals 0

    invoke-direct {p0, p2, p3, p1}, Lcom/unionpay/WebViewJavascriptBridge;->_sendData(Ljava/lang/String;Lcom/unionpay/ac;Ljava/lang/String;)V

    return-void
.end method

.method public registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/WebViewJavascriptBridge;->_messageHandlers:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public send(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/unionpay/WebViewJavascriptBridge;->send(Ljava/lang/String;Lcom/unionpay/ac;)V

    return-void
.end method

.method public send(Ljava/lang/String;Lcom/unionpay/ac;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/unionpay/WebViewJavascriptBridge;->_sendData(Ljava/lang/String;Lcom/unionpay/ac;Ljava/lang/String;)V

    return-void
.end method
