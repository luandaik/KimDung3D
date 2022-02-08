.class public Lcom/shengpay/express/smc/http/SimpleHttpClient;
.super Ljava/lang/Object;
.source "SimpleHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/shengpay/express/smc/http/SimpleHttpClient$StringResponseHandler;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SimpleHttpClient"

.field private static simpleHttpClient:Lcom/shengpay/express/smc/http/SimpleHttpClient;


# instance fields
.field protected client:Lorg/apache/http/client/HttpClient;

.field private responseHandler:Lorg/apache/http/client/ResponseHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/client/ResponseHandler",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    new-instance v0, Lcom/shengpay/express/smc/http/SimpleHttpClient;

    invoke-direct {v0}, Lcom/shengpay/express/smc/http/SimpleHttpClient;-><init>()V

    sput-object v0, Lcom/shengpay/express/smc/http/SimpleHttpClient;->simpleHttpClient:Lcom/shengpay/express/smc/http/SimpleHttpClient;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/shengpay/express/smc/http/SimpleHttpClient;-><init>(Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 11
    .param p1, "paramString"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v9, Lcom/shengpay/express/smc/http/SimpleHttpClient$StringResponseHandler;

    invoke-direct {v9, p0}, Lcom/shengpay/express/smc/http/SimpleHttpClient$StringResponseHandler;-><init>(Lcom/shengpay/express/smc/http/SimpleHttpClient;)V

    iput-object v9, p0, Lcom/shengpay/express/smc/http/SimpleHttpClient;->responseHandler:Lorg/apache/http/client/ResponseHandler;

    .line 64
    const-string v9, "SimpleHttpClient"

    const-string v10, "Init HttpClient..."

    invoke-static {v9, v10}, Lcom/shengpay/express/smc/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    :try_start_0
    new-instance v1, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v1}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 67
    .local v1, "httpParams":Lorg/apache/http/params/BasicHttpParams;
    const/4 v9, 0x1

    invoke-static {v1, v9}, Lorg/apache/http/params/HttpConnectionParams;->setStaleCheckingEnabled(Lorg/apache/http/params/HttpParams;Z)V

    .line 68
    const v9, 0xea60

    invoke-static {v1, v9}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 69
    const/16 v9, 0x7530

    invoke-static {v1, v9}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 70
    const/16 v9, 0x4000

    invoke-static {v1, v9}, Lorg/apache/http/params/HttpConnectionParams;->setSocketBufferSize(Lorg/apache/http/params/HttpParams;I)V

    .line 71
    const/4 v9, 0x0

    invoke-static {v1, v9}, Lorg/apache/http/client/params/HttpClientParams;->setRedirecting(Lorg/apache/http/params/HttpParams;Z)V

    .line 72
    const/4 v9, 0x0

    invoke-static {v1, v9}, Lorg/apache/http/client/params/HttpClientParams;->setAuthenticating(Lorg/apache/http/params/HttpParams;Z)V

    .line 73
    if-eqz p1, :cond_0

    .line 74
    invoke-static {v1, p1}, Lorg/apache/http/params/HttpProtocolParams;->setUserAgent(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 76
    :cond_0
    new-instance v4, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 78
    .local v4, "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v5

    .line 80
    .local v5, "socketFactory":Lorg/apache/http/conn/scheme/PlainSocketFactory;
    new-instance v2, Lorg/apache/http/conn/scheme/Scheme;

    const-string v9, "http"

    const/16 v10, 0x50

    invoke-direct {v2, v9, v5, v10}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    .line 81
    .local v2, "httpScheme":Lorg/apache/http/conn/scheme/Scheme;
    invoke-virtual {v4, v2}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 87
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v9

    .line 86
    invoke-static {v9}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v7

    .line 88
    .local v7, "trustStore":Ljava/security/KeyStore;
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v7, v9, v10}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 89
    new-instance v6, Lcom/shengpay/express/smc/http/SmkSSLSocketFactory;

    invoke-direct {v6, v7}, Lcom/shengpay/express/smc/http/SmkSSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .line 92
    .local v6, "sslSocketFactory":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    sget-object v8, Lorg/apache/http/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .line 94
    .local v8, "x509HostnameVerifier":Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    invoke-virtual {v6, v8}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 95
    invoke-static {v8}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 97
    new-instance v3, Lorg/apache/http/conn/scheme/Scheme;

    const-string v9, "https"

    const/16 v10, 0x1bb

    invoke-direct {v3, v9, v6, v10}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    .line 98
    .local v3, "httpsScheme":Lorg/apache/http/conn/scheme/Scheme;
    invoke-virtual {v4, v3}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 100
    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v0, v1, v4}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 103
    .local v0, "connManager":Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v9, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v9, v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    iput-object v9, p0, Lcom/shengpay/express/smc/http/SimpleHttpClient;->client:Lorg/apache/http/client/HttpClient;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .end local v0    # "connManager":Lorg/apache/http/conn/ClientConnectionManager;
    .end local v1    # "httpParams":Lorg/apache/http/params/BasicHttpParams;
    .end local v2    # "httpScheme":Lorg/apache/http/conn/scheme/Scheme;
    .end local v3    # "httpsScheme":Lorg/apache/http/conn/scheme/Scheme;
    .end local v4    # "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v5    # "socketFactory":Lorg/apache/http/conn/scheme/PlainSocketFactory;
    .end local v6    # "sslSocketFactory":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .end local v7    # "trustStore":Ljava/security/KeyStore;
    .end local v8    # "x509HostnameVerifier":Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    :goto_0
    return-void

    .line 104
    :catch_0
    move-exception v9

    goto :goto_0
