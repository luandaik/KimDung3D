.class public Lcom/unionpay/tsmservice/result/GetTransElementsResult;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/unionpay/tsmservice/result/GetTransElementsResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCommonElements:[Lcom/unionpay/tsmservice/data/TransElement;

.field private mCreditElements:[Lcom/unionpay/tsmservice/data/TransElement;

.field private mDebitElements:[Lcom/unionpay/tsmservice/data/TransElement;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/unionpay/tsmservice/result/GetTransElementsResult$1;

    invoke-direct {v0}, Lcom/unionpay/tsmservice/result/GetTransElementsResult$1;-><init>()V

    sput-object v0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class v0, Lcom/unionpay/tsmservice/data/TransElement;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelableArray(Ljava/lang/ClassLoader;)[Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_0

    array-length v1, v0

    const-class v2, [Lcom/unionpay/tsmservice/data/TransElement;

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unionpay/tsmservice/data/TransElement;

    iput-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mDebitElements:[Lcom/unionpay/tsmservice/data/TransElement;

    :cond_0
    const-class v0, Lcom/unionpay/tsmservice/data/TransElement;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelableArray(Ljava/lang/ClassLoader;)[Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_1

    array-length v1, v0

    const-class v2, [Lcom/unionpay/tsmservice/data/TransElement;

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unionpay/tsmservice/data/TransElement;

    iput-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mCreditElements:[Lcom/unionpay/tsmservice/data/TransElement;

    :cond_1
    const-class v0, Lcom/unionpay/tsmservice/data/TransElement;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelableArray(Ljava/lang/ClassLoader;)[Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_2

    array-length v1, v0

    const-class v2, [Lcom/unionpay/tsmservice/data/TransElement;

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unionpay/tsmservice/data/TransElement;

    iput-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mCommonElements:[Lcom/unionpay/tsmservice/data/TransElement;

    :cond_2
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getCommonElements()[Lcom/unionpay/tsmservice/data/TransElement;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mCommonElements:[Lcom/unionpay/tsmservice/data/TransElement;

    return-object v0
.end method

.method public getCreditElements()[Lcom/unionpay/tsmservice/data/TransElement;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mCreditElements:[Lcom/unionpay/tsmservice/data/TransElement;

    return-object v0
.end method

.method public getDebitElements()[Lcom/unionpay/tsmservice/data/TransElement;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mDebitElements:[Lcom/unionpay/tsmservice/data/TransElement;

    return-object v0
.end method

.method public setCommonElements([Lcom/unionpay/tsmservice/data/TransElement;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mCommonElements:[Lcom/unionpay/tsmservice/data/TransElement;

    return-void
.end method

.method public setCreditElements([Lcom/unionpay/tsmservice/data/TransElement;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mCreditElements:[Lcom/unionpay/tsmservice/data/TransElement;

    return-void
.end method

.method public setDebitElements([Lcom/unionpay/tsmservice/data/TransElement;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mDebitElements:[Lcom/unionpay/tsmservice/data/TransElement;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mDebitElements:[Lcom/unionpay/tsmservice/data/TransElement;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelableArray([Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mCreditElements:[Lcom/unionpay/tsmservice/data/TransElement;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelableArray([Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;->mCommonElements:[Lcom/unionpay/tsmservice/data/TransElement;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelableArray([Landroid/os/Parcelable;I)V

    return-void
.end method
