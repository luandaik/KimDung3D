.class public interface abstract Lcom/snda/youni/dualsim/DualSimAgentInterface;
.super Ljava/lang/Object;
.source "DualSimAgentInterface.java"


# static fields
.field public static final DUAL_SIM_TYPE_MTK_6573:I = 0x1

.field public static final DUAL_SIM_TYPE_QUALCOMM_COOLPAD:I = 0x7

.field public static final DUAL_SIM_TYPE_QUALCOMM_HTC:I = 0x5

.field public static final DUAL_SIM_TYPE_QUALCOMM_HUAWEI:I = 0x2

.field public static final DUAL_SIM_TYPE_QUALCOMM_QRD:I = 0x3

.field public static final DUAL_SIM_TYPE_QUALCOMM_SAMSUNG:I = 0x8

.field public static final DUAL_SIM_TYPE_QUALCOMM_SAMSUNG2:I = 0x9

.field public static final DUAL_SIM_TYPE_QUALCOMM_SAMSUNG3:I = 0xc

.field public static final DUAL_SIM_TYPE_QUALCOMM_ZTC:I = 0x6

.field public static final DUAL_SIM_TYPE_SPREADTRUM:I = 0x4

.field public static final DUAL_SIM_TYPE_SPREADTRUM_1:I = 0xa

.field public static final DUAL_SIM_TYPE_SPREADTRUM_2:I = 0xb


# virtual methods
.method public abstract getCellLocation(I)Landroid/telephony/CellLocation;
.end method

.method public abstract getDeviceId(I)Ljava/lang/String;
.end method

.method public abstract getDualSimType()I
.end method

.method public abstract getFirstSlotId()I
.end method

.method public abstract getLine1Number(I)Ljava/lang/String;
.end method

.method public abstract getNetworkCountryIso(I)Ljava/lang/String;
.end method

.method public abstract getNetworkOperator(I)Ljava/lang/String;
.end method

.method public abstract getNetworkOperatorName(I)Ljava/lang/String;
.end method

.method public abstract getNetworkType(I)I
.end method

.method public abstract getPhoneType(I)I
.end method

.method public abstract getSecondSlotId()I
.end method

.method public abstract getSimCountryIso(I)Ljava/lang/String;
.end method

.method public abstract getSimFieldName()Ljava/lang/String;
.end method

.method public abstract getSimOperator(I)Ljava/lang/String;
.end method

.method public abstract getSimOperatorName(I)Ljava/lang/String;
.end method

.method public abstract getSimSerialNumber(I)Ljava/lang/String;
.end method

.method public abstract getSimState(I)I
.end method

.method public abstract getSubscriberId(I)Ljava/lang/String;
.end method

.method public abstract isSupportedDualSim()Z
.end method

.method public abstract needQuerySimIdSperately()Z
.end method

.method public abstract sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V
.end method
