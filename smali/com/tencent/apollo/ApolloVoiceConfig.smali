.class public Lcom/tencent/apollo/ApolloVoiceConfig;
.super Ljava/lang/Object;
.source "ApolloVoiceConfig.java"


# static fields
.field private static LOGTAG:Ljava/lang/String; = null

.field private static final cfgName:Ljava/lang/String; = "GCloudVoice/config.json"

.field private static mainContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-string v0, "GCloudVoiceTag"

    sput-object v0, Lcom/tencent/apollo/ApolloVoiceConfig;->LOGTAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static JSONCfg()Ljava/lang/String;
    .locals 5

    .prologue
    .line 21
    const-string v1, ""

    .line 23
    :try_start_0
    new-instance v0, Ljava/io/InputStreamReader;

    sget-object v2, Lcom/tencent/apollo/ApolloVoiceConfig;->mainContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string v3, "GCloudVoice/config.json"

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 24
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 25
    const-string v0, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 27
    :goto_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 28
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 30
    :cond_0
    sget-object v1, Lcom/tencent/apollo/ApolloVoiceConfig;->LOGTAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Get config :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 38
    :cond_1
    :goto_1
    return-object v0

    .line 32
    :catch_0
    move-exception v0

    move-object v4, v0

    move-object v0, v1

    move-object v1, v4

    .line 33
    :goto_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 35
    const-string v1, ""

    if-ne v0, v1, :cond_1

    .line 36
    const-string v0, "{}"

    goto :goto_1

    .line 32
    :catch_1
    move-exception v1

    goto :goto_2
.end method

.method public static SetContext(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 17
    sput-object p0, Lcom/tencent/apollo/ApolloVoiceConfig;->mainContext:Landroid/content/Context;

    .line 18
    return-void
.end method
