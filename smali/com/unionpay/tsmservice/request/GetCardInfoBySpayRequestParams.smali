.class public Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams;
.super Lcom/unionpay/tsmservice/request/RequestParams;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAmount:Lcom/unionpay/tsmservice/data/Amount;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams$1;

    invoke-direct {v0}, Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams$1;-><init>()V

    sput-object v0, Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/unionpay/tsmservice/request/RequestParams;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/unionpay/tsmservice/request/RequestParams;-><init>(Landroid/os/Parcel;)V

    const-class v0, Lcom/unionpay/tsmservice/data/Amount;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/data/Amount;

    iput-object v0, p0, Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams;->mAmount:Lcom/unionpay/tsmservice/data/Amount;

    return-void
.end method


# virtual methods
.method public getAmount()Lcom/unionpay/tsmservice/data/Amount;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams;->mAmount:Lcom/unionpay/tsmservice/data/Amount;

    return-object v0
.end method

.method public setAmount(Lcom/unionpay/tsmservice/data/Amount;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams;->mAmount:Lcom/unionpay/tsmservice/data/Amount;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/unionpay/tsmservice/request/RequestParams;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams;->mAmount:Lcom/unionpay/tsmservice/data/Amount;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
