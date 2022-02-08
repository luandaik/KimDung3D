.class public interface abstract Lorg/cocos2dx/plugin/InterfaceSocial;
.super Ljava/lang/Object;
.source "InterfaceSocial.java"


# static fields
.field public static final PluginType:I = 0x6


# virtual methods
.method public abstract configDeveloperInfo(Ljava/util/Hashtable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract getPluginVersion()Ljava/lang/String;
.end method

.method public abstract getSDKVersion()Ljava/lang/String;
.end method

.method public abstract setDebugMode(Z)V
.end method

.method public abstract showAchievements()V
.end method

.method public abstract showLeaderboard(Ljava/lang/String;)V
.end method

.method public abstract submitScore(Ljava/lang/String;J)V
.end method

.method public abstract unlockAchievement(Ljava/util/Hashtable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method
