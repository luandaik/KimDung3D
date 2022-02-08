.class public Lcom/heitao/model/HTAntiAddiction;
.super Lcom/heitao/model/HTBaseEntity;
.source "HTAntiAddiction.java"


# instance fields
.field public result:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "result"    # I

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 9
    iput p1, p0, Lcom/heitao/model/HTAntiAddiction;->result:I

    .line 10
    return-void
.end method
