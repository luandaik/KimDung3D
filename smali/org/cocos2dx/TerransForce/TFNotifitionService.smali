.class public Lorg/cocos2dx/TerransForce/TFNotifitionService;
.super Landroid/app/Service;
.source "TFNotifitionService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cocos2dx/TerransForce/TFNotifitionService$PushThread;
    }
.end annotation


# static fields
.field static mMessageList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/cocos2dx/TerransForce/TFNotificationMessage;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field context:Landroid/content/Context;

.field mmessage:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mMessageList:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mmessage:Ljava/lang/String;

    .line 19
    iput-object p0, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService;->context:Landroid/content/Context;

    .line 22
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "TFNotifitionService.TFNotifitionService()"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mmessage:Ljava/lang/String;

    .line 19
    iput-object p0, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService;->context:Landroid/content/Context;

    .line 26
    return-void
.end method


# virtual methods
.method public checkPushStatue()Z
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 73
    .local v0, "currentTime":J
    sget-object v4, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mMessageList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 74
    sget-object v4, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mMessageList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 76
    .local v3, "listSize":I
    const/4 v2, 0x0

    .local v2, "i":I
    if-ge v2, v3, :cond_2

    .line 77
    sget-object v4, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mMessageList:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/cocos2dx/TerransForce/TFNotificationMessage;

    invoke-virtual {v4}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->getMark()J

    move-result-wide v6

    cmp-long v4, v6, v0

    if-gez v4, :cond_0

    .line 78
    sget-object v4, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mMessageList:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/cocos2dx/TerransForce/TFNotificationMessage;

    invoke-virtual {v4}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mmessage:Ljava/lang/String;

    .line 79
    sget-object v4, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mMessageList:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 81
    const/4 v4, 0x1

    .line 90
    .end local v2    # "i":I
    .end local v3    # "listSize":I
    :goto_0
    return v4

    .restart local v2    # "i":I
    .restart local v3    # "listSize":I
    :cond_0
    move v4, v5

    .line 83
    goto :goto_0

    .end local v2    # "i":I
    .end local v3    # "listSize":I
    :cond_1
    move v4, v5

    .line 87
    goto :goto_0

    .restart local v2    # "i":I
    .restart local v3    # "listSize":I
    :cond_2
    move v4, v5

    .line 90
    goto :goto_0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "arg0"    # Landroid/content/Intent;

    .prologue
    .line 31
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .prologue
    .line 36
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCreate()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mMessageList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 37
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 47
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 66
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 67
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I

    .prologue
    .line 51
    if-eqz p1, :cond_0

    .line 56
    const-string v1, "org.cocos2dx.TerransForce.TerransForce.message"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;

    .line 58
    .local v0, "nmObj":Lorg/cocos2dx/TerransForce/TFNotificationMessage;
    invoke-virtual {v0}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->getMessage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mmessage:Ljava/lang/String;

    .line 60
    invoke-virtual {p0}, Lorg/cocos2dx/TerransForce/TFNotifitionService;->showNotification()V

    .line 62
    .end local v0    # "nmObj":Lorg/cocos2dx/TerransForce/TFNotificationMessage;
    :cond_0
    return-void
.end method

.method public showNotification()V
    .locals 10

    .prologue
    const/4 v7, 0x0

    .line 95
    new-instance v2, Landroid/app/Notification;

    const/high16 v5, 0x7f020000

    iget-object v6, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mmessage:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-direct {v2, v5, v6, v8, v9}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 97
    .local v2, "notification":Landroid/app/Notification;
    const/4 v5, 0x1

    iput v5, v2, Landroid/app/Notification;->defaults:I

    .line 98
    iget v5, v2, Landroid/app/Notification;->flags:I

    or-int/lit8 v5, v5, 0x10

    iput v5, v2, Landroid/app/Notification;->flags:I

    .line 100
    new-instance v0, Landroid/content/Intent;

    const-string v5, "android.intent.action.MAIN"

    invoke-direct {v0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 101
    .local v0, "it":Landroid/content/Intent;
    const-string v5, "org.cocos2dx.TerransForce.TerransForce"

    invoke-virtual {v0, p0, v5}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 102
    const-string v5, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 103
    const/high16 v5, 0x10200000

    invoke-virtual {v0, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 106
    invoke-static {p0, v7, v0, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 108
    .local v3, "pintent":Landroid/app/PendingIntent;
    const-string v5, ""

    iget-object v6, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mmessage:Ljava/lang/String;

    invoke-virtual {v2, p0, v5, v6, v3}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 111
    const-string v4, "notification"

    .line 112
    .local v4, "service":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lorg/cocos2dx/TerransForce/TFNotifitionService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 113
    .local v1, "mNotificationManager":Landroid/app/NotificationManager;
    const/high16 v5, 0x7f030000

    invoke-virtual {v1, v5, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 114
    return-void
.end method
