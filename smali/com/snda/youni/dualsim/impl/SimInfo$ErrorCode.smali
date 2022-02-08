.class public Lcom/snda/youni/dualsim/impl/SimInfo$ErrorCode;
.super Ljava/lang/Object;
.source "SimInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/snda/youni/dualsim/impl/SimInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ErrorCode"
.end annotation


# static fields
.field public static final ERROR_GENERAL:I = -0x1

.field public static final ERROR_NAME_EXIST:I = -0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
