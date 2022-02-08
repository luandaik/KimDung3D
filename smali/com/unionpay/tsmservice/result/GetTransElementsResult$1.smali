.class final Lcom/unionpay/tsmservice/result/GetTransElementsResult$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/unionpay/tsmservice/result/GetTransElementsResult;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Lcom/unionpay/tsmservice/result/GetTransElementsResult;
    .locals 1

    new-instance v0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;

    invoke-direct {v0, p1}, Lcom/unionpay/tsmservice/result/GetTransElementsResult;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public final bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/unionpay/tsmservice/result/GetTransElementsResult$1;->createFromParcel(Landroid/os/Parcel;)Lcom/unionpay/tsmservice/result/GetTransElementsResult;

    move-result-object v0

    return-object v0
.end method

.method public final newArray(I)[Lcom/unionpay/tsmservice/result/GetTransElementsResult;
    .locals 1

    new-array v0, p1, [Lcom/unionpay/tsmservice/result/GetTransElementsResult;

    return-object v0
.end method

.method public final bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/unionpay/tsmservice/result/GetTransElementsResult$1;->newArray(I)[Lcom/unionpay/tsmservice/result/GetTransElementsResult;

    move-result-object v0

    return-object v0
.end method
