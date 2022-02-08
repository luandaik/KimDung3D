.class Lcom/heitao/platform/update/HTAPKUpdateHelper$2;
.super Ljava/lang/Thread;
.source "HTAPKUpdateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/update/HTAPKUpdateHelper;->downloadAPK(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/platform/common/HTAppUpdateInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$manager:Landroid/net/ConnectivityManager;


# direct methods
.method constructor <init>(Landroid/net/ConnectivityManager;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/update/HTAPKUpdateHelper$2;->val$manager:Landroid/net/ConnectivityManager;

    .line 121
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 125
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 126
    .local v4, "client":Lorg/apache/http/client/HttpClient;
    new-instance v10, Lorg/apache/http/client/methods/HttpGet;

    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$4()Lcom/heitao/platform/common/HTAppUpdateInfo;

    move-result-object v16

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/heitao/platform/common/HTAppUpdateInfo;->apkURL:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v10, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 130
    .local v10, "get":Lorg/apache/http/client/methods/HttpGet;
    :try_start_0
    invoke-interface {v4, v10}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v13

    .line 131
    .local v13, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    .line 132
    .local v7, "entity":Lorg/apache/http/HttpEntity;
    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v14

    .line 133
    .local v14, "length":J
    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v12

    .line 134
    .local v12, "is":Ljava/io/InputStream;
    const/4 v9, 0x0

    .line 135
    .local v9, "fileOutputStream":Ljava/io/FileOutputStream;
    if-eqz v12, :cond_0

    .line 138
    new-instance v8, Ljava/io/File;

    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$3()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 139
    .local v8, "file":Ljava/io/File;
    new-instance v9, Ljava/io/FileOutputStream;

    .end local v9    # "fileOutputStream":Ljava/io/FileOutputStream;
    invoke-direct {v9, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 140
    .restart local v9    # "fileOutputStream":Ljava/io/FileOutputStream;
    const/16 v16, 0x400

    move/from16 v0, v16

    new-array v2, v0, [B

    .line 141
    .local v2, "b":[B
    const/4 v3, -0x1

    .line 142
    .local v3, "charb":I
    const/4 v5, 0x0

    .line 143
    .local v5, "count":I
    :goto_0
    invoke-virtual {v12, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/16 v16, -0x1

    move/from16 v0, v16

    if-ne v3, v0, :cond_2

    .line 159
    .end local v2    # "b":[B
    .end local v3    # "charb":I
    .end local v5    # "count":I
    .end local v8    # "file":Ljava/io/File;
    :cond_0
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->flush()V

    .line 160
    if-eqz v9, :cond_1

    .line 162
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V

    .line 164
    :cond_1
    sget-object v16, Lcom/heitao/platform/update/HTAPKUpdateHelper;->handler:Landroid/os/Handler;

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 170
    .end local v7    # "entity":Lorg/apache/http/HttpEntity;
    .end local v9    # "fileOutputStream":Ljava/io/FileOutputStream;
    .end local v12    # "is":Ljava/io/InputStream;
    .end local v13    # "response":Lorg/apache/http/HttpResponse;
    .end local v14    # "length":J
    :goto_1
    return-void

    .line 145
    .restart local v2    # "b":[B
    .restart local v3    # "charb":I
    .restart local v5    # "count":I
    .restart local v7    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v8    # "file":Ljava/io/File;
    .restart local v9    # "fileOutputStream":Ljava/io/FileOutputStream;
    .restart local v12    # "is":Ljava/io/InputStream;
    .restart local v13    # "response":Lorg/apache/http/HttpResponse;
    .restart local v14    # "length":J
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/update/HTAPKUpdateHelper$2;->val$manager:Landroid/net/ConnectivityManager;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v11

    .line 146
    .local v11, "info":Landroid/net/NetworkInfo;
    if-eqz v11, :cond_3

    invoke-virtual {v11}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v16

    sget-object v17, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    if-ne v0, v1, :cond_3

    .line 148
    sget-object v16, Lcom/heitao/platform/update/HTAPKUpdateHelper;->handler:Landroid/os/Handler;

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 154
    :goto_2
    add-int/2addr v5, v3

    .line 155
    int-to-float v0, v5

    move/from16 v16, v0

    long-to-float v0, v14

    move/from16 v17, v0

    div-float v16, v16, v17

    const/high16 v17, 0x42c80000    # 100.0f

    mul-float v16, v16, v17

    move/from16 v0, v16

    float-to-int v0, v0

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$5(I)V

    .line 156
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v9, v2, v0, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 166
    .end local v2    # "b":[B
    .end local v3    # "charb":I
    .end local v5    # "count":I
    .end local v7    # "entity":Lorg/apache/http/HttpEntity;
    .end local v8    # "file":Ljava/io/File;
    .end local v9    # "fileOutputStream":Ljava/io/FileOutputStream;
    .end local v11    # "info":Landroid/net/NetworkInfo;
    .end local v12    # "is":Ljava/io/InputStream;
    .end local v13    # "response":Lorg/apache/http/HttpResponse;
    .end local v14    # "length":J
    :catch_0
    move-exception v6

    .line 168
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 152
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v2    # "b":[B
    .restart local v3    # "charb":I
    .restart local v5    # "count":I
    .restart local v7    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v8    # "file":Ljava/io/File;
    .restart local v9    # "fileOutputStream":Ljava/io/FileOutputStream;
    .restart local v11    # "info":Landroid/net/NetworkInfo;
    .restart local v12    # "is":Ljava/io/InputStream;
    .restart local v13    # "response":Lorg/apache/http/HttpResponse;
    .restart local v14    # "length":J
    :cond_3
    :try_start_1
    sget-object v16, Lcom/heitao/platform/update/HTAPKUpdateHelper;->handler:Landroid/os/Handler;

    const/16 v17, 0x2

    invoke-virtual/range {v16 .. v17}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method
