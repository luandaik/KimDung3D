.class public Lcom/shengpay/express/smc/sign/snk/PublicKeyBlob;
.super Ljava/lang/Object;
.source "PublicKeyBlob.java"


# instance fields
.field public blobLength:I

.field public blobheader:Lcom/shengpay/express/smc/sign/snk/BlobHeader;

.field public hashAlg:I

.field public modulus:Ljava/math/BigInteger;

.field public rsapubkey:Lcom/shengpay/express/smc/sign/snk/RSAPubKey;

.field public signatureAlg:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/shengpay/express/smc/sign/snk/BlobHeader;

    invoke-direct {v0}, Lcom/shengpay/express/smc/sign/snk/BlobHeader;-><init>()V

    iput-object v0, p0, Lcom/shengpay/express/smc/sign/snk/PublicKeyBlob;->blobheader:Lcom/shengpay/express/smc/sign/snk/BlobHeader;

    .line 20
    new-instance v0, Lcom/shengpay/express/smc/sign/snk/RSAPubKey;

    invoke-direct {v0}, Lcom/shengpay/express/smc/sign/snk/RSAPubKey;-><init>()V

    iput-object v0, p0, Lcom/shengpay/express/smc/sign/snk/PublicKeyBlob;->rsapubkey:Lcom/shengpay/express/smc/sign/snk/RSAPubKey;

    .line 22
    const/16 v0, 0x2400

    iput v0, p0, Lcom/shengpay/express/smc/sign/snk/PublicKeyBlob;->signatureAlg:I

    .line 23
    const v0, 0x8004

    iput v0, p0, Lcom/shengpay/express/smc/sign/snk/PublicKeyBlob;->hashAlg:I

    .line 24
    const/16 v0, 0x94

    iput v0, p0, Lcom/shengpay/express/smc/sign/snk/PublicKeyBlob;->blobLength:I

    .line 17
    return-void
.end method
