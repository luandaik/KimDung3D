.class public final Lcom/heitao/platform/pay/alipay/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final BASELENGTH:I = 0x80

.field private static final EIGHTBIT:I = 0x8

.field private static final FOURBYTE:I = 0x4

.field private static final LOOKUPLENGTH:I = 0x40

.field private static PAD:C = '\u0000'

.field private static final SIGN:I = -0x80

.field private static final SIXTEENBIT:I = 0x10

.field private static final TWENTYFOURBITGROUP:I = 0x18

.field private static base64Alphabet:[B

.field private static lookUpBase64Alphabet:[C


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/16 v8, 0x3f

    const/16 v7, 0x3e

    const/16 v6, 0x3d

    const/16 v5, 0x2f

    const/16 v4, 0x2b

    .line 12
    sput-char v6, Lcom/heitao/platform/pay/alipay/Base64;->PAD:C

    .line 13
    const/16 v2, 0x80

    new-array v2, v2, [B

    sput-object v2, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    .line 14
    const/16 v2, 0x40

    new-array v2, v2, [C

    sput-object v2, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    .line 17
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v2, 0x80

    if-lt v0, v2, :cond_0

    .line 20
    const/16 v0, 0x5a

    :goto_1
    const/16 v2, 0x41

    if-ge v0, v2, :cond_1

    .line 23
    const/16 v0, 0x7a

    :goto_2
    const/16 v2, 0x61

    if-ge v0, v2, :cond_2

    .line 27
    const/16 v0, 0x39

    :goto_3
    const/16 v2, 0x30

    if-ge v0, v2, :cond_3

    .line 31
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aput-byte v7, v2, v4

    .line 32
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aput-byte v8, v2, v5

    .line 34
    const/4 v0, 0x0

    :goto_4
    const/16 v2, 0x19

    if-le v0, v2, :cond_4

    .line 38
    const/16 v0, 0x1a

    const/4 v1, 0x0

    .local v1, "j":I
    :goto_5
    const/16 v2, 0x33

    if-le v0, v2, :cond_5

    .line 42
    const/16 v0, 0x34

    const/4 v1, 0x0

    :goto_6
    if-le v0, v6, :cond_6

    .line 45
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    aput-char v4, v2, v7

    .line 46
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    aput-char v5, v2, v8

    .line 48
    return-void

    .line 18
    .end local v1    # "j":I
    :cond_0
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    const/4 v3, -0x1

    aput-byte v3, v2, v0

    .line 17
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 21
    :cond_1
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    add-int/lit8 v3, v0, -0x41

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 20
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 24
    :cond_2
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    add-int/lit8 v3, v0, -0x61

    add-int/lit8 v3, v3, 0x1a

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 23
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 28
    :cond_3
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    add-int/lit8 v3, v0, -0x30

    add-int/lit8 v3, v3, 0x34

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 27
    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    .line 35
    :cond_4
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    add-int/lit8 v3, v0, 0x41

    int-to-char v3, v3

    aput-char v3, v2, v0

    .line 34
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 39
    .restart local v1    # "j":I
    :cond_5
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    add-int/lit8 v3, v1, 0x61

    int-to-char v3, v3

    aput-char v3, v2, v0

    .line 38
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 43
    :cond_6
    sget-object v2, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    add-int/lit8 v3, v1, 0x30

    int-to-char v3, v3

    aput-char v3, v2, v0

    .line 42
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_6
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 25
    .param p0, "encoded"    # Ljava/lang/String;

    .prologue
    .line 154
    if-nez p0, :cond_0

    .line 155
    const/16 v21, 0x0

    .line 243
    :goto_0
    return-object v21

    .line 158
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v8

    .line 160
    .local v8, "base64Data":[C
    invoke-static {v8}, Lcom/heitao/platform/pay/alipay/Base64;->removeWhiteSpace([C)I

    move-result v19

    .line 162
    .local v19, "len":I
    rem-int/lit8 v22, v19, 0x4

    if-eqz v22, :cond_1

    .line 163
    const/16 v21, 0x0

    goto :goto_0

    .line 166
    :cond_1
    div-int/lit8 v20, v19, 0x4

    .line 168
    .local v20, "numberQuadruple":I
    if-nez v20, :cond_2

    .line 169
    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [B

    move-object/from16 v21, v0

    goto :goto_0

    .line 172
    :cond_2
    const/4 v15, 0x0

    .line 173
    .local v15, "decodedData":[B
    const/4 v4, 0x0

    .local v4, "b1":B
    const/4 v5, 0x0

    .local v5, "b2":B
    const/4 v6, 0x0

    .local v6, "b3":B
    const/4 v7, 0x0

    .line 174
    .local v7, "b4":B
    const/4 v9, 0x0

    .local v9, "d1":C
    const/4 v10, 0x0

    .local v10, "d2":C
    const/4 v11, 0x0

    .local v11, "d3":C
    const/4 v12, 0x0

    .line 176
    .local v12, "d4":C
    const/16 v18, 0x0

    .line 177
    .local v18, "i":I
    const/16 v16, 0x0

    .line 178
    .local v16, "encodedIndex":I
    const/4 v13, 0x0

    .line 179
    .local v13, "dataIndex":I
    mul-int/lit8 v22, v20, 0x3

    move/from16 v0, v22

    new-array v15, v0, [B

    move v14, v13

    .end local v13    # "dataIndex":I
    .local v14, "dataIndex":I
    move/from16 v17, v16

    .line 181
    .end local v16    # "encodedIndex":I
    .local v17, "encodedIndex":I
    :goto_1
    add-int/lit8 v22, v20, -0x1

    move/from16 v0, v18

    move/from16 v1, v22

    if-lt v0, v1, :cond_4

    .line 200
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "dataIndex":I
    .restart local v13    # "dataIndex":I
    aget-char v9, v8, v14

    invoke-static {v9}, Lcom/heitao/platform/pay/alipay/Base64;->isData(C)Z

    move-result v22

    if-eqz v22, :cond_3

    .line 201
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "dataIndex":I
    .restart local v14    # "dataIndex":I
    aget-char v10, v8, v13

    invoke-static {v10}, Lcom/heitao/platform/pay/alipay/Base64;->isData(C)Z

    move-result v22

    if-nez v22, :cond_8

    move v13, v14

    .line 202
    .end local v14    # "dataIndex":I
    .restart local v13    # "dataIndex":I
    :cond_3
    const/16 v21, 0x0

    goto :goto_0

    .line 183
    .end local v13    # "dataIndex":I
    .restart local v14    # "dataIndex":I
    :cond_4
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "dataIndex":I
    .restart local v13    # "dataIndex":I
    aget-char v9, v8, v14

    invoke-static {v9}, Lcom/heitao/platform/pay/alipay/Base64;->isData(C)Z

    move-result v22

    if-eqz v22, :cond_6

    .line 184
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "dataIndex":I
    .restart local v14    # "dataIndex":I
    aget-char v10, v8, v13

    invoke-static {v10}, Lcom/heitao/platform/pay/alipay/Base64;->isData(C)Z

    move-result v22

    if-eqz v22, :cond_5

    .line 185
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "dataIndex":I
    .restart local v13    # "dataIndex":I
    aget-char v11, v8, v14

    invoke-static {v11}, Lcom/heitao/platform/pay/alipay/Base64;->isData(C)Z

    move-result v22

    if-eqz v22, :cond_6

    .line 186
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "dataIndex":I
    .restart local v14    # "dataIndex":I
    aget-char v12, v8, v13

    invoke-static {v12}, Lcom/heitao/platform/pay/alipay/Base64;->isData(C)Z

    move-result v22

    if-nez v22, :cond_7

    :cond_5
    move v13, v14

    .line 187
    .end local v14    # "dataIndex":I
    .restart local v13    # "dataIndex":I
    :cond_6
    const/16 v21, 0x0

    goto :goto_0

    .line 190
    .end local v13    # "dataIndex":I
    .restart local v14    # "dataIndex":I
    :cond_7
    sget-object v22, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aget-byte v4, v22, v9

    .line 191
    sget-object v22, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aget-byte v5, v22, v10

    .line 192
    sget-object v22, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aget-byte v6, v22, v11

    .line 193
    sget-object v22, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aget-byte v7, v22, v12

    .line 195
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "encodedIndex":I
    .restart local v16    # "encodedIndex":I
    shl-int/lit8 v22, v4, 0x2

    shr-int/lit8 v23, v5, 0x4

    or-int v22, v22, v23

    move/from16 v0, v22

    int-to-byte v0, v0

    move/from16 v22, v0

    aput-byte v22, v15, v17

    .line 196
    add-int/lit8 v17, v16, 0x1

    .end local v16    # "encodedIndex":I
    .restart local v17    # "encodedIndex":I
    and-int/lit8 v22, v5, 0xf

    shl-int/lit8 v22, v22, 0x4

    shr-int/lit8 v23, v6, 0x2

    and-int/lit8 v23, v23, 0xf

    or-int v22, v22, v23

    move/from16 v0, v22

    int-to-byte v0, v0

    move/from16 v22, v0

    aput-byte v22, v15, v16

    .line 197
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "encodedIndex":I
    .restart local v16    # "encodedIndex":I
    shl-int/lit8 v22, v6, 0x6

    or-int v22, v22, v7

    move/from16 v0, v22

    int-to-byte v0, v0

    move/from16 v22, v0

    aput-byte v22, v15, v17

    .line 181
    add-int/lit8 v18, v18, 0x1

    move/from16 v17, v16

    .end local v16    # "encodedIndex":I
    .restart local v17    # "encodedIndex":I
    goto/16 :goto_1

    .line 205
    :cond_8
    sget-object v22, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aget-byte v4, v22, v9

    .line 206
    sget-object v22, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aget-byte v5, v22, v10

    .line 208
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "dataIndex":I
    .restart local v13    # "dataIndex":I
    aget-char v11, v8, v14

    .line 209
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "dataIndex":I
    .restart local v14    # "dataIndex":I
    aget-char v12, v8, v13

    .line 210
    invoke-static {v11}, Lcom/heitao/platform/pay/alipay/Base64;->isData(C)Z

    move-result v22

    if-eqz v22, :cond_9

    invoke-static {v12}, Lcom/heitao/platform/pay/alipay/Base64;->isData(C)Z

    move-result v22

    if-nez v22, :cond_e

    .line 211
    :cond_9
    invoke-static {v11}, Lcom/heitao/platform/pay/alipay/Base64;->isPad(C)Z

    move-result v22

    if-eqz v22, :cond_b

    invoke-static {v12}, Lcom/heitao/platform/pay/alipay/Base64;->isPad(C)Z

    move-result v22

    if-eqz v22, :cond_b

    .line 212
    and-int/lit8 v22, v5, 0xf

    if-eqz v22, :cond_a

    .line 214
    const/16 v21, 0x0

    goto/16 :goto_0

    .line 216
    :cond_a
    mul-int/lit8 v22, v18, 0x3

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [B

    move-object/from16 v21, v0

    .line 217
    .local v21, "tmp":[B
    const/16 v22, 0x0

    const/16 v23, 0x0

    mul-int/lit8 v24, v18, 0x3

    move/from16 v0, v22

    move-object/from16 v1, v21

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-static {v15, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 218
    shl-int/lit8 v22, v4, 0x2

    shr-int/lit8 v23, v5, 0x4

    or-int v22, v22, v23

    move/from16 v0, v22

    int-to-byte v0, v0

    move/from16 v22, v0

    aput-byte v22, v21, v17

    goto/16 :goto_0

    .line 220
    .end local v21    # "tmp":[B
    :cond_b
    invoke-static {v11}, Lcom/heitao/platform/pay/alipay/Base64;->isPad(C)Z

    move-result v22

    if-nez v22, :cond_d

    invoke-static {v12}, Lcom/heitao/platform/pay/alipay/Base64;->isPad(C)Z

    move-result v22

    if-eqz v22, :cond_d

    .line 221
    sget-object v22, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aget-byte v6, v22, v11

    .line 222
    and-int/lit8 v22, v6, 0x3

    if-eqz v22, :cond_c

    .line 224
    const/16 v21, 0x0

    goto/16 :goto_0

    .line 226
    :cond_c
    mul-int/lit8 v22, v18, 0x3

    add-int/lit8 v22, v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [B

    move-object/from16 v21, v0

    .line 227
    .restart local v21    # "tmp":[B
    const/16 v22, 0x0

    const/16 v23, 0x0

    mul-int/lit8 v24, v18, 0x3

    move/from16 v0, v22

    move-object/from16 v1, v21

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-static {v15, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 228
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "encodedIndex":I
    .restart local v16    # "encodedIndex":I
    shl-int/lit8 v22, v4, 0x2

    shr-int/lit8 v23, v5, 0x4

    or-int v22, v22, v23

    move/from16 v0, v22

    int-to-byte v0, v0

    move/from16 v22, v0

    aput-byte v22, v21, v17

    .line 229
    and-int/lit8 v22, v5, 0xf

    shl-int/lit8 v22, v22, 0x4

    shr-int/lit8 v23, v6, 0x2

    and-int/lit8 v23, v23, 0xf

    or-int v22, v22, v23

    move/from16 v0, v22

    int-to-byte v0, v0

    move/from16 v22, v0

    aput-byte v22, v21, v16

    goto/16 :goto_0

    .line 232
    .end local v16    # "encodedIndex":I
    .end local v21    # "tmp":[B
    .restart local v17    # "encodedIndex":I
    :cond_d
    const/16 v21, 0x0

    goto/16 :goto_0

    .line 235
    :cond_e
    sget-object v22, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aget-byte v6, v22, v11

    .line 236
    sget-object v22, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aget-byte v7, v22, v12

    .line 237
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "encodedIndex":I
    .restart local v16    # "encodedIndex":I
    shl-int/lit8 v22, v4, 0x2

    shr-int/lit8 v23, v5, 0x4

    or-int v22, v22, v23

    move/from16 v0, v22

    int-to-byte v0, v0

    move/from16 v22, v0

    aput-byte v22, v15, v17

    .line 238
    add-int/lit8 v17, v16, 0x1

    .end local v16    # "encodedIndex":I
    .restart local v17    # "encodedIndex":I
    and-int/lit8 v22, v5, 0xf

    shl-int/lit8 v22, v22, 0x4

    shr-int/lit8 v23, v6, 0x2

    and-int/lit8 v23, v23, 0xf

    or-int v22, v22, v23

    move/from16 v0, v22

    int-to-byte v0, v0

    move/from16 v22, v0

    aput-byte v22, v15, v16

    .line 239
    add-int/lit8 v16, v17, 0x1

    .end local v17    # "encodedIndex":I
    .restart local v16    # "encodedIndex":I
    shl-int/lit8 v22, v6, 0x6

    or-int v22, v22, v7

    move/from16 v0, v22

    int-to-byte v0, v0

    move/from16 v22, v0

    aput-byte v22, v15, v17

    move-object/from16 v21, v15

    .line 243
    goto/16 :goto_0
.end method

.method public static encode([B)Ljava/lang/String;
    .locals 21
    .param p0, "binaryData"    # [B

    .prologue
    .line 71
    if-nez p0, :cond_0

    .line 72
    const/16 v19, 0x0

    .line 142
    :goto_0
    return-object v19

    .line 75
    :cond_0
    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v19, v0

    mul-int/lit8 v13, v19, 0x8

    .line 76
    .local v13, "lengthDataBits":I
    if-nez v13, :cond_1

    .line 77
    const-string v19, ""

    goto :goto_0

    .line 80
    :cond_1
    rem-int/lit8 v9, v13, 0x18

    .line 81
    .local v9, "fewerThan24bits":I
    div-int/lit8 v15, v13, 0x18

    .line 82
    .local v15, "numberTriplets":I
    if-eqz v9, :cond_2

    add-int/lit8 v14, v15, 0x1

    .line 84
    .local v14, "numberQuartet":I
    :goto_1
    const/4 v6, 0x0

    .line 86
    .local v6, "encodedData":[C
    mul-int/lit8 v19, v14, 0x4

    move/from16 v0, v19

    new-array v6, v0, [C

    .line 88
    const/4 v11, 0x0

    .local v11, "k":B
    const/4 v12, 0x0

    .local v12, "l":B
    const/4 v1, 0x0

    .local v1, "b1":B
    const/4 v2, 0x0

    .local v2, "b2":B
    const/4 v3, 0x0

    .line 90
    .local v3, "b3":B
    const/4 v7, 0x0

    .line 91
    .local v7, "encodedIndex":I
    const/4 v4, 0x0

    .line 93
    .local v4, "dataIndex":I
    const/4 v10, 0x0

    .local v10, "i":I
    move v5, v4

    .end local v4    # "dataIndex":I
    .local v5, "dataIndex":I
    move v8, v7

    .end local v7    # "encodedIndex":I
    .local v8, "encodedIndex":I
    :goto_2
    if-lt v10, v15, :cond_3

    .line 115
    const/16 v19, 0x8

    move/from16 v0, v19

    if-ne v9, v0, :cond_8

    .line 116
    aget-byte v1, p0, v5

    .line 117
    and-int/lit8 v19, v1, 0x3

    move/from16 v0, v19

    int-to-byte v11, v0

    .line 119
    and-int/lit8 v19, v1, -0x80

    if-nez v19, :cond_7

    shr-int/lit8 v19, v1, 0x2

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v16, v0

    .line 121
    .local v16, "val1":B
    :goto_3
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "encodedIndex":I
    .restart local v7    # "encodedIndex":I
    sget-object v19, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    aget-char v19, v19, v16

    aput-char v19, v6, v8

    .line 122
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "encodedIndex":I
    .restart local v8    # "encodedIndex":I
    sget-object v19, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    shl-int/lit8 v20, v11, 0x4

    aget-char v19, v19, v20

    aput-char v19, v6, v7

    .line 123
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "encodedIndex":I
    .restart local v7    # "encodedIndex":I
    sget-char v19, Lcom/heitao/platform/pay/alipay/Base64;->PAD:C

    aput-char v19, v6, v8

    .line 124
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "encodedIndex":I
    .restart local v8    # "encodedIndex":I
    sget-char v19, Lcom/heitao/platform/pay/alipay/Base64;->PAD:C

    aput-char v19, v6, v7

    move v7, v8

    .line 142
    .end local v8    # "encodedIndex":I
    .end local v16    # "val1":B
    .restart local v7    # "encodedIndex":I
    :goto_4
    new-instance v19, Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Ljava/lang/String;-><init>([C)V

    goto :goto_0

    .end local v1    # "b1":B
    .end local v2    # "b2":B
    .end local v3    # "b3":B
    .end local v5    # "dataIndex":I
    .end local v6    # "encodedData":[C
    .end local v7    # "encodedIndex":I
    .end local v10    # "i":I
    .end local v11    # "k":B
    .end local v12    # "l":B
    .end local v14    # "numberQuartet":I
    :cond_2
    move v14, v15

    .line 83
    goto :goto_1

    .line 94
    .restart local v1    # "b1":B
    .restart local v2    # "b2":B
    .restart local v3    # "b3":B
    .restart local v5    # "dataIndex":I
    .restart local v6    # "encodedData":[C
    .restart local v8    # "encodedIndex":I
    .restart local v10    # "i":I
    .restart local v11    # "k":B
    .restart local v12    # "l":B
    .restart local v14    # "numberQuartet":I
    :cond_3
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dataIndex":I
    .restart local v4    # "dataIndex":I
    aget-byte v1, p0, v5

    .line 95
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dataIndex":I
    .restart local v5    # "dataIndex":I
    aget-byte v2, p0, v4

    .line 96
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dataIndex":I
    .restart local v4    # "dataIndex":I
    aget-byte v3, p0, v5

    .line 98
    and-int/lit8 v19, v2, 0xf

    move/from16 v0, v19

    int-to-byte v12, v0

    .line 99
    and-int/lit8 v19, v1, 0x3

    move/from16 v0, v19

    int-to-byte v11, v0

    .line 101
    and-int/lit8 v19, v1, -0x80

    if-nez v19, :cond_4

    shr-int/lit8 v19, v1, 0x2

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v16, v0

    .line 103
    .restart local v16    # "val1":B
    :goto_5
    and-int/lit8 v19, v2, -0x80

    if-nez v19, :cond_5

    shr-int/lit8 v19, v2, 0x4

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v17, v0

    .line 105
    .local v17, "val2":B
    :goto_6
    and-int/lit8 v19, v3, -0x80

    if-nez v19, :cond_6

    shr-int/lit8 v19, v3, 0x6

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v18, v0

    .line 108
    .local v18, "val3":B
    :goto_7
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "encodedIndex":I
    .restart local v7    # "encodedIndex":I
    sget-object v19, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    aget-char v19, v19, v16

    aput-char v19, v6, v8

    .line 109
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "encodedIndex":I
    .restart local v8    # "encodedIndex":I
    sget-object v19, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    shl-int/lit8 v20, v11, 0x4

    or-int v20, v20, v17

    aget-char v19, v19, v20

    aput-char v19, v6, v7

    .line 110
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "encodedIndex":I
    .restart local v7    # "encodedIndex":I
    sget-object v19, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    shl-int/lit8 v20, v12, 0x2

    or-int v20, v20, v18

    aget-char v19, v19, v20

    aput-char v19, v6, v8

    .line 111
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "encodedIndex":I
    .restart local v8    # "encodedIndex":I
    sget-object v19, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    and-int/lit8 v20, v3, 0x3f

    aget-char v19, v19, v20

    aput-char v19, v6, v7

    .line 93
    add-int/lit8 v10, v10, 0x1

    move v5, v4

    .end local v4    # "dataIndex":I
    .restart local v5    # "dataIndex":I
    goto/16 :goto_2

    .line 102
    .end local v5    # "dataIndex":I
    .end local v16    # "val1":B
    .end local v17    # "val2":B
    .end local v18    # "val3":B
    .restart local v4    # "dataIndex":I
    :cond_4
    shr-int/lit8 v19, v1, 0x2

    move/from16 v0, v19

    xor-int/lit16 v0, v0, 0xc0

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v16, v0

    goto :goto_5

    .line 104
    .restart local v16    # "val1":B
    :cond_5
    shr-int/lit8 v19, v2, 0x4

    move/from16 v0, v19

    xor-int/lit16 v0, v0, 0xf0

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v17, v0

    goto :goto_6

    .line 106
    .restart local v17    # "val2":B
    :cond_6
    shr-int/lit8 v19, v3, 0x6

    move/from16 v0, v19

    xor-int/lit16 v0, v0, 0xfc

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v18, v0

    goto :goto_7

    .line 120
    .end local v4    # "dataIndex":I
    .end local v16    # "val1":B
    .end local v17    # "val2":B
    .restart local v5    # "dataIndex":I
    :cond_7
    shr-int/lit8 v19, v1, 0x2

    move/from16 v0, v19

    xor-int/lit16 v0, v0, 0xc0

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v16, v0

    goto/16 :goto_3

    .line 125
    :cond_8
    const/16 v19, 0x10

    move/from16 v0, v19

    if-ne v9, v0, :cond_9

    .line 126
    aget-byte v1, p0, v5

    .line 127
    add-int/lit8 v19, v5, 0x1

    aget-byte v2, p0, v19

    .line 128
    and-int/lit8 v19, v2, 0xf

    move/from16 v0, v19

    int-to-byte v12, v0

    .line 129
    and-int/lit8 v19, v1, 0x3

    move/from16 v0, v19

    int-to-byte v11, v0

    .line 131
    and-int/lit8 v19, v1, -0x80

    if-nez v19, :cond_a

    shr-int/lit8 v19, v1, 0x2

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v16, v0

    .line 133
    .restart local v16    # "val1":B
    :goto_8
    and-int/lit8 v19, v2, -0x80

    if-nez v19, :cond_b

    shr-int/lit8 v19, v2, 0x4

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v17, v0

    .line 136
    .restart local v17    # "val2":B
    :goto_9
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "encodedIndex":I
    .restart local v7    # "encodedIndex":I
    sget-object v19, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    aget-char v19, v19, v16

    aput-char v19, v6, v8

    .line 137
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "encodedIndex":I
    .restart local v8    # "encodedIndex":I
    sget-object v19, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    shl-int/lit8 v20, v11, 0x4

    or-int v20, v20, v17

    aget-char v19, v19, v20

    aput-char v19, v6, v7

    .line 138
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "encodedIndex":I
    .restart local v7    # "encodedIndex":I
    sget-object v19, Lcom/heitao/platform/pay/alipay/Base64;->lookUpBase64Alphabet:[C

    shl-int/lit8 v20, v12, 0x2

    aget-char v19, v19, v20

    aput-char v19, v6, v8

    .line 139
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "encodedIndex":I
    .restart local v8    # "encodedIndex":I
    sget-char v19, Lcom/heitao/platform/pay/alipay/Base64;->PAD:C

    aput-char v19, v6, v7

    .end local v16    # "val1":B
    .end local v17    # "val2":B
    :cond_9
    move v7, v8

    .end local v8    # "encodedIndex":I
    .restart local v7    # "encodedIndex":I
    goto/16 :goto_4

    .line 132
    .end local v7    # "encodedIndex":I
    .restart local v8    # "encodedIndex":I
    :cond_a
    shr-int/lit8 v19, v1, 0x2

    move/from16 v0, v19

    xor-int/lit16 v0, v0, 0xc0

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v16, v0

    goto :goto_8

    .line 134
    .restart local v16    # "val1":B
    :cond_b
    shr-int/lit8 v19, v2, 0x4

    move/from16 v0, v19

    xor-int/lit16 v0, v0, 0xf0

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v17, v0

    goto :goto_9
.end method

.method private static isData(C)Z
    .locals 2
    .param p0, "octect"    # C

    .prologue
    .line 59
    const/16 v0, 0x80

    if-ge p0, v0, :cond_0

    sget-object v0, Lcom/heitao/platform/pay/alipay/Base64;->base64Alphabet:[B

    aget-byte v0, v0, p0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isPad(C)Z
    .locals 1
    .param p0, "octect"    # C

    .prologue
    .line 55
    sget-char v0, Lcom/heitao/platform/pay/alipay/Base64;->PAD:C

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isWhiteSpace(C)Z
    .locals 1
    .param p0, "octect"    # C

    .prologue
    .line 51
    const/16 v0, 0x20

    if-eq p0, v0, :cond_0

    const/16 v0, 0xd

    if-eq p0, v0, :cond_0

    const/16 v0, 0xa

    if-eq p0, v0, :cond_0

    const/16 v0, 0x9

    if-eq p0, v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static removeWhiteSpace([C)I
    .locals 5
    .param p0, "data"    # [C

    .prologue
    .line 254
    if-nez p0, :cond_1

    .line 255
    const/4 v3, 0x0

    .line 266
    :cond_0
    return v3

    .line 259
    :cond_1
    const/4 v2, 0x0

    .line 260
    .local v2, "newSize":I
    array-length v1, p0

    .line 261
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    move v3, v2

    .end local v2    # "newSize":I
    .local v3, "newSize":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 262
    aget-char v4, p0, v0

    invoke-static {v4}, Lcom/heitao/platform/pay/alipay/Base64;->isWhiteSpace(C)Z

    move-result v4

    if-nez v4, :cond_2

    .line 263
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "newSize":I
    .restart local v2    # "newSize":I
    aget-char v4, p0, v0

    aput-char v4, p0, v3

    .line 261
    :goto_1
    add-int/lit8 v0, v0, 0x1

    move v3, v2

    .end local v2    # "newSize":I
    .restart local v3    # "newSize":I
    goto :goto_0

    :cond_2
    move v2, v3

    .end local v3    # "newSize":I
    .restart local v2    # "newSize":I
    goto :goto_1
.end method
