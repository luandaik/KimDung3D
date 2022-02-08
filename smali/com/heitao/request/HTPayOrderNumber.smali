.class public Lcom/heitao/request/HTPayOrderNumber;
.super Lcom/heitao/request/HTBaseRequest;
.source "HTPayOrderNumber.java"


# instance fields
.field private mErrorCode:I

.field private mErrorMessage:Ljava/lang/String;

.field private mErrorTitle:Ljava/lang/String;

.field private mParsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 21
    invoke-direct {p0}, Lcom/heitao/request/HTBaseRequest;-><init>()V

    .line 23
    iput-object v0, p0, Lcom/heitao/request/HTPayOrderNumber;->mParsMap:Ljava/util/Map;

    .line 24
    iput-object v0, p0, Lcom/heitao/request/HTPayOrderNumber;->mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/heitao/request/HTPayOrderNumber;->mErrorCode:I

    .line 27
    const-string v0, "\u63d0\u793a"

    iput-object v0, p0, Lcom/heitao/request/HTPayOrderNumber;->mErrorTitle:Ljava/lang/String;

    .line 28
    const-string v0, "\u751f\u6210\u8ba2\u5355\u53f7\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u8fde\u63a5\u6216\u7a0d\u540e\u91cd\u8bd5"

    iput-object v0, p0, Lcom/heitao/request/HTPayOrderNumber;->mErrorMessage:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/heitao/request/HTPayOrderNumber;)I
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTPayOrderNumber;

    .prologue
    .line 21
    iget v0, p0, Lcom/heitao/request/HTPayOrderNumber;->mErrorCode:I

    return v0
.end method

.method static synthetic access$002(Lcom/heitao/request/HTPayOrderNumber;I)I
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTPayOrderNumber;
    .param p1, "x1"    # I

    .prologue
    .line 21
    iput p1, p0, Lcom/heitao/request/HTPayOrderNumber;->mErrorCode:I

    return p1
.end method

.method static synthetic access$100(Lcom/heitao/request/HTPayOrderNumber;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTPayOrderNumber;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/heitao/request/HTPayOrderNumber;->mErrorTitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/heitao/request/HTPayOrderNumber;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTPayOrderNumber;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/heitao/request/HTPayOrderNumber;->mErrorTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/heitao/request/HTPayOrderNumber;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTPayOrderNumber;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/heitao/request/HTPayOrderNumber;->mErrorMessage:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lcom/heitao/request/HTPayOrderNumber;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTPayOrderNumber;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/heitao/request/HTPayOrderNumber;->mErrorMessage:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/heitao/request/HTPayOrderNumber;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/HTPayOrderNumber;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/request/HTPayOrderNumber;->doShowTryDialog(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/heitao/request/HTPayOrderNumber;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTPayOrderNumber;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/heitao/request/HTPayOrderNumber;->mParsMap:Ljava/util/Map;

    return-object v0
.end method

.method private doShowTryDialog(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "code"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 140
    invoke-virtual {p0}, Lcom/heitao/request/HTPayOrderNumber;->doCancelProgressDialog()V

    .line 142
    iget-object v0, p0, Lcom/heitao/request/HTPayOrderNumber;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/request/HTPayOrderNumber$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/heitao/request/HTPayOrderNumber$2;-><init>(Lcom/heitao/request/HTPayOrderNumber;ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 179
    return-void
.end method


# virtual methods
.method public doCreatePayOrderNumber(Ljava/util/Map;Lcom/heitao/listener/HTPayOrderListener;)V
    .locals 5
    .param p2, "lisener"    # Lcom/heitao/listener/HTPayOrderListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/listener/HTPayOrderListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 32
    .local p1, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/heitao/request/HTPayOrderNumber;->mParsMap:Ljava/util/Map;

    .line 33
    iput-object p2, p0, Lcom/heitao/request/HTPayOrderNumber;->mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;

    .line 35
    iget-object v3, p0, Lcom/heitao/request/HTPayOrderNumber;->mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;

    if-nez v3, :cond_0

    .line 37
    const-string v3, "\u672a\u8bbe\u7f6e\u751f\u6210\u8ba2\u5355\u53f7\u56de\u8c03\u76d1\u542c"

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 40
    :cond_0
    const-string v3, "\u8ba2\u5355\u53f7\u751f\u6210\u4e2d\u00b7\u00b7\u00b7"

    invoke-virtual {p0, v3}, Lcom/heitao/request/HTPayOrderNumber;->doShowProgressDialog(Ljava/lang/String;)V

    .line 42
    const-string v0, "http://smi.heitao.com/"

    .line 43
    .local v0, "baseUrl":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 45
    const-string v3, "\u8bf7\u5148\u8bbe\u7f6eSDK\u8bf7\u6c42URL"

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 46
    invoke-virtual {p0}, Lcom/heitao/request/HTPayOrderNumber;->doCancelProgressDialog()V

    .line 130
    :goto_0
    return-void

    .line 50
    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 52
    :cond_2
    const-string v3, "\u751f\u6210\u8ba2\u5355\u53f7\u53c2\u6570\u4e3a\u7a7a"

    invoke-static {v3}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 53
    invoke-virtual {p0}, Lcom/heitao/request/HTPayOrderNumber;->doCancelProgressDialog()V

    goto :goto_0

    .line 58
    :cond_3
    invoke-virtual {p0, p1}, Lcom/heitao/request/HTPayOrderNumber;->addPublicParsMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 60
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v4

    iget-object v4, v4, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    iget-object v4, v4, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/order/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v4

    invoke-virtual {v4}, Lcom/heitao/channel/HTChannelDispatcher;->getChannelKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 61
    .local v1, "requestUrl":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {p1, v4}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 62
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u751f\u6210\u8ba2\u5355\u53f7\u5f00\u59cb\u8bf7\u6c42\uff0crequestUrl="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 63
    move-object v2, v1

    .line 66
    .local v2, "requestUrlForLog":Ljava/lang/String;
    new-instance v3, Lcom/heitao/request/HTPayOrderNumber$1;

    invoke-direct {v3, p0, v2}, Lcom/heitao/request/HTPayOrderNumber$1;-><init>(Lcom/heitao/request/HTPayOrderNumber;Ljava/lang/String;)V

    invoke-virtual {p0, v1, v3}, Lcom/heitao/request/HTPayOrderNumber;->get(Ljava/lang/String;Lcom/heitao/listener/HTRequestListener;)V

    goto :goto_0
.end method
