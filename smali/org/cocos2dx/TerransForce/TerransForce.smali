.class public Lorg/cocos2dx/TerransForce/TerransForce;
.super Lorg/cocos2dx/lib/Cocos2dxActivity;
.source "TerransForce.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field public static final SER_KEY:Ljava/lang/String; = "org.cocos2dx.TerransForce.TerransForce.message"

.field private static final TAG:Ljava/lang/String;

.field public static final convert:I = 0x3e8

.field protected static mContext:Landroid/app/Activity;

.field public static mNotificationObj:Lorg/cocos2dx/TerransForce/TerransForce;

.field private static mView:Landroid/view/View;


# instance fields
.field private mAccelerometer:Landroid/hardware/Sensor;

.field mCalendar:Ljava/util/Calendar;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mX:I

.field private mY:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 71
    sput-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    .line 72
    sput-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mView:Landroid/view/View;

    .line 76
    sput-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mNotificationObj:Lorg/cocos2dx/TerransForce/TerransForce;

    .line 78
    const-class v0, Lorg/cocos2dx/TerransForce/TerransForce;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->TAG:Ljava/lang/String;

    .line 439
    const-string v0, "GCloudVoice"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 440
    const-string v0, "TerransForce"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 441
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/view/View;
    .locals 1

    .prologue
    .line 69
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mView:Landroid/view/View;

    return-object v0
.end method

