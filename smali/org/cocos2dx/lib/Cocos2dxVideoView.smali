.class public Lorg/cocos2dx/lib/Cocos2dxVideoView;
.super Landroid/view/SurfaceView;
.source "Cocos2dxVideoView.java"

# interfaces
.implements Landroid/widget/MediaController$MediaPlayerControl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;
    }
.end annotation


# static fields
.field private static final EVENT_COMPLETED:I = 0x3

.field private static final EVENT_PAUSED:I = 0x1

.field private static final EVENT_PLAYING:I = 0x0

.field private static final EVENT_STOPPED:I = 0x2

.field private static final STATE_ERROR:I = -0x1

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_PAUSED:I = 0x4

.field private static final STATE_PLAYBACK_COMPLETED:I = 0x5

.field private static final STATE_PLAYING:I = 0x3

.field private static final STATE_PREPARED:I = 0x2

.field private static final STATE_PREPARING:I = 0x1


# instance fields
.field private TAG:Ljava/lang/String;

.field private fileName:Ljava/lang/String;

.field private isAssetRouse:Z

.field private mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

.field private mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field protected mContext:Landroid/content/Context;

.field private mCurrentBufferPercentage:I

.field private mCurrentState:I

.field private mDuration:I

.field private mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mIsDestoryed:Z

.field private mIsPause:Z

.field private mKeepRatio:Z

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mNeedResume:Z

.field private mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field private mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

.field private mPausePosition:I

.field mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field mSHCallback:Landroid/view/SurfaceHolder$Callback;

.field private mSeekWhenPrepared:I

.field protected mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;

.field private mTargetState:I

.field private mUri:Landroid/net/Uri;

.field private mVideoHeight:I

.field private mVideoWidth:I

.field protected mViewHeight:I

.field protected mViewLeft:I

.field private mViewTag:I

.field protected mViewTop:I

.field protected mViewWidth:I

.field protected mVisibleHeight:I

.field protected mVisibleLeft:I

.field protected mVisibleTop:I

.field protected mVisibleWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tag"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 98
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 43
    const-string v0, "VideoView"

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->TAG:Ljava/lang/String;

    .line 62
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 63
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 66
    iput-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 67
    iput-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 68
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    .line 69
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    .line 79
    iput-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mContext:Landroid/content/Context;

    .line 81
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewLeft:I

    .line 82
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTop:I

    .line 83
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    .line 84
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    .line 86
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleLeft:I

    .line 87
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleTop:I

    .line 88
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    .line 89
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    .line 91
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTag:I

    .line 93
    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsDestoryed:Z

    .line 94
    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsPause:Z

    .line 95
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mPausePosition:I

    .line 173
    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mNeedResume:Z

    .line 214
    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isAssetRouse:Z

    .line 215
    iput-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->fileName:Ljava/lang/String;

    .line 332
    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mKeepRatio:Z

    .line 379
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$1;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$1;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 389
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$2;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$2;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 416
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 437
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$4;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$4;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 503
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$5;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$5;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 543
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$6;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$6;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    .line 100
    iput p2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTag:I

    .line 101
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mContext:Landroid/content/Context;

    .line 102
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->initVideoView()V

    .line 103
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 106
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 108
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mContext:Landroid/content/Context;

    .line 109
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->initVideoView()V

    .line 110
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 113
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    const-string v0, "VideoView"

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->TAG:Ljava/lang/String;

    .line 62
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 63
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 66
    iput-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 67
    iput-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 68
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    .line 69
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    .line 79
    iput-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mContext:Landroid/content/Context;

    .line 81
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewLeft:I

    .line 82
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTop:I

    .line 83
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    .line 84
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    .line 86
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleLeft:I

    .line 87
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleTop:I

    .line 88
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    .line 89
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    .line 91
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTag:I

    .line 93
    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsDestoryed:Z

    .line 94
    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsPause:Z

    .line 95
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mPausePosition:I

    .line 173
    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mNeedResume:Z

    .line 214
    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isAssetRouse:Z

    .line 215
    iput-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->fileName:Ljava/lang/String;

    .line 332
    iput-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mKeepRatio:Z

    .line 379
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$1;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$1;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 389
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$2;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$2;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 416
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 437
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$4;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$4;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 503
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$5;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$5;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 543
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxVideoView$6;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView$6;-><init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    .line 115
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mContext:Landroid/content/Context;

    .line 116
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->initVideoView()V

    .line 117
    return-void
