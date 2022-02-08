.class public Lcom/unionpay/tsmservice/data/TransElement;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/unionpay/tsmservice/data/TransElement;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private isMustShow:Z

.field private mHint:Ljava/lang/String;

.field private mLabel:Ljava/lang/String;

.field private mName:Ljava/lang/String;

.field private mType:Ljava/lang/String;

.field private mVerfyRule:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/unionpay/tsmservice/data/TransElement$1;

    invoke-direct {v0}, Lcom/unionpay/tsmservice/data/TransElement$1;-><init>()V

    sput-object v0, Lcom/unionpay/tsmservice/data/TransElement;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->isMustShow:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mLabel:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mName:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mHint:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mVerfyRule:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mType:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->isMustShow:Z

    const-string v1, ""

    iput-object v1, p0, Lcom/unionpay/tsmservice/data/TransElement;->mLabel:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/unionpay/tsmservice/data/TransElement;->mName:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/unionpay/tsmservice/data/TransElement;->mHint:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/unionpay/tsmservice/data/TransElement;->mVerfyRule:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/unionpay/tsmservice/data/TransElement;->mType:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v0, v1, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->isMustShow:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mLabel:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mHint:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mVerfyRule:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mType:Ljava/lang/String;

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getHint()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mHint:Ljava/lang/String;

    return-object v0
.end method

.method public getLabel()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mLabel:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mType:Ljava/lang/String;

    return-object v0
.end method

.method public getVerfyRule()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mVerfyRule:Ljava/lang/String;

    return-object v0
.end method

.method public isMustShow()Z
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->isMustShow:Z

    return v0
.end method

.method public setHint(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/data/TransElement;->mHint:Ljava/lang/String;

    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/data/TransElement;->mLabel:Ljava/lang/String;

    return-void
.end method

.method public setMustShow(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/unionpay/tsmservice/data/TransElement;->isMustShow:Z

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/data/TransElement;->mName:Ljava/lang/String;

    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/data/TransElement;->mType:Ljava/lang/String;

    return-void
.end method

.method public setVerfyRule(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/data/TransElement;->mVerfyRule:Ljava/lang/String;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->isMustShow:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mLabel:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mHint:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mVerfyRule:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/data/TransElement;->mType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
