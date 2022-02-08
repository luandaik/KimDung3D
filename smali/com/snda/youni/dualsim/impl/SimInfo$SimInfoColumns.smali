.class public final Lcom/snda/youni/dualsim/impl/SimInfo$SimInfoColumns;
.super Ljava/lang/Object;
.source "SimInfo.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/snda/youni/dualsim/impl/SimInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SimInfoColumns"
.end annotation


# static fields
.field public static final COLOR:Ljava/lang/String; = "color"

.field public static final COLOR_1:I = 0x0

.field public static final COLOR_2:I = 0x1

.field public static final COLOR_3:I = 0x2

.field public static final COLOR_4:I = 0x3

.field public static final COLOR_5:I = 0x4

.field public static final COLOR_6:I = 0x5

.field public static final COLOR_7:I = 0x6

.field public static final COLOR_8:I = 0x7

.field public static final COLOR_DEFAULT:I = 0x0

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final DATA_ROAMING:Ljava/lang/String; = "data_roaming"

.field public static final DATA_ROAMING_DEFAULT:I = 0x0

.field public static final DATA_ROAMING_DISABLE:I = 0x0

.field public static final DATA_ROAMING_ENABLE:I = 0x1

.field public static final DEFAULT_NAME_MAX_INDEX:I = 0x63

.field public static final DEFAULT_NAME_MIN_INDEX:I = 0x1

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "name ASC"

.field public static final DISLPAY_NUMBER_DEFAULT:I = 0x1

.field public static final DISPALY_NUMBER_NONE:I = 0x0

.field public static final DISPLAY_NAME:Ljava/lang/String; = "display_name"

.field public static final DISPLAY_NUMBER_FIRST:I = 0x1

.field public static final DISPLAY_NUMBER_FORMAT:Ljava/lang/String; = "display_number_format"

.field public static final DISPLAY_NUMBER_LAST:I = 0x2

.field public static final ERROR_GENERAL:I = -0x1

.field public static final ERROR_NAME_EXIST:I = -0x2

.field public static final ICC_ID:Ljava/lang/String; = "icc_id"

.field public static final NUMBER:Ljava/lang/String; = "number"

.field public static final SLOT:Ljava/lang/String; = "slot"

.field public static final SLOT_NONE:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 478
    const-string v0, "content://telephony/siminfo"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 477
    sput-object v0, Lcom/snda/youni/dualsim/impl/SimInfo$SimInfoColumns;->CONTENT_URI:Landroid/net/Uri;

    .line 540
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 476
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
