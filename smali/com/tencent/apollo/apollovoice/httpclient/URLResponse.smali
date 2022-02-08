.class public Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;
.super Ljava/lang/Object;
.source "URLResponse.java"


# instance fields
.field public URL:Ljava/lang/String;

.field public body:[B

.field public headers:Ljava/util/Map;
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

.field public status:I

.field public statusMsg:Ljava/lang/String;

.field public version:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v0, ""

    iput-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->statusMsg:Ljava/lang/String;

    .line 17
    const-string v0, ""

    iput-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->URL:Ljava/lang/String;

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->version:Ljava/lang/String;

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tencent/apollo/apollovoice/httpclient/URLResponse;->headers:Ljava/util/Map;

    .line 20
    return-void
.end method
