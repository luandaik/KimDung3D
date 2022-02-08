.class public Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams;
.super Lcom/unionpay/tsmservice/request/RequestParams;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAppAID:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams$1;

    invoke-direct {v0}, Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams$1;-><init>()V

    sput-object v0, Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

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

    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams;->mAppAID:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getAppAID()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams;->mAppAID:[Ljava/lang/String;

    return-object v0
.end method

.method public setAppAID([Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams;->mAppAID:[Ljava/lang/String;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/unionpay/tsmservice/request/RequestParams;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams;->mAppAID:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    return-void
.end method
