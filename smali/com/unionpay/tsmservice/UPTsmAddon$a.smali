.class final Lcom/unionpay/tsmservice/UPTsmAddon$a;
.super Lcom/unionpay/tsmservice/ITsmCallback$Stub;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/tsmservice/UPTsmAddon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/unionpay/tsmservice/UPTsmAddon;

.field private b:I

.field private c:I


# direct methods
.method private constructor <init>(Lcom/unionpay/tsmservice/UPTsmAddon;II)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-direct {p0}, Lcom/unionpay/tsmservice/ITsmCallback$Stub;-><init>()V

    iput p2, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->b:I

    iput p3, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->c:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/unionpay/tsmservice/UPTsmAddon;IIB)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/unionpay/tsmservice/UPTsmAddon$a;-><init>(Lcom/unionpay/tsmservice/UPTsmAddon;II)V

    return-void
.end method


# virtual methods
.method public final onError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v0, "errorCode"

    invoke-virtual {v1, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "errorDesc"

    invoke-virtual {v1, v0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    iget v2, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->b:I

    invoke-static {v0, v2}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;I)Ljava/util/HashMap;

    move-result-object v0

    iget v2, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->c:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/ITsmCallback;

    invoke-static {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/ITsmCallback;Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    iget v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->b:I

    invoke-static {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;I)Ljava/util/HashMap;

    move-result-object v0

    iget v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->c:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    iget v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->b:I

    invoke-static {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;I)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-static {v0}, Lcom/unionpay/tsmservice/UPTsmAddon;->b(Lcom/unionpay/tsmservice/UPTsmAddon;)[I

    move-result-object v0

    iget v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->b:I

    const/4 v2, 0x0

    aput v2, v0, v1

    :cond_0
    return-void
.end method

.method public final onResult(Landroid/os/Bundle;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v6, 0x0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->b:I

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    const-string v3, "errorCode"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "result"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "errorCode"

    invoke-virtual {v1, v5, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-static {v4}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v3

    if-eqz v3, :cond_0

    array-length v4, v3

    if-eqz v4, :cond_0

    array-length v4, v3

    invoke-virtual {v2, v3, v6, v4}, Landroid/os/Parcel;->unmarshall([BII)V

    invoke-virtual {v2, v6}, Landroid/os/Parcel;->setDataPosition(I)V

    :cond_0
    invoke-virtual {v2}, Landroid/os/Parcel;->dataSize()I

    move-result v3

    if-nez v3, :cond_2

    const-string v0, "errorCode"

    const-string v3, "010035"

    invoke-virtual {v1, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    move-object p1, v1

    :goto_0
    :pswitch_0
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    iget v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->b:I

    invoke-static {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;I)Ljava/util/HashMap;

    move-result-object v0

    iget v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->c:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/ITsmCallback;

    invoke-static {v0, p1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/ITsmCallback;Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    iget v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->b:I

    invoke-static {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;I)Ljava/util/HashMap;

    move-result-object v0

    iget v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->c:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    iget v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->b:I

    invoke-static {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;I)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-static {v0}, Lcom/unionpay/tsmservice/UPTsmAddon;->b(Lcom/unionpay/tsmservice/UPTsmAddon;)[I

    move-result-object v0

    iget v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$a;->b:I

    aput v6, v0, v1

    :cond_1
    return-void

    :cond_2
    packed-switch v0, :pswitch_data_0

    :pswitch_1
    goto :goto_0

    :pswitch_2
    const-class v0, Lcom/unionpay/tsmservice/result/InitResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/InitResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto :goto_0

    :pswitch_3
    const-class v0, Lcom/unionpay/tsmservice/result/GetAssociatedAppResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetAssociatedAppResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto :goto_0

    :pswitch_4
    const-class v0, Lcom/unionpay/tsmservice/result/GetSeAppListResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetSeAppListResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_5
    const-class v0, Lcom/unionpay/tsmservice/result/GetAppListResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetAppListResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_6
    const-class v0, Lcom/unionpay/tsmservice/result/GetAppDetailResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetAppDetailResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_7
    const-class v0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetTransElementsResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_8
    const-class v0, Lcom/unionpay/tsmservice/result/AppDownloadApplyResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/AppDownloadApplyResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_9
    const-class v0, Lcom/unionpay/tsmservice/result/GetSMSAuthCodeResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetSMSAuthCodeResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_a
    const-class v0, Lcom/unionpay/tsmservice/result/GetAccountInfoResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetAccountInfoResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_b
    const-class v0, Lcom/unionpay/tsmservice/result/GetAccountBalanceResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetAccountBalanceResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_c
    const-class v0, Lcom/unionpay/tsmservice/result/GetCardInfoResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetCardInfoResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_d
    const-class v0, Lcom/unionpay/tsmservice/result/GetDefaultCardResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetDefaultCardResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_e
    const-class v0, Lcom/unionpay/tsmservice/result/GetSeIdResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetSeIdResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_f
    const-class v0, Lcom/unionpay/tsmservice/result/GetTransRecordResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetTransRecordResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_10
    const-class v0, Lcom/unionpay/tsmservice/result/ECashTopUpResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/ECashTopUpResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_11
    const-class v0, Lcom/unionpay/tsmservice/result/EncryptDataResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/EncryptDataResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_12
    const-class v0, Lcom/unionpay/tsmservice/result/OpenChannelResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/OpenChannelResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_13
    const-class v0, Lcom/unionpay/tsmservice/result/SendApduResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/SendApduResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_14
    const-class v0, Lcom/unionpay/tsmservice/result/GetCardInfoBySpayResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/GetCardInfoBySpayResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_15
    const-class v0, Lcom/unionpay/tsmservice/result/CheckSSamsungPayResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/unionpay/tsmservice/result/CheckSSamsungPayResult;

    const-string v3, "result"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    move-object p1, v1

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_0
        :pswitch_c
        :pswitch_a
        :pswitch_b
        :pswitch_7
        :pswitch_f
        :pswitch_9
        :pswitch_e
        :pswitch_d
        :pswitch_1
        :pswitch_8
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_10
        :pswitch_12
        :pswitch_1
        :pswitch_13
        :pswitch_11
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_14
        :pswitch_15
    .end packed-switch
.end method
