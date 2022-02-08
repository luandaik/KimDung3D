.class Lcom/shengpay/express/smc/http/SmkSSLSocketFactory$1;
.super Ljava/lang/Object;
.source "SmkSSLSocketFactory.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/shengpay/express/smc/http/SmkSSLSocketFactory;-><init>(Ljava/security/KeyStore;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/shengpay/express/smc/http/SmkSSLSocketFactory;


# direct methods
.method constructor <init>(Lcom/shengpay/express/smc/http/SmkSSLSocketFactory;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/shengpay/express/smc/http/SmkSSLSocketFactory$1;->this$0:Lcom/shengpay/express/smc/http/SmkSSLSocketFactory;

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 29
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "chain"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 32
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 35
    const/4 v0, 0x0

    return-object v0
.end method
