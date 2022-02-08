.class public Lcom/shengpay/express/smc/vo/MobileInfo;
.super Ljava/lang/Object;
.source "MobileInfo.java"


# instance fields
.field private brand:Ljava/lang/String;

.field private imei:Ljava/lang/String;

.field private imsi1:Ljava/lang/String;

.field private imsi2:Ljava/lang/String;

.field private model:Ljava/lang/String;

.field private phoneNo1:Ljava/lang/String;

.field private phoneNo2:Ljava/lang/String;

.field private wifiMac:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBrand()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->brand:Ljava/lang/String;

    return-object v0
.end method

.method public getImei()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->imei:Ljava/lang/String;

    return-object v0
.end method

.method public getImsi1()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->imsi1:Ljava/lang/String;

    return-object v0
.end method

.method public getImsi2()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->imsi2:Ljava/lang/String;

    return-object v0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->model:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneNo1()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->phoneNo1:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneNo2()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->phoneNo2:Ljava/lang/String;

    return-object v0
.end method

.method public getWifiMac()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->wifiMac:Ljava/lang/String;

    return-object v0
.end method

.method public setBrand(Ljava/lang/String;)V
    .locals 0
    .param p1, "brand"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->brand:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public setImei(Ljava/lang/String;)V
    .locals 0
    .param p1, "imei"    # Ljava/lang/String;

    .prologue
    .line 17
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->imei:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public setImsi1(Ljava/lang/String;)V
    .locals 0
    .param p1, "imsi1"    # Ljava/lang/String;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->imsi1:Ljava/lang/String;

    .line 24
    return-void
.end method

.method public setImsi2(Ljava/lang/String;)V
    .locals 0
    .param p1, "imsi2"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->imsi2:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public setModel(Ljava/lang/String;)V
    .locals 0
    .param p1, "model"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->model:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public setPhoneNo1(Ljava/lang/String;)V
    .locals 0
    .param p1, "phoneNo1"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->phoneNo1:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public setPhoneNo2(Ljava/lang/String;)V
    .locals 0
    .param p1, "phoneNo2"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->phoneNo2:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public setWifiMac(Ljava/lang/String;)V
    .locals 0
    .param p1, "wifiMac"    # Ljava/lang/String;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/MobileInfo;->wifiMac:Ljava/lang/String;

    .line 48
    return-void
.end method
