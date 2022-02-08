.class public Lcom/heitao/notification/HTNotification;
.super Ljava/lang/Object;
.source "HTNotification.java"


# instance fields
.field public key:Ljava/lang/String;

.field public listener:Lcom/heitao/listener/HTNotificationListener;

.field public userObject:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Lcom/heitao/listener/HTNotificationListener;)V
    .locals 1
    .param p1, "_key"    # Ljava/lang/String;
    .param p2, "_userObject"    # Ljava/lang/Object;
    .param p3, "_listener"    # Lcom/heitao/listener/HTNotificationListener;

    .prologue
    const/4 v0, 0x0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput-object v0, p0, Lcom/heitao/notification/HTNotification;->key:Ljava/lang/String;

    .line 8
    iput-object v0, p0, Lcom/heitao/notification/HTNotification;->userObject:Ljava/lang/Object;

    .line 9
    iput-object v0, p0, Lcom/heitao/notification/HTNotification;->listener:Lcom/heitao/listener/HTNotificationListener;

    .line 13
    iput-object p1, p0, Lcom/heitao/notification/HTNotification;->key:Ljava/lang/String;

    .line 14
    iput-object p2, p0, Lcom/heitao/notification/HTNotification;->userObject:Ljava/lang/Object;

    .line 15
    iput-object p3, p0, Lcom/heitao/notification/HTNotification;->listener:Lcom/heitao/listener/HTNotificationListener;

    .line 16
    return-void
.end method
