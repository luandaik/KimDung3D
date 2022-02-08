.class public Lorg/cocos2dx/TerransForce/TFNotifitionService$PushThread;
.super Ljava/lang/Object;
.source "TFNotifitionService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/TerransForce/TFNotifitionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PushThread"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/TerransForce/TFNotifitionService;


# direct methods
.method public constructor <init>(Lorg/cocos2dx/TerransForce/TFNotifitionService;)V
    .locals 0

    .prologue
    .line 116
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService$PushThread;->this$0:Lorg/cocos2dx/TerransForce/TFNotifitionService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 118
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TFNotifitionService.PushThread.run()"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lorg/cocos2dx/TerransForce/TFNotifitionService;->mMessageList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 123
    :cond_0
    :goto_0
    const-wide/16 v2, 0x1

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    :goto_1
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService$PushThread;->this$0:Lorg/cocos2dx/TerransForce/TFNotifitionService;

    invoke-virtual {v1}, Lorg/cocos2dx/TerransForce/TFNotifitionService;->checkPushStatue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 130
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFNotifitionService$PushThread;->this$0:Lorg/cocos2dx/TerransForce/TFNotifitionService;

    invoke-virtual {v1}, Lorg/cocos2dx/TerransForce/TFNotifitionService;->showNotification()V

    goto :goto_0

    .line 124
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method
