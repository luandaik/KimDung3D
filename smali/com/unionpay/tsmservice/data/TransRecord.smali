.class public Lcom/unionpay/tsmservice/data/TransRecord;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/unionpay/tsmservice/data/TransRecord;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mMerchantName:Ljava/lang/String;

.field private mTransAmount:Ljava/lang/String;

.field private mTransTime:Ljava/lang/String;

.field private mTransType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/unionpay/tsmservice/data/TransRecord$1;

    invoke-direct {v0}, Lcom/unionpay/tsmservice/data/TransRecord$1;-><init>()V

    sput-object v0, Lcom/unionpay/tsmservice/data/TransRecord;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransTime:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mMerchantName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransType:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransAmount:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getMerchantName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mMerchantName:Ljava/lang/String;

    return-object v0
.end method

.method public getTransAmount()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransAmount:Ljava/lang/String;

    return-object v0
.end method

.method public getTransTime()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransTime:Ljava/lang/String;

    return-object v0
.end method

.method public getTransType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransType:Ljava/lang/String;

    return-object v0
.end method

.method public setMerchantName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mMerchantName:Ljava/lang/String;

    return-void
.end method

.method public setTransAmount(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransAmount:Ljava/lang/String;

    return-void
.end method

.method public setTransTime(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransTime:Ljava/lang/String;

    return-void
.end method

.method public setTransType(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransType:Ljava/lang/String;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransTime:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mMerchantName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransRecord;->mTransAmount:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