.end method

.method static synthetic access$000(Lorg/cocos2dx/lib/Cocos2dxVideoView;)I
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    return v0
.end method

.method static synthetic access$002(Lorg/cocos2dx/lib/Cocos2dxVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    return p1
.end method

.method static synthetic access$100(Lorg/cocos2dx/lib/Cocos2dxVideoView;)I
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    return v0
.end method

.method static synthetic access$1000(Lorg/cocos2dx/lib/Cocos2dxVideoView;)Landroid/media/MediaPlayer$OnErrorListener;
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    return-object v0
.end method

.method static synthetic access$102(Lorg/cocos2dx/lib/Cocos2dxVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    return p1
.end method

.method static synthetic access$1102(Lorg/cocos2dx/lib/Cocos2dxVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentBufferPercentage:I

    return p1
.end method

.method static synthetic access$1202(Lorg/cocos2dx/lib/Cocos2dxVideoView;Landroid/view/SurfaceHolder;)Landroid/view/SurfaceHolder;
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;
    .param p1, "x1"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    return-object p1
.end method

.method static synthetic access$1300(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->openVideo()V

    return-void
.end method

.method static synthetic access$1400(Lorg/cocos2dx/lib/Cocos2dxVideoView;)Z
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsPause:Z

    return v0
.end method

.method static synthetic access$1402(Lorg/cocos2dx/lib/Cocos2dxVideoView;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsPause:Z

    return p1
.end method

.method static synthetic access$1500(Lorg/cocos2dx/lib/Cocos2dxVideoView;)Z
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsDestoryed:Z

    return v0
.end method

.method static synthetic access$1502(Lorg/cocos2dx/lib/Cocos2dxVideoView;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsDestoryed:Z

    return p1
.end method

.method static synthetic access$1600(Lorg/cocos2dx/lib/Cocos2dxVideoView;)I
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mPausePosition:I

    return v0
.end method

.method static synthetic access$1602(Lorg/cocos2dx/lib/Cocos2dxVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mPausePosition:I

    return p1
.end method

.method static synthetic access$1700(Lorg/cocos2dx/lib/Cocos2dxVideoView;Z)V
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->release(Z)V

    return-void
.end method

.method static synthetic access$202(Lorg/cocos2dx/lib/Cocos2dxVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    return p1
.end method

.method static synthetic access$300(Lorg/cocos2dx/lib/Cocos2dxVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    return-object v0
.end method

.method static synthetic access$400(Lorg/cocos2dx/lib/Cocos2dxVideoView;)Landroid/media/MediaPlayer;
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$500(Lorg/cocos2dx/lib/Cocos2dxVideoView;)I
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSeekWhenPrepared:I

    return v0
.end method

.method static synthetic access$600(Lorg/cocos2dx/lib/Cocos2dxVideoView;)I
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    return v0
.end method

.method static synthetic access$602(Lorg/cocos2dx/lib/Cocos2dxVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    return p1
.end method

.method static synthetic access$700(Lorg/cocos2dx/lib/Cocos2dxVideoView;)Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    return-object v0
.end method

.method static synthetic access$800(Lorg/cocos2dx/lib/Cocos2dxVideoView;)I
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTag:I

    return v0
.end method

.method static synthetic access$900(Lorg/cocos2dx/lib/Cocos2dxVideoView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/cocos2dx/lib/Cocos2dxVideoView;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private initVideoView()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 190
    const-string v0, "cocos2d-x debug info"

    const-string v1, "initVideoview"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    iput v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    .line 192
    iput v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    .line 193
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 194
    invoke-virtual {p0, v3}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setFocusable(Z)V

    .line 195
    invoke-virtual {p0, v3}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setFocusableInTouchMode(Z)V

    .line 196
    iput v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 197
    iput v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 198
    const-string v0, "cocos2d-x debug info"

    const-string v1, "initVideoview end"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    return-void
.end method

.method private openVideo()V
    .locals 12

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    const/4 v9, -0x1

    .line 257
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    if-nez v0, :cond_0

    .line 259
    const-string v0, "cocos2d-x debug info"

    const-string v1, "not ready for playback just yet, will try again later"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    :goto_0
    return-void

    .line 263
    :cond_0
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isAssetRouse:Z

    if-eqz v0, :cond_1

    .line 264
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->fileName:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 265
    const-string v0, "cocos2d-x debug info"

    const-string v1, "fileName is null"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 269
    :cond_1
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mUri:Landroid/net/Uri;

    if-nez v0, :cond_2

    .line 270
    const-string v0, "cocos2d-x debug info"

    const-string v1, "Uri is null"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 278
    :cond_2
    new-instance v8, Landroid/content/Intent;

    const-string v0, "com.android.music.musicservicecommand"

    invoke-direct {v8, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 279
    .local v8, "i":Landroid/content/Intent;
    const-string v0, "command"

    const-string v1, "pause"

    invoke-virtual {v8, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 280
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 284
    invoke-direct {p0, v10}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->release(Z)V

    .line 288
    :try_start_0
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 289
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 290
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 291
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 292
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 293
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 295
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 296
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 297
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 301
    const/4 v0, -0x1

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mDuration:I

    .line 302
    const/4 v0, 0x0

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentBufferPercentage:I

    .line 303
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isAssetRouse:Z

    if-eqz v0, :cond_3

    .line 304
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->fileName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 305
    .local v6, "afd":Landroid/content/res/AssetFileDescriptor;
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 311
    .end local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :goto_1
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 314
    const/4 v0, 0x1

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 315
    :catch_0
    move-exception v7

    .line 316
    .local v7, "ex":Ljava/io/IOException;
    const-string v0, "cocos2d-x debug info"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to open content: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 317
    iput v9, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 318
    iput v9, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 319
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {v0, v1, v11, v10}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    goto/16 :goto_0

    .line 308
    .end local v7    # "ex":Ljava/io/IOException;
    :cond_3
    :try_start_1
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 322
    :catch_1
    move-exception v7

    .line 323
    .local v7, "ex":Ljava/lang/IllegalArgumentException;
    const-string v0, "cocos2d-x debug info"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to open content: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 324
    iput v9, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 325
    iput v9, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 326
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {v0, v1, v11, v10}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    goto/16 :goto_0
.end method

.method private release(Z)V
    .locals 2
    .param p1, "cleartargetstate"    # Z

    .prologue
    const/4 v1, 0x0

    .line 589
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 590
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 591
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 592
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 593
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 594
    if-eqz p1, :cond_0

    .line 595
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 598
    :cond_0
    return-void
.end method

.method private setVideoURI(Landroid/net/Uri;Ljava/util/Map;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v1, 0x50

    .line 237
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mUri:Landroid/net/Uri;

    .line 238
    const/4 v0, 0x0

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSeekWhenPrepared:I

    .line 239
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    .line 240
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    .line 241
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->openVideo()V

    .line 242
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->requestLayout()V

    .line 243
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->invalidate()V

    .line 244
    return-void
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 710
    const/4 v0, 0x1

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 716
    const/4 v0, 0x1

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 722
    const/4 v0, 0x1

    return v0
.end method

.method public fixSize()V
    .locals 5

    .prologue
    const/4 v4, -0x2

    .line 340
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    if-eqz v1, :cond_3

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    if-eqz v1, :cond_3

    .line 341
    iget-boolean v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mKeepRatio:Z

    if-eqz v1, :cond_2

    .line 342
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    mul-int/2addr v1, v2

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    iget v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    mul-int/2addr v2, v3

    if-le v1, v2, :cond_1

    .line 343
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    .line 344
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    mul-int/2addr v1, v2

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    div-int/2addr v1, v2

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    .line 350
    :cond_0
    :goto_0
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewLeft:I

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    iget v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleLeft:I

    .line 351
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTop:I

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    iget v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleTop:I

    .line 364
    :goto_1
    const-string v1, "cocos2d-x debug info"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    iget v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    invoke-interface {v1, v2, v3}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 369
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 372
    .local v0, "lParams":Landroid/widget/FrameLayout$LayoutParams;
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleLeft:I

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 373
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleTop:I

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 374
    const-string v1, "cocos2d-x debug info"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleLeft:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleTop:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 377
    return-void

    .line 345
    .end local v0    # "lParams":Landroid/widget/FrameLayout$LayoutParams;
    :cond_1
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    mul-int/2addr v1, v2

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    iget v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    mul-int/2addr v2, v3

    if-ge v1, v2, :cond_0

    .line 347
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    mul-int/2addr v1, v2

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    div-int/2addr v1, v2

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    .line 348
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    goto/16 :goto_0

    .line 353
    :cond_2
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewLeft:I

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleLeft:I

    .line 354
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTop:I

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleTop:I

    .line 355
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    .line 356
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    goto/16 :goto_1

    .line 359
    :cond_3
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewLeft:I

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleLeft:I

    .line 360
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTop:I

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleTop:I

    .line 361
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    .line 362
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    goto/16 :goto_1
.end method

.method public getAudioSessionId()I
    .locals 1

    .prologue
    .line 727
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result v0

    return v0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 696
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 697
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentBufferPercentage:I

    .line 699
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()I
    .locals 1

    .prologue
    .line 676
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 677
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    .line 679
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 664
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 665
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mDuration:I

    if-lez v0, :cond_0

    .line 666
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mDuration:I

    .line 672
    :goto_0
    return v0

    .line 668
    :cond_0
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mDuration:I

    .line 669
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mDuration:I

    goto :goto_0

    .line 671
    :cond_1
    const/4 v0, -0x1

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mDuration:I

    .line 672
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mDuration:I

    goto :goto_0
.end method

.method public isInPlaybackState()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 703
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    if-eqz v1, :cond_0

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    if-eq v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 692
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onActivityPause()V
    .locals 1

    .prologue
    .line 732
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsPause:Z

    .line 733
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->pause()V

    .line 734
    return-void
.end method

.method public onActivityResume()V
    .locals 1

    .prologue
    .line 738
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsDestoryed:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsPause:Z

    if-eqz v0, :cond_0

    .line 739
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->resume()V

    .line 740
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mIsPause:Z

    .line 742
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 121
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    if-nez v0, :cond_1

    .line 122
    :cond_0
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    invoke-virtual {p0, v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setMeasuredDimension(II)V

    .line 123
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    :goto_0
    return-void

    .line 125
    :cond_1
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    invoke-virtual {p0, v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setMeasuredDimension(II)V

    .line 126
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVisibleHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public pause()V
    .locals 4

    .prologue
    const/4 v3, 0x4

    .line 612
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 613
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 614
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mPausePosition:I

    .line 615
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 616
    iput v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 617
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    if-eqz v0, :cond_0

    .line 618
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTag:I

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;->onVideoEvent(II)V

    .line 622
    :cond_0
    iput v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 623
    return-void
.end method

.method public resolveAdjustedSize(II)I
    .locals 3
    .param p1, "desiredSize"    # I
    .param p2, "measureSpec"    # I

    .prologue
    .line 143
    move v0, p1

    .line 144
    .local v0, "result":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 145
    .local v1, "specMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 147
    .local v2, "specSize":I
    sparse-switch v1, :sswitch_data_0

    .line 170
    :goto_0
    return v0

    .line 153
    :sswitch_0
    move v0, p1

    .line 154
    goto :goto_0

    .line 162
    :sswitch_1
    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 163
    goto :goto_0

    .line 167
    :sswitch_2
    move v0, v2

    goto :goto_0

    .line 147
    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_1
        0x0 -> :sswitch_0
        0x40000000 -> :sswitch_2
    .end sparse-switch
.end method

.method public restart()V
    .locals 3

    .prologue
    const/4 v2, 0x3

    .line 654
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 655
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 656
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 657
    iput v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 658
    iput v2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 660
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 3

    .prologue
    .line 642
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 643
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 644
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 645
    const/4 v0, 0x3

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 646
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    if-eqz v0, :cond_0

    .line 647
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTag:I

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;->onVideoEvent(II)V

    .line 651
    :cond_0
    return-void
.end method

.method public seekTo(I)V
    .locals 1
    .param p1, "msec"    # I

    .prologue
    .line 683
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 684
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 685
    const/4 v0, 0x0

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSeekWhenPrepared:I

    .line 689
    :goto_0
    return-void

    .line 687
    :cond_0
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSeekWhenPrepared:I

    goto :goto_0
.end method

.method public setKeepRatio(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 335
    iput-boolean p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mKeepRatio:Z

    .line 336
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->fixSize()V

    .line 337
    return-void
.end method

.method public setOnCompletionListener(Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;)V
    .locals 0
    .param p1, "l"    # Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    .prologue
    .line 528
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    .line 529
    return-void
.end method

.method public setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V
    .locals 0
    .param p1, "l"    # Landroid/media/MediaPlayer$OnErrorListener;

    .prologue
    .line 540
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 541
    return-void
.end method

.method public setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    .locals 0
    .param p1, "l"    # Landroid/media/MediaPlayer$OnPreparedListener;

    .prologue
    .line 517
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 518
    return-void
.end method

.method public setVideoFileName(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 218
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isAssetRouse:Z

    .line 220
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setVideoURI(Landroid/net/Uri;Ljava/util/Map;)V

    .line 226
    :goto_0
    return-void

    .line 222
    :cond_0
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->fileName:Ljava/lang/String;

    .line 223
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isAssetRouse:Z

    .line 224
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setVideoURI(Landroid/net/Uri;Ljava/util/Map;)V

    goto :goto_0
.end method

.method public setVideoRect(IIII)V
    .locals 1
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "maxWidth"    # I
    .param p4, "maxHeight"    # I

    .prologue
    .line 132
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewLeft:I

    .line 133
    iput p2, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTop:I

    .line 134
    iput p3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewWidth:I

    .line 135
    iput p4, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewHeight:I

    .line 137
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoWidth:I

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mVideoHeight:I

    if-eqz v0, :cond_0

    .line 138
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->fixSize()V

    .line 140
    :cond_0
    return-void
.end method

.method public setVideoURL(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 229
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isAssetRouse:Z

    .line 230
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->setVideoURI(Landroid/net/Uri;Ljava/util/Map;)V

    .line 231
    return-void
.end method

.method public setVisibility(I)V
    .locals 1
    .param p1, "visibility"    # I

    .prologue
    .line 177
    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    .line 178
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isPlaying()Z

    move-result v0

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mNeedResume:Z

    .line 179
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mNeedResume:Z

    if-eqz v0, :cond_0

    .line 180
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mSeekWhenPrepared:I

    .line 186
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 187
    return-void

    .line 182
    :cond_1
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mNeedResume:Z

    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->start()V

    .line 184
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mNeedResume:Z

    goto :goto_0
.end method

.method public start()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    .line 601
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 602
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 603
    iput v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 604
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    if-eqz v0, :cond_0

    .line 605
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTag:I

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;->onVideoEvent(II)V

    .line 608
    :cond_0
    iput v3, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 609
    return-void
.end method

.method public stop()V
    .locals 3

    .prologue
    .line 626
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 627
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 628
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->stopPlayback()V

    .line 629
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    if-eqz v0, :cond_0

    .line 630
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mOnVideoEventListener:Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mViewTag:I

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;->onVideoEvent(II)V

    .line 634
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 635
    return-void
.end method

.method public stopPlayback()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 247
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 249
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 250
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 251
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mCurrentState:I

    .line 252
    iput v1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView;->mTargetState:I

    .line 254
    :cond_0
    return-void
.end method

.method public suspend()V
    .locals 1

    .prologue
    .line 638
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->release(Z)V

    .line 639
    return-void
.end method
