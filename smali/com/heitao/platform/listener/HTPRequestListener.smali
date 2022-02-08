.class public abstract Lcom/heitao/platform/listener/HTPRequestListener;
.super Ljava/lang/Object;
.source "HTPRequestListener.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V
.end method

.method public abstract onFailed(Lcom/heitao/platform/model/HTPError;)V
.end method
