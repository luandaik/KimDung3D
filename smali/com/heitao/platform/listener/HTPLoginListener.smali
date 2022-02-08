.class public abstract Lcom/heitao/platform/listener/HTPLoginListener;
.super Ljava/lang/Object;
.source "HTPLoginListener.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onLoginCompleted(Lcom/heitao/platform/model/HTPUser;)V
.end method

.method public abstract onLoginFailed(Lcom/heitao/platform/model/HTPError;)V
.end method
