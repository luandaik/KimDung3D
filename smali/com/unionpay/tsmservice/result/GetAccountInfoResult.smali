.class public Lcom/unionpay/tsmservice/result/GetAccountInfoResult;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/unionpay/tsmservice/result/GetAccountInfoResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAssociatedCardInfo:Lcom/unionpay/tsmservice/data/AssociatedCardInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/unionpay/tsmservice/result/GetAccountInfoResult$1;

    invoke-direct {v0}, Lcom/unionpay/tsmservice/result/GetAccountInfoResult$1;-><init>()V

    sput-object v0, Lcom/unionpay/tsmservice/result/GetAccountInfoResult;->CREATOR:Landroid/os/Parcelable$Creator;

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

    const-class v0, Lcom/unionpay/tsmservice/data/AssociatedCardInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/data/AssociatedCardInfo;

    iput-object v0, p0, Lcom/unionpay/tsmservice/result/GetAccountInfoResult;->mAssociatedCardInfo:Lcom/unionpay/tsmservice/data/AssociatedCardInfo;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getAssociatedCardInfo()Lcom/unionpay/tsmservice/data/AssociatedCardInfo;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetAccountInfoResult;->mAssociatedCardInfo:Lcom/unionpay/tsmservice/data/AssociatedCardInfo;

    return-object v0
.end method

.method public setAssociatedCardInfo(Lcom/unionpay/tsmservice/data/AssociatedCardInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/result/GetAccountInfoResult;->mAssociatedCardInfo:Lcom/unionpay/tsmservice/data/AssociatedCardInfo;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/result/GetAccountInfoResult;->mAssociatedCardInfo:Lcom/unionpay/tsmservice/data/AssociatedCardInfo;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
