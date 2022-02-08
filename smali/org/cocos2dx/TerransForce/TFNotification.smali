.class public Lorg/cocos2dx/TerransForce/TFNotification;
.super Lorg/cocos2dx/lib/Cocos2dxActivity;
.source "TFNotification.java"


# static fields
.field public static final SER_KEY:Ljava/lang/String; = "org.cocos2dx.mangEngine.TFNotification.message"

.field public static final convert:I = 0x3e8

.field public static mNotificationObj:Lorg/cocos2dx/TerransForce/TFNotification;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 82
    const-string v0, "TFNotification"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;-><init>()V

    .line 79
    return-void
.end method

.method public static pushMessage(Ljava/lang/String;JI)V
    .locals 5
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "mark"    # J
    .param p3, "repeats"    # I

    .prologue
    .line 51
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TFNotification.passFromJni()"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 53
    new-instance v0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;-><init>()V

    .line 55
    .local v0, "nmObj":Lorg/cocos2dx/TerransForce/TFNotificationMessage;
    invoke-virtual {v0, p0}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->setMessage(Ljava/lang/String;)V

    .line 57
    const-wide/16 v2, 0x3e8

    mul-long/2addr v2, p1

    invoke-virtual {v0, v2, v3}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->setMark(J)V

    .line 59
    invoke-virtual {v0, p3}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->setId(I)V

    .line 61
    sget-object v1, Lorg/cocos2dx/TerransForce/TFNotification;->mNotificationObj:Lorg/cocos2dx/TerransForce/TFNotification;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/TerransForce/TFNotification;->SerializeMethod(Lorg/cocos2dx/TerransForce/TFNotificationMessage;)V

    .line 63
    return-void
.end method

.method public static removeNotification()V
    .locals 2

    .prologue
    .line 66
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "TFNotification.removeNotification()"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 68
    return-void
.end method


# virtual methods
.method public SerializeMethod(Lorg/cocos2dx/TerransForce/TFNotificationMessage;)V
    .locals 4
    .param p1, "message"    # Lorg/cocos2dx/TerransForce/TFNotificationMessage;

    .prologue
    .line 38
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 39
    .local v0, "intent":Landroid/content/Intent;
    const-class v2, Lorg/cocos2dx/TerransForce/TFNotifitionService;

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 40
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 41
    .local v1, "mBundle":Landroid/os/Bundle;
    const-string v2, "org.cocos2dx.mangEngine.TFNotification.message"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 42
    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 44
    invoke-virtual {p0, v0}, Lorg/cocos2dx/TerransForce/TFNotification;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 46
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Push notify message."

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 33
    invoke-super {p0, p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 34
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 17
    const-string v0, "com.ea.product.TFNotification"

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    invoke-virtual {p0}, Lorg/cocos2dx/TerransForce/TFNotification;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 20
    sput-object p0, Lorg/cocos2dx/TerransForce/TFNotification;->mNotificationObj:Lorg/cocos2dx/TerransForce/TFNotification;

    .line 21
    return-void
.end method

.method public onCreateView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    .locals 7

    .prologue
    const/4 v1, 0x5

    .line 24
    const-string v2, "com.ea.product.TFNotification"

    const-string v3, "onCreateView"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 27
    .local v0, "glSurfaceView":Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    const/4 v2, 0x6

    const/4 v4, 0x0

    const/16 v5, 0x10

    const/16 v6, 0x8

    move v3, v1

    invoke-virtual/range {v0 .. v6}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setEGLConfigChooser(IIIIII)V

    .line 28
    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 75
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onDestroy()V

    .line 76
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 71
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onStop()V

    .line 72
    return-void
.end method
