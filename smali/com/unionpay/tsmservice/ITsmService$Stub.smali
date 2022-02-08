.class public abstract Lcom/unionpay/tsmservice/ITsmService$Stub;
.super Landroid/os/Binder;

# interfaces
.implements Lcom/unionpay/tsmservice/ITsmService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/tsmservice/ITsmService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/tsmservice/ITsmService$Stub$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p0, p0, v0}, Lcom/unionpay/tsmservice/ITsmService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmService;
    .locals 2

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "com.unionpay.tsmservice.ITsmService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/unionpay/tsmservice/ITsmService;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/unionpay/tsmservice/ITsmService;

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/unionpay/tsmservice/ITsmService$Stub$a;

    invoke-direct {v0, p0}, Lcom/unionpay/tsmservice/ITsmService$Stub$a;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    sparse-switch p1, :sswitch_data_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v0

    :goto_0
    return v0

    :sswitch_0
    const-string v0, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    move v0, v1

    goto :goto_0

    :sswitch_1
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_0

    sget-object v0, Lcom/unionpay/tsmservice/request/InitRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/InitRequestParams;

    :cond_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->init(Lcom/unionpay/tsmservice/request/InitRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto :goto_0

    :sswitch_2
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-gez v3, :cond_1

    :goto_1
    invoke-virtual {p0, v2, v0}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getPubKey(I[Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    move v0, v1

    goto :goto_0

    :cond_1
    new-array v0, v3, [Ljava/lang/String;

    goto :goto_1

    :sswitch_3
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-gez v3, :cond_2

    :goto_2
    invoke-virtual {p0, v2, v0}, Lcom/unionpay/tsmservice/ITsmService$Stub;->exchangeKey(Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    move v0, v1

    goto :goto_0

    :cond_2
    new-array v0, v3, [Ljava/lang/String;

    goto :goto_2

    :sswitch_4
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_3

    sget-object v0, Lcom/unionpay/tsmservice/request/EncryptDataRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/EncryptDataRequestParams;

    :cond_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->encryptData(Lcom/unionpay/tsmservice/request/EncryptDataRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_5
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_4

    sget-object v0, Lcom/unionpay/tsmservice/request/GetSeIdRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetSeIdRequestParams;

    :cond_4
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getSEId(Lcom/unionpay/tsmservice/request/GetSeIdRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_6
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_5

    sget-object v0, Lcom/unionpay/tsmservice/request/GetAssociatedAppRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetAssociatedAppRequestParams;

    :cond_5
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getAssociatedApp(Lcom/unionpay/tsmservice/request/GetAssociatedAppRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_7
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_6

    sget-object v0, Lcom/unionpay/tsmservice/request/GetSeAppListRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetSeAppListRequestParams;

    :cond_6
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getSEAppList(Lcom/unionpay/tsmservice/request/GetSeAppListRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_8
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_7

    sget-object v0, Lcom/unionpay/tsmservice/request/GetAppListRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetAppListRequestParams;

    :cond_7
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getAppList(Lcom/unionpay/tsmservice/request/GetAppListRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_9
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_8

    sget-object v0, Lcom/unionpay/tsmservice/request/GetAppStatusRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetAppStatusRequestParams;

    :cond_8
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getAppStatus(Lcom/unionpay/tsmservice/request/GetAppStatusRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_a
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_9

    sget-object v0, Lcom/unionpay/tsmservice/request/GetAppDetailRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetAppDetailRequestParams;

    :cond_9
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getAppDetail(Lcom/unionpay/tsmservice/request/GetAppDetailRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_b
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_a

    sget-object v0, Lcom/unionpay/tsmservice/request/GetTransElementsRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetTransElementsRequestParams;

    :cond_a
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getTransElements(Lcom/unionpay/tsmservice/request/GetTransElementsRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_c
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_b

    sget-object v0, Lcom/unionpay/tsmservice/request/AppDownloadApplyRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/AppDownloadApplyRequestParams;

    :cond_b
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->appDownloadApply(Lcom/unionpay/tsmservice/request/AppDownloadApplyRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_d
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_c

    sget-object v0, Lcom/unionpay/tsmservice/request/AppDownloadRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/AppDownloadRequestParams;

    :cond_c
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/unionpay/tsmservice/ITsmProgressCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmProgressCallback;

    move-result-object v3

    invoke-virtual {p0, v0, v2, v3}, Lcom/unionpay/tsmservice/ITsmService$Stub;->appDownload(Lcom/unionpay/tsmservice/request/AppDownloadRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;Lcom/unionpay/tsmservice/ITsmProgressCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_e
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_d

    sget-object v0, Lcom/unionpay/tsmservice/request/AppDeleteRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/AppDeleteRequestParams;

    :cond_d
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/unionpay/tsmservice/ITsmProgressCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmProgressCallback;

    move-result-object v3

    invoke-virtual {p0, v0, v2, v3}, Lcom/unionpay/tsmservice/ITsmService$Stub;->appDelete(Lcom/unionpay/tsmservice/request/AppDeleteRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;Lcom/unionpay/tsmservice/ITsmProgressCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_f
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_e

    sget-object v0, Lcom/unionpay/tsmservice/request/AppDataUpdateRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/AppDataUpdateRequestParams;

    :cond_e
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/unionpay/tsmservice/ITsmProgressCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmProgressCallback;

    move-result-object v3

    invoke-virtual {p0, v0, v2, v3}, Lcom/unionpay/tsmservice/ITsmService$Stub;->appDataUpdate(Lcom/unionpay/tsmservice/request/AppDataUpdateRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;Lcom/unionpay/tsmservice/ITsmProgressCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_10
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_f

    sget-object v0, Lcom/unionpay/tsmservice/request/AppLockRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/AppLockRequestParams;

    :cond_f
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->appLock(Lcom/unionpay/tsmservice/request/AppLockRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_11
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_10

    sget-object v0, Lcom/unionpay/tsmservice/request/AppUnlockRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/AppUnlockRequestParams;

    :cond_10
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->appUnlock(Lcom/unionpay/tsmservice/request/AppUnlockRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_12
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_11

    sget-object v0, Lcom/unionpay/tsmservice/request/GetSMSAuthCodeRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetSMSAuthCodeRequestParams;

    :cond_11
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getSMSAuthCode(Lcom/unionpay/tsmservice/request/GetSMSAuthCodeRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_13
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_12

    sget-object v0, Lcom/unionpay/tsmservice/request/ECashTopUpRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/ECashTopUpRequestParams;

    :cond_12
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->eCashTopUp(Lcom/unionpay/tsmservice/request/ECashTopUpRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_14
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_13

    sget-object v0, Lcom/unionpay/tsmservice/request/GetTransRecordRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetTransRecordRequestParams;

    :cond_13
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getTransRecord(Lcom/unionpay/tsmservice/request/GetTransRecordRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_15
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_14

    sget-object v0, Lcom/unionpay/tsmservice/request/GetAccountInfoRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetAccountInfoRequestParams;

    :cond_14
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getAccountInfo(Lcom/unionpay/tsmservice/request/GetAccountInfoRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_16
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_15

    sget-object v0, Lcom/unionpay/tsmservice/request/GetAccountBalanceRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetAccountBalanceRequestParams;

    :cond_15
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getAccountBalance(Lcom/unionpay/tsmservice/request/GetAccountBalanceRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_17
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_16

    sget-object v0, Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams;

    :cond_16
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getCardInfo(Lcom/unionpay/tsmservice/request/GetCardInfoRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_18
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_17

    sget-object v0, Lcom/unionpay/tsmservice/request/SetDefaultCardRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/SetDefaultCardRequestParams;

    :cond_17
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->setDefaultCard(Lcom/unionpay/tsmservice/request/SetDefaultCardRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_19
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_18

    sget-object v0, Lcom/unionpay/tsmservice/request/GetDefaultCardRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetDefaultCardRequestParams;

    :cond_18
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getDefaultCard(Lcom/unionpay/tsmservice/request/GetDefaultCardRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_1a
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_19

    sget-object v0, Lcom/unionpay/tsmservice/request/OpenChannelRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/OpenChannelRequestParams;

    :cond_19
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->openChannel(Lcom/unionpay/tsmservice/request/OpenChannelRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_1b
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_1a

    sget-object v0, Lcom/unionpay/tsmservice/request/SendApduRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/SendApduRequestParams;

    :cond_1a
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->sendApdu(Lcom/unionpay/tsmservice/request/SendApduRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_1c
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_1b

    sget-object v0, Lcom/unionpay/tsmservice/request/CloseChannelRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/CloseChannelRequestParams;

    :cond_1b
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->closeChannel(Lcom/unionpay/tsmservice/request/CloseChannelRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_1d
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_1c

    sget-object v0, Lcom/unionpay/tsmservice/request/HideAppApplyRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/HideAppApplyRequestParams;

    :cond_1c
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->hideAppApply(Lcom/unionpay/tsmservice/request/HideAppApplyRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_1e
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_1d

    sget-object v0, Lcom/unionpay/tsmservice/request/ExecuteCmdRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/ExecuteCmdRequestParams;

    :cond_1d
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/unionpay/tsmservice/ITsmProgressCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmProgressCallback;

    move-result-object v3

    invoke-virtual {p0, v0, v2, v3}, Lcom/unionpay/tsmservice/ITsmService$Stub;->executeCmd(Lcom/unionpay/tsmservice/request/ExecuteCmdRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;Lcom/unionpay/tsmservice/ITsmProgressCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_1f
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_1e

    sget-object v0, Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams;

    :cond_1e
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->getCardInfoBySamsungPay(Lcom/unionpay/tsmservice/request/GetCardInfoBySpayRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_20
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_1f

    sget-object v0, Lcom/unionpay/tsmservice/request/CheckSSamsungPayRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/CheckSSamsungPayRequestParams;

    :cond_1f
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->checkSSamsungPay(Lcom/unionpay/tsmservice/request/CheckSSamsungPayRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_21
    const-string v2, "com.unionpay.tsmservice.ITsmService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_20

    sget-object v0, Lcom/unionpay/tsmservice/request/SetSamsungDefWalletRequestParams;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/request/SetSamsungDefWalletRequestParams;

    :cond_20
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmCallback;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->setSamsungDefaultWallet(Lcom/unionpay/tsmservice/request/SetSamsungDefWalletRequestParams;Lcom/unionpay/tsmservice/ITsmCallback;)I

    move-result v0

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    move v0, v1

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0x8 -> :sswitch_8
        0x9 -> :sswitch_9
        0xa -> :sswitch_a
        0xb -> :sswitch_b
        0xc -> :sswitch_c
        0xd -> :sswitch_d
        0xe -> :sswitch_e
        0xf -> :sswitch_f
        0x10 -> :sswitch_10
        0x11 -> :sswitch_11
        0x12 -> :sswitch_12
        0x13 -> :sswitch_13
        0x14 -> :sswitch_14
        0x15 -> :sswitch_15
        0x16 -> :sswitch_16
        0x17 -> :sswitch_17
        0x18 -> :sswitch_18
        0x19 -> :sswitch_19
        0x1a -> :sswitch_1a
        0x1b -> :sswitch_1b
        0x1c -> :sswitch_1c
        0x1d -> :sswitch_1d
        0x1e -> :sswitch_1e
        0x1f -> :sswitch_1f
        0x20 -> :sswitch_20
        0x21 -> :sswitch_21
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
