.class public Lorg/cocos2dx/TerransForce/TFBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "TFBroadcastReceiver.java"


# static fields
.field public static final SER_KEY:Ljava/lang/String; = "org.cocos2dx.TerransForce.TerransForce.message"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 14
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 15
    .local v1, "it":Landroid/content/Intent;
    const-class v3, Lorg/cocos2dx/TerransForce/TFNotifitionService;

    invoke-virtual {v1, p1, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 17
    const-string v3, "org.cocos2dx.TerransForce.TerransForce.message"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Lorg/cocos2dx/TerransForce/TFNotificationMessage;

    .line 18
    .local v2, "message":Lorg/cocos2dx/TerransForce/TFNotificationMessage;
    const-string v3, "MyService"

    invoke-virtual {v2}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 21
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "org.cocos2dx.TerransForce.TerransForce.message"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 22
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 24
    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 25
    return-void
.end method
