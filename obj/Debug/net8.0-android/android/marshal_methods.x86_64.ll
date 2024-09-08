; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [418 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [836 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 262
	i64 47637496229263198, ; 1: it\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xa93e0ce8bbf75e => 392
	i64 98382396393917666, ; 2: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 191
	i64 120698629574877762, ; 3: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 4: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 201
	i64 196720943101637631, ; 5: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 206980223877136582, ; 6: cs\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x2df576abfba40c6 => 378
	i64 210515253464952879, ; 7: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 249
	i64 225432268808147330, ; 8: Microcharts.Maui => 0x320e5743f385182 => 181
	i64 229794953483747371, ; 9: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 10: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 290
	i64 295915112840604065, ; 11: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 293
	i64 316157742385208084, ; 12: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 256
	i64 348532633569910570, ; 13: Microsoft.TestPlatform.Utilities => 0x4d63c956890df2a => 208
	i64 350363924239463924, ; 14: AlohaKit.Animations => 0x4dcbe21fe67b5f4 => 173
	i64 350667413455104241, ; 15: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 358744575426475612, ; 16: es\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x4fa844a6764b65c => 386
	i64 383952053976779057, ; 17: de\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x554125bdc114931 => 354
	i64 384983419793289340, ; 18: it\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x557bc616d31b07c => 390
	i64 419930437115159537, ; 19: tr\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x5d3e481f69fa3f1 => 408
	i64 422779754995088667, ; 20: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 21: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 292
	i64 464346026994987652, ; 22: System.Reactive.dll => 0x671b04057e67284 => 231
	i64 486223428996552534, ; 23: ZstdSharp.dll => 0x6bf69a1eecfd756 => 317
	i64 515963292785918183, ; 24: ko\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x72911e18fa540e7 => 398
	i64 560278790331054453, ; 25: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 569564398114481256, ; 26: Microsoft.TestPlatform.CoreUtilities => 0x7e77fcd6a52a468 => 203
	i64 634308326490598313, ; 27: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 275
	i64 649145001856603771, ; 28: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 666645149764583677, ; 29: cs\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x940663b4ef480fd => 379
	i64 680363742271143144, ; 30: ja\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x971233808207ce8 => 363
	i64 750875890346172408, ; 31: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 32: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 250
	i64 799765834175365804, ; 33: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 802357016254684293, ; 34: Microsoft.Practices.ServiceLocation => 0xb228b7488e71c85 => 177
	i64 805302231655005164, ; 35: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 330
	i64 872800313462103108, ; 36: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 261
	i64 895210737996778430, ; 37: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 276
	i64 940822596282819491, ; 38: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 39: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 964614131093751526, ; 40: it\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0xd62ff71052a46e6 => 360
	i64 987364250896784675, ; 41: de\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xdb3d28e0e9f5d23 => 383
	i64 1010599046655515943, ; 42: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1033454650104814733, ; 43: XAct.Core.PCL.dll => 0xe5791875ef91c8d => 233
	i64 1103253330105578028, ; 44: testhost.dll => 0xf4f8b0ef635b22c => 210
	i64 1120440138749646132, ; 45: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 305
	i64 1131324090314641426, ; 46: fr\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xfb34544210bd012 => 389
	i64 1155293581196374002, ; 47: ru\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x10086d641e7faff2 => 370
	i64 1224204378712574818, ; 48: pl\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x10fd3f6575a40b62 => 400
	i64 1268860745194512059, ; 49: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301626418029409250, ; 50: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 51: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 245
	i64 1369545283391376210, ; 52: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 283
	i64 1404195534211153682, ; 53: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 54: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1472482321403310552, ; 55: pl\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x146f4edea94971d8 => 367
	i64 1476839205573959279, ; 56: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 57: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 198
	i64 1492954217099365037, ; 58: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1509266843412015967, ; 59: Microsoft.VisualStudio.CodeCoverage.Shim => 0x14f1fe3298d92b5f => 182
	i64 1513467482682125403, ; 60: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1537168428375924959, ; 61: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1546012405902441892, ; 62: tr\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x15748a1790297da4 => 373
	i64 1576750169145655260, ; 63: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 304
	i64 1596876529298339293, ; 64: it\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x16293ebe26fc75dd => 361
	i64 1624659445732251991, ; 65: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 244
	i64 1626108477898771886, ; 66: zh-Hant\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x1691190b8f684dae => 415
	i64 1628611045998245443, ; 67: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 279
	i64 1636321030536304333, ; 68: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 269
	i64 1651782184287836205, ; 69: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 70: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1682513316613008342, ; 71: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1722597719627028132, ; 72: zh-Hant\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x17e7e57fd14456a4 => 416
	i64 1725540158281208691, ; 73: cs\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x17f259a1b405d373 => 352
	i64 1731380447121279447, ; 74: Newtonsoft.Json => 0x18071957e9b889d7 => 216
	i64 1735388228521408345, ; 75: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 76: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 77: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1795316252682057001, ; 78: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 243
	i64 1825687700144851180, ; 79: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 80: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 324
	i64 1836611346387731153, ; 81: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 290
	i64 1836985299277495700, ; 82: de\Microsoft.TestPlatform.CoreUtilities.resources => 0x197e48659d0cbd94 => 354
	i64 1854145951182283680, ; 83: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1875417405349196092, ; 84: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 85: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 240
	i64 1881198190668717030, ; 86: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 346
	i64 1897575647115118287, ; 87: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 292
	i64 1904113745533088721, ; 88: pt-BR\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x1a6cc55cf67033d1 => 368
	i64 1917020900923949484, ; 89: ko\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x1a9aa05a429241ac => 397
	i64 1920760634179481754, ; 90: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 199
	i64 1925780155338202561, ; 91: zh-Hant\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x1ab9bed91a6e1dc1 => 376
	i64 1972385128188460614, ; 92: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 93: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 277
	i64 2040001226662520565, ; 94: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2062890601515140263, ; 95: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 96: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 313
	i64 2080945842184875448, ; 97: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 98: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 99: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2107715700938949604, ; 100: pl\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x1d401c4349fac3e4 => 366
	i64 2133195048986300728, ; 101: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 216
	i64 2152408820173588167, ; 102: Supabase.Functions.dll => 0x1ddee46b01dd46c7 => 225
	i64 2165310824878145998, ; 103: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 237
	i64 2165725771938924357, ; 104: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 247
	i64 2200176636225660136, ; 105: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 189
	i64 2262844636196693701, ; 106: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 261
	i64 2287834202362508563, ; 107: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 108: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2304837677853103545, ; 109: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 289
	i64 2306462301517933117, ; 110: de\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x2002333e39ce6a3d => 381
	i64 2315304989185124968, ; 111: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 112: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 272
	i64 2335503487726329082, ; 113: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 114: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2443621855109524048, ; 115: AWSSDK.Core.dll => 0x21e97d215f2f2a50 => 174
	i64 2462759402812536893, ; 116: es\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x222d7aa0ebe4f83d => 384
	i64 2470498323731680442, ; 117: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 254
	i64 2479423007379663237, ; 118: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 299
	i64 2497223385847772520, ; 119: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2503741058806314188, ; 120: Microsoft.VisualStudio.TestPlatform.Common => 0x22bf133a43b5f4cc => 209
	i64 2547086958574651984, ; 121: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 238
	i64 2592350477072141967, ; 122: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 123: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 345
	i64 2612152650457191105, ; 124: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 195
	i64 2624866290265602282, ; 125: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 126: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2634866700793824328, ; 127: fr\Microsoft.TestPlatform.CoreUtilities.resources => 0x2490ed4de3524448 => 358
	i64 2656907746661064104, ; 128: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 185
	i64 2662981627730767622, ; 129: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 320
	i64 2706075432581334785, ; 130: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2783046991838674048, ; 131: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 132: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 294
	i64 2789714023057451704, ; 133: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 193
	i64 2815524396660695947, ; 134: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2894115230615641917, ; 135: zh-Hant\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x2829f677f3e49f3d => 414
	i64 2895129759130297543, ; 136: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 325
	i64 2923871038697555247, ; 137: Jsr305Binding => 0x2893ad37e69ec52f => 306
	i64 2926123043691605432, ; 138: Websocket.Client.dll => 0x289bad67ac52adb8 => 232
	i64 3017136373564924869, ; 139: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 140: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 305
	i64 3106852385031680087, ; 141: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 142: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 143: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3150549697688062710, ; 144: ColorHelper.dll => 0x2bb90041f9e94af6 => 176
	i64 3154532723826522171, ; 145: ru\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x2bc726cc8406783b => 371
	i64 3260349211929083484, ; 146: testhost => 0x2d3f16558cc1fe5c => 210
	i64 3281594302220646930, ; 147: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 148: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 270
	i64 3303437397778967116, ; 149: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 241
	i64 3311221304742556517, ; 150: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 151: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 152: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 153: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 316
	i64 3402534845034375023, ; 154: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 230
	i64 3414639567687375782, ; 155: SkiaSharp.Views.Maui.Controls => 0x2f633c9863ffdba6 => 220
	i64 3429672777697402584, ; 156: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 201
	i64 3437845325506641314, ; 157: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 158: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 296
	i64 3494946837667399002, ; 159: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 183
	i64 3508450208084372758, ; 160: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 161: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 295
	i64 3531994851595924923, ; 162: System.Numerics => 0x31042a9aade235bb => 83
	i64 3551103847008531295, ; 163: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3567343442040498961, ; 164: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 340
	i64 3571415421602489686, ; 165: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3638003163729360188, ; 166: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 184
	i64 3647754201059316852, ; 167: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 168: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 183
	i64 3659371656528649588, ; 169: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 235
	i64 3716579019761409177, ; 170: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3727469159507183293, ; 171: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 288
	i64 3772598417116884899, ; 172: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 262
	i64 3869221888984012293, ; 173: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 187
	i64 3869649043256705283, ; 174: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3890352374528606784, ; 175: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 199
	i64 3919223565570527920, ; 176: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 177: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 178: System.Memory => 0x370b03412596249e => 62
	i64 4006972109285359177, ; 179: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 180: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4070326265757318011, ; 181: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 321
	i64 4073500526318903918, ; 182: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 183: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 197
	i64 4084133767404826236, ; 184: AlohaKit.Animations.dll => 0x38adc205d557ae7c => 173
	i64 4084167866418059728, ; 185: Supabase.Postgrest.dll => 0x38ade10920e9d9d0 => 227
	i64 4109434362916229071, ; 186: ja\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x3907a4c7c567cfcf => 393
	i64 4120493066591692148, ; 187: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 351
	i64 4148881117810174540, ; 188: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 189: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 190: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 191: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4184189618158325478, ; 192: MongoDB.Driver.dll => 0x3a113a49f7344ee6 => 213
	i64 4187479170553454871, ; 193: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 194: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 256
	i64 4205801962323029395, ; 195: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4235503420553921860, ; 196: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4282138915307457788, ; 197: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4360412976914417659, ; 198: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 346
	i64 4373617458794931033, ; 199: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4397634830160618470, ; 200: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4420739171370228354, ; 201: ko\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x3d599edab22d5a82 => 396
	i64 4431384125090363999, ; 202: es\Microsoft.TestPlatform.CoreUtilities.resources => 0x3d7f70621f50fa5f => 356
	i64 4477672992252076438, ; 203: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 204: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4533124835995628778, ; 205: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4561651694162463980, ; 206: Microsoft.VisualStudio.CodeCoverage.Shim.dll => 0x3f4e3e0c139cccec => 182
	i64 4573907121248322966, ; 207: fr\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x3f79c84b0da2c596 => 388
	i64 4636684751163556186, ; 208: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 300
	i64 4672453897036726049, ; 209: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4691307545558880431, ; 210: es\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x411adf5b692590af => 356
	i64 4716677666592453464, ; 211: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4743821336939966868, ; 212: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 213: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 274
	i64 4794310189461587505, ; 214: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 238
	i64 4795410492532947900, ; 215: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 295
	i64 4809057822547766521, ; 216: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 217: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 218: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 4871824391508510238, ; 219: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 336
	i64 4910825324935172425, ; 220: ColorHelper => 0x4426c19d46c0d149 => 176
	i64 4926014167703849846, ; 221: MongoDB.Driver => 0x445cb7c950878b76 => 213
	i64 4953714692329509532, ; 222: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 344
	i64 5055365687667823624, ; 223: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 239
	i64 5081566143765835342, ; 224: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5099468265966638712, ; 225: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 226: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5182934613077526976, ; 227: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 228: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 281
	i64 5244375036463807528, ; 229: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5252573413799640170, ; 230: ru\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x48e4e3b0c6303c6a => 406
	i64 5262971552273843408, ; 231: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 232: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 233: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 273
	i64 5290786973231294105, ; 234: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5376510917114486089, ; 235: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 299
	i64 5388159308784456503, ; 236: Snappier => 0x4ac69657f94fd337 => 222
	i64 5408338804355907810, ; 237: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 297
	i64 5415938286181081424, ; 238: Microsoft.VisualStudio.TestPlatform.ObjectModel => 0x4b29472d2942e150 => 205
	i64 5423376490970181369, ; 239: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 240: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 241: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5448796023926118037, ; 242: MongoDB.Libmongocrypt.dll => 0x4b9e031d63ad5695 => 215
	i64 5451019430259338467, ; 243: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 252
	i64 5457765010617926378, ; 244: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5471532531798518949, ; 245: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 344
	i64 5492553108247319490, ; 246: Microsoft.TestPlatform.CrossPlatEngine => 0x4c3977f37f0c93c2 => 207
	i64 5507995362134886206, ; 247: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 248: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 347
	i64 5527431512186326818, ; 249: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 250: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 251: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 252: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 242
	i64 5591791169662171124, ; 253: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5650097808083101034, ; 254: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5692067934154308417, ; 255: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 302
	i64 5724799082821825042, ; 256: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 265
	i64 5748194408492950188, ; 257: Supabase.Storage.dll => 0x4fc5b05bfa1be2ac => 229
	i64 5757522595884336624, ; 258: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 251
	i64 5783556987928984683, ; 259: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 260: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 271
	i64 5959344983920014087, ; 261: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 291
	i64 5979151488806146654, ; 262: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 263: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6102788177522843259, ; 264: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 291
	i64 6154847252547150359, ; 265: zh-Hans\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x556a68f766dca217 => 375
	i64 6200764641006662125, ; 266: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 341
	i64 6222399776351216807, ; 267: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 268: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6254074608930031704, ; 269: zh-Hant\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x56caefb8a8108858 => 377
	i64 6278736998281604212, ; 270: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 271: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6300676701234028427, ; 272: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 324
	i64 6319713645133255417, ; 273: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 275
	i64 6324923616432364285, ; 274: es\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x57c6a484acee1afd => 357
	i64 6357457916754632952, ; 275: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 417
	i64 6401687960814735282, ; 276: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 272
	i64 6471714727257221498, ; 277: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 325
	i64 6476067149090213100, ; 278: SharpCompress => 0x59df9cc2ab194cec => 217
	i64 6478287442656530074, ; 279: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 329
	i64 6504860066809920875, ; 280: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 247
	i64 6543695854135597810, ; 281: cs\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x5acfe0b597f2daf2 => 379
	i64 6548213210057960872, ; 282: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 258
	i64 6557084851308642443, ; 283: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 303
	i64 6560151584539558821, ; 284: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 190
	i64 6586820312280503698, ; 285: pl\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x5b69162cf0ce9592 => 401
	i64 6589202984700901502, ; 286: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 308
	i64 6591971792923354531, ; 287: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 273
	i64 6597607856101239634, ; 288: fr\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x5b8f6963b63dab52 => 359
	i64 6617685658146568858, ; 289: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6623869560322245061, ; 290: fr\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x5becb6453587c1c5 => 387
	i64 6625210033332858966, ; 291: pl\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x5bf1796c6728b056 => 400
	i64 6671798237668743565, ; 292: SkiaSharp => 0x5c96fd260152998d => 218
	i64 6691389789501826183, ; 293: cs\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x5cdc978fa0eea487 => 378
	i64 6713440830605852118, ; 294: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6717181655064947627, ; 295: cs\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x5d38392049eaabab => 380
	i64 6718033397713755128, ; 296: Microsoft.TestPlatform.CommunicationUtilities => 0x5d3b3fc813f05bf8 => 206
	i64 6724398223859243234, ; 297: Supabase.Postgrest => 0x5d51dc8ea565d8e2 => 227
	i64 6739853162153639747, ; 298: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 299: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 337
	i64 6772837112740759457, ; 300: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6786606130239981554, ; 301: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 302: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6803670344757653184, ; 303: tr\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x5e6b7e219423aec0 => 409
	i64 6814185388980153342, ; 304: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6815302996714479452, ; 305: zh-Hans\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x5e94d1f76bd25f5c => 412
	i64 6876862101832370452, ; 306: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 307: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6925458353495495940, ; 308: zh-Hant\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x601c2bae0adc5504 => 414
	i64 6951120618030172113, ; 309: zh-Hans\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x6077575f9c9507d1 => 412
	i64 7011053663211085209, ; 310: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 267
	i64 7015894696409149188, ; 311: ja\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x615d770df903af04 => 394
	i64 7053519078139822371, ; 312: zh-Hant\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x61e3223afcf70123 => 377
	i64 7060896174307865760, ; 313: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 314: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 315: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 316: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 268
	i64 7112547816752919026, ; 317: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7135566945239978827, ; 318: ru\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x6306a054b20c534b => 371
	i64 7135772949214115721, ; 319: Microsoft.TestPlatform.PlatformAbstractions => 0x63075bb0bbbfb789 => 204
	i64 7141245265674678182, ; 320: ru\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x631accbbb27aafa6 => 407
	i64 7152184366158511193, ; 321: it\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x6341a9c980fafc59 => 391
	i64 7192745174564810625, ; 322: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 237
	i64 7243049202045766964, ; 323: MongoDB.Bson.dll => 0x64847adfba9d4d34 => 212
	i64 7253917073024768321, ; 324: ru\Microsoft.TestPlatform.CoreUtilities.resources => 0x64ab17251fc85941 => 370
	i64 7270811800166795866, ; 325: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7279649523988600175, ; 326: de\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x650682ac3eae956f => 355
	i64 7299370801165188114, ; 327: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7314237870106916923, ; 328: SkiaSharp.Views.Maui.Core.dll => 0x65816497226eb83b => 221
	i64 7316205155833392065, ; 329: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7330575255854596182, ; 330: it\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x65bb6f5b2c7b4056 => 361
	i64 7338192458477945005, ; 331: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7349431895026339542, ; 332: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 236
	i64 7377312882064240630, ; 333: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7488575175965059935, ; 334: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 335: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7496222613193209122, ; 336: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 230
	i64 7533181980585541824, ; 337: pl\Microsoft.TestPlatform.CoreUtilities.resources => 0x688b3d194d2cc0c0 => 366
	i64 7567961186354546683, ; 338: pt-BR\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x6906cc9a2a9b47fb => 403
	i64 7592577537120840276, ; 339: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7602111570124318452, ; 340: System.Reactive => 0x698020320025a6f4 => 231
	i64 7637303409920963731, ; 341: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7654504624184590948, ; 342: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 343: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7714652370974252055, ; 344: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7723873813026311384, ; 345: SkiaSharp.Views.Maui.Controls.dll => 0x6b30b64f63600cd8 => 220
	i64 7725404731275645577, ; 346: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 276
	i64 7729023323672879921, ; 347: DnsClient.dll => 0x6b4301c3443b2331 => 178
	i64 7735176074855944702, ; 348: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 349: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 311
	i64 7742555799473854801, ; 350: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 332
	i64 7752363265887618525, ; 351: zh-Hans\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x6b95ed510904c5dd => 374
	i64 7760934865774298505, ; 352: pl\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x6bb46124276bc589 => 399
	i64 7791074099216502080, ; 353: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 354: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 355: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 244
	i64 7868980864444657808, ; 356: Supabase.Realtime.dll => 0x6d343c679191f090 => 228
	i64 7920660704032196801, ; 357: pt-BR\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x6debd6f1e23c08c1 => 402
	i64 7927939710195668715, ; 358: SkiaSharp.Views.Android.dll => 0x6e05b32992ed16eb => 219
	i64 7975724199463739455, ; 359: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 343
	i64 8025517457475554965, ; 360: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 361: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8064050204834738623, ; 362: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 363: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 270
	i64 8085230611270010360, ; 364: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 365: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 366: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8108129031893776750, ; 367: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 334
	i64 8113615946733131500, ; 368: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8167236081217502503, ; 369: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8185542183669246576, ; 370: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 371: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 315
	i64 8218310118835926725, ; 372: zh-Hans\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x720d4d82b736b6c5 => 413
	i64 8219213124972527414, ; 373: tr\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x721082ca37373f36 => 373
	i64 8246048515196606205, ; 374: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 202
	i64 8264926008854159966, ; 375: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8281768536253590100, ; 376: ja\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x72eec09ae366ea54 => 395
	i64 8290740647658429042, ; 377: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8308610922448049511, ; 378: MongoDB.Bson => 0x734e1d9cf1725567 => 212
	i64 8318905602908530212, ; 379: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8358562636959632936, ; 380: ja\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x73ff946ec8d4ce28 => 395
	i64 8368701292315763008, ; 381: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8386351099740279196, ; 382: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 349
	i64 8398329775253868912, ; 383: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 253
	i64 8400357532724379117, ; 384: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 285
	i64 8410671156615598628, ; 385: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 386: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 274
	i64 8518412311883997971, ; 387: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8559794043086654790, ; 388: fr\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x76ca7f5498af4d46 => 387
	i64 8563666267364444763, ; 389: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8598790081731763592, ; 390: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 264
	i64 8601935802264776013, ; 391: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 297
	i64 8623059219396073920, ; 392: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 393: Java.Interop => 0x77b654e585b55834 => 168
	i64 8638972117149407195, ; 394: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 395: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 284
	i64 8648495978913578441, ; 396: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 397: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 339
	i64 8684531736582871431, ; 398: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 399: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8727204506373749864, ; 400: Microsoft.TestPlatform.PlatformAbstractions.dll => 0x791d424284987c68 => 204
	i64 8758604146903086415, ; 401: Supabase.Realtime => 0x798cd011086bf54f => 228
	i64 8853378295825400934, ; 402: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 312
	i64 8892012985579047651, ; 403: ja\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x7b66c6b2cf998ae3 => 363
	i64 8940085421939982114, ; 404: ja\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x7c1190531c617f22 => 394
	i64 8941376889969657626, ; 405: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 406: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 287
	i64 8954753533646919997, ; 407: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 9025199618048112714, ; 408: ja\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x7d3ff33c2cbfb84a => 393
	i64 9031828859052788883, ; 409: de\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x7d57807e9ff68c93 => 355
	i64 9045785047181495996, ; 410: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 349
	i64 9138683372487561558, ; 411: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9274423733644249388, ; 412: zh-Hans\Microsoft.TestPlatform.CoreUtilities.resources => 0x80b55f3f6c51492c => 374
	i64 9312692141327339315, ; 413: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 302
	i64 9324707631942237306, ; 414: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 243
	i64 9363564275759486853, ; 415: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 323
	i64 9367833895579413143, ; 416: Microsoft.TestPlatform.CommunicationUtilities.dll => 0x82013b4b8cdfea97 => 206
	i64 9427266486299436557, ; 417: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 194
	i64 9433493255347078749, ; 418: pt-BR\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x82ea80228c01865d => 369
	i64 9461546124022044683, ; 419: AWSSDK.Core => 0x834e2a12044ed80b => 174
	i64 9468215723722196442, ; 420: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9530086241013453038, ; 421: zh-Hans\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x8441aaf19271d0ee => 411
	i64 9551379474083066910, ; 422: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 347
	i64 9554839972845591462, ; 423: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 424: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 307
	i64 9584643793929893533, ; 425: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9659729154652888475, ; 426: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 427: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 428: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 429: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 254
	i64 9702891218465930390, ; 430: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9717392825338892579, ; 431: pl\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x86db1d4a29411123 => 399
	i64 9773637193738963987, ; 432: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 319
	i64 9780093022148426479, ; 433: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 304
	i64 9808709177481450983, ; 434: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9825649861376906464, ; 435: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 251
	i64 9834056768316610435, ; 436: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 437: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9901358901552137447, ; 438: cs\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x8968b17618aac4e7 => 353
	i64 9907349773706910547, ; 439: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 264
	i64 9916475970990711220, ; 440: de\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x899e665b1a9921b4 => 382
	i64 9933555792566666578, ; 441: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9956195530459977388, ; 442: Microsoft.Maui => 0x8a2b8315b36616ac => 200
	i64 9974604633896246661, ; 443: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 10017511394021241210, ; 444: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 189
	i64 10030245730422138886, ; 445: pl\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x8b3297596bb0a806 => 401
	i64 10038780035334861115, ; 446: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 447: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10078727084704864206, ; 448: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 449: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 450: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 198
	i64 10105485790837105934, ; 451: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 452: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 321
	i64 10172784693937004642, ; 453: ja\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x8d2cfdc80aa56062 => 362
	i64 10209869394718195525, ; 454: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 337
	i64 10226222362177979215, ; 455: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 313
	i64 10229024438826829339, ; 456: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 258
	i64 10236596565285903943, ; 457: tr\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x8e0fb2571ed99e47 => 410
	i64 10236703004850800690, ; 458: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10242742161382113725, ; 459: ru\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x8e2587ba371901bd => 405
	i64 10245369515835430794, ; 460: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10321854143672141184, ; 461: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 310
	i64 10347464889647514442, ; 462: Supabase.Gotrue => 0x8f99947e7144434a => 226
	i64 10360651442923773544, ; 463: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 464: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 465: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 296
	i64 10380555600483482841, ; 466: Maui.FreakyEffects.dll => 0x900f2451f2027cd9 => 179
	i64 10406448008575299332, ; 467: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 316
	i64 10430153318873392755, ; 468: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 255
	i64 10506226065143327199, ; 469: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 319
	i64 10546663366131771576, ; 470: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 471: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 472: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10622622168187877170, ; 473: ja\Microsoft.TestPlatform.CoreUtilities.resources => 0x936b2294b6073732 => 362
	i64 10623836582304434781, ; 474: fr\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x936f7315880e4a5d => 358
	i64 10659268777568624339, ; 475: ko\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x93ed547a5c63ded3 => 365
	i64 10670374202010151210, ; 476: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 477: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10761706286639228993, ; 478: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 351
	i64 10785150219063592792, ; 479: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10822644899632537592, ; 480: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 481: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 482: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 245
	i64 10899834349646441345, ; 483: System.Web => 0x9743fd975946eb81 => 153
	i64 10943875058216066601, ; 484: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 485: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 11002576679268595294, ; 486: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 188
	i64 11009005086950030778, ; 487: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 200
	i64 11019817191295005410, ; 488: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 242
	i64 11023048688141570732, ; 489: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 490: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11071824625609515081, ; 491: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 308
	i64 11073167957374033680, ; 492: fr\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x99abcb96cd845f10 => 359
	i64 11103970607964515343, ; 493: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 330
	i64 11136029745144976707, ; 494: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 306
	i64 11156122287428000958, ; 495: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 345
	i64 11157797727133427779, ; 496: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 326
	i64 11162124722117608902, ; 497: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 301
	i64 11188319605227840848, ; 498: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11220793807500858938, ; 499: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 333
	i64 11226290749488709958, ; 500: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 190
	i64 11235648312900863002, ; 501: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11244247448620239658, ; 502: DnsClient => 0x9c0b977add9a0b2a => 178
	i64 11293139486330765430, ; 503: XAct.Core.PCL => 0x9cb94a8779aec076 => 233
	i64 11329751333533450475, ; 504: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 505: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 257
	i64 11347436699239206956, ; 506: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11392833485892708388, ; 507: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 286
	i64 11432101114902388181, ; 508: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 509: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 510: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11481869442598199266, ; 511: Microcharts.Maui.dll => 0x9f57cb6cab7a5fe2 => 181
	i64 11485890710487134646, ; 512: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11492437505814828710, ; 513: zh-Hant\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x9f7d5705a17816a6 => 415
	i64 11508496261504176197, ; 514: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 267
	i64 11517440453979132662, ; 515: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 192
	i64 11518296021396496455, ; 516: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 331
	i64 11529969570048099689, ; 517: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 301
	i64 11530571088791430846, ; 518: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 187
	i64 11580057168383206117, ; 519: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 240
	i64 11591352189662810718, ; 520: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 294
	i64 11597940890313164233, ; 521: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11601633546924392839, ; 522: Microsoft.TestPlatform.Utilities.dll => 0xa101483e2aaf0187 => 208
	i64 11672361001936329215, ; 523: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 268
	i64 11692977985522001935, ; 524: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11707554492040141440, ; 525: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11743665907891708234, ; 526: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11855031688536399763, ; 527: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 348
	i64 11868377108928577036, ; 528: MimeMapping.dll => 0xa4b4f2196610be0c => 211
	i64 11991047634523762324, ; 529: System.Net => 0xa668c24ad493ae94 => 81
	i64 12040886584167504988, ; 530: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12063623837170009990, ; 531: System.Security => 0xa76a99f6ce740786 => 130
	i64 12086882945695899740, ; 532: pt-BR\Microsoft.TestPlatform.CoreUtilities.resources => 0xa7bd3c0003ee605c => 368
	i64 12088833796337653806, ; 533: cs\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0xa7c42a49d371582e => 353
	i64 12092927421164141420, ; 534: tr\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xa7d2b56b2111bb6c => 410
	i64 12096697103934194533, ; 535: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 536: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 537: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12123222956711050623, ; 538: ru\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xa83e570c2b9f7d7f => 407
	i64 12137774235383566651, ; 539: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 298
	i64 12145679461940342714, ; 540: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12191646537372739477, ; 541: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 234
	i64 12201331334810686224, ; 542: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 543: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12326995185477451607, ; 544: ko\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0xab1248cf5a557f57 => 364
	i64 12332222936682028543, ; 545: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12375446203996702057, ; 546: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12439275739440478309, ; 547: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 193
	i64 12451044538927396471, ; 548: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 266
	i64 12465598750332601897, ; 549: Glucomification => 0xacfeb4049220c629 => 0
	i64 12466513435562512481, ; 550: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 280
	i64 12475113361194491050, ; 551: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 417
	i64 12487638416075308985, ; 552: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 260
	i64 12517810545449516888, ; 553: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 554: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 248
	i64 12550732019250633519, ; 555: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12583435758766487096, ; 556: Microsoft.VisualStudio.TestPlatform.Common.dll => 0xaea1582717397638 => 209
	i64 12629613789220932786, ; 557: es\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0xaf4566d3a4e38cb2 => 357
	i64 12699999919562409296, ; 558: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 559: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 249
	i64 12708238894395270091, ; 560: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 561: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 562: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12753841065332862057, ; 563: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 303
	i64 12808066478489537992, ; 564: Websocket.Client => 0xb1bf649a25f50dc8 => 232
	i64 12828192437253469131, ; 565: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 314
	i64 12835242264250840079, ; 566: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 567: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 191
	i64 12843770487262409629, ; 568: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 569: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12888876061296924636, ; 570: Supabase.Core.dll => 0xb2de7c7d53a397dc => 224
	i64 12982280885948128408, ; 571: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 259
	i64 12989346753972519995, ; 572: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 318
	i64 12990648294856868982, ; 573: pl\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0xb4480dcbf8fa4476 => 367
	i64 13005833372463390146, ; 574: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 339
	i64 13068258254871114833, ; 575: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13099989568376067714, ; 576: zh-Hans\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xb5cc831b1060d682 => 413
	i64 13129914918964716986, ; 577: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 263
	i64 13162308329486800654, ; 578: pt-BR\Microsoft.TestPlatform.CrossPlatEngine.resources => 0xb6a9e9b05339d70e => 403
	i64 13173818576982874404, ; 579: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13310112861600168646, ; 580: Supabase.Storage => 0xb8b70520ac093ac6 => 229
	i64 13319338332334923375, ; 581: Maui.FreakyEffects => 0xb8d7cba4f6111e6f => 179
	i64 13332124879522271362, ; 582: Microsoft.TestPlatform.CrossPlatEngine.dll => 0xb90538f0f9129082 => 207
	i64 13343850469010654401, ; 583: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 584: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 585: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 327
	i64 13401370062847626945, ; 586: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 298
	i64 13404347523447273790, ; 587: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 253
	i64 13418404731555841257, ; 588: MongoDB.Driver.Core => 0xba37c00274ce84e9 => 214
	i64 13431476299110033919, ; 589: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13447930857737371653, ; 590: Microsoft.TestPlatform.CoreUtilities.dll => 0xbaa0a5dd6b734005 => 203
	i64 13454009404024712428, ; 591: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 309
	i64 13458502671294772007, ; 592: de\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xbac634df932bb327 => 381
	i64 13463706743370286408, ; 593: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 594: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 311
	i64 13491513212026656886, ; 595: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 246
	i64 13540124433173649601, ; 596: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 348
	i64 13572454107664307259, ; 597: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 288
	i64 13578472628727169633, ; 598: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 599: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 600: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 259
	i64 13647894001087880694, ; 601: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13664641607527540181, ; 602: MongoDB.Libmongocrypt => 0xbda28f24c7b3a5d5 => 215
	i64 13675589307506966157, ; 603: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 239
	i64 13702626353344114072, ; 604: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 605: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 606: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 607: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13768883594457632599, ; 608: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13828521679616088467, ; 609: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 312
	i64 13881226289574188012, ; 610: ko\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xc0a405c3b4e213ec => 398
	i64 13881769479078963060, ; 611: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13911222732217019342, ; 612: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13928444506500929300, ; 613: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13959074834287824816, ; 614: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 266
	i64 13977061573113476558, ; 615: Microsoft.VisualStudio.TestPlatform.ObjectModel.dll => 0xc1f87f727530f5ce => 205
	i64 13979187680923934585, ; 616: tr\Microsoft.TestPlatform.CoreUtilities.resources => 0xc2000d2181fcdf79 => 372
	i64 14075334701871371868, ; 617: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14124974489674258913, ; 618: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 248
	i64 14125464355221830302, ; 619: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14178052285788134900, ; 620: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 235
	i64 14212104595480609394, ; 621: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 622: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 623: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 624: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14250888582875222668, ; 625: cs\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xc5c553a963f2928c => 380
	i64 14254574811015963973, ; 626: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 627: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 286
	i64 14298246716367104064, ; 628: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 629: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 630: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14331727281556788554, ; 631: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 236
	i64 14346402571976470310, ; 632: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14349907877893689639, ; 633: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 341
	i64 14461014870687870182, ; 634: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 635: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 342
	i64 14486659737292545672, ; 636: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 271
	i64 14491877563792607819, ; 637: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 350
	i64 14495724990987328804, ; 638: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 289
	i64 14540296873554490412, ; 639: ko\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0xc9c982f7fcf0342c => 397
	i64 14551742072151931844, ; 640: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14552901170081803662, ; 641: SkiaSharp.Views.Maui.Core => 0xc9f64a827617ad8e => 221
	i64 14561513370130550166, ; 642: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14573961554188510889, ; 643: fr\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xca411cd13f9b26a9 => 389
	i64 14574160591280636898, ; 644: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14610046442689856844, ; 645: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 320
	i64 14622043554576106986, ; 646: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14625816794512409936, ; 647: Supabase.Gotrue.dll => 0xcaf956e23adac550 => 226
	i64 14644440854989303794, ; 648: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 281
	i64 14669215534098758659, ; 649: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 185
	i64 14690985099581930927, ; 650: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 651: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 334
	i64 14735017007120366644, ; 652: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 333
	i64 14744092281598614090, ; 653: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 350
	i64 14744453227118192070, ; 654: MimeMapping => 0xcc9ed21731bde5c6 => 211
	i64 14792063746108907174, ; 655: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 309
	i64 14819054087695749454, ; 656: SharpCompress.dll => 0xcda7db2d9467d14e => 217
	i64 14832630590065248058, ; 657: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14840837531691867048, ; 658: pt-BR\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xcdf53f1addc75ba8 => 404
	i64 14852515768018889994, ; 659: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 257
	i64 14865527528615483191, ; 660: ko\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0xce4cf686bdea9737 => 365
	i64 14889905118082851278, ; 661: GoogleGson.dll => 0xcea391d0969961ce => 180
	i64 14904040806490515477, ; 662: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 318
	i64 14910051242480515446, ; 663: Microsoft.Practices.ServiceLocation.dll => 0xceeb249bb2ec3976 => 177
	i64 14912225920358050525, ; 664: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 665: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 666: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 186
	i64 14984936317414011727, ; 667: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 668: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 669: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 260
	i64 15015154896917945444, ; 670: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 671: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15071021337266399595, ; 672: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 673: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15111608613780139878, ; 674: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 335
	i64 15114941322287144814, ; 675: pt-BR\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xd1c30f0cdbcc5f6e => 404
	i64 15115185479366240210, ; 676: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15129078151567169327, ; 677: Glucomification.dll => 0xd1f5486beb48d72f => 0
	i64 15133485256822086103, ; 678: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15138356091203993725, ; 679: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 192
	i64 15150743910298169673, ; 680: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 287
	i64 15154054061132759083, ; 681: Supabase => 0xd24e03e104e2402b => 223
	i64 15203009853192377507, ; 682: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 340
	i64 15215108431144787653, ; 683: ko\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xd326ec81496f9ec5 => 396
	i64 15227001540531775957, ; 684: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 184
	i64 15234786388537674379, ; 685: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 686: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 687: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 250
	i64 15279429628684179188, ; 688: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 315
	i64 15299439993936780255, ; 689: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15336207514779943596, ; 690: fr\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0xd4d5277ae02282ac => 388
	i64 15338463749992804988, ; 691: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15346856666220527370, ; 692: tr\Microsoft.TestPlatform.CrossPlatEngine.resources => 0xd4fafcd3a8e8ff0a => 409
	i64 15370334346939861994, ; 693: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 255
	i64 15391712275433856905, ; 694: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 186
	i64 15475341621120354588, ; 695: tr\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0xd6c3753668b2491c => 372
	i64 15526743539506359484, ; 696: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 697: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 698: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 699: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 322
	i64 15541854775306130054, ; 700: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 701: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15582737692548360875, ; 702: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 279
	i64 15609085926864131306, ; 703: System.dll => 0xd89e9cf3334914ea => 164
	i64 15661133872274321916, ; 704: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15710114879900314733, ; 705: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15755368083429170162, ; 706: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 707: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 293
	i64 15783653065526199428, ; 708: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 323
	i64 15817206913877585035, ; 709: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15847085070278954535, ; 710: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15885744048853936810, ; 711: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15890926625037132090, ; 712: tr\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xdc87e9925d22a13a => 408
	i64 15928521404965645318, ; 713: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 197
	i64 15934062614519587357, ; 714: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 715: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15942979176950631493, ; 716: MongoDB.Driver.Core.dll => 0xdd40d71787978c45 => 214
	i64 15963349826457351533, ; 717: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15971679995444160383, ; 718: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 719: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16054465462676478687, ; 720: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16056281320585338352, ; 721: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 342
	i64 16154507427712707110, ; 722: System => 0xe03056ea4e39aa26 => 164
	i64 16178945028308640265, ; 723: it\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xe08728c894e8a209 => 392
	i64 16219561732052121626, ; 724: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16288847719894691167, ; 725: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 336
	i64 16315482530584035869, ; 726: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 727: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 188
	i64 16324796876805858114, ; 728: SkiaSharp.dll => 0xe28d5444586b6342 => 218
	i64 16328914084158521434, ; 729: it\Microsoft.TestPlatform.CrossPlatEngine.resources => 0xe29bf4d86224405a => 391
	i64 16331030441871676004, ; 730: de\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xe2a379a94fda1264 => 383
	i64 16337011941688632206, ; 731: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16361933716545543812, ; 732: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 265
	i64 16423015068819898779, ; 733: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 314
	i64 16442365378858692411, ; 734: Snappier.dll => 0xe42f04325a0daf3b => 222
	i64 16454459195343277943, ; 735: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16496768397145114574, ; 736: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16589693266713801121, ; 737: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 278
	i64 16621146507174665210, ; 738: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 252
	i64 16649148416072044166, ; 739: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 202
	i64 16677317093839702854, ; 740: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 285
	i64 16702652415771857902, ; 741: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 742: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 743: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16758309481308491337, ; 744: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 745: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 746: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16803648858859583026, ; 747: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 335
	i64 16822611501064131242, ; 748: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 749: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 750: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16865005275003574711, ; 751: es\Microsoft.TestPlatform.CommunicationUtilities.resources => 0xea0c88f167ad59b7 => 384
	i64 16890310621557459193, ; 752: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16898105457700624756, ; 753: es\Microsoft.TestPlatform.CrossPlatEngine.resources => 0xea8221623f55d974 => 385
	i64 16933958494752847024, ; 754: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 755: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 343
	i64 16970469619770477956, ; 756: zh-Hans\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0xeb833834adfa4d84 => 375
	i64 16977952268158210142, ; 757: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 758: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 278
	i64 16990511923927238273, ; 759: es\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xebca6c9341b8c681 => 386
	i64 16998075588627545693, ; 760: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 283
	i64 17008137082415910100, ; 761: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 762: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 241
	i64 17031351772568316411, ; 763: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 282
	i64 17037200463775726619, ; 764: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 269
	i64 17062143951396181894, ; 765: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17087678693691554459, ; 766: de\Microsoft.TestPlatform.CrossPlatEngine.resources => 0xed23a13ccd7efa9b => 382
	i64 17111680674646691228, ; 767: pt-BR\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0xed78e6e97a3b8d9c => 369
	i64 17118171214553292978, ; 768: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17137864900836977098, ; 769: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 195
	i64 17154287038065938077, ; 770: AWSSDK.SecurityToken => 0xee10452c7f020e9d => 175
	i64 17169790565222164104, ; 771: ko\Microsoft.TestPlatform.CoreUtilities.resources => 0xee47598cb3eba688 => 364
	i64 17176940277450956538, ; 772: cs\Microsoft.TestPlatform.CoreUtilities.resources => 0xee60c02ccd905efa => 352
	i64 17179789585722495361, ; 773: AWSSDK.SecurityToken.dll => 0xee6adf9b14f1d181 => 175
	i64 17187273293601214786, ; 774: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 775: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 776: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17203614576212522419, ; 777: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 338
	i64 17230721278011714856, ; 778: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 779: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17234616483251655377, ; 780: zh-Hans\Microsoft.TestPlatform.CommunicationUtilities.resources => 0xef2da860ec4e92d1 => 411
	i64 17260702271250283638, ; 781: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17310278548634113468, ; 782: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 328
	i64 17333249706306540043, ; 783: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 784: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 785: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 328
	i64 17344678509612454043, ; 786: it\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xf0b4ad355ccd509b => 390
	i64 17360349973592121190, ; 787: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 307
	i64 17470386307322966175, ; 788: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17509662556995089465, ; 789: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 790: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 326
	i64 17522591619082469157, ; 791: GoogleGson => 0xf32cc03d27a5bf25 => 180
	i64 17576078694130054946, ; 792: Supabase.dll => 0xf3eac67343eef722 => 223
	i64 17590473451926037903, ; 793: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 234
	i64 17608862831326185980, ; 794: Microsoft.IO.RecyclableMemoryStream.dll => 0xf45f3f7307c6c9fc => 196
	i64 17614600256232167694, ; 795: zh-Hant\Microsoft.TestPlatform.CoreUtilities.resources => 0xf473a19b5d39190e => 376
	i64 17623389608345532001, ; 796: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 338
	i64 17627500474728259406, ; 797: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17630110890370250853, ; 798: pt-BR\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xf4aabc724b43b865 => 402
	i64 17671790519499593115, ; 799: SkiaSharp.Views.Android => 0xf53ecfd92be3959b => 219
	i64 17685921127322830888, ; 800: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17704177640604968747, ; 801: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 280
	i64 17710060891934109755, ; 802: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 277
	i64 17712670374920797664, ; 803: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17725622694045212979, ; 804: ru\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0xf5fe0fed052ae133 => 406
	i64 17777860260071588075, ; 805: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17790600151040787804, ; 806: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 194
	i64 17827813215687577648, ; 807: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 329
	i64 17838668724098252521, ; 808: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 809: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 310
	i64 17928294245072900555, ; 810: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17942426894774770628, ; 811: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 322
	i64 17945899804122884383, ; 812: ru\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xf90ca4ca577f291f => 405
	i64 17958341848870185232, ; 813: Microsoft.IO.RecyclableMemoryStream => 0xf938d8c3a0f06910 => 196
	i64 17979120673405951447, ; 814: ZstdSharp => 0xf982aafeb83e5dd7 => 317
	i64 17992315986609351877, ; 815: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18025913125965088385, ; 816: System.Threading => 0xfa28e87b91334681 => 148
	i64 18028992993990630806, ; 817: it\Microsoft.TestPlatform.CoreUtilities.resources => 0xfa33d99b38d15d96 => 360
	i64 18099689198537119569, ; 818: Supabase.Functions => 0xfb2f036e07c79751 => 225
	i64 18116111925905154859, ; 819: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 246
	i64 18121036031235206392, ; 820: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 282
	i64 18146411883821974900, ; 821: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 822: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18225059387460068507, ; 823: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18226465428055663763, ; 824: Supabase.Core => 0xfcf169bd26322493 => 224
	i64 18245806341561545090, ; 825: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18250058964007765534, ; 826: es\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0xfd453bef4f9dc61e => 385
	i64 18260797123374478311, ; 827: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 263
	i64 18305135509493619199, ; 828: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 284
	i64 18318849532986632368, ; 829: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 830: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 332
	i64 18342408478508122430, ; 831: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 331
	i64 18358161419737137786, ; 832: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 327
	i64 18380184030268848184, ; 833: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 300
	i64 18417063591209321014, ; 834: zh-Hant\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xff968dc227cfc236 => 416
	i64 18439108438687598470 ; 835: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [836 x i32] [
	i32 262, ; 0
	i32 392, ; 1
	i32 191, ; 2
	i32 171, ; 3
	i32 201, ; 4
	i32 58, ; 5
	i32 378, ; 6
	i32 249, ; 7
	i32 181, ; 8
	i32 151, ; 9
	i32 290, ; 10
	i32 293, ; 11
	i32 256, ; 12
	i32 208, ; 13
	i32 173, ; 14
	i32 132, ; 15
	i32 386, ; 16
	i32 354, ; 17
	i32 390, ; 18
	i32 408, ; 19
	i32 56, ; 20
	i32 292, ; 21
	i32 231, ; 22
	i32 317, ; 23
	i32 398, ; 24
	i32 95, ; 25
	i32 203, ; 26
	i32 275, ; 27
	i32 129, ; 28
	i32 379, ; 29
	i32 363, ; 30
	i32 145, ; 31
	i32 250, ; 32
	i32 18, ; 33
	i32 177, ; 34
	i32 330, ; 35
	i32 261, ; 36
	i32 276, ; 37
	i32 150, ; 38
	i32 104, ; 39
	i32 360, ; 40
	i32 383, ; 41
	i32 95, ; 42
	i32 233, ; 43
	i32 210, ; 44
	i32 305, ; 45
	i32 389, ; 46
	i32 370, ; 47
	i32 400, ; 48
	i32 36, ; 49
	i32 28, ; 50
	i32 245, ; 51
	i32 283, ; 52
	i32 50, ; 53
	i32 115, ; 54
	i32 367, ; 55
	i32 70, ; 56
	i32 198, ; 57
	i32 65, ; 58
	i32 182, ; 59
	i32 170, ; 60
	i32 145, ; 61
	i32 373, ; 62
	i32 304, ; 63
	i32 361, ; 64
	i32 244, ; 65
	i32 415, ; 66
	i32 279, ; 67
	i32 269, ; 68
	i32 40, ; 69
	i32 89, ; 70
	i32 81, ; 71
	i32 416, ; 72
	i32 352, ; 73
	i32 216, ; 74
	i32 66, ; 75
	i32 62, ; 76
	i32 86, ; 77
	i32 243, ; 78
	i32 106, ; 79
	i32 324, ; 80
	i32 290, ; 81
	i32 354, ; 82
	i32 102, ; 83
	i32 35, ; 84
	i32 240, ; 85
	i32 346, ; 86
	i32 292, ; 87
	i32 368, ; 88
	i32 397, ; 89
	i32 199, ; 90
	i32 376, ; 91
	i32 119, ; 92
	i32 277, ; 93
	i32 142, ; 94
	i32 141, ; 95
	i32 313, ; 96
	i32 53, ; 97
	i32 35, ; 98
	i32 141, ; 99
	i32 366, ; 100
	i32 216, ; 101
	i32 225, ; 102
	i32 237, ; 103
	i32 247, ; 104
	i32 189, ; 105
	i32 261, ; 106
	i32 8, ; 107
	i32 14, ; 108
	i32 289, ; 109
	i32 381, ; 110
	i32 51, ; 111
	i32 272, ; 112
	i32 136, ; 113
	i32 101, ; 114
	i32 174, ; 115
	i32 384, ; 116
	i32 254, ; 117
	i32 299, ; 118
	i32 116, ; 119
	i32 209, ; 120
	i32 238, ; 121
	i32 163, ; 122
	i32 345, ; 123
	i32 195, ; 124
	i32 166, ; 125
	i32 67, ; 126
	i32 358, ; 127
	i32 185, ; 128
	i32 320, ; 129
	i32 80, ; 130
	i32 101, ; 131
	i32 294, ; 132
	i32 193, ; 133
	i32 117, ; 134
	i32 414, ; 135
	i32 325, ; 136
	i32 306, ; 137
	i32 232, ; 138
	i32 78, ; 139
	i32 305, ; 140
	i32 114, ; 141
	i32 121, ; 142
	i32 48, ; 143
	i32 176, ; 144
	i32 371, ; 145
	i32 210, ; 146
	i32 128, ; 147
	i32 270, ; 148
	i32 241, ; 149
	i32 82, ; 150
	i32 110, ; 151
	i32 75, ; 152
	i32 316, ; 153
	i32 230, ; 154
	i32 220, ; 155
	i32 201, ; 156
	i32 53, ; 157
	i32 296, ; 158
	i32 183, ; 159
	i32 69, ; 160
	i32 295, ; 161
	i32 83, ; 162
	i32 172, ; 163
	i32 340, ; 164
	i32 116, ; 165
	i32 184, ; 166
	i32 156, ; 167
	i32 183, ; 168
	i32 235, ; 169
	i32 167, ; 170
	i32 288, ; 171
	i32 262, ; 172
	i32 187, ; 173
	i32 32, ; 174
	i32 199, ; 175
	i32 122, ; 176
	i32 72, ; 177
	i32 62, ; 178
	i32 161, ; 179
	i32 113, ; 180
	i32 321, ; 181
	i32 88, ; 182
	i32 197, ; 183
	i32 173, ; 184
	i32 227, ; 185
	i32 393, ; 186
	i32 351, ; 187
	i32 105, ; 188
	i32 18, ; 189
	i32 146, ; 190
	i32 118, ; 191
	i32 213, ; 192
	i32 58, ; 193
	i32 256, ; 194
	i32 17, ; 195
	i32 52, ; 196
	i32 92, ; 197
	i32 346, ; 198
	i32 55, ; 199
	i32 129, ; 200
	i32 396, ; 201
	i32 356, ; 202
	i32 152, ; 203
	i32 41, ; 204
	i32 92, ; 205
	i32 182, ; 206
	i32 388, ; 207
	i32 300, ; 208
	i32 50, ; 209
	i32 356, ; 210
	i32 162, ; 211
	i32 13, ; 212
	i32 274, ; 213
	i32 238, ; 214
	i32 295, ; 215
	i32 36, ; 216
	i32 67, ; 217
	i32 109, ; 218
	i32 336, ; 219
	i32 176, ; 220
	i32 213, ; 221
	i32 344, ; 222
	i32 239, ; 223
	i32 99, ; 224
	i32 99, ; 225
	i32 11, ; 226
	i32 11, ; 227
	i32 281, ; 228
	i32 25, ; 229
	i32 406, ; 230
	i32 128, ; 231
	i32 76, ; 232
	i32 273, ; 233
	i32 109, ; 234
	i32 299, ; 235
	i32 222, ; 236
	i32 297, ; 237
	i32 205, ; 238
	i32 106, ; 239
	i32 2, ; 240
	i32 26, ; 241
	i32 215, ; 242
	i32 252, ; 243
	i32 157, ; 244
	i32 344, ; 245
	i32 207, ; 246
	i32 21, ; 247
	i32 347, ; 248
	i32 49, ; 249
	i32 43, ; 250
	i32 126, ; 251
	i32 242, ; 252
	i32 59, ; 253
	i32 119, ; 254
	i32 302, ; 255
	i32 265, ; 256
	i32 229, ; 257
	i32 251, ; 258
	i32 3, ; 259
	i32 271, ; 260
	i32 291, ; 261
	i32 38, ; 262
	i32 124, ; 263
	i32 291, ; 264
	i32 375, ; 265
	i32 341, ; 266
	i32 137, ; 267
	i32 149, ; 268
	i32 377, ; 269
	i32 85, ; 270
	i32 90, ; 271
	i32 324, ; 272
	i32 275, ; 273
	i32 357, ; 274
	i32 417, ; 275
	i32 272, ; 276
	i32 325, ; 277
	i32 217, ; 278
	i32 329, ; 279
	i32 247, ; 280
	i32 379, ; 281
	i32 258, ; 282
	i32 303, ; 283
	i32 190, ; 284
	i32 401, ; 285
	i32 308, ; 286
	i32 273, ; 287
	i32 359, ; 288
	i32 133, ; 289
	i32 387, ; 290
	i32 400, ; 291
	i32 218, ; 292
	i32 378, ; 293
	i32 96, ; 294
	i32 380, ; 295
	i32 206, ; 296
	i32 227, ; 297
	i32 3, ; 298
	i32 337, ; 299
	i32 105, ; 300
	i32 33, ; 301
	i32 154, ; 302
	i32 409, ; 303
	i32 158, ; 304
	i32 412, ; 305
	i32 155, ; 306
	i32 82, ; 307
	i32 414, ; 308
	i32 412, ; 309
	i32 267, ; 310
	i32 394, ; 311
	i32 377, ; 312
	i32 143, ; 313
	i32 87, ; 314
	i32 19, ; 315
	i32 268, ; 316
	i32 51, ; 317
	i32 371, ; 318
	i32 204, ; 319
	i32 407, ; 320
	i32 391, ; 321
	i32 237, ; 322
	i32 212, ; 323
	i32 370, ; 324
	i32 61, ; 325
	i32 355, ; 326
	i32 54, ; 327
	i32 221, ; 328
	i32 4, ; 329
	i32 361, ; 330
	i32 97, ; 331
	i32 236, ; 332
	i32 17, ; 333
	i32 155, ; 334
	i32 84, ; 335
	i32 230, ; 336
	i32 366, ; 337
	i32 403, ; 338
	i32 29, ; 339
	i32 231, ; 340
	i32 45, ; 341
	i32 64, ; 342
	i32 66, ; 343
	i32 172, ; 344
	i32 220, ; 345
	i32 276, ; 346
	i32 178, ; 347
	i32 1, ; 348
	i32 311, ; 349
	i32 332, ; 350
	i32 374, ; 351
	i32 399, ; 352
	i32 47, ; 353
	i32 24, ; 354
	i32 244, ; 355
	i32 228, ; 356
	i32 402, ; 357
	i32 219, ; 358
	i32 343, ; 359
	i32 165, ; 360
	i32 108, ; 361
	i32 12, ; 362
	i32 270, ; 363
	i32 63, ; 364
	i32 27, ; 365
	i32 23, ; 366
	i32 334, ; 367
	i32 93, ; 368
	i32 168, ; 369
	i32 12, ; 370
	i32 315, ; 371
	i32 413, ; 372
	i32 373, ; 373
	i32 202, ; 374
	i32 29, ; 375
	i32 395, ; 376
	i32 103, ; 377
	i32 212, ; 378
	i32 14, ; 379
	i32 395, ; 380
	i32 126, ; 381
	i32 349, ; 382
	i32 253, ; 383
	i32 285, ; 384
	i32 91, ; 385
	i32 274, ; 386
	i32 9, ; 387
	i32 387, ; 388
	i32 86, ; 389
	i32 264, ; 390
	i32 297, ; 391
	i32 71, ; 392
	i32 168, ; 393
	i32 1, ; 394
	i32 284, ; 395
	i32 5, ; 396
	i32 339, ; 397
	i32 44, ; 398
	i32 27, ; 399
	i32 204, ; 400
	i32 228, ; 401
	i32 312, ; 402
	i32 363, ; 403
	i32 394, ; 404
	i32 158, ; 405
	i32 287, ; 406
	i32 112, ; 407
	i32 393, ; 408
	i32 355, ; 409
	i32 349, ; 410
	i32 121, ; 411
	i32 374, ; 412
	i32 302, ; 413
	i32 243, ; 414
	i32 323, ; 415
	i32 206, ; 416
	i32 194, ; 417
	i32 369, ; 418
	i32 174, ; 419
	i32 159, ; 420
	i32 411, ; 421
	i32 347, ; 422
	i32 131, ; 423
	i32 307, ; 424
	i32 57, ; 425
	i32 138, ; 426
	i32 83, ; 427
	i32 30, ; 428
	i32 254, ; 429
	i32 10, ; 430
	i32 399, ; 431
	i32 319, ; 432
	i32 304, ; 433
	i32 171, ; 434
	i32 251, ; 435
	i32 150, ; 436
	i32 94, ; 437
	i32 353, ; 438
	i32 264, ; 439
	i32 382, ; 440
	i32 60, ; 441
	i32 200, ; 442
	i32 157, ; 443
	i32 189, ; 444
	i32 401, ; 445
	i32 64, ; 446
	i32 88, ; 447
	i32 79, ; 448
	i32 47, ; 449
	i32 198, ; 450
	i32 143, ; 451
	i32 321, ; 452
	i32 362, ; 453
	i32 337, ; 454
	i32 313, ; 455
	i32 258, ; 456
	i32 410, ; 457
	i32 74, ; 458
	i32 405, ; 459
	i32 91, ; 460
	i32 310, ; 461
	i32 226, ; 462
	i32 135, ; 463
	i32 90, ; 464
	i32 296, ; 465
	i32 179, ; 466
	i32 316, ; 467
	i32 255, ; 468
	i32 319, ; 469
	i32 112, ; 470
	i32 42, ; 471
	i32 159, ; 472
	i32 362, ; 473
	i32 358, ; 474
	i32 365, ; 475
	i32 4, ; 476
	i32 103, ; 477
	i32 351, ; 478
	i32 70, ; 479
	i32 60, ; 480
	i32 39, ; 481
	i32 245, ; 482
	i32 153, ; 483
	i32 56, ; 484
	i32 34, ; 485
	i32 188, ; 486
	i32 200, ; 487
	i32 242, ; 488
	i32 21, ; 489
	i32 163, ; 490
	i32 308, ; 491
	i32 359, ; 492
	i32 330, ; 493
	i32 306, ; 494
	i32 345, ; 495
	i32 326, ; 496
	i32 301, ; 497
	i32 140, ; 498
	i32 333, ; 499
	i32 190, ; 500
	i32 89, ; 501
	i32 178, ; 502
	i32 233, ; 503
	i32 147, ; 504
	i32 257, ; 505
	i32 162, ; 506
	i32 286, ; 507
	i32 6, ; 508
	i32 169, ; 509
	i32 31, ; 510
	i32 181, ; 511
	i32 107, ; 512
	i32 415, ; 513
	i32 267, ; 514
	i32 192, ; 515
	i32 331, ; 516
	i32 301, ; 517
	i32 187, ; 518
	i32 240, ; 519
	i32 294, ; 520
	i32 167, ; 521
	i32 208, ; 522
	i32 268, ; 523
	i32 140, ; 524
	i32 59, ; 525
	i32 144, ; 526
	i32 348, ; 527
	i32 211, ; 528
	i32 81, ; 529
	i32 74, ; 530
	i32 130, ; 531
	i32 368, ; 532
	i32 353, ; 533
	i32 410, ; 534
	i32 25, ; 535
	i32 7, ; 536
	i32 93, ; 537
	i32 407, ; 538
	i32 298, ; 539
	i32 137, ; 540
	i32 234, ; 541
	i32 113, ; 542
	i32 9, ; 543
	i32 364, ; 544
	i32 104, ; 545
	i32 19, ; 546
	i32 193, ; 547
	i32 266, ; 548
	i32 0, ; 549
	i32 280, ; 550
	i32 417, ; 551
	i32 260, ; 552
	i32 33, ; 553
	i32 248, ; 554
	i32 46, ; 555
	i32 209, ; 556
	i32 357, ; 557
	i32 30, ; 558
	i32 249, ; 559
	i32 57, ; 560
	i32 134, ; 561
	i32 114, ; 562
	i32 303, ; 563
	i32 232, ; 564
	i32 314, ; 565
	i32 55, ; 566
	i32 191, ; 567
	i32 6, ; 568
	i32 77, ; 569
	i32 224, ; 570
	i32 259, ; 571
	i32 318, ; 572
	i32 367, ; 573
	i32 339, ; 574
	i32 111, ; 575
	i32 413, ; 576
	i32 263, ; 577
	i32 403, ; 578
	i32 102, ; 579
	i32 229, ; 580
	i32 179, ; 581
	i32 207, ; 582
	i32 170, ; 583
	i32 115, ; 584
	i32 327, ; 585
	i32 298, ; 586
	i32 253, ; 587
	i32 214, ; 588
	i32 76, ; 589
	i32 203, ; 590
	i32 309, ; 591
	i32 381, ; 592
	i32 85, ; 593
	i32 311, ; 594
	i32 246, ; 595
	i32 348, ; 596
	i32 288, ; 597
	i32 160, ; 598
	i32 2, ; 599
	i32 259, ; 600
	i32 24, ; 601
	i32 215, ; 602
	i32 239, ; 603
	i32 32, ; 604
	i32 117, ; 605
	i32 37, ; 606
	i32 16, ; 607
	i32 52, ; 608
	i32 312, ; 609
	i32 398, ; 610
	i32 20, ; 611
	i32 123, ; 612
	i32 154, ; 613
	i32 266, ; 614
	i32 205, ; 615
	i32 372, ; 616
	i32 131, ; 617
	i32 248, ; 618
	i32 148, ; 619
	i32 235, ; 620
	i32 120, ; 621
	i32 28, ; 622
	i32 132, ; 623
	i32 100, ; 624
	i32 380, ; 625
	i32 134, ; 626
	i32 286, ; 627
	i32 153, ; 628
	i32 97, ; 629
	i32 125, ; 630
	i32 236, ; 631
	i32 69, ; 632
	i32 341, ; 633
	i32 72, ; 634
	i32 342, ; 635
	i32 271, ; 636
	i32 350, ; 637
	i32 289, ; 638
	i32 397, ; 639
	i32 136, ; 640
	i32 221, ; 641
	i32 124, ; 642
	i32 389, ; 643
	i32 71, ; 644
	i32 320, ; 645
	i32 111, ; 646
	i32 226, ; 647
	i32 281, ; 648
	i32 185, ; 649
	i32 152, ; 650
	i32 334, ; 651
	i32 333, ; 652
	i32 350, ; 653
	i32 211, ; 654
	i32 309, ; 655
	i32 217, ; 656
	i32 118, ; 657
	i32 404, ; 658
	i32 257, ; 659
	i32 365, ; 660
	i32 180, ; 661
	i32 318, ; 662
	i32 177, ; 663
	i32 127, ; 664
	i32 133, ; 665
	i32 186, ; 666
	i32 77, ; 667
	i32 46, ; 668
	i32 260, ; 669
	i32 73, ; 670
	i32 63, ; 671
	i32 98, ; 672
	i32 84, ; 673
	i32 335, ; 674
	i32 404, ; 675
	i32 43, ; 676
	i32 0, ; 677
	i32 61, ; 678
	i32 192, ; 679
	i32 287, ; 680
	i32 223, ; 681
	i32 340, ; 682
	i32 396, ; 683
	i32 184, ; 684
	i32 37, ; 685
	i32 40, ; 686
	i32 250, ; 687
	i32 315, ; 688
	i32 160, ; 689
	i32 388, ; 690
	i32 98, ; 691
	i32 409, ; 692
	i32 255, ; 693
	i32 186, ; 694
	i32 372, ; 695
	i32 135, ; 696
	i32 20, ; 697
	i32 65, ; 698
	i32 322, ; 699
	i32 125, ; 700
	i32 75, ; 701
	i32 279, ; 702
	i32 164, ; 703
	i32 156, ; 704
	i32 5, ; 705
	i32 49, ; 706
	i32 293, ; 707
	i32 323, ; 708
	i32 144, ; 709
	i32 139, ; 710
	i32 100, ; 711
	i32 408, ; 712
	i32 197, ; 713
	i32 123, ; 714
	i32 120, ; 715
	i32 214, ; 716
	i32 142, ; 717
	i32 39, ; 718
	i32 68, ; 719
	i32 41, ; 720
	i32 342, ; 721
	i32 164, ; 722
	i32 392, ; 723
	i32 73, ; 724
	i32 336, ; 725
	i32 165, ; 726
	i32 188, ; 727
	i32 218, ; 728
	i32 391, ; 729
	i32 383, ; 730
	i32 127, ; 731
	i32 265, ; 732
	i32 314, ; 733
	i32 222, ; 734
	i32 68, ; 735
	i32 169, ; 736
	i32 278, ; 737
	i32 252, ; 738
	i32 202, ; 739
	i32 285, ; 740
	i32 151, ; 741
	i32 45, ; 742
	i32 108, ; 743
	i32 48, ; 744
	i32 96, ; 745
	i32 31, ; 746
	i32 335, ; 747
	i32 23, ; 748
	i32 166, ; 749
	i32 22, ; 750
	i32 384, ; 751
	i32 138, ; 752
	i32 385, ; 753
	i32 78, ; 754
	i32 343, ; 755
	i32 375, ; 756
	i32 54, ; 757
	i32 278, ; 758
	i32 386, ; 759
	i32 283, ; 760
	i32 10, ; 761
	i32 241, ; 762
	i32 282, ; 763
	i32 269, ; 764
	i32 16, ; 765
	i32 382, ; 766
	i32 369, ; 767
	i32 139, ; 768
	i32 195, ; 769
	i32 175, ; 770
	i32 364, ; 771
	i32 352, ; 772
	i32 175, ; 773
	i32 13, ; 774
	i32 15, ; 775
	i32 122, ; 776
	i32 338, ; 777
	i32 87, ; 778
	i32 149, ; 779
	i32 411, ; 780
	i32 22, ; 781
	i32 328, ; 782
	i32 34, ; 783
	i32 79, ; 784
	i32 328, ; 785
	i32 390, ; 786
	i32 307, ; 787
	i32 147, ; 788
	i32 80, ; 789
	i32 326, ; 790
	i32 180, ; 791
	i32 223, ; 792
	i32 234, ; 793
	i32 196, ; 794
	i32 376, ; 795
	i32 338, ; 796
	i32 42, ; 797
	i32 402, ; 798
	i32 219, ; 799
	i32 26, ; 800
	i32 280, ; 801
	i32 277, ; 802
	i32 107, ; 803
	i32 406, ; 804
	i32 110, ; 805
	i32 194, ; 806
	i32 329, ; 807
	i32 7, ; 808
	i32 310, ; 809
	i32 44, ; 810
	i32 322, ; 811
	i32 405, ; 812
	i32 196, ; 813
	i32 317, ; 814
	i32 161, ; 815
	i32 148, ; 816
	i32 360, ; 817
	i32 225, ; 818
	i32 246, ; 819
	i32 282, ; 820
	i32 38, ; 821
	i32 15, ; 822
	i32 146, ; 823
	i32 224, ; 824
	i32 8, ; 825
	i32 385, ; 826
	i32 263, ; 827
	i32 284, ; 828
	i32 130, ; 829
	i32 332, ; 830
	i32 331, ; 831
	i32 327, ; 832
	i32 300, ; 833
	i32 416, ; 834
	i32 94 ; 835
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
