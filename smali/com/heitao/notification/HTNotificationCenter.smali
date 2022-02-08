.class public Lcom/heitao/notification/HTNotificationCenter;
.super Ljava/lang/Object;
.source "HTNotificationCenter.java"


# static fields
.field private static mInstance:Lcom/heitao/notification/HTNotificationCenter;


# instance fields
.field private mNotifications:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/heitao/notification/HTNotification;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/notification/HTNotificationCenter;->mInstance:Lcom/heitao/notification/HTNotificationCenter;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/heitao/notification/HTNotificationCenter;->mNotifications:Ljava/util/List;

    return-void
.end method

.method public static getInstance()Lcom/heitao/notification/HTNotificationCenter;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/heitao/notification/HTNotificationCenter;->mInstance:Lcom/heitao/notification/HTNotificationCenter;

    if-nez v0, :cond_0

    .line 17
    new-instance v0, Lcom/heitao/notification/HTNotificationCenter;

    invoke-direct {v0}, Lcom/heitao/notification/HTNotificationCenter;-><init>()V

    sput-object v0, Lcom/heitao/notification/HTNotificationCenter;->mInstance:Lcom/heitao/notification/HTNotificationCenter;

    .line 20
    :cond_0
    sget-object v0, Lcom/heitao/notification/HTNotificationCenter;->mInstance:Lcom/heitao/notification/HTNotificationCenter;

    return-object v0
.end method

.method private notificationForKey(Ljava/lang/String;)Lcom/heitao/notification/HTNotification;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 88
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 90
    iget-object v2, p0, Lcom/heitao/notification/HTNotificationCenter;->mNotifications:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/heitao/notification/HTNotification;

    .line 92
    .local v1, "item":Lcom/heitao/notification/HTNotification;
    iget-object v2, v1, Lcom/heitao/notification/HTNotification;->key:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "item":Lcom/heitao/notification/HTNotification;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public isRegisteredNotificationForKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lcom/heitao/notification/HTNotificationCenter;->notificationForKey(Ljava/lang/String;)Lcom/heitao/notification/HTNotification;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public postNotification(Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/heitao/notification/HTNotificationCenter;->postNotification(Ljava/lang/String;Ljava/lang/Object;)V

    .line 84
    return-void
.end method

.method public postNotification(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lcom/heitao/notification/HTNotificationCenter;->notificationForKey(Ljava/lang/String;)Lcom/heitao/notification/HTNotification;

    move-result-object v0

    .line 70
    .local v0, "notification":Lcom/heitao/notification/HTNotification;
    if-eqz v0, :cond_0

    .line 72
    iput-object p2, v0, Lcom/heitao/notification/HTNotification;->userObject:Ljava/lang/Object;

    .line 73
    iget-object v1, v0, Lcom/heitao/notification/HTNotification;->listener:Lcom/heitao/listener/HTNotificationListener;

    invoke-interface {v1, v0}, Lcom/heitao/listener/HTNotificationListener;->onHTNotificationReceived(Lcom/heitao/notification/HTNotification;)V

    .line 75
    :cond_0
    return-void
.end method

.method public register(Ljava/lang/String;Lcom/heitao/listener/HTNotificationListener;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/heitao/listener/HTNotificationListener;

    .prologue
    .line 30
    new-instance v0, Lcom/heitao/notification/HTNotification;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, p2}, Lcom/heitao/notification/HTNotification;-><init>(Ljava/lang/String;Ljava/lang/Object;Lcom/heitao/listener/HTNotificationListener;)V

    .line 31
    .local v0, "notification":Lcom/heitao/notification/HTNotification;
    invoke-virtual {p0, p1}, Lcom/heitao/notification/HTNotificationCenter;->remove(Ljava/lang/String;)V

    .line 32
    iget-object v1, p0, Lcom/heitao/notification/HTNotificationCenter;->mNotifications:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 41
    iget-object v2, p0, Lcom/heitao/notification/HTNotificationCenter;->mNotifications:Ljava/util/List;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/heitao/notification/HTNotificationCenter;->mNotifications:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 43
    iget-object v2, p0, Lcom/heitao/notification/HTNotificationCenter;->mNotifications:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/heitao/notification/HTNotification;

    .line 45
    .local v1, "item":Lcom/heitao/notification/HTNotification;
    iget-object v2, v1, Lcom/heitao/notification/HTNotification;->key:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    iget-object v2, p0, Lcom/heitao/notification/HTNotificationCenter;->mNotifications:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 52
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "item":Lcom/heitao/notification/HTNotification;
    :cond_1
    return-void
.end method

.method public removeAll()V
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/heitao/notification/HTNotificationCenter;->mNotifications:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 60
    return-void
.end method
