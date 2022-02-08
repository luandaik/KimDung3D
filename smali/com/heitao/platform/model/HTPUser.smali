.class public Lcom/heitao/platform/model/HTPUser;
.super Ljava/lang/Object;
.source "HTPUser.java"


# instance fields
.field public ltime:Ljava/lang/String;

.field public ltoken:Ljava/lang/String;

.field public mobile:Ljava/lang/String;

.field public time:Ljava/lang/String;

.field public token:Ljava/lang/String;

.field public userId:Ljava/lang/String;

.field public userName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLtime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/heitao/platform/model/HTPUser;->ltime:Ljava/lang/String;

    return-object v0
.end method

.method public getLtoken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/heitao/platform/model/HTPUser;->ltoken:Ljava/lang/String;

    return-object v0
.end method

.method public getMobile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    return-object v0
.end method

.method public getTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/heitao/platform/model/HTPUser;->time:Ljava/lang/String;

    return-object v0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/heitao/platform/model/HTPUser;->token:Ljava/lang/String;

    return-object v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public setLtime(Ljava/lang/String;)V
    .locals 0
    .param p1, "ltime"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/heitao/platform/model/HTPUser;->ltime:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public setLtoken(Ljava/lang/String;)V
    .locals 0
    .param p1, "ltoken"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/heitao/platform/model/HTPUser;->ltoken:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public setMobile(Ljava/lang/String;)V
    .locals 0
    .param p1, "mobile"    # Ljava/lang/String;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public setTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/heitao/platform/model/HTPUser;->time:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/heitao/platform/model/HTPUser;->token:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 0
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "userId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&userName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&time="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/model/HTPUser;->time:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&token="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/model/HTPUser;->token:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&ltime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/model/HTPUser;->ltime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&ltoken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/model/HTPUser;->ltoken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
