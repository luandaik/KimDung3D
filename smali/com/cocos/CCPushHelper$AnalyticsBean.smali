.class Lcom/cocos/CCPushHelper$AnalyticsBean;
.super Ljava/lang/Object;
.source "CCPushHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cocos/CCPushHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AnalyticsBean"
.end annotation


# instance fields
.field private eventId:Ljava/lang/String;

.field private params:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0
    .param p1, "eventId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 193
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 194
    iput-object p1, p0, Lcom/cocos/CCPushHelper$AnalyticsBean;->eventId:Ljava/lang/String;

    .line 195
    iput-object p2, p0, Lcom/cocos/CCPushHelper$AnalyticsBean;->params:Ljava/util/HashMap;

    .line 196
    return-void
.end method


# virtual methods
.method public getEventId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/cocos/CCPushHelper$AnalyticsBean;->eventId:Ljava/lang/String;

    return-object v0
.end method

.method public getParams()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 207
    iget-object v0, p0, Lcom/cocos/CCPushHelper$AnalyticsBean;->params:Ljava/util/HashMap;

    return-object v0
.end method

.method public setEventId(Ljava/lang/String;)V
    .locals 0
    .param p1, "eventId"    # Ljava/lang/String;

    .prologue
    .line 203
    iput-object p1, p0, Lcom/cocos/CCPushHelper$AnalyticsBean;->eventId:Ljava/lang/String;

    .line 204
    return-void
.end method

.method public setParams(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 211
    .local p1, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/cocos/CCPushHelper$AnalyticsBean;->params:Ljava/util/HashMap;

    .line 212
    return-void
.end method
