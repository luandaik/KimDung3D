.class public Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
.super Ljava/lang/Object;
.source "Cocos2dxVideoHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoEventRunnable;,
        Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;
    }
.end annotation


# static fields
.field static final KeyEventBack:I = 0x3e8

.field private static final VideoTaskCreate:I = 0x0

.field private static final VideoTaskFullScreen:I = 0xc

.field private static final VideoTaskKeepRatio:I = 0xb

.field private static final VideoTaskPause:I = 0x5

.field private static final VideoTaskRemove:I = 0x1

.field private static final VideoTaskRestart:I = 0xa

.field private static final VideoTaskResume:I = 0x6

.field private static final VideoTaskSeek:I = 0x8

.field private static final VideoTaskSetRect:I = 0x3

.field private static final VideoTaskSetSource:I = 0x2

.field private static final VideoTaskSetVisible:I = 0x9

.field private static final VideoTaskStart:I = 0x4

.field private static final VideoTaskStop:I = 0x7

.field static mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

.field private static videoTag:I


# instance fields
.field private mActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

.field private mLayout:Landroid/widget/FrameLayout;

.field private sVideoViews:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lorg/cocos2dx/lib/Cocos2dxVideoView;",
            ">;"
        }
    .end annotation
.end field

.field videoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const/4 v0, 0x0

    sput-object v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    .line 55
    const/4 v0, 0x0

    sput v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->videoTag:I

    return-void
.end method

.method constructor <init>(Lorg/cocos2dx/lib/Cocos2dxActivity;Landroid/widget/FrameLayout;)V
    .locals 1
    .param p1, "activity"    # Lorg/cocos2dx/lib/Cocos2dxActivity;
    .param p2, "layout"    # Landroid/widget/FrameLayout;

    .prologue
    const/4 v0, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mLayout:Landroid/widget/FrameLayout;

    .line 42
    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    .line 43
    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    .line 177
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$1;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$1;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->videoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    .line 48
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    .line 49
    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mLayout:Landroid/widget/FrameLayout;

    .line 51
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;)V

    sput-object v0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    .line 52
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    .line 53
    return-void
.end method

