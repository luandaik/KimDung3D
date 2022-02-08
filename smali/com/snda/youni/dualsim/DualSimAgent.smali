.class public Lcom/snda/youni/dualsim/DualSimAgent;
.super Ljava/lang/Object;
.source "DualSimAgent.java"

# interfaces
.implements Lcom/snda/youni/dualsim/DualSimAgentInterface;


# instance fields
.field context:Landroid/content/Context;

.field dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

.field fake_apis:Lcom/snda/youni/dualsim/DualSimApis;

.field mDualSimType:I

.field single_apis:Lcom/snda/youni/dualsim/DualSimApis;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 25
    iput-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 26
    iput-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->fake_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 27
    const/4 v0, -0x1

    iput v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 25
    iput-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 26
    iput-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->fake_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 27
    const/4 v0, -0x1

    iput v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 34
    iput-object p1, p0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    .line 35
    invoke-direct {p0}, Lcom/snda/youni/dualsim/DualSimAgent;->testDualSimApis()V

    .line 36
    return-void
.end method

.method private testDualSimApis()V
    .locals 24

    .prologue
    .line 51
    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 52
    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->fake_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 53
    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 56
    const/4 v8, 0x1

    .line 57
    .local v8, "flag":Z
    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 58
    .local v3, "brand":Ljava/lang/String;
    sget-object v9, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 59
    .local v9, "model":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_0

    const-string v22, "samsung"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_0

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_0

    const-string v22, "GT-I9505"

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_0

    .line 60
    const/4 v8, 0x0

    .line 63
    :cond_0
    if-eqz v8, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-nez v22, :cond_1

    .line 64
    new-instance v2, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_MTK_6573;-><init>(Landroid/content/Context;)V

    .line 65
    .local v2, "apis":Lcom/snda/youni/dualsim/DualSimApis;
    invoke-interface {v2}, Lcom/snda/youni/dualsim/DualSimApis;->testDualSimApis()Z

    move-result v22

    if-eqz v22, :cond_1

    .line 66
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 67
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 70
    .end local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    :cond_1
    if-eqz v8, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-nez v22, :cond_2

    .line 71
    new-instance v2, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_Coolpad;-><init>(Landroid/content/Context;)V

    .line 72
    .restart local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    invoke-interface {v2}, Lcom/snda/youni/dualsim/DualSimApis;->testDualSimApis()Z

    move-result v22

    if-eqz v22, :cond_2

    .line 73
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 74
    const/16 v22, 0x7

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 77
    .end local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    :cond_2
    if-eqz v8, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-nez v22, :cond_3

    .line 78
    new-instance v2, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_HTC;-><init>(Landroid/content/Context;)V

    .line 79
    .restart local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    invoke-interface {v2}, Lcom/snda/youni/dualsim/DualSimApis;->testDualSimApis()Z

    move-result v22

    if-eqz v22, :cond_3

    .line 80
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 81
    const/16 v22, 0x5

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 84
    .end local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    :cond_3
    if-eqz v8, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-nez v22, :cond_6

    .line 85
    new-instance v2, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG3;-><init>(Landroid/content/Context;)V

    .line 86
    .restart local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    invoke-interface {v2}, Lcom/snda/youni/dualsim/DualSimApis;->testDualSimApis()Z

    move-result v22

    if-eqz v22, :cond_6

    .line 87
    sget-object v22, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v23, "samsung"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_4

    sget-object v22, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v23, "SM-N9006"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_6

    .line 88
    :cond_4
    sget-object v22, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v23, "samsung"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_5

    sget-object v22, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v23, "SM-N9008"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_6

    .line 89
    :cond_5
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 90
    const/16 v22, 0xc

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 94
    .end local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    :cond_6
    if-eqz v8, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-nez v22, :cond_8

    .line 95
    new-instance v2, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG;-><init>(Landroid/content/Context;)V

    .line 96
    .restart local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    invoke-interface {v2}, Lcom/snda/youni/dualsim/DualSimApis;->testDualSimApis()Z

    move-result v22

    if-eqz v22, :cond_8

    .line 97
    sget-object v22, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v23, "samsung"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_7

    sget-object v22, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v23, "GT-I9268"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_8

    .line 98
    :cond_7
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 99
    const/16 v22, 0x8

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 103
    .end local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    :cond_8
    if-eqz v8, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-nez v22, :cond_a

    .line 104
    new-instance v2, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_SAMSUNG2;-><init>(Landroid/content/Context;)V

    .line 105
    .restart local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    invoke-interface {v2}, Lcom/snda/youni/dualsim/DualSimApis;->testDualSimApis()Z

    move-result v22

    if-eqz v22, :cond_a

    .line 106
    sget-object v22, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v23, "samsung"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_9

    sget-object v22, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v23, "GT-I939D"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_a

    .line 107
    :cond_9
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 108
    const/16 v22, 0x9

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 112
    .end local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    :cond_a
    if-eqz v8, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-nez v22, :cond_b

    .line 113
    new-instance v2, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_ZTC;-><init>(Landroid/content/Context;)V

    .line 114
    .restart local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    invoke-interface {v2}, Lcom/snda/youni/dualsim/DualSimApis;->testDualSimApis()Z

    move-result v22

    if-eqz v22, :cond_b

    .line 115
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 116
    const/16 v22, 0x6

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 119
    .end local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    :cond_b
    if-eqz v8, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-nez v22, :cond_c

    .line 120
    new-instance v2, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_QUALCOMM_QRD;-><init>(Landroid/content/Context;)V

    .line 121
    .restart local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    invoke-interface {v2}, Lcom/snda/youni/dualsim/DualSimApis;->testDualSimApis()Z

    move-result v22

    if-eqz v22, :cond_c

    .line 122
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 123
    const/16 v22, 0x3

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 126
    .end local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    :cond_c
    if-eqz v8, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-nez v22, :cond_d

    .line 127
    new-instance v2, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_2;-><init>(Landroid/content/Context;)V

    .line 128
    .restart local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    invoke-interface {v2}, Lcom/snda/youni/dualsim/DualSimApis;->testDualSimApis()Z

    move-result v22

    if-eqz v22, :cond_d

    .line 129
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 130
    const/16 v22, 0xb

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 133
    .end local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    :cond_d
    if-eqz v8, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-nez v22, :cond_e

    .line 134
    new-instance v2, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_1;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lcom/snda/youni/dualsim/impl/DualSimApis_Spreadtrum_1;-><init>(Landroid/content/Context;)V

    .line 135
    .restart local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    invoke-interface {v2}, Lcom/snda/youni/dualsim/DualSimApis;->testDualSimApis()Z

    move-result v22

    if-eqz v22, :cond_e

    .line 136
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 137
    const/16 v22, 0xa

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 142
    .end local v2    # "apis":Lcom/snda/youni/dualsim/DualSimApis;
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    if-eqz v22, :cond_22

    .line 143
    new-instance v16, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v22, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;-><init>(Landroid/content/Context;)V

    .line 144
    .local v16, "standard_api":Lcom/snda/youni/dualsim/DualSimApis;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-interface/range {v22 .. v23}, Lcom/snda/youni/dualsim/DualSimApis;->getSimSerialNumber(I)Ljava/lang/String;

    move-result-object v11

    .line 145
    .local v11, "sim1":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-interface/range {v22 .. v23}, Lcom/snda/youni/dualsim/DualSimApis;->getSimSerialNumber(I)Ljava/lang/String;

    move-result-object v13

    .line 146
    .local v13, "sim2":Ljava/lang/String;
    const/16 v22, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v22

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getSimSerialNumber(I)Ljava/lang/String;

    move-result-object v10

    .line 147
    .local v10, "sim":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-interface/range {v22 .. v23}, Lcom/snda/youni/dualsim/DualSimApis;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v18

    .line 148
    .local v18, "subscriber1":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-interface/range {v22 .. v23}, Lcom/snda/youni/dualsim/DualSimApis;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v19

    .line 149
    .local v19, "subscriber2":Ljava/lang/String;
    const/16 v22, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v22

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v17

    .line 150
    .local v17, "subscriber":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-interface/range {v22 .. v23}, Lcom/snda/youni/dualsim/DualSimApis;->getSimState(I)I

    move-result v12

    .line 151
    .local v12, "sim1_state":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-interface/range {v22 .. v23}, Lcom/snda/youni/dualsim/DualSimApis;->getSimState(I)I

    move-result v14

    .line 152
    .local v14, "sim2_state":I
    const/16 v22, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v22

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getSimState(I)I

    move-result v15

    .line 153
    .local v15, "sim_state":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-interface/range {v22 .. v23}, Lcom/snda/youni/dualsim/DualSimApis;->getDeviceId(I)Ljava/lang/String;

    move-result-object v6

    .line 154
    .local v6, "deviceId1":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-interface/range {v22 .. v23}, Lcom/snda/youni/dualsim/DualSimApis;->getDeviceId(I)Ljava/lang/String;

    move-result-object v7

    .line 155
    .local v7, "deviceId2":Ljava/lang/String;
    const/16 v22, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v22

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getDeviceId(I)Ljava/lang/String;

    move-result-object v5

    .line 156
    .local v5, "deviceId":Ljava/lang/String;
    const/16 v21, 0x0

    .line 157
    .local v21, "wrong_hit":Z
    const/4 v4, 0x0

    .line 158
    .local v4, "definite_hit":Z
    const/16 v20, 0x0

    .line 159
    .local v20, "unknown_hit":Z
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_13

    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_13

    .line 160
    const/16 v21, 0x1

    .line 175
    :cond_f
    :goto_0
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_19

    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_19

    .line 176
    const/4 v4, 0x1

    .line 189
    :cond_10
    :goto_1
    const/16 v22, 0x5

    move/from16 v0, v22

    if-eq v15, v0, :cond_11

    const/16 v22, 0x5

    move/from16 v0, v22

    if-eq v12, v0, :cond_11

    const/16 v22, 0x5

    move/from16 v0, v22

    if-eq v14, v0, :cond_11

    .line 190
    const/16 v20, 0x1

    .line 193
    :cond_11
    if-eqz v21, :cond_21

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->fake_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 196
    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 197
    const/16 v22, -0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    .line 208
    :cond_12
    :goto_2
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 212
    .end local v4    # "definite_hit":Z
    .end local v5    # "deviceId":Ljava/lang/String;
    .end local v6    # "deviceId1":Ljava/lang/String;
    .end local v7    # "deviceId2":Ljava/lang/String;
    .end local v10    # "sim":Ljava/lang/String;
    .end local v11    # "sim1":Ljava/lang/String;
    .end local v12    # "sim1_state":I
    .end local v13    # "sim2":Ljava/lang/String;
    .end local v14    # "sim2_state":I
    .end local v15    # "sim_state":I
    .end local v16    # "standard_api":Lcom/snda/youni/dualsim/DualSimApis;
    .end local v17    # "subscriber":Ljava/lang/String;
    .end local v18    # "subscriber1":Ljava/lang/String;
    .end local v19    # "subscriber2":Ljava/lang/String;
    .end local v20    # "unknown_hit":Z
    .end local v21    # "wrong_hit":Z
    :goto_3
    return-void

    .line 161
    .restart local v4    # "definite_hit":Z
    .restart local v5    # "deviceId":Ljava/lang/String;
    .restart local v6    # "deviceId1":Ljava/lang/String;
    .restart local v7    # "deviceId2":Ljava/lang/String;
    .restart local v10    # "sim":Ljava/lang/String;
    .restart local v11    # "sim1":Ljava/lang/String;
    .restart local v12    # "sim1_state":I
    .restart local v13    # "sim2":Ljava/lang/String;
    .restart local v14    # "sim2_state":I
    .restart local v15    # "sim_state":I
    .restart local v16    # "standard_api":Lcom/snda/youni/dualsim/DualSimApis;
    .restart local v17    # "subscriber":Ljava/lang/String;
    .restart local v18    # "subscriber1":Ljava/lang/String;
    .restart local v19    # "subscriber2":Ljava/lang/String;
    .restart local v20    # "unknown_hit":Z
    .restart local v21    # "wrong_hit":Z
    :cond_13
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_14

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_14

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_14

    .line 162
    const/16 v21, 0x1

    .line 163
    goto :goto_0

    :cond_14
    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_15

    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_15

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_15

    .line 164
    const/16 v21, 0x1

    .line 165
    goto :goto_0

    :cond_15
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_16

    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_16

    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_16

    .line 166
    const/16 v21, 0x1

    .line 167
    goto/16 :goto_0

    :cond_16
    const/16 v22, 0x5

    move/from16 v0, v22

    if-ne v15, v0, :cond_17

    const/16 v22, 0x5

    move/from16 v0, v22

    if-eq v12, v0, :cond_17

    const/16 v22, 0x5

    move/from16 v0, v22

    if-eq v14, v0, :cond_17

    .line 168
    const/16 v21, 0x1

    .line 169
    goto/16 :goto_0

    :cond_17
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_f

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_f

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_f

    .line 170
    move-object/from16 v0, p0

    iget v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    move/from16 v22, v0

    const/16 v23, 0x5

    move/from16 v0, v22

    move/from16 v1, v23

    if-eq v0, v1, :cond_18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    move/from16 v22, v0

    const/16 v23, 0x8

    move/from16 v0, v22

    move/from16 v1, v23

    if-eq v0, v1, :cond_18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    move/from16 v22, v0

    const/16 v23, 0x9

    move/from16 v0, v22

    move/from16 v1, v23

    if-eq v0, v1, :cond_18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    move/from16 v22, v0

    const/16 v23, 0xc

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_f

    .line 171
    :cond_18
    const/16 v21, 0x1

    goto/16 :goto_0

    .line 177
    :cond_19
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_1a

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_1a

    .line 178
    const/4 v4, 0x1

    .line 179
    goto/16 :goto_1

    :cond_1a
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_1b

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_1b

    .line 180
    const/4 v4, 0x1

    .line 181
    goto/16 :goto_1

    :cond_1b
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_1d

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_1c

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_1d

    .line 182
    :cond_1c
    const/4 v4, 0x1

    .line 183
    goto/16 :goto_1

    :cond_1d
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_1f

    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_1e

    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_1f

    .line 184
    :cond_1e
    const/4 v4, 0x1

    .line 185
    goto/16 :goto_1

    :cond_1f
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_10

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_20

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_10

    .line 186
    :cond_20
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 198
    :cond_21
    if-nez v4, :cond_12

    .line 200
    if-eqz v20, :cond_12

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->fake_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 203
    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    goto/16 :goto_2

    .line 210
    .end local v4    # "definite_hit":Z
    .end local v5    # "deviceId":Ljava/lang/String;
    .end local v6    # "deviceId1":Ljava/lang/String;
    .end local v7    # "deviceId2":Ljava/lang/String;
    .end local v10    # "sim":Ljava/lang/String;
    .end local v11    # "sim1":Ljava/lang/String;
    .end local v12    # "sim1_state":I
    .end local v13    # "sim2":Ljava/lang/String;
    .end local v14    # "sim2_state":I
    .end local v15    # "sim_state":I
    .end local v16    # "standard_api":Lcom/snda/youni/dualsim/DualSimApis;
    .end local v17    # "subscriber":Ljava/lang/String;
    .end local v18    # "subscriber1":Ljava/lang/String;
    .end local v19    # "subscriber2":Ljava/lang/String;
    .end local v20    # "unknown_hit":Z
    .end local v21    # "wrong_hit":Z
    :cond_22
    new-instance v22, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    move-object/from16 v23, v0

    invoke-direct/range {v22 .. v23}, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    goto/16 :goto_3