.end method

.method public static INSTANCE()Lcom/shengpay/express/smc/http/SimpleHttpClient;
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/shengpay/express/smc/http/SimpleHttpClient;->simpleHttpClient:Lcom/shengpay/express/smc/http/SimpleHttpClient;

    return-object v0
.end method

.method private static getParamsList(Landroid/os/Bundle;)Ljava/util/List;
    .locals 5
    .param p0, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 201
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/os/Bundle;->size()I

    move-result v2

    if-nez v2, :cond_2

    .line 202
    :cond_0
    const/4 v1, 0x0

    .line 208
    :cond_1
    return-object v1

    .line 204
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 205
    .local v1, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    invoke-virtual {p0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 206
    .local v0, "key":Ljava/lang/String;
    new-instance v3, Lorg/apache/http/message/BasicNameValuePair;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private getParamsList(Ljava/lang/String;)Ljava/util/List;
    .locals 10
    .param p1, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 187
    const-string v4, "&"

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 189
    .local v3, "paramArray":[Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 190
    .local v1, "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    array-length v6, v3

    move v4, v5

    :goto_0
    if-lt v4, v6, :cond_0

    .line 197
    return-object v1

    .line 190
    :cond_0
    aget-object v2, v3, v4

    .line 191
    .local v2, "param":Ljava/lang/String;
    const-string v7, "="

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 194
    .local v0, "keyValue":[Ljava/lang/String;
    new-instance v7, Lorg/apache/http/message/BasicNameValuePair;

    aget-object v8, v0, v5

    const/4 v9, 0x1

    aget-object v9, v0, v9

    invoke-direct {v7, v8, v9}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method


# virtual methods
.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;
    .locals 4
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    .local p2, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<TT;>;"
    const-string v2, "SimpleHttpClient"

    const-string v3, "HttpClient execute request..."

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    if-nez p2, :cond_0

    .line 117
    :try_start_0
    iget-object v2, p0, Lcom/shengpay/express/smc/http/SimpleHttpClient;->client:Lorg/apache/http/client/HttpClient;

    invoke-interface {v2, p1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 124
    :goto_0
    return-object v1

    .line 120
    :cond_0
    iget-object v2, p0, Lcom/shengpay/express/smc/http/SimpleHttpClient;->client:Lorg/apache/http/client/HttpClient;

    invoke-interface {v2, p1, p2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 122
    :catch_0
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "{\'status\':\'ERROR\',\'result\':{\'code\':\'-9999\',\'message\':\'\u7f51\u7edc\u8fde\u63a5\u8d85\u65f6\uff0c\u8bf7\u60a8\u91cd\u65b0\u5c1d\u8bd5\'}}"

    .line 124
    .local v1, "response":Ljava/lang/String;
    goto :goto_0
.end method

.method public getResponseHandler()Lorg/apache/http/client/ResponseHandler;
    .locals 1

    .prologue
    .line 213
    iget-object v0, p0, Lcom/shengpay/express/smc/http/SimpleHttpClient;->responseHandler:Lorg/apache/http/client/ResponseHandler;

    return-object v0
.end method

.method public sendGetMessage(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    const-string v1, "SimpleHttpClient"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "sendGetMessage, uri: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v0, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 135
    .local v0, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    invoke-virtual {p0}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->getResponseHandler()Lorg/apache/http/client/ResponseHandler;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public sendGetMessage(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/Object;
    .locals 8
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "paramsMap"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    const-string v5, "SimpleHttpClient"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "sendGetMessage, uri: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " paramsMap: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 142
    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 141
    invoke-static {v5, v6}, Lcom/shengpay/express/smc/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .local v3, "sb":Ljava/lang/StringBuilder;
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/os/Bundle;->size()I

    move-result v5

    if-eqz v5, :cond_0

    .line 146
    const-string v5, "?"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    invoke-virtual {p2}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_1

    .line 151
    :cond_0
    const/4 v5, 0x0

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 152
    .local v4, "url":Ljava/lang/String;
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v0, v4}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 153
    .local v0, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 154
    .local v2, "params":Lorg/apache/http/params/HttpParams;
    invoke-virtual {v0, v2}, Lorg/apache/http/client/methods/HttpGet;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 155
    invoke-virtual {p0}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->getResponseHandler()Lorg/apache/http/client/ResponseHandler;

    move-result-object v5

    invoke-virtual {p0, v0, v5}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v5

    return-object v5

    .line 147
    .end local v0    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v2    # "params":Lorg/apache/http/params/HttpParams;
    .end local v4    # "url":Ljava/lang/String;
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 148
    .local v1, "key":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "&"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public sendJsonString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    new-instance v1, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v1, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 231
    .local v1, "httpPost":Lorg/apache/http/client/methods/HttpPost;
    if-eqz p2, :cond_0

    .line 232
    new-instance v0, Lorg/apache/http/entity/StringEntity;

    const-string v2, "utf-8"

    invoke-direct {v0, p2, v2}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .local v0, "entity":Lorg/apache/http/entity/StringEntity;
    const-string v2, "application/json"

    invoke-virtual {v0, v2}, Lorg/apache/http/entity/StringEntity;->setContentType(Ljava/lang/String;)V

    .line 234
    invoke-virtual {v1, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 236
    .end local v0    # "entity":Lorg/apache/http/entity/StringEntity;
    :cond_0
    invoke-virtual {p0}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->getResponseHandler()Lorg/apache/http/client/ResponseHandler;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public sendPostMessage(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/Object;
    .locals 5
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "params"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    const-string v2, "SimpleHttpClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "sendPostMessage, uri: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " params: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    new-instance v1, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v1, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 163
    .local v1, "httpPost":Lorg/apache/http/client/methods/HttpPost;
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/os/Bundle;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 164
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    .line 165
    invoke-static {p2}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->getParamsList(Landroid/os/Bundle;)Ljava/util/List;

    move-result-object v2

    const-string v3, "utf-8"

    .line 164
    invoke-direct {v0, v2, v3}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 166
    .local v0, "formEntity":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    invoke-virtual {v1, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 168
    .end local v0    # "formEntity":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :cond_0
    invoke-virtual {p0}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->getResponseHandler()Lorg/apache/http/client/ResponseHandler;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public sendPostMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    const-string v2, "SimpleHttpClient"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "sendPostMessage, uri: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " paramsMap: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 175
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 174
    invoke-static {v2, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    new-instance v1, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v1, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 178
    .local v1, "httpPost":Lorg/apache/http/client/methods/HttpPost;
    if-eqz p2, :cond_0

    .line 179
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    .line 180
    invoke-direct {p0, p2}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->getParamsList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 179
    invoke-direct {v0, v2}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    .line 181
    .local v0, "formEntity":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    invoke-virtual {v1, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 183
    .end local v0    # "formEntity":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :cond_0
    invoke-virtual {p0}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->getResponseHandler()Lorg/apache/http/client/ResponseHandler;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public sendPostStringForm(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    new-instance v1, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v1, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 243
    .local v1, "httpPost":Lorg/apache/http/client/methods/HttpPost;
    if-eqz p2, :cond_0

    .line 244
    new-instance v2, Lorg/apache/http/message/BasicHeader;

    const-string v3, "Content-Type"

    const-string v4, "application/x-www-form-urlencoded"

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Lorg/apache/http/Header;)V

    .line 245
    const-string v2, "Accept"

    const-string v3, "*/*"

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    new-instance v0, Lorg/apache/http/entity/StringEntity;

    const-string v2, "utf-8"

    invoke-direct {v0, p2, v2}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .local v0, "entity":Lorg/apache/http/entity/StringEntity;
    invoke-virtual {v1, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 249
    .end local v0    # "entity":Lorg/apache/http/entity/StringEntity;
    :cond_0
    invoke-virtual {p0}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->getResponseHandler()Lorg/apache/http/client/ResponseHandler;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public sendPostStringForm(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Object;
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/message/BasicNameValuePair;",
            ">;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    .local p2, "orderList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v0, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 256
    .local v0, "httpPost":Lorg/apache/http/client/methods/HttpPost;
    if-eqz p2, :cond_0

    .line 257
    new-instance v1, Lorg/apache/http/message/BasicHeader;

    const-string v2, "Content-Type"

    const-string v3, "application/x-www-form-urlencoded"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Lorg/apache/http/Header;)V

    .line 258
    const-string v1, "Accept"

    const-string v2, "*/*"

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    new-instance v1, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v2, "UTF-8"

    invoke-direct {v1, p2, v2}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 261
    :cond_0
    invoke-virtual {p0}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->getResponseHandler()Lorg/apache/http/client/ResponseHandler;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method
