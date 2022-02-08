.class Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;
.super Ljava/lang/Object;
.source "URLRequest.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RequestTask"
.end annotation


# instance fields
.field private filepath:Ljava/lang/String;

.field final synthetic this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;


# direct methods
.method public constructor <init>(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 165
    iput-object p1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    iput-object p2, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->filepath:Ljava/lang/String;

    .line 167
    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v1, 0x0

    const/16 v10, 0x400

    const/4 v9, -0x1

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 173
    .line 177
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->filepath:Ljava/lang/String;

    const-string v2, ""

    if-eq v0, v2, :cond_f

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$000(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "GET"

    if-ne v0, v2, :cond_f

    .line 178
    new-instance v2, Ljava/io/File;

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->filepath:Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 180
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 181
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v0

    .line 191
    :goto_0
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->filepath:Ljava/lang/String;

    const-string v3, ""

    if-eq v0, v3, :cond_0

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$000(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "POST"

    if-ne v0, v3, :cond_0

    .line 193
    :try_start_1
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->filepath:Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 204
    :cond_0
    :try_start_2
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$100(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)[B

    move-result-object v0

    if-eqz v0, :cond_2

    .line 206
    new-instance v0, Ljava/io/BufferedOutputStream;

    iget-object v1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$200(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/net/HttpURLConnection;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 207
    iget-object v1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$100(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 208
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 209
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 244
    :goto_1
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$200(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v0

    .line 245
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    if-nez v1, :cond_6

    .line 247
    :cond_1
    const-string v0, "ApolloVoice"

    const-string v1, "headerFields == null || headerFields.entrySet() == null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    .line 349
    :goto_2
    return-void

    .line 182
    :catch_0
    move-exception v0

    .line 184
    const-string v1, "ApolloVoice"

    const-string v2, "Get File With Create File Error"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 186
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    goto :goto_2

    .line 194
    :catch_1
    move-exception v0

    .line 196
    const-string v1, "ApolloVoice"

    const-string v2, "Post File With Open File Error"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 198
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    goto :goto_2

    .line 210
    :cond_2
    :try_start_3
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->filepath:Ljava/lang/String;

    const-string v3, ""

    if-eq v0, v3, :cond_4

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$000(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "POST"

    if-ne v0, v3, :cond_4

    if-eqz v1, :cond_4

    .line 211
    const/16 v0, 0x400

    new-array v0, v0, [B

    .line 214
    new-instance v3, Ljava/io/BufferedOutputStream;

    iget-object v4, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v4}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$200(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/net/HttpURLConnection;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 215
    :goto_3
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v4

    if-eq v4, v9, :cond_3

    .line 216
    const/4 v5, 0x0

    invoke-virtual {v3, v0, v5, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 217
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catch Ljava/net/UnknownHostException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    goto :goto_3

    .line 229
    :catch_2
    move-exception v0

    .line 230
    const-string v0, "ApolloVoice"

    const-string v1, "UnknownHost"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    goto :goto_2

    .line 219
    :cond_3
    :try_start_4
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/net/UnknownHostException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    goto/16 :goto_1

    .line 233
    :catch_3
    move-exception v0

    .line 234
    const-string v0, "ApolloVoice"

    const-string v1, "SocketTimeoutException"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    goto :goto_2

    .line 221
    :cond_4
    :try_start_5
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$200(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/net/HttpURLConnection;

    move-result-object v0

    if-nez v0, :cond_5

    .line 222
    const-string v0, "ApolloVice"

    const-string v1, "urlConn is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/net/UnknownHostException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto/16 :goto_2

    .line 237
    :catch_4
    move-exception v0

    .line 239
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 240
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-virtual {v0, v8}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    goto/16 :goto_2

    .line 225
    :cond_5
    :try_start_6
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$200(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V
    :try_end_6
    .catch Ljava/net/UnknownHostException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto/16 :goto_1

    .line 251
    :cond_6
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 252
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 253
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 254
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 255
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 256
    const-string v3, ""

    .line 257
    if-eqz v0, :cond_7

    .line 258
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 259
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v3, v0

    goto :goto_5

    .line 262
    :cond_7
    if-nez v1, :cond_8

    .line 263
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v0

    const-string v1, "\\ "

    invoke-virtual {v3, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v7

    iput-object v1, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->version:Ljava/lang/String;

    goto :goto_4

    .line 265
    :cond_8
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v0

    iget-object v0, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->headers:Ljava/util/Map;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 270
    :cond_9
    :try_start_7
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v0

    iget-object v1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$200(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/net/HttpURLConnection;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    iput v1, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->status:I
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 277
    :goto_6
    :try_start_8
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v0

    iget-object v1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$200(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/net/HttpURLConnection;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->statusMsg:Ljava/lang/String;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_7

    .line 285
    :goto_7
    :try_start_9
    new-instance v0, Ljava/io/BufferedInputStream;

    iget-object v1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$200(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/net/HttpURLConnection;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_9
    .catch Ljava/io/FileNotFoundException; {:try_start_9 .. :try_end_9} :catch_8
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_9

    .line 308
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 309
    new-array v3, v10, [B

    .line 312
    :cond_a
    :goto_8
    :try_start_a
    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    if-eq v4, v9, :cond_d

    .line 313
    if-nez v2, :cond_c

    .line 315
    const/4 v5, 0x0

    invoke-virtual {v1, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5

    goto :goto_8

    .line 322
    :catch_5
    move-exception v0

    .line 324
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 325
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    goto/16 :goto_2

    .line 271
    :catch_6
    move-exception v0

    .line 273
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 274
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v0

    iput v7, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->status:I

    goto :goto_6

    .line 278
    :catch_7
    move-exception v0

    .line 280
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 281
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v0

    const-string v1, "No Status Message!"

    iput-object v1, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->statusMsg:Ljava/lang/String;

    goto :goto_7

    .line 286
    :catch_8
    move-exception v0

    .line 287
    iget-object v1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v1

    iget v1, v1, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->status:I

    const/16 v2, 0x194

    if-ne v1, v2, :cond_b

    .line 288
    const-string v0, "404"

    .line 289
    iget-object v1, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v1}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    iput-object v0, v1, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->body:[B

    .line 290
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-virtual {v0, v7}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    goto/16 :goto_2

    .line 293
    :cond_b
    const-string v1, "ApolloVoice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "response status = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v3}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v3

    iget v3, v3, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->status:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v3}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v3

    iget-object v3, v3, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->statusMsg:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    const-string v1, "ApolloVoice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v3}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$200(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/net/HttpURLConnection;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 296
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-virtual {v0, v8}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    goto/16 :goto_2

    .line 299
    :catch_9
    move-exception v0

    .line 302
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 303
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-virtual {v0, v8}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    goto/16 :goto_2

    .line 317
    :cond_c
    if-eqz v2, :cond_a

    .line 318
    const/4 v5, 0x0

    :try_start_b
    invoke-virtual {v2, v3, v5, v4}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5

    goto/16 :goto_8

    .line 329
    :cond_d
    :try_start_c
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 330
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_a

    .line 335
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v0

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    iput-object v1, v0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->body:[B

    .line 336
    const-string v0, "ApolloVoice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Java body size is "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v3}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$300(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;

    move-result-object v3

    iget-object v3, v3, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->body:[B

    array-length v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->filepath:Ljava/lang/String;

    const-string v1, ""

    if-eq v0, v1, :cond_e

    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-static {v0}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->access$000(Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "GET"

    if-ne v0, v1, :cond_e

    .line 338
    if-eqz v2, :cond_e

    .line 340
    :try_start_d
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 341
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_b

    .line 348
    :cond_e
    :goto_9
    iget-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest$RequestTask;->this$0:Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;

    invoke-virtual {v0, v7}, Lcom/tencent/apollo/apollovoice/httpclient/URLRequest;->response2cpp(I)V

    goto/16 :goto_2

    .line 331
    :catch_a
    move-exception v0

    .line 332
    const-string v0, "ApolloVoice"

    const-string v1, "ByteArrayOutputStream Exception"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 342
    :catch_b
    move-exception v0

    .line 344
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_9

    :cond_f
    move-object v2, v1

    goto/16 :goto_0
.end method
