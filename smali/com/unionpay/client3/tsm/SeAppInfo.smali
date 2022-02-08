.class public Lcom/unionpay/client3/tsm/SeAppInfo;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/unionpay/client3/tsm/SeAppInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAppAid:Ljava/lang/String;

.field private mAppIcon:Ljava/lang/String;

.field private mAppName:Ljava/lang/String;

.field private mAppProviderLogo:Ljava/lang/String;

.field private mAppProviderName:Ljava/lang/String;

.field private mAppSummary:Ljava/lang/String;

.field private mAppVersion:Ljava/lang/String;

.field private mBalance:Ljava/lang/String;

.field private mBankId:Ljava/lang/String;

.field private mCVN2:Ljava/lang/String;

.field private mDownloadTimes:I

.field private mPan:Ljava/lang/String;

.field private mValidDate:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/unionpay/client3/tsm/SeAppInfo$1;

    invoke-direct {v0}, Lcom/unionpay/client3/tsm/SeAppInfo$1;-><init>()V

    sput-object v0, Lcom/unionpay/client3/tsm/SeAppInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Lcom/unionpay/client3/tsm/SeAppInfo;->readFromParcel(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getAppAid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppAid:Ljava/lang/String;

    return-object v0
.end method

.method public getAppIcon()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppIcon:Ljava/lang/String;

    return-object v0
.end method

.method public getAppName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppName:Ljava/lang/String;

    return-object v0
.end method

.method public getAppProviderLogo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppProviderLogo:Ljava/lang/String;

    return-object v0
.end method

.method public getAppProviderName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppProviderName:Ljava/lang/String;

    return-object v0
.end method

.method public getAppSummary()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppSummary:Ljava/lang/String;

    return-object v0
.end method

.method public getAppVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getBalance()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mBalance:Ljava/lang/String;

    return-object v0
.end method

.method public getBankId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mBankId:Ljava/lang/String;

    return-object v0
.end method

.method public getCVN2()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mCVN2:Ljava/lang/String;

    return-object v0
.end method

.method public getDownloadTimes()I
    .locals 1

    iget v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mDownloadTimes:I

    return v0
.end method

.method public getPan()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mPan:Ljava/lang/String;

    return-object v0
.end method

.method public getValidDate()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mValidDate:Ljava/lang/String;

    return-object v0
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .locals 1

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppAid:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppIcon:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mBankId:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppProviderName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppProviderLogo:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppSummary:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppVersion:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mDownloadTimes:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mPan:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mValidDate:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mBalance:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mCVN2:Ljava/lang/String;

    return-void
.end method

.method public setAppAid(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppAid:Ljava/lang/String;

    return-void
.end method

.method public setAppIcon(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppIcon:Ljava/lang/String;

    return-void
.end method

.method public setAppName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppName:Ljava/lang/String;

    return-void
.end method

.method public setAppProviderLogo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppProviderLogo:Ljava/lang/String;

    return-void
.end method

.method public setAppProviderName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppProviderName:Ljava/lang/String;

    return-void
.end method

.method public setAppSummary(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppSummary:Ljava/lang/String;

    return-void
.end method

.method public setAppVersion(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppVersion:Ljava/lang/String;

    return-void
.end method

.method public setBalance(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mBalance:Ljava/lang/String;

    return-void
.end method

.method public setBankId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mBankId:Ljava/lang/String;

    return-void
.end method

.method public setCVN2(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mCVN2:Ljava/lang/String;

    return-void
.end method

.method public setDownloadTimes(I)V
    .locals 0

    iput p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mDownloadTimes:I

    return-void
.end method

.method public setPan(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mPan:Ljava/lang/String;

    return-void
.end method

.method public setValidDate(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mValidDate:Ljava/lang/String;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppAid:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppIcon:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mBankId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppProviderName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppProviderLogo:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppSummary:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mAppVersion:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mDownloadTimes:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mPan:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mValidDate:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mBalance:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/client3/tsm/SeAppInfo;->mCVN2:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
