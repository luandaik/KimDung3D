.class final Lcom/unionpay/mobile/android/pboctransaction/a;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;",
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
.method public final synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2

    new-instance v0, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;-><init>(B)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;->a(Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;->b(Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;Ljava/lang/String;)Ljava/lang/String;

    return-object v0
.end method

.method public final bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    new-array v0, p1, [Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;

    return-object v0
.end method
