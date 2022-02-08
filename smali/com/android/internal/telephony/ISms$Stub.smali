.class public abstract Lcom/android/internal/telephony/ISms$Stub;
.super Landroid/os/Binder;
.source "ISms.java"

# interfaces
.implements Lcom/android/internal/telephony/ISms;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/ISms;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/ISms$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.android.internal.telephony.ISms"

.field static final TRANSACTION_copyMessageToIccEf:I = 0x2

.field static final TRANSACTION_disableCellBroadcast:I = 0x7

.field static final TRANSACTION_disableCellBroadcastRange:I = 0x9

.field static final TRANSACTION_enableCellBroadcast:I = 0x6

.field static final TRANSACTION_enableCellBroadcastRange:I = 0x8

.field static final TRANSACTION_sendData:I = 0x3

.field static final TRANSACTION_sendMultipartText:I = 0x5

.field static final TRANSACTION_sendText:I = 0x4

.field static final TRANSACTION_updateMessageOnIccEf:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 29
    const-string v0, "com.android.internal.telephony.ISms"

    invoke-virtual {p0, p0, v0}, Lcom/android/internal/telephony/ISms$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 30
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    .line 37
    if-nez p0, :cond_0

    .line 38
    const/4 v0, 0x0

    .line 44
    :goto_0
    return-object v0

    .line 40
    :cond_0
    const-string v1, "com.android.internal.telephony.ISms"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 41
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/android/internal/telephony/ISms;

    if-eqz v1, :cond_1

    .line 42
    check-cast v0, Lcom/android/internal/telephony/ISms;

    goto :goto_0

    .line 44
    :cond_1
    new-instance v0, Lcom/android/internal/telephony/ISms$Stub$Proxy;

    .end local v0    # "iin":Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/android/internal/telephony/ISms$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    .line 48
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 15
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 52
    sparse-switch p1, :sswitch_data_0

    .line 205
    invoke-super/range {p0 .. p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    :goto_0
    return v1

    .line 56
    :sswitch_0
    const-string v1, "com.android.internal.telephony.ISms"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 57
    const/4 v1, 0x1

    goto :goto_0

    .line 61
    :sswitch_1
    const-string v1, "com.android.internal.telephony.ISms"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 63
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 65
    .local v2, "_arg0":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 67
    .local v3, "_arg1":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v4

    .line 68
    .local v4, "_arg2":[B
    invoke-virtual {p0, v2, v3, v4}, Lcom/android/internal/telephony/ISms$Stub;->updateMessageOnIccEf(II[B)Z

    move-result v14

    .line 69
    .local v14, "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 70
    if-eqz v14, :cond_0

    const/4 v1, 0x1

    :goto_1
    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 71
    const/4 v1, 0x1

    goto :goto_0

    .line 70
    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    .line 75
    .end local v2    # "_arg0":I
    .end local v3    # "_arg1":I
    .end local v4    # "_arg2":[B
    .end local v14    # "_result":Z
    :sswitch_2
    const-string v1, "com.android.internal.telephony.ISms"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 77
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 79
    .restart local v2    # "_arg0":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v3

    .line 81
    .local v3, "_arg1":[B
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v4

    .line 82
    .restart local v4    # "_arg2":[B
    invoke-virtual {p0, v2, v3, v4}, Lcom/android/internal/telephony/ISms$Stub;->copyMessageToIccEf(I[B[B)Z

    move-result v14

    .line 83
    .restart local v14    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 84
    if-eqz v14, :cond_1

    const/4 v1, 0x1

    :goto_2
    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 85
    const/4 v1, 0x1

    goto :goto_0

    .line 84
    :cond_1
    const/4 v1, 0x0

    goto :goto_2

    .line 89
    .end local v2    # "_arg0":I
    .end local v3    # "_arg1":[B
    .end local v4    # "_arg2":[B
    .end local v14    # "_result":Z
    :sswitch_3
    const-string v1, "com.android.internal.telephony.ISms"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 91
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 93
    .local v2, "_arg0":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 95
    .local v3, "_arg1":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 97
    .local v4, "_arg2":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v5

    .line 99
    .local v5, "_arg3":[B
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_2

    .line 100
    sget-object v1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    move-object/from16 v0, p2

    invoke-interface {v1, v0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/PendingIntent;

    .line 106
    .local v6, "_arg4":Landroid/app/PendingIntent;
    :goto_3
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_3

    .line 107
    sget-object v1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    move-object/from16 v0, p2

    invoke-interface {v1, v0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/app/PendingIntent;

    .local v7, "_arg5":Landroid/app/PendingIntent;
    :goto_4
    move-object v1, p0

    .line 112
    invoke-virtual/range {v1 .. v7}, Lcom/android/internal/telephony/ISms$Stub;->sendData(Ljava/lang/String;Ljava/lang/String;I[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    .line 113
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 114
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 103
    .end local v6    # "_arg4":Landroid/app/PendingIntent;
    .end local v7    # "_arg5":Landroid/app/PendingIntent;
    :cond_2
    const/4 v6, 0x0

    .restart local v6    # "_arg4":Landroid/app/PendingIntent;
    goto :goto_3

    .line 110
    :cond_3
    const/4 v7, 0x0

    .restart local v7    # "_arg5":Landroid/app/PendingIntent;
    goto :goto_4

    .line 118
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":I
    .end local v5    # "_arg3":[B
    .end local v6    # "_arg4":Landroid/app/PendingIntent;
    .end local v7    # "_arg5":Landroid/app/PendingIntent;
    :sswitch_4
    const-string v1, "com.android.internal.telephony.ISms"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 120
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 122
    .restart local v2    # "_arg0":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 124
    .restart local v3    # "_arg1":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 126
    .local v4, "_arg2":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_4

    .line 127
    sget-object v1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    move-object/from16 v0, p2

    invoke-interface {v1, v0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/PendingIntent;

    .line 133
    .local v5, "_arg3":Landroid/app/PendingIntent;
    :goto_5
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_5

    .line 134
    sget-object v1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    move-object/from16 v0, p2

    invoke-interface {v1, v0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/PendingIntent;

    .restart local v6    # "_arg4":Landroid/app/PendingIntent;
    :goto_6
    move-object v1, p0

    .line 139
    invoke-virtual/range {v1 .. v6}, Lcom/android/internal/telephony/ISms$Stub;->sendText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    .line 140
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 141
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 130
    .end local v5    # "_arg3":Landroid/app/PendingIntent;
    .end local v6    # "_arg4":Landroid/app/PendingIntent;
    :cond_4
    const/4 v5, 0x0

    .restart local v5    # "_arg3":Landroid/app/PendingIntent;
    goto :goto_5

    .line 137
    :cond_5
    const/4 v6, 0x0

    .restart local v6    # "_arg4":Landroid/app/PendingIntent;
    goto :goto_6

    .line 145
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":Ljava/lang/String;
    .end local v4    # "_arg2":Ljava/lang/String;
    .end local v5    # "_arg3":Landroid/app/PendingIntent;
    .end local v6    # "_arg4":Landroid/app/PendingIntent;
    :sswitch_5
    const-string v1, "com.android.internal.telephony.ISms"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 147
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 149
    .restart local v2    # "_arg0":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 151
    .restart local v3    # "_arg1":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v11

    .line 153
    .local v11, "_arg2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v12

    .line 155
    .local v12, "_arg3":Ljava/util/List;, "Ljava/util/List<Landroid/app/PendingIntent;>;"
    sget-object v1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v13

    .local v13, "_arg4":Ljava/util/List;, "Ljava/util/List<Landroid/app/PendingIntent;>;"
    move-object v8, p0

    move-object v9, v2

    move-object v10, v3

    .line 156
    invoke-virtual/range {v8 .. v13}, Lcom/android/internal/telephony/ISms$Stub;->sendMultipartText(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 157
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 158
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 162
    .end local v2    # "_arg0":Ljava/lang/String;
    .end local v3    # "_arg1":Ljava/lang/String;
    .end local v11    # "_arg2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v12    # "_arg3":Ljava/util/List;, "Ljava/util/List<Landroid/app/PendingIntent;>;"
    .end local v13    # "_arg4":Ljava/util/List;, "Ljava/util/List<Landroid/app/PendingIntent;>;"
    :sswitch_6
    const-string v1, "com.android.internal.telephony.ISms"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 164
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 165
    .local v2, "_arg0":I
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/ISms$Stub;->enableCellBroadcast(I)Z

    move-result v14

    .line 166
    .restart local v14    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 167
    if-eqz v14, :cond_6

    const/4 v1, 0x1

    :goto_7
    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 168
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 167
    :cond_6
    const/4 v1, 0x0

    goto :goto_7

    .line 172
    .end local v2    # "_arg0":I
    .end local v14    # "_result":Z
    :sswitch_7
    const-string v1, "com.android.internal.telephony.ISms"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 174
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 175
    .restart local v2    # "_arg0":I
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/ISms$Stub;->disableCellBroadcast(I)Z

    move-result v14

    .line 176
    .restart local v14    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 177
    if-eqz v14, :cond_7

    const/4 v1, 0x1

    :goto_8
    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 178
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 177
    :cond_7
    const/4 v1, 0x0

    goto :goto_8

    .line 182
    .end local v2    # "_arg0":I
    .end local v14    # "_result":Z
    :sswitch_8
    const-string v1, "com.android.internal.telephony.ISms"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 184
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 186
    .restart local v2    # "_arg0":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 187
    .local v3, "_arg1":I
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/ISms$Stub;->enableCellBroadcastRange(II)Z

    move-result v14

    .line 188
    .restart local v14    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 189
    if-eqz v14, :cond_8

    const/4 v1, 0x1

    :goto_9
    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 190
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 189
    :cond_8
    const/4 v1, 0x0

    goto :goto_9

    .line 194
    .end local v2    # "_arg0":I
    .end local v3    # "_arg1":I
    .end local v14    # "_result":Z
    :sswitch_9
    const-string v1, "com.android.internal.telephony.ISms"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 196
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 198
    .restart local v2    # "_arg0":I
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 199
    .restart local v3    # "_arg1":I
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/ISms$Stub;->disableCellBroadcastRange(II)Z

    move-result v14

    .line 200
    .restart local v14    # "_result":Z
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 201
    if-eqz v14, :cond_9

    const/4 v1, 0x1

    :goto_a
    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 202
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 201
    :cond_9
    const/4 v1, 0x0

    goto :goto_a

    .line 52
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0x8 -> :sswitch_8
        0x9 -> :sswitch_9
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
