.class public Lcom/heitao/common/HTFileReader;
.super Ljava/lang/Object;
.source "HTFileReader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public openFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileNmae"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 20
    if-nez p1, :cond_0

    .line 22
    const-string v2, "HTFileReader openFile context is null"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 45
    :goto_0
    return-object v1

    .line 26
    :cond_0
    invoke-static {p2}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 28
    const-string v2, "HTFileReader openFile fileNmae is null"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 32
    :cond_1
    const/4 v1, 0x0

    .line 35
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 42
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public openTextFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileNmae"    # Ljava/lang/String;

    .prologue
    .line 56
    const/4 v6, 0x0

    .line 57
    .local v6, "text":Ljava/lang/String;
    invoke-virtual {p0, p1, p2}, Lcom/heitao/common/HTFileReader;->openFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 58
    .local v3, "is":Ljava/io/InputStream;
    if-eqz v3, :cond_1

    .line 60
    const-string v4, ""

    .line 61
    .local v4, "line":Ljava/lang/String;
    const-string v5, ""

    .line 62
    .local v5, "result":Ljava/lang/String;
    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 63
    .local v2, "inputReader":Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 67
    .local v0, "bufReader":Ljava/io/BufferedReader;
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 69
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_0

    .line 72
    :catch_0
    move-exception v1

    .line 75
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 78
    .end local v1    # "e":Ljava/io/IOException;
    :cond_0
    move-object v6, v5

    .line 80
    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .end local v2    # "inputReader":Ljava/io/InputStreamReader;
    .end local v4    # "line":Ljava/lang/String;
    .end local v5    # "result":Ljava/lang/String;
    :cond_1
    return-object v6
.end method
