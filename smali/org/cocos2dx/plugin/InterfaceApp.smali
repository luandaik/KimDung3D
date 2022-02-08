.class public interface abstract Lorg/cocos2dx/plugin/InterfaceApp;
.super Ljava/lang/Object;
.source "InterfaceApp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cocos2dx/plugin/InterfaceApp$ExitListener;
    }
.end annotation


# virtual methods
.method public abstract onDestroy(Landroid/content/Context;)V
.end method

.method public abstract onExit(Landroid/content/Context;Lorg/cocos2dx/plugin/InterfaceApp$ExitListener;)V
.end method

.method public abstract onPause(Landroid/content/Context;)V
.end method

.method public abstract onResume(Landroid/content/Context;)V
.end method
