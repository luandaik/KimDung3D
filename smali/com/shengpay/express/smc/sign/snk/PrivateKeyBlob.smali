.class public Lcom/shengpay/express/smc/sign/snk/PrivateKeyBlob;
.super Ljava/lang/Object;
.source "PrivateKeyBlob.java"


# instance fields
.field public blobheader:Lcom/shengpay/express/smc/sign/snk/BlobHeader;

.field public coefficient:Ljava/math/BigInteger;

.field public exponent1:Ljava/math/BigInteger;

.field public exponent2:Ljava/math/BigInteger;

.field public modulus:Ljava/math/BigInteger;

.field public prime1:Ljava/math/BigInteger;

.field public prime2:Ljava/math/BigInteger;

.field public privateExponent:Ljava/math/BigInteger;

.field public rsapubkey:Lcom/shengpay/express/smc/sign/snk/RSAPubKey;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/shengpay/express/smc/sign/snk/BlobHeader;

    invoke-direct {v0}, Lcom/shengpay/express/smc/sign/snk/BlobHeader;-><init>()V

    iput-object v0, p0, Lcom/shengpay/express/smc/sign/snk/PrivateKeyBlob;->blobheader:Lcom/shengpay/express/smc/sign/snk/BlobHeader;

    .line 20
    new-instance v0, Lcom/shengpay/express/smc/sign/snk/RSAPubKey;

    invoke-direct {v0}, Lcom/shengpay/express/smc/sign/snk/RSAPubKey;-><init>()V

    iput-object v0, p0, Lcom/shengpay/express/smc/sign/snk/PrivateKeyBlob;->rsapubkey:Lcom/shengpay/express/smc/sign/snk/RSAPubKey;

    .line 17
    return-void
.end method