.method private _createVideoView(I)V
    .locals 6
    .param p1, "index"    # I

    .prologue
    const/4 v5, -0x2

    .line 196
    const-string v2, "cocos2d-x debug info"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_createVideoView  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-direct {v1, v2, p1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;-><init>(Landroid/content/Context;I)V

    .line 198
    .local v1, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 199
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 202
    .local v0, "lParams":Landroid/widget/FrameLayout$LayoutParams;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setZOrderOnTop(Z)V

    .line 203
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->videoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    invoke-virtual {v1, v2}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setOnCompletionListener(Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;)V

    .line 204
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 205
    const-string v2, "cocos2d-x debug info"

    const-string v3, "_createVideoView end  "

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    return-void
.end method

.method private _pauseVideo(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 286
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 287
    .local v0, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 288
    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->pause()V

    .line 290
    :cond_0
    return-void
.end method

.method private _removeVideoView(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 216
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 217
    .local v0, "view":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 218
    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->stopPlayback()V

    .line 219
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 220
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 222
    :cond_0
    return-void
.end method

.method private _restartVideo(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 328
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 329
    .local v0, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 330
    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->restart()V

    .line 332
    :cond_0
    return-void
.end method

.method private _resumeVideo(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 300
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 301
    .local v0, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 302
    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->resume()V

    .line 304
    :cond_0
    return-void
.end method

.method private _seekVideoTo(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "msec"    # I

    .prologue
    .line 343
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 344
    .local v0, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 345
    invoke-virtual {v0, p2}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->seekTo(I)V

    .line 347
    :cond_0
    return-void
.end method

.method private _setVideoKeepRatio(IZ)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "enable"    # Z

    .prologue
    .line 387
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 388
    .local v0, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 389
    invoke-virtual {v0, p2}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setKeepRatio(Z)V

    .line 391
    :cond_0
    return-void
.end method

.method private _setVideoRect(IIIII)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "maxWidth"    # I
    .param p5, "maxHeight"    # I

    .prologue
    .line 258
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 259
    .local v0, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 260
    invoke-virtual {v0, p2, p3, p4, p5}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setVideoRect(IIII)V

    .line 262
    :cond_0
    return-void
.end method

.method private _setVideoURL(IILjava/lang/String;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "videoSource"    # I
    .param p3, "videoUrl"    # Ljava/lang/String;

    .prologue
    .line 234
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 235
    .local v0, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 236
    packed-switch p2, :pswitch_data_0

    .line 247
    :cond_0
    :goto_0
    return-void

    .line 238
    :pswitch_0
    invoke-virtual {v0, p3}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setVideoFileName(Ljava/lang/String;)V

    goto :goto_0

    .line 241
    :pswitch_1
    invoke-virtual {v0, p3}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setVideoURL(Ljava/lang/String;)V

    goto :goto_0

    .line 236
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private _setVideoVisible(IZ)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "visible"    # Z

    .prologue
    .line 363
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 364
    .local v0, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 365
    if-eqz p2, :cond_1

    .line 366
    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->fixSize()V

    .line 367
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setVisibility(I)V

    .line 372
    :cond_0
    :goto_0
    return-void

    .line 369
    :cond_1
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setVisibility(I)V

    goto :goto_0
.end method

.method private _startVideo(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 272
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 273
    .local v0, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 274
    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->start()V

    .line 276
    :cond_0
    return-void
.end method

.method private _stopVideo(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 314
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 315
    .local v0, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v0, :cond_0

    .line 316
    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->stop()V

    .line 318
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_createVideoView(I)V

    return-void
.end method

.method static synthetic access$100(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_removeVideoView(I)V

    return-void
.end method

.method static synthetic access$1000(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_restartVideo(I)V

    return-void
.end method

.method static synthetic access$1100(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;IZ)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_setVideoKeepRatio(IZ)V

    return-void
.end method

.method static synthetic access$1200(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;)Lorg/cocos2dx/lib/Cocos2dxActivity;
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;

    .prologue
    .line 39
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    return-object v0
.end method

.method static synthetic access$200(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;IILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_setVideoURL(IILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_startVideo(I)V

    return-void
.end method

.method static synthetic access$400(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;IIIII)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .param p4, "x4"    # I
    .param p5, "x5"    # I

    .prologue
    .line 39
    invoke-direct/range {p0 .. p5}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_setVideoRect(IIIII)V

    return-void
.end method

.method static synthetic access$500(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_pauseVideo(I)V

    return-void
.end method

.method static synthetic access$600(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_resumeVideo(I)V

    return-void
.end method

.method static synthetic access$700(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;I)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_stopVideo(I)V

    return-void
.end method

.method static synthetic access$800(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;II)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_seekVideoTo(II)V

    return-void
.end method

.method static synthetic access$900(Lorg/cocos2dx/lib/Cocos2dxVideoHelper;IZ)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoHelper;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->_setVideoVisible(IZ)V

    return-void
.end method

.method public static createVideoWidget()I
    .locals 3

    .prologue
    .line 187
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 188
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x0

    iput v1, v0, Landroid/os/Message;->what:I

    .line 189
    sget v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->videoTag:I

    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 190
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 192
    sget v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->videoTag:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->videoTag:I

    return v1
.end method

.method public static native nativeExecuteVideoCallback(II)V
.end method

.method public static pauseVideo(I)V
    .locals 2
    .param p0, "index"    # I

    .prologue
    .line 279
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 280
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x5

    iput v1, v0, Landroid/os/Message;->what:I

    .line 281
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 282
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 283
    return-void
.end method

.method public static removeVideoWidget(I)V
    .locals 2
    .param p0, "index"    # I

    .prologue
    .line 209
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 210
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->what:I

    .line 211
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 212
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 213
    return-void
.end method

.method public static restartVideo(I)V
    .locals 2
    .param p0, "index"    # I

    .prologue
    .line 321
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 322
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0xa

    iput v1, v0, Landroid/os/Message;->what:I

    .line 323
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 324
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 325
    return-void
.end method

.method public static resumeVideo(I)V
    .locals 2
    .param p0, "index"    # I

    .prologue
    .line 293
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 294
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x6

    iput v1, v0, Landroid/os/Message;->what:I

    .line 295
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 296
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 297
    return-void
.end method

.method public static seekVideoTo(II)V
    .locals 2
    .param p0, "index"    # I
    .param p1, "msec"    # I

    .prologue
    .line 335
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 336
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x8

    iput v1, v0, Landroid/os/Message;->what:I

    .line 337
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 338
    iput p1, v0, Landroid/os/Message;->arg2:I

    .line 339
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 340
    return-void
.end method

.method public static setVideoKeepRatioEnabled(IZ)V
    .locals 2
    .param p0, "index"    # I
    .param p1, "enable"    # Z

    .prologue
    .line 375
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 376
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0xb

    iput v1, v0, Landroid/os/Message;->what:I

    .line 377
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 378
    if-eqz p1, :cond_0

    .line 379
    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->arg2:I

    .line 383
    :goto_0
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 384
    return-void

    .line 381
    :cond_0
    const/4 v1, 0x0

    iput v1, v0, Landroid/os/Message;->arg2:I

    goto :goto_0
.end method

.method public static setVideoRect(IIIII)V
    .locals 2
    .param p0, "index"    # I
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "maxWidth"    # I
    .param p4, "maxHeight"    # I

    .prologue
    .line 250
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 251
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    .line 252
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 253
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, p1, p2, p3, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 254
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 255
    return-void
.end method

.method public static setVideoUrl(IILjava/lang/String;)V
    .locals 2
    .param p0, "index"    # I
    .param p1, "videoSource"    # I
    .param p2, "videoUrl"    # Ljava/lang/String;

    .prologue
    .line 225
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 226
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 227
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 228
    iput p1, v0, Landroid/os/Message;->arg2:I

    .line 229
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 230
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 231
    return-void
.end method

.method public static setVideoVisible(IZ)V
    .locals 2
    .param p0, "index"    # I
    .param p1, "visible"    # Z

    .prologue
    .line 350
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 351
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x9

    iput v1, v0, Landroid/os/Message;->what:I

    .line 352
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 353
    if-eqz p1, :cond_0

    .line 354
    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->arg2:I

    .line 359
    :goto_0
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 360
    return-void

    .line 356
    :cond_0
    const/4 v1, 0x0

    iput v1, v0, Landroid/os/Message;->arg2:I

    goto :goto_0
.end method

.method public static startVideo(I)V
    .locals 2
    .param p0, "index"    # I

    .prologue
    .line 265
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 266
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    .line 267
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 268
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 269
    return-void
.end method

.method public static stopVideo(I)V
    .locals 2
    .param p0, "index"    # I

    .prologue
    .line 307
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 308
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x7

    iput v1, v0, Landroid/os/Message;->what:I

    .line 309
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 310
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->mVideoHandler:Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoHelper$VideoHandler;->sendMessage(Landroid/os/Message;)Z

    .line 311
    return-void
.end method


# virtual methods
.method public onPause()V
    .locals 3

    .prologue
    .line 394
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 395
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 396
    .local v1, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v1, :cond_0

    .line 397
    invoke-virtual {v1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->onActivityPause()V

    .line 394
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 399
    .end local v1    # "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 403
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 404
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoHelper;->sVideoViews:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .line 405
    .local v1, "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    if-eqz v1, :cond_0

    .line 406
    invoke-virtual {v1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->onActivityResume()V

    .line 403
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 408
    .end local v1    # "videoView":Lorg/cocos2dx/lib/Cocos2dxVideoView;
    :cond_1
    return-void
.end method
