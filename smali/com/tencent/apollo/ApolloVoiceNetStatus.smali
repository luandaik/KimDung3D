.class public Lcom/tencent/apollo/ApolloVoiceNetStatus;
.super Ljava/lang/Object;
.source "ApolloVoiceNetStatus.java"


# static fields
.field private static LOGTAG:Ljava/lang/String;

.field private static UNKNOWN:Ljava/lang/String;

.field private static mainContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const-string v0, "GCloudVoiceVoiceTag"

    sput-object v0, Lcom/tencent/apollo/ApolloVoiceNetStatus;->LOGTAG:Ljava/lang/String;

    .line 11
    const-string v0, "Unknown"

    sput-object v0, Lcom/tencent/apollo/ApolloVoiceNetStatus;->UNKNOWN:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Net()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 20
    sget-object v1, Lcom/tencent/apollo/ApolloVoiceNetStatus;->UNKNOWN:Ljava/lang/String;

    .line 21
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceNetStatus;->mainContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 22
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceNetStatus;->LOGTAG:Ljava/lang/String;

    const-string v2, "mainContext is null .May init java first"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    :goto_0
    return-object v1

    .line 25
    :cond_0
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceNetStatus;->mainContext:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 26
    if-nez v0, :cond_1

    .line 27
    sget-object v1, Lcom/tencent/apollo/ApolloVoiceNetStatus;->UNKNOWN:Ljava/lang/String;

    goto :goto_0

    .line 31
    :cond_1
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 32
    if-nez v0, :cond_2

    .line 33
    sget-object v0, Lcom/tencent/apollo/ApolloVoiceNetStatus;->UNKNOWN:Ljava/lang/String;

    .line 49
    :goto_1
    sget-object v1, Lcom/tencent/apollo/ApolloVoiceNetStatus;->LOGTAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Android Java Get Net status:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v0

    .line 50
    goto :goto_0

    .line 34
    :cond_2
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    if-ne v2, v3, :cond_3

    .line 35
    const-string v0, "WiFi"

    goto :goto_1

    .line 36
    :cond_3
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    if-nez v2, :cond_8

    .line 37
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v0

    .line 38
    const/4 v2, 0x4

    if-eq v0, v2, :cond_4

    if-eq v0, v3, :cond_4

    const/4 v2, 0x2

    if-eq v0, v2, :cond_4

    if-ne v0, v3, :cond_5

    .line 40
    :cond_4
    const-string v0, "2G"

    goto :goto_1

    .line 41
    :cond_5
    const/4 v2, 0x3

    if-eq v0, v2, :cond_6

    const/16 v2, 0x8

    if-eq v0, v2, :cond_6

    const/4 v2, 0x6

    if-eq v0, v2, :cond_6

    const/4 v2, 0x5

    if-eq v0, v2, :cond_6

    const/16 v2, 0xc

    if-ne v0, v2, :cond_7

    .line 44
    :cond_6
    const-string v0, "3G"

    goto :goto_1

    .line 45
    :cond_7
    const/16 v2, 0xd

    if-ne v0, v2, :cond_8

    .line 46
    const-string v0, "4G"

    goto :goto_1

    :cond_8
    move-object v0, v1

    goto :goto_1
.end method

.method public static SetContext(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 16
    sput-object p0, Lcom/tencent/apollo/ApolloVoiceNetStatus;->mainContext:Landroid/content/Context;

    .line 17
    return-void
.end method
