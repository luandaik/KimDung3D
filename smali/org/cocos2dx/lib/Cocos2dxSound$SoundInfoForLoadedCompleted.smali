.class public Lorg/cocos2dx/lib/Cocos2dxSound$SoundInfoForLoadedCompleted;
.super Ljava/lang/Object;
.source "Cocos2dxSound.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/lib/Cocos2dxSound;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SoundInfoForLoadedCompleted"
.end annotation


# instance fields
.field public isLoop:Z

.field public path:Ljava/lang/String;

.field public soundID:I

.field final synthetic this$0:Lorg/cocos2dx/lib/Cocos2dxSound;


# direct methods
.method public constructor <init>(Lorg/cocos2dx/lib/Cocos2dxSound;Ljava/lang/String;IZ)V
    .locals 0
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "soundId"    # I
    .param p4, "isLoop"    # Z

    .prologue
    .line 337
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxSound$SoundInfoForLoadedCompleted;->this$0:Lorg/cocos2dx/lib/Cocos2dxSound;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 338
    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxSound$SoundInfoForLoadedCompleted;->path:Ljava/lang/String;

    .line 339
    iput p3, p0, Lorg/cocos2dx/lib/Cocos2dxSound$SoundInfoForLoadedCompleted;->soundID:I

    .line 340
    iput-boolean p4, p0, Lorg/cocos2dx/lib/Cocos2dxSound$SoundInfoForLoadedCompleted;->isLoop:Z

    .line 341
    return-void
.end method
