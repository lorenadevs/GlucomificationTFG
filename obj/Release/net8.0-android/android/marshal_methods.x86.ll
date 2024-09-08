; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [418 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [836 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 20582070, ; 3: it\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x13a0eb6 => 382
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 275
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 309
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 7: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 318
	i32 39109920, ; 8: Newtonsoft.Json.dll => 0x254c520 => 216
	i32 39485524, ; 9: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 10: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 327
	i32 42639949, ; 11: System.Threading.Thread => 0x28aa24d => 145
	i32 57974484, ; 12: ko\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x3749ed4 => 371
	i32 66541672, ; 13: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 14: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 351
	i32 68219467, ; 15: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 16: Microsoft.Maui.Graphics.dll => 0x44bb714 => 202
	i32 82292897, ; 17: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 18: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 335
	i32 95598293, ; 19: Supabase.dll => 0x5b2b6d5 => 223
	i32 101534019, ; 20: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 293
	i32 102064928, ; 21: zh-Hans\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x6156320 => 376
	i32 117431740, ; 22: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 23: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 293
	i32 122350210, ; 24: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 123423881, ; 25: de\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x75b4c89 => 379
	i32 128889585, ; 26: pt-BR\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x7aeb2f1 => 373
	i32 134690465, ; 27: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 313
	i32 136584136, ; 28: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 350
	i32 140062828, ; 29: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 343
	i32 142721839, ; 30: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 143804574, ; 31: pl\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x892489e => 398
	i32 149972175, ; 32: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 155357089, ; 33: cs\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x9428fa1 => 404
	i32 159306688, ; 34: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 162612358, ; 35: MimeMapping => 0x9b14486 => 211
	i32 165246403, ; 36: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 249
	i32 165709020, ; 37: it\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x9e084dc => 369
	i32 176265551, ; 38: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 39: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 295
	i32 184328833, ; 40: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 41: System.ComponentModel => 0xc38ff48 => 18
	i32 206219802, ; 42: ru\Microsoft.TestPlatform.CrossPlatEngine.resources => 0xc4aaa1a => 400
	i32 209399409, ; 43: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 247
	i32 212724149, ; 44: MongoDB.Driver.Core => 0xcade9b5 => 214
	i32 220171995, ; 45: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 46: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 269
	i32 230752869, ; 47: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 48: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 49: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 50: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 51: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 252
	i32 263698020, ; 52: ColorHelper => 0xfb7b664 => 176
	i32 276479776, ; 53: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 54: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 271
	i32 280482487, ; 55: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 268
	i32 286582269, ; 56: ja\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x1114e5fd => 383
	i32 291076382, ; 57: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 58: System.Net.Ping.dll => 0x11d123fd => 69
	i32 305108063, ; 59: cs\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x122f945f => 365
	i32 312243509, ; 60: es\Microsoft.TestPlatform.CoreUtilities.resources => 0x129c7535 => 354
	i32 317674968, ; 61: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 348
	i32 318968648, ; 62: Xamarin.AndroidX.Activity.dll => 0x13031348 => 238
	i32 321597661, ; 63: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 64: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 326
	i32 329962767, ; 65: Microsoft.Practices.ServiceLocation.dll => 0x13aad50f => 177
	i32 342366114, ; 66: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 270
	i32 360082299, ; 67: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 68: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 69: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 70: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 71: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 72: System.Memory.dll => 0x16fe439a => 62
	i32 389482135, ; 73: tr\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x17370697 => 401
	i32 392610295, ; 74: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 75: _Microsoft.Android.Resource.Designer => 0x17969339 => 417
	i32 397620678, ; 76: es\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x17b335c6 => 406
	i32 403441872, ; 77: WindowsBase => 0x180c08d0 => 165
	i32 405657606, ; 78: zh-Hant\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x182dd806 => 377
	i32 409257351, ; 79: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 346
	i32 439864463, ; 80: ja\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x1a37cc8f => 396
	i32 441335492, ; 81: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 253
	i32 442565967, ; 82: System.Collections => 0x1a61054f => 12
	i32 448006413, ; 83: de\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x1ab4090d => 392
	i32 450948140, ; 84: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 266
	i32 451504562, ; 85: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 86: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 87: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 88: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 89: System.dll => 0x1bff388e => 164
	i32 476646585, ; 90: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 268
	i32 485463106, ; 91: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 192
	i32 486930444, ; 92: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 281
	i32 489220957, ; 93: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 324
	i32 498788369, ; 94: System.ObjectModel => 0x1dbae811 => 84
	i32 508376876, ; 95: Microsoft.VisualStudio.TestPlatform.Common => 0x1e4d372c => 209
	i32 513247710, ; 96: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 191
	i32 525008092, ; 97: SkiaSharp.dll => 0x1f4afcdc => 218
	i32 526420162, ; 98: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 99: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 313
	i32 530272170, ; 100: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 101: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 345
	i32 539058512, ; 102: Microsoft.Extensions.Logging => 0x20216150 => 187
	i32 540030774, ; 103: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 104: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 105: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 106: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 107: Jsr305Binding => 0x213954e7 => 306
	i32 558657783, ; 108: fr\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x214c70f7 => 394
	i32 569601784, ; 109: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 304
	i32 577298002, ; 110: Microsoft.VisualStudio.TestPlatform.Common.dll => 0x2268de52 => 209
	i32 577335427, ; 111: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 579873359, ; 112: zh-Hant\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x22902a4f => 403
	i32 599687487, ; 113: Microsoft.TestPlatform.Utilities => 0x23be813f => 208
	i32 601371474, ; 114: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 115: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 610194910, ; 116: System.Reactive.dll => 0x245ed5de => 231
	i32 611721483, ; 117: zh-Hans\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x2476210b => 376
	i32 613668793, ; 118: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 119: Xamarin.AndroidX.CustomView => 0x2568904f => 258
	i32 627931235, ; 120: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 337
	i32 639843206, ; 121: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 264
	i32 643868501, ; 122: System.Net => 0x2660a755 => 81
	i32 656670485, ; 123: Microsoft.TestPlatform.PlatformAbstractions.dll => 0x2723ff15 => 204
	i32 658403675, ; 124: ja\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x273e715b => 357
	i32 662205335, ; 125: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 126: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 300
	i32 666292255, ; 127: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 245
	i32 670496576, ; 128: ja\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x27f6f740 => 409
	i32 672442732, ; 129: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 130: System.Net.Security => 0x28bdabca => 73
	i32 686326153, ; 131: pt-BR\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x28e88189 => 412
	i32 690569205, ; 132: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 133: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 315
	i32 693804605, ; 134: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 135: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 136: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 310
	i32 700358131, ; 137: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 716229409, ; 138: ja\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x2ab0cb21 => 409
	i32 720511267, ; 139: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 314
	i32 721890671, ; 140: ja\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x2b072d6f => 383
	i32 722857257, ; 141: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 726425535, ; 142: MongoDB.Libmongocrypt.dll => 0x2b4c5fbf => 215
	i32 735086769, ; 143: tr\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x2bd088b1 => 388
	i32 735137430, ; 144: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 145: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 146: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 235
	i32 755814674, ; 147: ko\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x2d0cd112 => 397
	i32 759454413, ; 148: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 149: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 763346851, ; 150: Websocket.Client => 0x2d7fbfa3 => 232
	i32 772621961, ; 151: Supabase.Core.dll => 0x2e0d4689 => 224
	i32 775507847, ; 152: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 153: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 343
	i32 788959164, ; 154: ko\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x2f068fbc => 397
	i32 789151979, ; 155: Microsoft.Extensions.Options => 0x2f0980eb => 190
	i32 790371945, ; 156: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 259
	i32 795583798, ; 157: Microsoft.TestPlatform.CommunicationUtilities.dll => 0x2f6ba536 => 206
	i32 798358160, ; 158: Microsoft.VisualStudio.CodeCoverage.Shim => 0x2f95fa90 => 182
	i32 804715423, ; 159: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 160: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 273
	i32 818048070, ; 161: cs\Microsoft.TestPlatform.CoreUtilities.resources => 0x30c26c46 => 352
	i32 823281589, ; 162: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 163: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 164: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 165: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 166: Xamarin.AndroidX.Print => 0x3246f6cd => 286
	i32 857506242, ; 167: Microsoft.VisualStudio.TestPlatform.ObjectModel.dll => 0x331c81c2 => 205
	i32 869139383, ; 168: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 328
	i32 873119928, ; 169: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 875999793, ; 170: pl\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x3436b231 => 385
	i32 877678880, ; 171: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 172: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 173: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 342
	i32 904024072, ; 174: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 906082314, ; 175: pl\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x3601b80a => 359
	i32 909689493, ; 176: zh-Hant\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x3638c295 => 390
	i32 911108515, ; 177: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 914181247, ; 178: es\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x367d4c7f => 380
	i32 918734561, ; 179: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 339
	i32 920281169, ; 180: Supabase.Functions => 0x36da6051 => 225
	i32 927898344, ; 181: zh-Hans\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x374e9ae8 => 363
	i32 928116545, ; 182: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 309
	i32 950578820, ; 183: cs\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x38a8ae84 => 378
	i32 952186615, ; 184: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 185: Newtonsoft.Json => 0x38f24a24 => 216
	i32 956575887, ; 186: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 314
	i32 961460050, ; 187: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 332
	i32 962901365, ; 188: MongoDB.Driver.Core.dll => 0x3964b575 => 214
	i32 966729478, ; 189: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 307
	i32 967690846, ; 190: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 270
	i32 975236339, ; 191: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 192: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 193: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 194: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 195: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 341
	i32 992768348, ; 196: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 197: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 198: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 199: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 290
	i32 1019214401, ; 200: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 201: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 186
	i32 1031528504, ; 202: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 308
	i32 1035644815, ; 203: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 243
	i32 1036536393, ; 204: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 205: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 322
	i32 1044663988, ; 206: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 207: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 277
	i32 1067306892, ; 208: GoogleGson => 0x3f9dcf8c => 180
	i32 1082857460, ; 209: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1083637766, ; 210: zh-Hant\Microsoft.TestPlatform.CoreUtilities.resources => 0x40970006 => 364
	i32 1084122840, ; 211: Xamarin.Kotlin.StdLib => 0x409e66d8 => 311
	i32 1089187994, ; 212: Websocket.Client.dll => 0x40ebb09a => 232
	i32 1098259244, ; 213: System => 0x41761b2c => 164
	i32 1108272742, ; 214: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 344
	i32 1111289522, ; 215: DnsClient.dll => 0x423ceeb2 => 178
	i32 1117529484, ; 216: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 338
	i32 1118262833, ; 217: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 334
	i32 1121599056, ; 218: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 276
	i32 1127624469, ; 219: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 189
	i32 1149092582, ; 220: Xamarin.AndroidX.Window => 0x447dc2e6 => 303
	i32 1155750561, ; 221: de\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x44e35aa1 => 392
	i32 1165181021, ; 222: tr\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x4573405d => 388
	i32 1168523401, ; 223: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 340
	i32 1170634674, ; 224: System.Web.dll => 0x45c677b2 => 153
	i32 1175002586, ; 225: cs\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x46091dda => 378
	i32 1175144683, ; 226: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 299
	i32 1178241025, ; 227: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 284
	i32 1185835922, ; 228: tr\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x46ae6b92 => 375
	i32 1204270330, ; 229: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 245
	i32 1208641965, ; 230: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1216849306, ; 231: Supabase.Realtime.dll => 0x4887a59a => 228
	i32 1219128291, ; 232: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1219540809, ; 233: Supabase.Functions.dll => 0x48b0b749 => 225
	i32 1236230039, ; 234: ru\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x49af5f97 => 400
	i32 1243150071, ; 235: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 304
	i32 1253011324, ; 236: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 237: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 320
	i32 1264511973, ; 238: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 294
	i32 1267360935, ; 239: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 298
	i32 1273260888, ; 240: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 250
	i32 1275534314, ; 241: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 315
	i32 1278448581, ; 242: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 242
	i32 1287326769, ; 243: ko\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x4cbb0c31 => 384
	i32 1289200857, ; 244: Microsoft.TestPlatform.PlatformAbstractions => 0x4cd7a4d9 => 204
	i32 1291411246, ; 245: tr\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x4cf95f2e => 414
	i32 1293217323, ; 246: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 261
	i32 1305935355, ; 247: ru\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x4dd6fdfb => 374
	i32 1308624726, ; 248: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 329
	i32 1309188875, ; 249: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1316264101, ; 250: tr\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x4e7498a5 => 401
	i32 1322716291, ; 251: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 303
	i32 1324164729, ; 252: System.Linq => 0x4eed2679 => 61
	i32 1329097642, ; 253: it\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x4f386baa => 408
	i32 1335329327, ; 254: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 255: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 349
	i32 1336984896, ; 256: Supabase.Core => 0x4fb0c540 => 224
	i32 1364015309, ; 257: System.IO => 0x514d38cd => 57
	i32 1365712339, ; 258: pl\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x51671dd3 => 411
	i32 1373134921, ; 259: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 350
	i32 1376866003, ; 260: Xamarin.AndroidX.SavedState => 0x52114ed3 => 290
	i32 1379779777, ; 261: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1391893274, ; 262: MongoDB.Bson.dll => 0x52f69b1a => 212
	i32 1402170036, ; 263: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 264: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 254
	i32 1408764838, ; 265: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 266: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 267: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1428737403, ; 268: Maui.FreakyEffects => 0x5528cd7b => 179
	i32 1430672901, ; 269: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 318
	i32 1434145427, ; 270: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 271: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 307
	i32 1439761251, ; 272: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 273: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 274: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 275: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 276: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 277: System.IdentityModel.Tokens.Jwt => 0x57137723 => 230
	i32 1461004990, ; 278: es\Microsoft.Maui.Controls.resources => 0x57152abe => 324
	i32 1461234159, ; 279: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 280: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1461797484, ; 281: pt-BR\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x5721426c => 373
	i32 1462112819, ; 282: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 283: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 244
	i32 1470490898, ; 284: Microsoft.Extensions.Primitives => 0x57a5e912 => 191
	i32 1479771757, ; 285: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 286: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 287: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 288: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 291
	i32 1498168481, ; 289: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 193
	i32 1516168485, ; 290: Supabase.Gotrue => 0x5a5ee525 => 226
	i32 1521837168, ; 291: zh-Hant\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x5ab56470 => 377
	i32 1526286932, ; 292: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 348
	i32 1536373174, ; 293: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 294: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 295: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 296: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551954004, ; 297: Microsoft.IO.RecyclableMemoryStream.dll => 0x5c80f054 => 196
	i32 1555965187, ; 298: Microsoft.Practices.ServiceLocation => 0x5cbe2503 => 177
	i32 1565693220, ; 299: pl\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x5d529524 => 385
	i32 1565862583, ; 300: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 301: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 302: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 303: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 304: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 260
	i32 1586683303, ; 305: Microsoft.TestPlatform.CrossPlatEngine.dll => 0x5e92dda7 => 207
	i32 1586948392, ; 306: Maui.FreakyEffects.dll => 0x5e96e928 => 179
	i32 1592978981, ; 307: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 308: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 308
	i32 1598243079, ; 309: it\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x5f434107 => 356
	i32 1601112923, ; 310: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 311: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 312: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 313: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 280
	i32 1622358360, ; 314: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1623212457, ; 315: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 220
	i32 1624863272, ; 316: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 302
	i32 1635184631, ; 317: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 264
	i32 1636350590, ; 318: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 257
	i32 1639515021, ; 319: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 320: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 321: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 322: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 323: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 296
	i32 1658251792, ; 324: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 305
	i32 1670060433, ; 325: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 252
	i32 1670326403, ; 326: AWSSDK.Core.dll => 0x638f2883 => 174
	i32 1670549604, ; 327: ja\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x63929064 => 370
	i32 1672159497, ; 328: Glucomification => 0x63ab2109 => 0
	i32 1675553242, ; 329: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 330: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 331: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 332: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 333: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696485959, ; 334: de\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x651e5247 => 366
	i32 1696967625, ; 335: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 336: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 312
	i32 1701541528, ; 337: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1703516718, ; 338: ru\Microsoft.TestPlatform.CoreUtilities.resources => 0x65899a2e => 361
	i32 1709002909, ; 339: zh-Hans\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x65dd509d => 402
	i32 1720223769, ; 340: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 273
	i32 1726116996, ; 341: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 342: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 343: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 248
	i32 1743415430, ; 344: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 319
	i32 1744735666, ; 345: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 346: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 347: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 348: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 349: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 350: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 351: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 295
	i32 1770582343, ; 352: Microsoft.Extensions.Logging.dll => 0x6988f147 => 187
	i32 1773394522, ; 353: es\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x69b3da5a => 393
	i32 1776026572, ; 354: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 355: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 356: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 357: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 335
	i32 1788241197, ; 358: Xamarin.AndroidX.Fragment => 0x6a96652d => 266
	i32 1791986079, ; 359: pl\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x6acf899f => 398
	i32 1793755602, ; 360: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 327
	i32 1806131398, ; 361: it\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x6ba760c6 => 395
	i32 1807397336, ; 362: MongoDB.Driver => 0x6bbab1d8 => 213
	i32 1808609942, ; 363: Xamarin.AndroidX.Loader => 0x6bcd3296 => 280
	i32 1811883999, ; 364: fr\Microsoft.TestPlatform.CoreUtilities.resources => 0x6bff27df => 355
	i32 1813058853, ; 365: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 311
	i32 1813201214, ; 366: Xamarin.Google.Android.Material => 0x6c13413e => 305
	i32 1818569960, ; 367: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 285
	i32 1818787751, ; 368: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 369: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 370: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 371: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 188
	i32 1835989518, ; 372: Snappier => 0x6d6efa0e => 222
	i32 1847515442, ; 373: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 235
	i32 1853025655, ; 374: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 344
	i32 1858542181, ; 375: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 376: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 377: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 326
	i32 1879696579, ; 378: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1881903010, ; 379: pl\Microsoft.TestPlatform.CoreUtilities.resources => 0x702b8fa2 => 359
	i32 1883048514, ; 380: zh-Hans\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0x703d0a42 => 389
	i32 1885316902, ; 381: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 246
	i32 1888955245, ; 382: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 383: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 384: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 320
	i32 1898237753, ; 385: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 386: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 387: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1915695524, ; 388: it\Microsoft.TestPlatform.CoreUtilities.resources => 0x722f31a4 => 356
	i32 1939592360, ; 389: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 390: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 331
	i32 1956758971, ; 391: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 392: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 292
	i32 1968388702, ; 393: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 183
	i32 1978715730, ; 394: it\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x75f0ce52 => 408
	i32 1983156543, ; 395: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 312
	i32 1985761444, ; 396: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 237
	i32 1986222447, ; 397: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 195
	i32 1988094259, ; 398: AWSSDK.SecurityToken.dll => 0x767fe933 => 175
	i32 2003115576, ; 399: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 323
	i32 2011961780, ; 400: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2018526534, ; 401: Supabase.Gotrue.dll => 0x78504546 => 226
	i32 2019465201, ; 402: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 277
	i32 2025094553, ; 403: XAct.Core.PCL => 0x78b47d99 => 233
	i32 2031763787, ; 404: Xamarin.Android.Glide => 0x791a414b => 234
	i32 2045470958, ; 405: System.Private.Xml => 0x79eb68ee => 88
	i32 2045482904, ; 406: ru\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x79eb9798 => 413
	i32 2055257422, ; 407: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 272
	i32 2060060697, ; 408: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 409: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 322
	i32 2070888862, ; 410: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 411: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 412: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 413: System.Console => 0x7ec9ffe9 => 20
	i32 2128198166, ; 414: Supabase.Realtime => 0x7ed9ba16 => 228
	i32 2138252982, ; 415: Supabase => 0x7f7326b6 => 223
	i32 2142473426, ; 416: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143465592, ; 417: Microsoft.IO.RecyclableMemoryStream => 0x7fc2b078 => 196
	i32 2143790110, ; 418: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 419: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 420: Microsoft.Maui => 0x80bd55ad => 200
	i32 2169148018, ; 421: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 330
	i32 2181898931, ; 422: Microsoft.Extensions.Options.dll => 0x820d22b3 => 190
	i32 2188602587, ; 423: Microcharts.Maui => 0x82736cdb => 181
	i32 2192057212, ; 424: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 188
	i32 2193016926, ; 425: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 426: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 316
	i32 2201231467, ; 427: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 428: it\Microsoft.Maui.Controls.resources => 0x839595db => 332
	i32 2217644978, ; 429: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 299
	i32 2222056684, ; 430: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 431: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 281
	i32 2252106437, ; 432: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 433: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 434: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 435: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 184
	i32 2267999099, ; 436: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 236
	i32 2274506972, ; 437: pt-BR\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x879238dc => 360
	i32 2279755925, ; 438: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 288
	i32 2290594010, ; 439: SharpCompress.dll => 0x8887b0da => 217
	i32 2293034957, ; 440: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 441: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 442: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 443: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 336
	i32 2305521784, ; 444: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2305641583, ; 445: Microsoft.TestPlatform.CoreUtilities => 0x896d4c6f => 203
	i32 2306956749, ; 446: tr\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x89815dcd => 362
	i32 2315684594, ; 447: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 240
	i32 2320631194, ; 448: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2334729734, ; 449: cs\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0x8b292606 => 365
	i32 2340441535, ; 450: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 451: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 452: System.Net.Primitives => 0x8c40e0db => 70
	i32 2363036410, ; 453: ru\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0x8cd912fa => 374
	i32 2364201794, ; 454: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 221
	i32 2366048013, ; 455: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 330
	i32 2366988767, ; 456: cs\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x8d1561df => 391
	i32 2368005991, ; 457: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 458: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 194
	i32 2371007202, ; 459: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 183
	i32 2378619854, ; 460: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 461: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395836407, ; 462: tr\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x8ecd8ff7 => 414
	i32 2395872292, ; 463: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 331
	i32 2401565422, ; 464: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 465: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 263
	i32 2421380589, ; 466: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 467: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 250
	i32 2427813419, ; 468: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 328
	i32 2435356389, ; 469: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 470: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2444332367, ; 471: it\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x91b18d4f => 382
	i32 2445922895, ; 472: es\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0x91c9d24f => 393
	i32 2454642406, ; 473: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 474: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 475: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 476: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 253
	i32 2471841756, ; 477: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 478: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 479: Microsoft.Maui.Controls => 0x93dba8a1 => 198
	i32 2483375731, ; 480: ru\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x94054e73 => 413
	i32 2483903535, ; 481: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 482: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 483: System.AppContext.dll => 0x94798bc5 => 6
	i32 2496790010, ; 484: pt-BR\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x94d1fdfa => 412
	i32 2501346920, ; 485: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 486: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 334
	i32 2505896520, ; 487: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 275
	i32 2522472828, ; 488: Xamarin.Android.Glide.dll => 0x9659e17c => 234
	i32 2538310050, ; 489: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 490: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 329
	i32 2562349572, ; 491: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 492: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 493: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 333
	i32 2581783588, ; 494: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 276
	i32 2581819634, ; 495: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 298
	i32 2585220780, ; 496: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 497: System.Net.Ping => 0x9a20430d => 69
	i32 2589451624, ; 498: pt-BR\Microsoft.TestPlatform.CrossPlatEngine.resources => 0x9a57e568 => 399
	i32 2589602615, ; 499: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2591834020, ; 500: zh-Hans\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x9a7c3fa4 => 415
	i32 2593496499, ; 501: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 338
	i32 2605712449, ; 502: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 316
	i32 2611359322, ; 503: ZstdSharp.dll => 0x9ba62e5a => 317
	i32 2611875357, ; 504: testhost.dll => 0x9bae0e1d => 210
	i32 2613717964, ; 505: Microsoft.VisualStudio.TestPlatform.ObjectModel => 0x9bca2bcc => 205
	i32 2615233544, ; 506: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 267
	i32 2616218305, ; 507: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 189
	i32 2617129537, ; 508: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 509: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 510: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 257
	i32 2624644809, ; 511: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 262
	i32 2625339995, ; 512: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 221
	i32 2626831493, ; 513: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 333
	i32 2627185994, ; 514: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 515: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 516: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 271
	i32 2634816656, ; 517: fr\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0x9d0c1c90 => 355
	i32 2640290731, ; 518: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 194
	i32 2650278439, ; 519: fr\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0x9df80a27 => 407
	i32 2652614677, ; 520: zh-Hant\Microsoft.VisualStudio.TestPlatform.Common.resources => 0x9e1bb015 => 416
	i32 2663391936, ; 521: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 236
	i32 2663698177, ; 522: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2663973326, ; 523: pt-BR\Microsoft.TestPlatform.CommunicationUtilities.resources => 0x9ec901ce => 386
	i32 2664396074, ; 524: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 525: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 526: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 527: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 528: System.IO.dll => 0xa090e36a => 57
	i32 2700780895, ; 529: ja\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0xa0faa55f => 396
	i32 2701096212, ; 530: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 296
	i32 2715334215, ; 531: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 532: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719961531, ; 533: es\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0xa21f51bb => 367
	i32 2719963679, ; 534: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 535: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2725980451, ; 536: SharpCompress => 0xa27b2923 => 217
	i32 2728513968, ; 537: MongoDB.Libmongocrypt => 0xa2a1d1b0 => 215
	i32 2732626843, ; 538: Xamarin.AndroidX.Activity => 0xa2e0939b => 238
	i32 2735172069, ; 539: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 540: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 244
	i32 2740698338, ; 541: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 319
	i32 2740948882, ; 542: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2747200821, ; 543: ja\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0xa3bef535 => 370
	i32 2748088231, ; 544: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 545: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 339
	i32 2758225723, ; 546: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 199
	i32 2764765095, ; 547: Microsoft.Maui.dll => 0xa4caf7a7 => 200
	i32 2765824710, ; 548: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 549: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 310
	i32 2778768386, ; 550: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 301
	i32 2779977773, ; 551: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 289
	i32 2785988530, ; 552: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 345
	i32 2788224221, ; 553: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 267
	i32 2792771119, ; 554: de\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0xa6764e2f => 353
	i32 2795602088, ; 555: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 219
	i32 2796683033, ; 556: pl\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0xa6b1ff19 => 372
	i32 2801831435, ; 557: Microsoft.Maui.Graphics => 0xa7008e0b => 202
	i32 2803228030, ; 558: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 559: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 254
	i32 2817380358, ; 560: testhost => 0xa7edd006 => 210
	i32 2819470561, ; 561: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 562: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 563: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 289
	i32 2824502124, ; 564: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2825246514, ; 565: Microsoft.VisualStudio.CodeCoverage.Shim.dll => 0xa865d732 => 182
	i32 2838993487, ; 566: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 278
	i32 2849599387, ; 567: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853079587, ; 568: zh-Hans\Microsoft.TestPlatform.CoreUtilities.resources => 0xaa0e8a23 => 363
	i32 2853208004, ; 569: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 301
	i32 2855708567, ; 570: Xamarin.AndroidX.Transition => 0xaa36a797 => 297
	i32 2857977710, ; 571: zh-Hans\Microsoft.TestPlatform.CommunicationUtilities.resources => 0xaa59476e => 389
	i32 2861098320, ; 572: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 573: Microsoft.Maui.Essentials => 0xaa8a4878 => 201
	i32 2870099610, ; 574: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 239
	i32 2872313209, ; 575: ColorHelper.dll => 0xab340579 => 176
	i32 2875164099, ; 576: Jsr305Binding.dll => 0xab5f85c3 => 306
	i32 2875220617, ; 577: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 578: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 265
	i32 2887636118, ; 579: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 580: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 581: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 582: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 583: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 584: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2912489636, ; 585: SkiaSharp.Views.Android => 0xad9910a4 => 219
	i32 2916838712, ; 586: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 302
	i32 2919462931, ; 587: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 588: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 241
	i32 2933966894, ; 589: cs\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0xaee0c82e => 391
	i32 2934941515, ; 590: pt-BR\Microsoft.TestPlatform.CoreUtilities.resources => 0xaeefa74b => 360
	i32 2936416060, ; 591: System.Resources.Reader => 0xaf06273c => 98
	i32 2937137298, ; 592: ko\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0xaf112892 => 371
	i32 2940926066, ; 593: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 594: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959368326, ; 595: zh-Hant\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xb0646086 => 390
	i32 2959614098, ; 596: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 597: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2969912590, ; 598: pl\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xb105450e => 411
	i32 2972252294, ; 599: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 600: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 261
	i32 2987532451, ; 601: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 292
	i32 2996846495, ; 602: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 274
	i32 3004449635, ; 603: ko\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xb3144363 => 410
	i32 3012900311, ; 604: it\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0xb39535d7 => 369
	i32 3016983068, ; 605: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 294
	i32 3023353419, ; 606: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 607: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 269
	i32 3038032645, ; 608: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 417
	i32 3053864966, ; 609: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 325
	i32 3055454909, ; 610: fr\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0xb61e8abd => 368
	i32 3056245963, ; 611: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 291
	i32 3057625584, ; 612: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 282
	i32 3059408633, ; 613: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 614: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 615: System.Threading.Tasks => 0xb755818f => 144
	i32 3084678329, ; 616: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 195
	i32 3086536999, ; 617: cs\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0xb7f8d127 => 352
	i32 3089219899, ; 618: ZstdSharp => 0xb821c13b => 317
	i32 3090735792, ; 619: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099081453, ; 620: MimeMapping.dll => 0xb8b83aed => 211
	i32 3099732863, ; 621: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 622: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 623: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 624: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 625: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 626: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3138360719, ; 627: Supabase.Postgrest.dll => 0xbb0f958f => 227
	i32 3143283668, ; 628: AWSSDK.SecurityToken => 0xbb5ab3d4 => 175
	i32 3147165239, ; 629: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 630: GoogleGson.dll => 0xbba64c02 => 180
	i32 3152804951, ; 631: cs\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xbbebfc57 => 404
	i32 3159123045, ; 632: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 633: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3173064269, ; 634: DnsClient => 0xbd211e4d => 178
	i32 3178803400, ; 635: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 283
	i32 3188718548, ; 636: ko\Microsoft.TestPlatform.CoreUtilities.resources => 0xbe0ffbd4 => 358
	i32 3192346100, ; 637: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 638: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 639: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 640: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3210014338, ; 641: ko\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0xbf54ee82 => 358
	i32 3211777861, ; 642: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 260
	i32 3214337465, ; 643: it\Microsoft.TestPlatform.CrossPlatEngine.resources => 0xbf96e5b9 => 395
	i32 3220365878, ; 644: System.Threading => 0xbff2e236 => 148
	i32 3222011088, ; 645: fr\Microsoft.TestPlatform.CrossPlatEngine.resources => 0xc00bfcd0 => 394
	i32 3226221578, ; 646: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3243190844, ; 647: XAct.Core.PCL.dll => 0xc14f2a3c => 233
	i32 3246114445, ; 648: tr\Microsoft.TestPlatform.CoreUtilities.resources => 0xc17bc68d => 362
	i32 3251039220, ; 649: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3252856589, ; 650: MongoDB.Driver.dll => 0xc1e2a70d => 213
	i32 3254388565, ; 651: tr\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0xc1fa0755 => 375
	i32 3258312781, ; 652: Xamarin.AndroidX.CardView => 0xc235e84d => 248
	i32 3258876633, ; 653: MongoDB.Bson => 0xc23e82d9 => 212
	i32 3265493905, ; 654: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 655: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 656: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 657: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 658: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 659: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 660: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 661: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 662: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 325
	i32 3312457198, ; 663: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 193
	i32 3315247489, ; 664: fr\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0xc59aa981 => 368
	i32 3316684772, ; 665: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 666: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 258
	i32 3317144872, ; 667: System.Data => 0xc5b79d28 => 24
	i32 3340387945, ; 668: SkiaSharp => 0xc71a4669 => 218
	i32 3340431453, ; 669: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 246
	i32 3345895724, ; 670: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 287
	i32 3346324047, ; 671: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 284
	i32 3346364086, ; 672: ru\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xc77576b6 => 387
	i32 3348592242, ; 673: es\Microsoft.TestPlatform.CommunicationUtilities.resources => 0xc7977672 => 380
	i32 3357674450, ; 674: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 342
	i32 3358260929, ; 675: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 676: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 239
	i32 3362522851, ; 677: Xamarin.AndroidX.Core => 0xc86c06e3 => 255
	i32 3366347497, ; 678: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 679: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 288
	i32 3381016424, ; 680: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 321
	i32 3395150330, ; 681: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3402975835, ; 682: zh-Hant\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0xcad54a5b => 403
	i32 3403906625, ; 683: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3403954882, ; 684: de\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xcae43ac2 => 405
	i32 3405233483, ; 685: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 259
	i32 3406866195, ; 686: ko\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xcb10a713 => 384
	i32 3428513518, ; 687: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 185
	i32 3429136800, ; 688: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 689: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 690: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 262
	i32 3445260447, ; 691: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 692: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 197
	i32 3457240403, ; 693: AWSSDK.Core => 0xce114d53 => 174
	i32 3458724246, ; 694: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 340
	i32 3471940407, ; 695: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3473156932, ; 696: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 220
	i32 3476120550, ; 697: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 698: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 341
	i32 3485117614, ; 699: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486461866, ; 700: pt-BR\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xcfcf2faa => 386
	i32 3486566296, ; 701: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 702: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 251
	i32 3509114376, ; 703: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 704: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 705: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 706: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3543600791, ; 707: Microsoft.TestPlatform.CoreUtilities.dll => 0xd3370e97 => 203
	i32 3560100363, ; 708: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 709: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3573365857, ; 710: zh-Hant\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xd4fd3c61 => 416
	i32 3580758918, ; 711: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 349
	i32 3581187863, ; 712: de\Microsoft.TestPlatform.CommunicationUtilities.resources => 0xd5749717 => 379
	i32 3592228221, ; 713: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 351
	i32 3597029428, ; 714: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 237
	i32 3598340787, ; 715: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3607666123, ; 716: Supabase.Postgrest => 0xd7089dcb => 227
	i32 3608519521, ; 717: System.Linq.dll => 0xd715a361 => 61
	i32 3622006156, ; 718: zh-Hant\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0xd7e36d8c => 364
	i32 3624195450, ; 719: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 720: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 286
	i32 3633644679, ; 721: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 241
	i32 3638274909, ; 722: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 723: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 272
	i32 3643446276, ; 724: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 346
	i32 3643854240, ; 725: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 283
	i32 3645089577, ; 726: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 727: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 184
	i32 3660523487, ; 728: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3668376873, ; 729: zh-Hans\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xdaa6fd29 => 415
	i32 3672681054, ; 730: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3678800269, ; 731: Microsoft.TestPlatform.CommunicationUtilities => 0xdb46098d => 206
	i32 3682565725, ; 732: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 247
	i32 3684561358, ; 733: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 251
	i32 3700591436, ; 734: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 192
	i32 3700866549, ; 735: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 736: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 256
	i32 3715952620, ; 737: es\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0xdd7cefec => 367
	i32 3716563718, ; 738: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 739: Xamarin.AndroidX.Annotation => 0xdda814c6 => 240
	i32 3724971120, ; 740: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 282
	i32 3726653078, ; 741: es\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0xde203696 => 354
	i32 3727046658, ; 742: Microsoft.TestPlatform.Utilities.dll => 0xde263802 => 208
	i32 3731644420, ; 743: System.Reactive => 0xde6c6004 => 231
	i32 3732100267, ; 744: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 745: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 746: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 747: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 748: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 321
	i32 3786282454, ; 749: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 249
	i32 3791210109, ; 750: Snappier.dll => 0xe1f9467d => 222
	i32 3792276235, ; 751: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 752: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 197
	i32 3802395368, ; 753: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3810897912, ; 754: fr\Microsoft.TestPlatform.CommunicationUtilities.resources => 0xe325aff8 => 381
	i32 3819260425, ; 755: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 756: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 757: System.Numerics.dll => 0xe4436460 => 83
	i32 3837488932, ; 758: de\Microsoft.TestPlatform.CoreUtilities.resources => 0xe4bb6f24 => 353
	i32 3838563514, ; 759: Glucomification.dll => 0xe4cbd4ba => 0
	i32 3841636137, ; 760: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 186
	i32 3844307129, ; 761: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 762: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3864064308, ; 763: ko\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xe650f134 => 410
	i32 3869632455, ; 764: fr\Microsoft.TestPlatform.CommunicationUtilities.resources.dll => 0xe6a5e7c7 => 381
	i32 3870376305, ; 765: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 766: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 767: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 768: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 769: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 297
	i32 3888767677, ; 770: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 287
	i32 3893118486, ; 771: AlohaKit.Animations => 0xe80c4616 => 173
	i32 3893759750, ; 772: zh-Hans\Microsoft.TestPlatform.CrossPlatEngine.resources => 0xe8160f06 => 402
	i32 3896106733, ; 773: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 774: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 255
	i32 3898101830, ; 775: ru\Microsoft.TestPlatform.CommunicationUtilities.resources => 0xe8585046 => 387
	i32 3901907137, ; 776: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3906640997, ; 777: Supabase.Storage.dll => 0xe8da9c65 => 229
	i32 3920221145, ; 778: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 337
	i32 3920810846, ; 779: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 780: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 300
	i32 3928044579, ; 781: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 782: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 783: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 285
	i32 3945713374, ; 784: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 785: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 786: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 243
	i32 3959773229, ; 787: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 274
	i32 3975623045, ; 788: de\Microsoft.VisualStudio.TestPlatform.Common.resources.dll => 0xecf73185 => 405
	i32 3980364293, ; 789: Supabase.Storage => 0xed3f8a05 => 229
	i32 4003436829, ; 790: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 791: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 242
	i32 4025784931, ; 792: System.Memory => 0xeff49a63 => 62
	i32 4045469085, ; 793: de\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources.dll => 0xf120f59d => 366
	i32 4046471985, ; 794: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 199
	i32 4054681211, ; 795: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4058492420, ; 796: pt-BR\Microsoft.TestPlatform.CrossPlatEngine.resources.dll => 0xf1e7ae04 => 399
	i32 4066861299, ; 797: AlohaKit.Animations.dll => 0xf26760f3 => 173
	i32 4068434129, ; 798: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 799: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 800: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 323
	i32 4094352644, ; 801: Microsoft.Maui.Essentials.dll => 0xf40add04 => 201
	i32 4099507663, ; 802: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 803: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 804: Xamarin.AndroidX.Emoji2 => 0xf479582c => 263
	i32 4103439459, ; 805: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 347
	i32 4126470640, ; 806: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 185
	i32 4127667938, ; 807: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 808: System.AppContext => 0xf6318da0 => 6
	i32 4132566263, ; 809: ja\Microsoft.TestPlatform.CoreUtilities.resources => 0xf651f4f7 => 357
	i32 4147896353, ; 810: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 811: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 347
	i32 4151237749, ; 812: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 813: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 814: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 815: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 816: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 817: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 279
	i32 4185676441, ; 818: System.Security => 0xf97c5a99 => 130
	i32 4186433927, ; 819: ru\Microsoft.TestPlatform.CoreUtilities.resources.dll => 0xf987e987 => 361
	i32 4189085287, ; 820: Microcharts.Maui.dll => 0xf9b05e67 => 181
	i32 4196529839, ; 821: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 822: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4231935821, ; 823: pl\Microsoft.VisualStudio.TestPlatform.ObjectModel.resources => 0xfc3e374d => 372
	i32 4235817225, ; 824: fr\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xfc797109 => 407
	i32 4236519394, ; 825: Microsoft.TestPlatform.CrossPlatEngine => 0xfc8427e2 => 207
	i32 4244015775, ; 826: es\Microsoft.VisualStudio.TestPlatform.Common.resources => 0xfcf68a9f => 406
	i32 4249188766, ; 827: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 336
	i32 4256097574, ; 828: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 256
	i32 4258378803, ; 829: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 278
	i32 4260525087, ; 830: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 831: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 230
	i32 4271975918, ; 832: Microsoft.Maui.Controls.dll => 0xfea12dee => 198
	i32 4274976490, ; 833: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 834: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 279
	i32 4294763496 ; 835: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 265
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [836 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 382, ; 3
	i32 275, ; 4
	i32 309, ; 5
	i32 48, ; 6
	i32 318, ; 7
	i32 216, ; 8
	i32 80, ; 9
	i32 327, ; 10
	i32 145, ; 11
	i32 371, ; 12
	i32 30, ; 13
	i32 351, ; 14
	i32 124, ; 15
	i32 202, ; 16
	i32 102, ; 17
	i32 335, ; 18
	i32 223, ; 19
	i32 293, ; 20
	i32 376, ; 21
	i32 107, ; 22
	i32 293, ; 23
	i32 139, ; 24
	i32 379, ; 25
	i32 373, ; 26
	i32 313, ; 27
	i32 350, ; 28
	i32 343, ; 29
	i32 77, ; 30
	i32 398, ; 31
	i32 124, ; 32
	i32 404, ; 33
	i32 13, ; 34
	i32 211, ; 35
	i32 249, ; 36
	i32 369, ; 37
	i32 132, ; 38
	i32 295, ; 39
	i32 151, ; 40
	i32 18, ; 41
	i32 400, ; 42
	i32 247, ; 43
	i32 214, ; 44
	i32 26, ; 45
	i32 269, ; 46
	i32 1, ; 47
	i32 59, ; 48
	i32 42, ; 49
	i32 91, ; 50
	i32 252, ; 51
	i32 176, ; 52
	i32 147, ; 53
	i32 271, ; 54
	i32 268, ; 55
	i32 383, ; 56
	i32 54, ; 57
	i32 69, ; 58
	i32 365, ; 59
	i32 354, ; 60
	i32 348, ; 61
	i32 238, ; 62
	i32 83, ; 63
	i32 326, ; 64
	i32 177, ; 65
	i32 270, ; 66
	i32 131, ; 67
	i32 55, ; 68
	i32 149, ; 69
	i32 74, ; 70
	i32 145, ; 71
	i32 62, ; 72
	i32 401, ; 73
	i32 146, ; 74
	i32 417, ; 75
	i32 406, ; 76
	i32 165, ; 77
	i32 377, ; 78
	i32 346, ; 79
	i32 396, ; 80
	i32 253, ; 81
	i32 12, ; 82
	i32 392, ; 83
	i32 266, ; 84
	i32 125, ; 85
	i32 152, ; 86
	i32 113, ; 87
	i32 166, ; 88
	i32 164, ; 89
	i32 268, ; 90
	i32 192, ; 91
	i32 281, ; 92
	i32 324, ; 93
	i32 84, ; 94
	i32 209, ; 95
	i32 191, ; 96
	i32 218, ; 97
	i32 150, ; 98
	i32 313, ; 99
	i32 60, ; 100
	i32 345, ; 101
	i32 187, ; 102
	i32 51, ; 103
	i32 103, ; 104
	i32 114, ; 105
	i32 40, ; 106
	i32 306, ; 107
	i32 394, ; 108
	i32 304, ; 109
	i32 209, ; 110
	i32 120, ; 111
	i32 403, ; 112
	i32 208, ; 113
	i32 52, ; 114
	i32 44, ; 115
	i32 231, ; 116
	i32 376, ; 117
	i32 119, ; 118
	i32 258, ; 119
	i32 337, ; 120
	i32 264, ; 121
	i32 81, ; 122
	i32 204, ; 123
	i32 357, ; 124
	i32 136, ; 125
	i32 300, ; 126
	i32 245, ; 127
	i32 409, ; 128
	i32 8, ; 129
	i32 73, ; 130
	i32 412, ; 131
	i32 155, ; 132
	i32 315, ; 133
	i32 154, ; 134
	i32 92, ; 135
	i32 310, ; 136
	i32 45, ; 137
	i32 409, ; 138
	i32 314, ; 139
	i32 383, ; 140
	i32 109, ; 141
	i32 215, ; 142
	i32 388, ; 143
	i32 129, ; 144
	i32 25, ; 145
	i32 235, ; 146
	i32 397, ; 147
	i32 72, ; 148
	i32 55, ; 149
	i32 232, ; 150
	i32 224, ; 151
	i32 46, ; 152
	i32 343, ; 153
	i32 397, ; 154
	i32 190, ; 155
	i32 259, ; 156
	i32 206, ; 157
	i32 182, ; 158
	i32 22, ; 159
	i32 273, ; 160
	i32 352, ; 161
	i32 86, ; 162
	i32 43, ; 163
	i32 160, ; 164
	i32 71, ; 165
	i32 286, ; 166
	i32 205, ; 167
	i32 328, ; 168
	i32 3, ; 169
	i32 385, ; 170
	i32 42, ; 171
	i32 63, ; 172
	i32 342, ; 173
	i32 16, ; 174
	i32 359, ; 175
	i32 390, ; 176
	i32 53, ; 177
	i32 380, ; 178
	i32 339, ; 179
	i32 225, ; 180
	i32 363, ; 181
	i32 309, ; 182
	i32 378, ; 183
	i32 105, ; 184
	i32 216, ; 185
	i32 314, ; 186
	i32 332, ; 187
	i32 214, ; 188
	i32 307, ; 189
	i32 270, ; 190
	i32 34, ; 191
	i32 158, ; 192
	i32 85, ; 193
	i32 32, ; 194
	i32 341, ; 195
	i32 12, ; 196
	i32 51, ; 197
	i32 56, ; 198
	i32 290, ; 199
	i32 36, ; 200
	i32 186, ; 201
	i32 308, ; 202
	i32 243, ; 203
	i32 35, ; 204
	i32 322, ; 205
	i32 58, ; 206
	i32 277, ; 207
	i32 180, ; 208
	i32 17, ; 209
	i32 364, ; 210
	i32 311, ; 211
	i32 232, ; 212
	i32 164, ; 213
	i32 344, ; 214
	i32 178, ; 215
	i32 338, ; 216
	i32 334, ; 217
	i32 276, ; 218
	i32 189, ; 219
	i32 303, ; 220
	i32 392, ; 221
	i32 388, ; 222
	i32 340, ; 223
	i32 153, ; 224
	i32 378, ; 225
	i32 299, ; 226
	i32 284, ; 227
	i32 375, ; 228
	i32 245, ; 229
	i32 29, ; 230
	i32 228, ; 231
	i32 52, ; 232
	i32 225, ; 233
	i32 400, ; 234
	i32 304, ; 235
	i32 5, ; 236
	i32 320, ; 237
	i32 294, ; 238
	i32 298, ; 239
	i32 250, ; 240
	i32 315, ; 241
	i32 242, ; 242
	i32 384, ; 243
	i32 204, ; 244
	i32 414, ; 245
	i32 261, ; 246
	i32 374, ; 247
	i32 329, ; 248
	i32 85, ; 249
	i32 401, ; 250
	i32 303, ; 251
	i32 61, ; 252
	i32 408, ; 253
	i32 112, ; 254
	i32 349, ; 255
	i32 224, ; 256
	i32 57, ; 257
	i32 411, ; 258
	i32 350, ; 259
	i32 290, ; 260
	i32 99, ; 261
	i32 212, ; 262
	i32 19, ; 263
	i32 254, ; 264
	i32 111, ; 265
	i32 101, ; 266
	i32 102, ; 267
	i32 179, ; 268
	i32 318, ; 269
	i32 104, ; 270
	i32 307, ; 271
	i32 71, ; 272
	i32 38, ; 273
	i32 32, ; 274
	i32 103, ; 275
	i32 73, ; 276
	i32 230, ; 277
	i32 324, ; 278
	i32 9, ; 279
	i32 123, ; 280
	i32 373, ; 281
	i32 46, ; 282
	i32 244, ; 283
	i32 191, ; 284
	i32 9, ; 285
	i32 43, ; 286
	i32 4, ; 287
	i32 291, ; 288
	i32 193, ; 289
	i32 226, ; 290
	i32 377, ; 291
	i32 348, ; 292
	i32 31, ; 293
	i32 138, ; 294
	i32 92, ; 295
	i32 93, ; 296
	i32 196, ; 297
	i32 177, ; 298
	i32 385, ; 299
	i32 49, ; 300
	i32 141, ; 301
	i32 112, ; 302
	i32 140, ; 303
	i32 260, ; 304
	i32 207, ; 305
	i32 179, ; 306
	i32 115, ; 307
	i32 308, ; 308
	i32 356, ; 309
	i32 157, ; 310
	i32 76, ; 311
	i32 79, ; 312
	i32 280, ; 313
	i32 37, ; 314
	i32 220, ; 315
	i32 302, ; 316
	i32 264, ; 317
	i32 257, ; 318
	i32 64, ; 319
	i32 138, ; 320
	i32 15, ; 321
	i32 116, ; 322
	i32 296, ; 323
	i32 305, ; 324
	i32 252, ; 325
	i32 174, ; 326
	i32 370, ; 327
	i32 0, ; 328
	i32 48, ; 329
	i32 70, ; 330
	i32 80, ; 331
	i32 126, ; 332
	i32 94, ; 333
	i32 366, ; 334
	i32 121, ; 335
	i32 312, ; 336
	i32 26, ; 337
	i32 361, ; 338
	i32 402, ; 339
	i32 273, ; 340
	i32 97, ; 341
	i32 28, ; 342
	i32 248, ; 343
	i32 319, ; 344
	i32 149, ; 345
	i32 169, ; 346
	i32 4, ; 347
	i32 98, ; 348
	i32 33, ; 349
	i32 93, ; 350
	i32 295, ; 351
	i32 187, ; 352
	i32 393, ; 353
	i32 21, ; 354
	i32 41, ; 355
	i32 170, ; 356
	i32 335, ; 357
	i32 266, ; 358
	i32 398, ; 359
	i32 327, ; 360
	i32 395, ; 361
	i32 213, ; 362
	i32 280, ; 363
	i32 355, ; 364
	i32 311, ; 365
	i32 305, ; 366
	i32 285, ; 367
	i32 2, ; 368
	i32 134, ; 369
	i32 111, ; 370
	i32 188, ; 371
	i32 222, ; 372
	i32 235, ; 373
	i32 344, ; 374
	i32 58, ; 375
	i32 95, ; 376
	i32 326, ; 377
	i32 39, ; 378
	i32 359, ; 379
	i32 389, ; 380
	i32 246, ; 381
	i32 25, ; 382
	i32 94, ; 383
	i32 320, ; 384
	i32 89, ; 385
	i32 99, ; 386
	i32 10, ; 387
	i32 356, ; 388
	i32 87, ; 389
	i32 331, ; 390
	i32 100, ; 391
	i32 292, ; 392
	i32 183, ; 393
	i32 408, ; 394
	i32 312, ; 395
	i32 237, ; 396
	i32 195, ; 397
	i32 175, ; 398
	i32 323, ; 399
	i32 7, ; 400
	i32 226, ; 401
	i32 277, ; 402
	i32 233, ; 403
	i32 234, ; 404
	i32 88, ; 405
	i32 413, ; 406
	i32 272, ; 407
	i32 154, ; 408
	i32 322, ; 409
	i32 33, ; 410
	i32 116, ; 411
	i32 82, ; 412
	i32 20, ; 413
	i32 228, ; 414
	i32 223, ; 415
	i32 11, ; 416
	i32 196, ; 417
	i32 162, ; 418
	i32 3, ; 419
	i32 200, ; 420
	i32 330, ; 421
	i32 190, ; 422
	i32 181, ; 423
	i32 188, ; 424
	i32 84, ; 425
	i32 316, ; 426
	i32 64, ; 427
	i32 332, ; 428
	i32 299, ; 429
	i32 143, ; 430
	i32 281, ; 431
	i32 157, ; 432
	i32 41, ; 433
	i32 117, ; 434
	i32 184, ; 435
	i32 236, ; 436
	i32 360, ; 437
	i32 288, ; 438
	i32 217, ; 439
	i32 131, ; 440
	i32 75, ; 441
	i32 66, ; 442
	i32 336, ; 443
	i32 172, ; 444
	i32 203, ; 445
	i32 362, ; 446
	i32 240, ; 447
	i32 143, ; 448
	i32 365, ; 449
	i32 106, ; 450
	i32 151, ; 451
	i32 70, ; 452
	i32 374, ; 453
	i32 221, ; 454
	i32 330, ; 455
	i32 391, ; 456
	i32 156, ; 457
	i32 194, ; 458
	i32 183, ; 459
	i32 121, ; 460
	i32 127, ; 461
	i32 414, ; 462
	i32 331, ; 463
	i32 152, ; 464
	i32 263, ; 465
	i32 141, ; 466
	i32 250, ; 467
	i32 328, ; 468
	i32 20, ; 469
	i32 14, ; 470
	i32 382, ; 471
	i32 393, ; 472
	i32 135, ; 473
	i32 75, ; 474
	i32 59, ; 475
	i32 253, ; 476
	i32 167, ; 477
	i32 168, ; 478
	i32 198, ; 479
	i32 413, ; 480
	i32 15, ; 481
	i32 74, ; 482
	i32 6, ; 483
	i32 412, ; 484
	i32 23, ; 485
	i32 334, ; 486
	i32 275, ; 487
	i32 234, ; 488
	i32 91, ; 489
	i32 329, ; 490
	i32 1, ; 491
	i32 136, ; 492
	i32 333, ; 493
	i32 276, ; 494
	i32 298, ; 495
	i32 134, ; 496
	i32 69, ; 497
	i32 399, ; 498
	i32 146, ; 499
	i32 415, ; 500
	i32 338, ; 501
	i32 316, ; 502
	i32 317, ; 503
	i32 210, ; 504
	i32 205, ; 505
	i32 267, ; 506
	i32 189, ; 507
	i32 88, ; 508
	i32 96, ; 509
	i32 257, ; 510
	i32 262, ; 511
	i32 221, ; 512
	i32 333, ; 513
	i32 31, ; 514
	i32 45, ; 515
	i32 271, ; 516
	i32 355, ; 517
	i32 194, ; 518
	i32 407, ; 519
	i32 416, ; 520
	i32 236, ; 521
	i32 109, ; 522
	i32 386, ; 523
	i32 158, ; 524
	i32 35, ; 525
	i32 22, ; 526
	i32 114, ; 527
	i32 57, ; 528
	i32 396, ; 529
	i32 296, ; 530
	i32 144, ; 531
	i32 118, ; 532
	i32 367, ; 533
	i32 120, ; 534
	i32 110, ; 535
	i32 217, ; 536
	i32 215, ; 537
	i32 238, ; 538
	i32 139, ; 539
	i32 244, ; 540
	i32 319, ; 541
	i32 54, ; 542
	i32 370, ; 543
	i32 105, ; 544
	i32 339, ; 545
	i32 199, ; 546
	i32 200, ; 547
	i32 133, ; 548
	i32 310, ; 549
	i32 301, ; 550
	i32 289, ; 551
	i32 345, ; 552
	i32 267, ; 553
	i32 353, ; 554
	i32 219, ; 555
	i32 372, ; 556
	i32 202, ; 557
	i32 159, ; 558
	i32 254, ; 559
	i32 210, ; 560
	i32 163, ; 561
	i32 132, ; 562
	i32 289, ; 563
	i32 161, ; 564
	i32 182, ; 565
	i32 278, ; 566
	i32 140, ; 567
	i32 363, ; 568
	i32 301, ; 569
	i32 297, ; 570
	i32 389, ; 571
	i32 169, ; 572
	i32 201, ; 573
	i32 239, ; 574
	i32 176, ; 575
	i32 306, ; 576
	i32 40, ; 577
	i32 265, ; 578
	i32 81, ; 579
	i32 56, ; 580
	i32 37, ; 581
	i32 97, ; 582
	i32 166, ; 583
	i32 172, ; 584
	i32 219, ; 585
	i32 302, ; 586
	i32 82, ; 587
	i32 241, ; 588
	i32 391, ; 589
	i32 360, ; 590
	i32 98, ; 591
	i32 371, ; 592
	i32 30, ; 593
	i32 159, ; 594
	i32 390, ; 595
	i32 18, ; 596
	i32 127, ; 597
	i32 411, ; 598
	i32 119, ; 599
	i32 261, ; 600
	i32 292, ; 601
	i32 274, ; 602
	i32 410, ; 603
	i32 369, ; 604
	i32 294, ; 605
	i32 165, ; 606
	i32 269, ; 607
	i32 417, ; 608
	i32 325, ; 609
	i32 368, ; 610
	i32 291, ; 611
	i32 282, ; 612
	i32 170, ; 613
	i32 16, ; 614
	i32 144, ; 615
	i32 195, ; 616
	i32 352, ; 617
	i32 317, ; 618
	i32 125, ; 619
	i32 211, ; 620
	i32 118, ; 621
	i32 38, ; 622
	i32 115, ; 623
	i32 47, ; 624
	i32 142, ; 625
	i32 117, ; 626
	i32 227, ; 627
	i32 175, ; 628
	i32 34, ; 629
	i32 180, ; 630
	i32 404, ; 631
	i32 95, ; 632
	i32 53, ; 633
	i32 178, ; 634
	i32 283, ; 635
	i32 358, ; 636
	i32 129, ; 637
	i32 153, ; 638
	i32 24, ; 639
	i32 161, ; 640
	i32 358, ; 641
	i32 260, ; 642
	i32 395, ; 643
	i32 148, ; 644
	i32 394, ; 645
	i32 104, ; 646
	i32 233, ; 647
	i32 362, ; 648
	i32 89, ; 649
	i32 213, ; 650
	i32 375, ; 651
	i32 248, ; 652
	i32 212, ; 653
	i32 60, ; 654
	i32 142, ; 655
	i32 100, ; 656
	i32 5, ; 657
	i32 13, ; 658
	i32 122, ; 659
	i32 135, ; 660
	i32 28, ; 661
	i32 325, ; 662
	i32 193, ; 663
	i32 368, ; 664
	i32 72, ; 665
	i32 258, ; 666
	i32 24, ; 667
	i32 218, ; 668
	i32 246, ; 669
	i32 287, ; 670
	i32 284, ; 671
	i32 387, ; 672
	i32 380, ; 673
	i32 342, ; 674
	i32 137, ; 675
	i32 239, ; 676
	i32 255, ; 677
	i32 168, ; 678
	i32 288, ; 679
	i32 321, ; 680
	i32 101, ; 681
	i32 403, ; 682
	i32 123, ; 683
	i32 405, ; 684
	i32 259, ; 685
	i32 384, ; 686
	i32 185, ; 687
	i32 163, ; 688
	i32 167, ; 689
	i32 262, ; 690
	i32 39, ; 691
	i32 197, ; 692
	i32 174, ; 693
	i32 340, ; 694
	i32 17, ; 695
	i32 220, ; 696
	i32 171, ; 697
	i32 341, ; 698
	i32 137, ; 699
	i32 386, ; 700
	i32 150, ; 701
	i32 251, ; 702
	i32 155, ; 703
	i32 130, ; 704
	i32 19, ; 705
	i32 65, ; 706
	i32 203, ; 707
	i32 147, ; 708
	i32 47, ; 709
	i32 416, ; 710
	i32 349, ; 711
	i32 379, ; 712
	i32 351, ; 713
	i32 237, ; 714
	i32 79, ; 715
	i32 227, ; 716
	i32 61, ; 717
	i32 364, ; 718
	i32 106, ; 719
	i32 286, ; 720
	i32 241, ; 721
	i32 49, ; 722
	i32 272, ; 723
	i32 346, ; 724
	i32 283, ; 725
	i32 14, ; 726
	i32 184, ; 727
	i32 68, ; 728
	i32 415, ; 729
	i32 171, ; 730
	i32 206, ; 731
	i32 247, ; 732
	i32 251, ; 733
	i32 192, ; 734
	i32 78, ; 735
	i32 256, ; 736
	i32 367, ; 737
	i32 108, ; 738
	i32 240, ; 739
	i32 282, ; 740
	i32 354, ; 741
	i32 208, ; 742
	i32 231, ; 743
	i32 67, ; 744
	i32 63, ; 745
	i32 27, ; 746
	i32 160, ; 747
	i32 321, ; 748
	i32 249, ; 749
	i32 222, ; 750
	i32 10, ; 751
	i32 197, ; 752
	i32 11, ; 753
	i32 381, ; 754
	i32 78, ; 755
	i32 126, ; 756
	i32 83, ; 757
	i32 353, ; 758
	i32 0, ; 759
	i32 186, ; 760
	i32 66, ; 761
	i32 107, ; 762
	i32 410, ; 763
	i32 381, ; 764
	i32 65, ; 765
	i32 128, ; 766
	i32 122, ; 767
	i32 77, ; 768
	i32 297, ; 769
	i32 287, ; 770
	i32 173, ; 771
	i32 402, ; 772
	i32 8, ; 773
	i32 255, ; 774
	i32 387, ; 775
	i32 2, ; 776
	i32 229, ; 777
	i32 337, ; 778
	i32 44, ; 779
	i32 300, ; 780
	i32 156, ; 781
	i32 128, ; 782
	i32 285, ; 783
	i32 23, ; 784
	i32 133, ; 785
	i32 243, ; 786
	i32 274, ; 787
	i32 405, ; 788
	i32 229, ; 789
	i32 29, ; 790
	i32 242, ; 791
	i32 62, ; 792
	i32 366, ; 793
	i32 199, ; 794
	i32 90, ; 795
	i32 399, ; 796
	i32 173, ; 797
	i32 87, ; 798
	i32 148, ; 799
	i32 323, ; 800
	i32 201, ; 801
	i32 36, ; 802
	i32 86, ; 803
	i32 263, ; 804
	i32 347, ; 805
	i32 185, ; 806
	i32 50, ; 807
	i32 6, ; 808
	i32 357, ; 809
	i32 90, ; 810
	i32 347, ; 811
	i32 21, ; 812
	i32 162, ; 813
	i32 96, ; 814
	i32 50, ; 815
	i32 113, ; 816
	i32 279, ; 817
	i32 130, ; 818
	i32 361, ; 819
	i32 181, ; 820
	i32 76, ; 821
	i32 27, ; 822
	i32 372, ; 823
	i32 407, ; 824
	i32 207, ; 825
	i32 406, ; 826
	i32 336, ; 827
	i32 256, ; 828
	i32 278, ; 829
	i32 7, ; 830
	i32 230, ; 831
	i32 198, ; 832
	i32 110, ; 833
	i32 279, ; 834
	i32 265 ; 835
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