.end method


# virtual methods
.method public disablePhoneWithDualSim()V
    .locals 2

    .prologue
    .line 332
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_0

    .line 333
    new-instance v0, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;

    iget-object v1, p0, Lcom/snda/youni/dualsim/DualSimAgent;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/snda/youni/dualsim/impl/DualSimApis_Standard_Default;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    .line 334
    :cond_0
    return-void
.end method

.method public getCellLocation(I)Landroid/telephony/CellLocation;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 374
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDeviceId(I)Ljava/lang/String;
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 304
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 305
    const/4 v0, 0x0

    .line 309
    :goto_0
    return-object v0

    .line 306
    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 307
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0, p1}, Lcom/snda/youni/dualsim/DualSimApis;->getDeviceId(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 309
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getDeviceId(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getDualSimType()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->mDualSimType:I

    return v0
.end method

.method public getFirstSlotId()I
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 226
    const/4 v0, 0x0

    .line 228
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0}, Lcom/snda/youni/dualsim/DualSimApis;->getFirstSlotSimId()I

    move-result v0

    goto :goto_0
.end method

.method public getLine1Number(I)Ljava/lang/String;
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 313
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 314
    const/4 v0, 0x0

    .line 318
    :goto_0
    return-object v0

    .line 315
    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 316
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0, p1}, Lcom/snda/youni/dualsim/DualSimApis;->getLine1Number(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 318
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getLine1Number(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getNetworkCountryIso(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 368
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNetworkOperator(I)Ljava/lang/String;
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 277
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 278
    const/4 v0, 0x0

    .line 282
    :goto_0
    return-object v0

    .line 279
    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 280
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0, p1}, Lcom/snda/youni/dualsim/DualSimApis;->getNetworkOperator(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 282
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getNetworkOperator(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getNetworkOperatorName(I)Ljava/lang/String;
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 286
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 287
    const/4 v0, 0x0

    .line 291
    :goto_0
    return-object v0

    .line 288
    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 289
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0, p1}, Lcom/snda/youni/dualsim/DualSimApis;->getNetworkOperatorName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 291
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getNetworkOperatorName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getNetworkType(I)I
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 295
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 296
    const/4 v0, -0x1

    .line 300
    :goto_0
    return v0

    .line 297
    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 298
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0, p1}, Lcom/snda/youni/dualsim/DualSimApis;->getNetworkType(I)I

    move-result v0

    goto :goto_0

    .line 300
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getNetworkType(I)I

    move-result v0

    goto :goto_0
.end method

.method public getPhoneType(I)I
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 380
    const/4 v0, 0x0

    return v0
.end method

.method public getSecondSlotId()I
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 234
    const/4 v0, 0x1

    .line 236
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0}, Lcom/snda/youni/dualsim/DualSimApis;->getSecondSlotSimId()I

    move-result v0

    goto :goto_0
.end method

.method public getSimCountryIso(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 362
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSimFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 218
    const-string v0, "sim_id"

    .line 220
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0}, Lcom/snda/youni/dualsim/DualSimApis;->getSimFieldName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getSimOperator(I)Ljava/lang/String;
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 341
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 342
    const/4 v0, 0x0

    .line 346
    :goto_0
    return-object v0

    .line 343
    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 344
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0, p1}, Lcom/snda/youni/dualsim/DualSimApis;->getSimOperator(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 346
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getSimOperator(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getSimOperatorName(I)Ljava/lang/String;
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 351
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 352
    const/4 v0, 0x0

    .line 356
    :goto_0
    return-object v0

    .line 353
    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 354
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0, p1}, Lcom/snda/youni/dualsim/DualSimApis;->getSimOperator(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 356
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getSimOperator(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getSimSerialNumber(I)Ljava/lang/String;
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 268
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 269
    const/4 v0, 0x0

    .line 273
    :goto_0
    return-object v0

    .line 270
    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 271
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0, p1}, Lcom/snda/youni/dualsim/DualSimApis;->getSimSerialNumber(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 273
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getSimSerialNumber(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getSimState(I)I
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 259
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 260
    const/4 v0, -0x1

    .line 264
    :goto_0
    return v0

    .line 261
    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 262
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0, p1}, Lcom/snda/youni/dualsim/DualSimApis;->getSimState(I)I

    move-result v0

    goto :goto_0

    .line 264
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getSimState(I)I

    move-result v0

    goto :goto_0
.end method

.method public getSubscriberId(I)Ljava/lang/String;
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 250
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 251
    const/4 v0, 0x0

    .line 255
    :goto_0
    return-object v0

    .line 252
    :cond_0
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 253
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0, p1}, Lcom/snda/youni/dualsim/DualSimApis;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 255
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/snda/youni/dualsim/DualSimApis;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public isSupportedDualSim()Z
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-nez v0, :cond_0

    .line 40
    const/4 v0, 0x0

    .line 42
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public needQuerySimIdSperately()Z
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    invoke-interface {v0}, Lcom/snda/youni/dualsim/DualSimApis;->needQuerySimIdSperately()Z

    move-result v0

    .line 245
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V
    .locals 7
    .param p1, "destinationAddress"    # Ljava/lang/String;
    .param p2, "scAddress"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "sentIntent"    # Landroid/app/PendingIntent;
    .param p5, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p6, "simId"    # I

    .prologue
    .line 323
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_1

    .line 324
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->dual_apis:Lcom/snda/youni/dualsim/DualSimApis;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    invoke-interface/range {v0 .. v6}, Lcom/snda/youni/dualsim/DualSimApis;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V

    .line 328
    :cond_0
    :goto_0
    return-void

    .line 325
    :cond_1
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    if-eqz v0, :cond_0

    .line 326
    iget-object v0, p0, Lcom/snda/youni/dualsim/DualSimAgent;->single_apis:Lcom/snda/youni/dualsim/DualSimApis;

    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-interface/range {v0 .. v6}, Lcom/snda/youni/dualsim/DualSimApis;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V

    goto :goto_0
.end method
