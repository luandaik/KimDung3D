.class public Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;
.super Ljava/lang/Object;
.source "URLRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;
    }
.end annotation


# instance fields
.field private final AV_HTTP_STATUS_FAIL:I

.field private final AV_HTTP_STATUS_GET_CREATEFILE:I

.field private final AV_HTTP_STATUS_GET_WRITEFILE:I

.field private final AV_HTTP_STATUS_INVALIED_HOST:I

.field private final AV_HTTP_STATUS_INVALIED_URL:I

.field private final AV_HTTP_STATUS_NOHEADERS:I

.field private final AV_HTTP_STATUS_POST_READFILE:I

.field private final AV_HTTP_STATUS_READBODY:I

.field private final AV_HTTP_STATUS_SEND_INCOMPLETE:I

.field private final AV_HTTP_STATUS_SUCC:I

.field private final AV_HTTP_STATUS_TIMEOUT:I

.field private body:[B

.field private delegate:J

.field private getFilePath:Ljava/lang/String;

.field private method:Ljava/lang/String;

.field private postFilePath:Ljava/lang/String;

.field private reqConnURL:Ljava/net/URL;

.field private response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

.field private timeout:I

.field private urlConn:Ljava/net/HttpURLConnection;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_SUCC:I

    .line 29
    const/4 v0, 0x1

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_FAIL:I

    .line 30
    const/4 v0, 0x2

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_TIMEOUT:I

    .line 31
    const/4 v0, 0x3

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_INVALIED_HOST:I

    .line 32
    const/4 v0, 0x4

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_INVALIED_URL:I

    .line 33
    const/4 v0, 0x5

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_NOHEADERS:I

    .line 34
    const/4 v0, 0x6

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_READBODY:I

    .line 35
    const/4 v0, 0x7

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_SEND_INCOMPLETE:I

    .line 36
    const/16 v0, 0x8

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_GET_CREATEFILE:I

    .line 37
    const/16 v0, 0x9

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_GET_WRITEFILE:I

    .line 38
    const/16 v0, 0xa

    iput v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->AV_HTTP_STATUS_POST_READFILE:I

    .line 163
    return-void
.end method

.method static synthetic access$000(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->method:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)[B
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->body:[B

    return-object v0
.end method

.method static synthetic access$200(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/net/HttpURLConnection;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->urlConn:Ljava/net/HttpURLConnection;

    return-object v0
.end method

.method static synthetic access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    return-object v0
.end method

.method public static native response(IJILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[B[Ljava/lang/String;)V
.end method


# virtual methods
.method public addHead(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->urlConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method public getFile(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 99
    const-string v0, "GET"

    invoke-virtual {p0, v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->setMethod(Ljava/lang/String;)V

    .line 100
    invoke-virtual {p0, p1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->sendRequest(Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method public initWithURL(Ljava/lang/String;I)I
    .locals 5

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 54
    new-instance v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    invoke-direct {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;-><init>()V

    iput-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    .line 55
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    iput-object p1, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->URL:Ljava/lang/String;

    .line 56
    const-string v0, "GET"

    iput-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->method:Ljava/lang/String;

    .line 57
    iput p2, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->timeout:I

    .line 59
    :try_start_0
    new-instance v0, Ljava/net/URL;

    iget-object v3, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    iget-object v3, v3, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->URL:Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->reqConnURL:Ljava/net/URL;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    :goto_0
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->reqConnURL:Ljava/net/URL;

    if-nez v0, :cond_0

    .line 65
    const-string v0, "ApolloVoice"

    const-string v2, "reqConnURL"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 95
    :goto_1
    return v0

    .line 60
    :catch_0
    move-exception v0

    .line 62
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_0

    .line 69
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->reqConnURL:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    iput-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->urlConn:Ljava/net/HttpURLConnection;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 75
    const-string v0, "ApolloVoice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "After open Connection With URL:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->urlConn:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_1

    .line 77
    const-string v0, "cz"

    const-string v2, "urlConn == null"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    .line 78
    goto :goto_1

    .line 70
    :catch_1
    move-exception v0

    .line 72
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move v0, v1

    .line 73
    goto :goto_1

    .line 81
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->urlConn:Ljava/net/HttpURLConnection;

    iget-object v3, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->method:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/net/ProtocolException; {:try_start_2 .. :try_end_2} :catch_2

    .line 87
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->urlConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 89
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->method:Ljava/lang/String;

    const-string v1, "POST"

    if-ne v0, v1, :cond_2

    .line 90
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->urlConn:Ljava/net/HttpURLConnection;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 91
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->urlConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 94
    :cond_2
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->urlConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    move v0, v2

    .line 95
    goto :goto_1

    .line 82
    :catch_2
    move-exception v0

    .line 84
    invoke-virtual {v0}, Ljava/net/ProtocolException;->printStackTrace()V

    move v0, v1

    .line 85
    goto :goto_1
.end method

.method public postFile(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 104
    const-string v0, "POST"

    invoke-virtual {p0, v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->setMethod(Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0, p1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->sendRequest(Ljava/lang/String;)V

    .line 106
    return-void
.end method

.method public response2cpp(I)V
    .locals 11

    .prologue
    const/4 v8, 0x0

    const/4 v4, 0x0

    .line 118
    const-string v0, "ApolloVoice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "url["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    iget-object v2, v2, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]response2cpp with result :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    if-eqz p1, :cond_0

    .line 121
    iget-wide v2, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->delegate:J

    const-string v5, ""

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    iget-object v6, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->URL:Ljava/lang/String;

    const-string v7, ""

    move v1, p1

    move-object v9, v8

    invoke-static/range {v1 .. v9}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response(IJILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[B[Ljava/lang/String;)V

    .line 136
    :goto_0
    return-void

    .line 123
    :cond_0
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 124
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    iget-object v0, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->headers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 125
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 126
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 127
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 128
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 129
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 130
    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 134
    :cond_2
    iget-wide v2, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->delegate:J

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    iget v10, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->status:I

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    iget-object v5, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->statusMsg:Ljava/lang/String;

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    iget-object v6, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->URL:Ljava/lang/String;

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    iget-object v7, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->version:Ljava/lang/String;

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response:Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    iget-object v8, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->body:[B

    new-array v0, v4, [Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    move-object v9, v0

    check-cast v9, [Ljava/lang/String;

    move v1, p1

    move v4, v10

    invoke-static/range {v1 .. v9}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response(IJILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[B[Ljava/lang/String;)V

    goto :goto_0
.end method

.method public sendRequest()V
    .locals 1

    .prologue
    .line 108
    const-string v0, "GET"

    iput-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->method:Ljava/lang/String;

    .line 109
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->sendRequest(Ljava/lang/String;)V

    .line 110
    return-void
.end method

.method public sendRequest(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 113
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;

    invoke-direct {v1, p0, p1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;-><init>(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 114
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 115
    return-void
.end method

.method public setBody([B)V
    .locals 0

    .prologue
    .line 159
    iput-object p1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->body:[B

    .line 160
    return-void
.end method

.method public setDelegate(J)V
    .locals 1

    .prologue
    .line 150
    iput-wide p1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->delegate:J

    .line 151
    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 139
    iput-object p1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->method:Ljava/lang/String;

    .line 141
    :try_start_0
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->urlConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_0

    .line 147
    :goto_0
    return-void

    .line 142
    :catch_0
    move-exception v0

    .line 144
    invoke-virtual {v0}, Ljava/net/ProtocolException;->printStackTrace()V

    goto :goto_0
.end method
