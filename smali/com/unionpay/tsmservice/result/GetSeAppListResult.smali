.class public Lcom/unionpay/tsmservice/result/GetSeAppListResult;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/unionpay/tsmservice/result/GetSeAppListResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mSeAppList:[Lcom/unionpay/tsmservice/data/SeAppListItem;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/unionpay/tsmservice/result/GetSeAppListResult$1;

    invoke-direct {v0}, Lcom/unionpay/tsmservice/result/GetSeAppListResult$1;-><init>()V

    sput-object v0, Lcom/unionpay/tsmservice/result/GetSeAppListResult;->CREATOR:Landroid/os/Parcelable$Creator;

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

    sget-object v0, Lcom/unionpay/tsmservice/data/SeAppListItem;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArray(Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unionpay/tsmservice/data/SeAppListItem;

    iput-object v0, p0, Lcom/unionpay/tsmservice/result/GetSeAppListResult;->mSeAppList:[Lcom/unionpay/tsmservice/data/SeAppListItem;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getSeAppList()[Lcom/unionpay/tsmservice/data/SeAppListItem;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetSeAppListResult;->mSeAppList:[Lcom/unionpay/tsmservice/data/SeAppListItem;

    return-object v0
.end method

.method public setSeAppList([Lcom/unionpay/tsmservice/data/SeAppListItem;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/result/GetSeAppListResult;->mSeAppList:[Lcom/unionpay/tsmservice/data/SeAppListItem;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetSeAppListResult;->mSeAppList:[Lcom/unionpay/tsmservice/data/SeAppListItem;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeTypedArray([Landroid/os/Parcelable;I)V

    return-void
.end method
