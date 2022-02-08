.class public abstract Lcom/heitao/platform/listener/HTPPayListener;
.super Ljava/lang/Object;
.source "HTPPayListener.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onPayCompleted()V
.end method

.method public abstract onPayFailed(Lcom/heitao/platform/model/HTPError;)V
.end method
