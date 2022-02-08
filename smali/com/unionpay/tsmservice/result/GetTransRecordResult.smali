.class public Lcom/unionpay/tsmservice/result/GetTransRecordResult;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/unionpay/tsmservice/result/GetTransRecordResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mTransRecord:[Lcom/unionpay/tsmservice/data/TransRecord;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/unionpay/tsmservice/result/GetTransRecordResult$1;

    invoke-direct {v0}, Lcom/unionpay/tsmservice/result/GetTransRecordResult$1;-><init>()V

    sput-object v0, Lcom/unionpay/tsmservice/result/GetTransRecordResult;->CREATOR:Landroid/os/Parcelable$Creator;

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

    const-class v0, Lcom/unionpay/tsmservice/data/TransRecord;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelableArray(Ljava/lang/ClassLoader;)[Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_0

    array-length v1, v0

    const-class v2, [Lcom/unionpay/tsmservice/data/TransRecord;

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unionpay/tsmservice/data/TransRecord;

    iput-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransRecordResult;->mTransRecord:[Lcom/unionpay/tsmservice/data/TransRecord;

    :cond_0
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getTransRecord()[Lcom/unionpay/tsmservice/data/TransRecord;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransRecordResult;->mTransRecord:[Lcom/unionpay/tsmservice/data/TransRecord;

    return-object v0
.end method

.method public setTransRecord([Lcom/unionpay/tsmservice/data/TransRecord;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/result/GetTransRecordResult;->mTransRecord:[Lcom/unionpay/tsmservice/data/TransRecord;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetTransRecordResult;->mTransRecord:[Lcom/unionpay/tsmservice/data/TransRecord;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelableArray([Landroid/os/Parcelable;I)V

    return-void
.end method