.method private convert(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 10
    .param p1, "a"    # Landroid/graphics/Bitmap;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/4 v1, 0x0

    .line 129
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 131
    .local v3, "w":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 133
    .local v4, "h":I
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, p3, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 134
    .local v9, "newb":Landroid/graphics/Bitmap;
    new-instance v7, Landroid/graphics/Canvas;

    invoke-direct {v7, v9}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 135
    .local v7, "cv":Landroid/graphics/Canvas;
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 136
    .local v5, "m":Landroid/graphics/Matrix;
    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v5, v0, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 138
    const/4 v6, 0x1

    move-object v0, p1

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 139
    .local v8, "new2":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-direct {v0, v1, v1, v2, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v1, v1, p2, p3}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v1, 0x0

    invoke-virtual {v7, v8, v0, v2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 141
    return-object v9
.end method

.method private correctWinSize()V
    .locals 31

    .prologue
    .line 145
    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/TerransForce/TerransForce;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v26

    .line 146
    .local v26, "wm":Landroid/view/WindowManager;
    invoke-interface/range {v26 .. v26}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Landroid/view/Display;->getWidth()I

    move-result v17

    .line 147
    .local v17, "nWidth":I
    invoke-interface/range {v26 .. v26}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Landroid/view/Display;->getHeight()I

    move-result v14

    .line 148
    .local v14, "nHeight":I
    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v24, v0

    .line 149
    .local v24, "width":F
    int-to-float v9, v14

    .line 150
    .local v9, "height":F
    const/high16 v25, 0x44700000    # 960.0f

    .local v25, "width0":F
    const/16 v10, 0x280

    .line 152
    .local v10, "height0":I
    div-float v27, v9, v24

    int-to-float v0, v10

    move/from16 v28, v0

    div-float v28, v28, v25

    cmpl-float v27, v27, v28

    if-lez v27, :cond_0

    .line 153
    new-instance v18, Landroid/graphics/BitmapFactory$Options;

    invoke-direct/range {v18 .. v18}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 154
    .local v18, "options":Landroid/graphics/BitmapFactory$Options;
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, v18

    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 155
    invoke-virtual/range {p0 .. p0}, Lorg/cocos2dx/TerransForce/TerransForce;->getResources()Landroid/content/res/Resources;

    move-result-object v27

    const v28, 0x7f02003e

    move-object/from16 v0, v27

    move/from16 v1, v28

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 156
    .local v7, "bmp":Landroid/graphics/Bitmap;
    int-to-float v0, v10

    move/from16 v27, v0

    mul-float v27, v27, v24

    div-float v27, v27, v25

    sub-float v27, v9, v27

    const/high16 v28, 0x3f000000    # 0.5f

    mul-float v6, v27, v28

    .line 157
    .local v6, "bannerH":F
    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move/from16 v27, v0

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    div-float v22, v24, v27

    .line 158
    .local v22, "scaleX":F
    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move/from16 v27, v0

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    div-float v23, v6, v27

    .line 159
    .local v23, "scaleY":F
    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->max(FF)F

    move-result v21

    .line 160
    .local v21, "scale":F
    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move/from16 v27, v0

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    mul-float v27, v27, v21

    move/from16 v0, v27

    float-to-double v0, v0

    move-wide/from16 v28, v0

    invoke-static/range {v28 .. v29}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v28

    move-wide/from16 v0, v28

    double-to-int v0, v0

    move/from16 v16, v0

    .line 161
    .local v16, "nImgWidth":I
    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move/from16 v27, v0

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    mul-float v27, v27, v21

    move/from16 v0, v27

    float-to-double v0, v0

    move-wide/from16 v28, v0

    invoke-static/range {v28 .. v29}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v28

    move-wide/from16 v0, v28

    double-to-int v15, v0

    .line 162
    .local v15, "nImgHeight":I
    float-to-double v0, v6

    move-wide/from16 v28, v0

    invoke-static/range {v28 .. v29}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v28

    move-wide/from16 v0, v28

    double-to-int v13, v0

    .line 163
    .local v13, "nBannerH":I
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v7, v1, v15}, Lorg/cocos2dx/TerransForce/TerransForce;->convert(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 164
    .local v8, "bmpTarget":Landroid/graphics/Bitmap;
    new-instance v19, Landroid/widget/FrameLayout$LayoutParams;

    move-object/from16 v0, v19

    move/from16 v1, v17

    invoke-direct {v0, v1, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 165
    .local v19, "params":Landroid/widget/FrameLayout$LayoutParams;
    move-object/from16 v0, v19

    iput v15, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 166
    move/from16 v0, v16

    move-object/from16 v1, v19

    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 167
    const/16 v27, 0x0

    sub-int v28, v13, v15

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v27

    move/from16 v2, v28

    move/from16 v3, v29

    move/from16 v4, v30

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 171
    new-instance v11, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 172
    .local v11, "imgView":Landroid/widget/ImageView;
    invoke-virtual {v11, v8}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 173
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v11, v1}, Lorg/cocos2dx/TerransForce/TerransForce;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    new-instance v12, Landroid/widget/ImageView;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 177
    .local v12, "imgView0":Landroid/widget/ImageView;
    new-instance v20, Landroid/widget/FrameLayout$LayoutParams;

    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-direct {v0, v1, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 178
    .local v20, "params0":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v27, 0x0

    sub-int v28, v14, v13

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v27

    move/from16 v2, v28

    move/from16 v3, v29

    move/from16 v4, v30

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 179
    move-object/from16 v0, v20

    iput v15, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 180
    move/from16 v0, v16

    move-object/from16 v1, v20

    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 183
    const v27, 0x7f02003e

    move/from16 v0, v27

    invoke-virtual {v12, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 184
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v12, v1}, Lorg/cocos2dx/TerransForce/TerransForce;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 186
    .end local v6    # "bannerH":F
    .end local v7    # "bmp":Landroid/graphics/Bitmap;
    .end local v8    # "bmpTarget":Landroid/graphics/Bitmap;
    .end local v11    # "imgView":Landroid/widget/ImageView;
    .end local v12    # "imgView0":Landroid/widget/ImageView;
    .end local v13    # "nBannerH":I
    .end local v15    # "nImgHeight":I
    .end local v16    # "nImgWidth":I
    .end local v18    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v19    # "params":Landroid/widget/FrameLayout$LayoutParams;
    .end local v20    # "params0":Landroid/widget/FrameLayout$LayoutParams;
    .end local v21    # "scale":F
    .end local v22    # "scaleX":F
    .end local v23    # "scaleY":F
    :cond_0
    return-void
.end method

.method public static disableDeviceSleep(Z)V
    .locals 2
    .param p0, "notSleep"    # Z

    .prologue
    .line 238
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mView:Landroid/view/View;

    if-eqz v0, :cond_0

    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 247
    :cond_0
    :goto_0
    return-void

    .line 240
    :cond_1
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    new-instance v1, Lorg/cocos2dx/TerransForce/TerransForce$1;

    invoke-direct {v1, p0}, Lorg/cocos2dx/TerransForce/TerransForce$1;-><init>(Z)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static enableScreenAutoRotate(Z)V
    .locals 2
    .param p0, "autoRotate"    # Z

    .prologue
    .line 250
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 257
    :goto_0
    return-void

    .line 252
    :cond_0
    if-eqz p0, :cond_1

    .line 253
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_0

    .line 255
    :cond_1
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_0
.end method

.method public static pushMessage(Ljava/lang/String;II)V
    .locals 4
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "mark"    # I
    .param p2, "repeats"    # I

    .prologue
    .line 312
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TFNotification.passFromJni()"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 314
    new-instance v0, Lorg/cocos2dx/TerransForce/TFNotificationMessage;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;-><init>()V

    .line 316
    .local v0, "nmObj":Lorg/cocos2dx/TerransForce/TFNotificationMessage;
    invoke-virtual {v0, p0}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->setMessage(Ljava/lang/String;)V

    .line 318
    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->setMark(J)V

    .line 320
    invoke-virtual {v0, p2}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->setId(I)V

    .line 322
    invoke-virtual {v0, p2}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->setRepeatTimes(I)V

    .line 324
    sget-object v1, Lorg/cocos2dx/TerransForce/TerransForce;->mNotificationObj:Lorg/cocos2dx/TerransForce/TerransForce;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/TerransForce/TerransForce;->SerializeMethod(Lorg/cocos2dx/TerransForce/TFNotificationMessage;)V

    .line 326
    return-void
.end method

.method public static removeNotification()V
    .locals 2

    .prologue
    .line 329
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "TFNotification.removeNotification()"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 330
    return-void
.end method

.method public static setScreenOrientation(F)V
    .locals 2
    .param p0, "orientaion"    # F

    .prologue
    .line 260
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 269
    :cond_0
    :goto_0
    return-void

    .line 262
    :cond_1
    float-to-int v0, p0

    if-nez v0, :cond_2

    .line 264
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_0

    .line 265
    :cond_2
    float-to-int v0, p0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 267
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_0
.end method


# virtual methods
.method public SerializeMethod(Lorg/cocos2dx/TerransForce/TFNotificationMessage;)V
    .locals 14
    .param p1, "message"    # Lorg/cocos2dx/TerransForce/TFNotificationMessage;

    .prologue
    const-wide/16 v12, 0x3e8

    const/4 v1, 0x1

    .line 289
    const-string v4, "alarm"

    invoke-virtual {p0, v4}, Lorg/cocos2dx/TerransForce/TerransForce;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 291
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    new-instance v8, Landroid/content/Intent;

    const-class v4, Lorg/cocos2dx/TerransForce/TFBroadcastReceiver;

    invoke-direct {v8, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 292
    .local v8, "intent":Landroid/content/Intent;
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 293
    .local v7, "bundle":Landroid/os/Bundle;
    const-string v4, "org.cocos2dx.TerransForce.TerransForce.message"

    invoke-virtual {v7, v4, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 294
    invoke-virtual {v8, v7}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 295
    const/4 v4, 0x0

    const/high16 v5, 0x8000000

    invoke-static {p0, v4, v8, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 298
    .local v6, "pendingintent":Landroid/app/PendingIntent;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p1}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->getMark()J

    move-result-wide v10

    mul-long/2addr v10, v12

    add-long v2, v4, v10

    .line 301
    .local v2, "triggerAtMillis":J
    invoke-virtual {p1}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->getRepeatTimes()I

    move-result v4

    if-gt v4, v1, :cond_0

    .line 302
    const-string v4, "MyService"

    const-string v5, "alarmManager "

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    invoke-virtual {v0, v1, v2, v3, v6}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 309
    :goto_0
    return-void

    .line 305
    :cond_0
    const-string v4, "MyService"

    const-string v5, "alarmManager repeat"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    invoke-virtual {p1}, Lorg/cocos2dx/TerransForce/TFNotificationMessage;->getMark()J

    move-result-wide v4

    mul-long/2addr v4, v12

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    goto :goto_0
.end method

.method public disable()V
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 223
    return-void
.end method

.method public enable()V
    .locals 3

    .prologue
    .line 212
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    .line 213
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mAccelerometer:Landroid/hardware/Sensor;

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 219
    :goto_0
    return-void

    .line 216
    :cond_0
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mAccelerometer:Landroid/hardware/Sensor;

    const/16 v2, 0x2710

    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    goto :goto_0
.end method

.method public getMaxValue(III)I
    .locals 1
    .param p1, "px"    # I
    .param p2, "py"    # I
    .param p3, "pz"    # I

    .prologue
    .line 495
    const/4 v0, 0x0

    .line 496
    .local v0, "max":I
    if-le p1, p2, :cond_1

    if-le p1, p3, :cond_1

    .line 497
    move v0, p1

    .line 504
    :cond_0
    :goto_0
    return v0

    .line 498
    :cond_1
    if-le p2, p1, :cond_2

    if-le p2, p3, :cond_2

    .line 499
    move v0, p2

    goto :goto_0

    .line 500
    :cond_2
    if-le p3, p1, :cond_0

    if-le p3, p2, :cond_0

    .line 501
    move v0, p3

    goto :goto_0
.end method

.method public initSensorManager()V
    .locals 2

    .prologue
    .line 189
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mSensorManager:Landroid/hardware/SensorManager;

    .line 190
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mAccelerometer:Landroid/hardware/Sensor;

    .line 209
    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 511
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 386
    invoke-super {p0, p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 388
    invoke-static {p1, p2, p3}, Lcom/heitao/api/HTGameProxy;->onActivityResult(IILandroid/content/Intent;)V

    .line 389
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 394
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 396
    invoke-static {p1}, Lcom/heitao/api/HTGameProxy;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 397
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 98
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onCreate(Landroid/os/Bundle;)V

    .line 99
    invoke-virtual {p0}, Lorg/cocos2dx/TerransForce/TerransForce;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "423acd7ff6"

    invoke-static {v0, v1, v2}, Lcom/tencent/bugly/crashreport/CrashReport;->initCrashReport(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 100
    invoke-static {}, Lcom/tencent/gcloud/voice/GCloudVoiceEngine;->getInstance()Lcom/tencent/gcloud/voice/GCloudVoiceEngine;

    move-result-object v0

    invoke-virtual {p0}, Lorg/cocos2dx/TerransForce/TerransForce;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/tencent/gcloud/voice/GCloudVoiceEngine;->init(Landroid/content/Context;Landroid/app/Activity;)I

    .line 102
    invoke-direct {p0}, Lorg/cocos2dx/TerransForce/TerransForce;->correctWinSize()V

    .line 103
    invoke-virtual {p0}, Lorg/cocos2dx/TerransForce/TerransForce;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    sput-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mView:Landroid/view/View;

    .line 104
    sget-object v0, Lorg/cocos2dx/TerransForce/TerransForce;->mView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setKeepScreenOn(Z)V

    .line 106
    invoke-static {p0}, Lorg/cocos2dx/TerransForce/TFWebView;->setActivity(Landroid/app/Activity;)V

    .line 109
    sput-object p0, Lorg/cocos2dx/TerransForce/TerransForce;->mNotificationObj:Lorg/cocos2dx/TerransForce/TerransForce;

    .line 111
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-static {v0}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->init(Landroid/app/Activity;)V

    .line 121
    invoke-virtual {p0}, Lorg/cocos2dx/TerransForce/TerransForce;->initSensorManager()V

    .line 124
    return-void
.end method

.method public onCreateView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    .locals 7

    .prologue
    const/4 v1, 0x5

    .line 226
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 228
    .local v0, "glSurfaceView":Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    const/4 v2, 0x6

    const/4 v4, 0x0

    const/16 v5, 0x10

    const/16 v6, 0x8

    move v3, v1

    invoke-virtual/range {v0 .. v6}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setEGLConfigChooser(IIIIII)V

    .line 229
    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    sput-object v1, Lorg/cocos2dx/TerransForce/TerransForce;->mContext:Landroid/app/Activity;

    .line 231
    invoke-static {p0}, Lorg/cocos2dx/plugin/PluginWrapper;->init(Landroid/content/Context;)V

    .line 232
    invoke-static {v0}, Lorg/cocos2dx/plugin/PluginWrapper;->setGLSurfaceView(Landroid/opengl/GLSurfaceView;)V

    .line 233
    return-object v0
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 370
    invoke-static {}, Lcom/heitao/api/HTGameProxy;->onDestroy()V

    .line 372
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onDestroy()V

    .line 373
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "pKeyCode"    # I
    .param p2, "pKeyEvent"    # Landroid/view/KeyEvent;

    .prologue
    .line 427
    packed-switch p1, :pswitch_data_0

    .line 433
    invoke-super {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    :goto_0
    return v0

    .line 430
    :pswitch_0
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->loginExit()V

    .line 431
    const/4 v0, 0x1

    goto :goto_0

    .line 427
    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 410
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 412
    invoke-static {p1}, Lcom/heitao/api/HTGameProxy;->onNewIntent(Landroid/content/Intent;)V

    .line 413
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 337
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onPause()V

    .line 339
    invoke-static {}, Lcom/heitao/api/HTGameProxy;->onPause()V

    .line 340
    return-void
.end method

.method protected onRestart()V
    .locals 0

    .prologue
    .line 378
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onRestart()V

    .line 380
    invoke-static {}, Lcom/heitao/api/HTGameProxy;->onRestart()V

    .line 381
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 345
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onResume()V

    .line 347
    invoke-static {}, Lcom/heitao/api/HTGameProxy;->onResume()V

    .line 348
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 419
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 421
    const-string v0, "onSaveInstanceState"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V

    .line 422
    invoke-static {}, Lcom/heitao/notification/HTNotificationCenter;->getInstance()Lcom/heitao/notification/HTNotificationCenter;

    move-result-object v0

    const-string v1, "ON_SaveInstanceState"

    invoke-virtual {v0, v1, p1}, Lcom/heitao/notification/HTNotificationCenter;->postNotification(Ljava/lang/String;Ljava/lang/Object;)V

    .line 423
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 6
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v5, 0x1

    .line 447
    iget-object v3, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    if-nez v3, :cond_1

    .line 483
    :cond_0
    :goto_0
    return-void

    .line 450
    :cond_1
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->isOpenAccelerometer()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 453
    iget-object v3, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v3}, Landroid/hardware/Sensor;->getType()I

    move-result v3

    if-ne v3, v5, :cond_0

    .line 454
    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v4, 0x0

    aget v3, v3, v4

    float-to-int v1, v3

    .line 455
    .local v1, "x":I
    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v3, v5

    float-to-int v2, v3

    .line 470
    .local v2, "y":I
    iget v3, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mX:I

    if-ne v3, v1, :cond_2

    iget v3, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mY:I

    if-eq v3, v2, :cond_0

    .line 472
    :cond_2
    const/4 v0, 0x0

    .line 473
    .local v0, "num":I
    add-int/lit8 v3, v1, 0xa

    mul-int/lit8 v3, v3, 0x64

    add-int/lit16 v3, v3, 0xc8

    add-int/lit8 v4, v2, 0xa

    add-int v0, v3, v4

    .line 474
    const/16 v3, 0xc8

    if-ge v0, v3, :cond_3

    .line 475
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onSensorChanged...x:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "y:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 478
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "x:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "y:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V

    .line 479
    iput v1, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mX:I

    .line 480
    iput v2, p0, Lorg/cocos2dx/TerransForce/TerransForce;->mY:I

    goto :goto_0
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 353
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onStart()V

    .line 355
    invoke-static {}, Lcom/heitao/api/HTGameProxy;->onStart()V

    .line 356
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 361
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onStop()V

    .line 363
    invoke-static {}, Lcom/heitao/api/HTGameProxy;->onStop()V

    .line 364
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasFocus"    # Z

    .prologue
    .line 402
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onWindowFocusChanged(Z)V

    .line 404
    invoke-static {p1}, Lcom/heitao/api/HTGameProxy;->onWindowFocusChanged(Z)V

    .line 405
    return-void
.end method
