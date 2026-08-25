Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013001.outbound.protection.outlook.com [40.93.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B72561A7
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 02:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787625912; cv=fail; b=W5JWhBD7TStXdRkGjJIWGQwY/PndGWsf4HlxiMWiAOwY/hAL0EEUwoqFgnIkQhz/DbPx+taWQV5N/fW+wZ6GuAIpnhxxnUvcSy/WX5mP0bJN5J3pK3OwiUE9pYEfaA3ML4m9LZbXDtu+qCdOqYBiM8qmT7CADgsziVCXBeNSnLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787625912; c=relaxed/simple;
	bh=jgcd+QzpHt7BgPhjGPCSo6XmlzCsdOgMuKxJ3ZA3f68=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fwn7Zk5JZAealgH1xy9KiVk4j6mRq8fgsHw+V9TLHzQmEQpDLJi8UoKhce1zLhYI998a6dbjnOM5n6NUPl7Q23A1QLOabM0xYfSTncLh1WMYcjpdqxfgVINVQX7SYlDHWGqVUUVO30cXL30q2w5gzatHaWe0jI6pdLOpee9LivA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tzmp7FH3; arc=fail smtp.client-ip=40.93.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tzmp7FH3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZ2abS0h9MeRnNAwPD+XvrVkQiZ8H+zmQRkKTWh4tjnQYosXHuYF3E+cyPCSgI4KtZX5hnoSWHKrMBIKVFEQdbmvhBEvnHv0weE7qaMV5TLzKBhd5QKnCwLmPbw25vOzyH2Zs0bSMxYQbkbEZCCKWwlNKv7F/1BoHaWJltdgOL9cNT7LJ14K5+Bm9DEHm8a3/LllUqh7Adps7JiipPQCpzvt3fARGToThile61mnI5Kkwf6u5qQQJEbA3ADScOZv4ZC4I7iBSjPRo8MDVOEbWZH9VOOpKH/A0s7XP2ulUA4lPfdG4E6Xb4zIqpyydBbjzjohajFS9grbWffUtCJotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/bOF0h5ZipjSTH9kisFNdhfyFkx4uU3GI4PKQDXaYI=;
 b=dsuVgQC8/aUlAI7hF7hVr3SirJp/zaxbEb4ls+tIs0yhIU0gV4qrPd73FUzpUoEYS/JsCy1krpE8b3z5RvooKZS0Ynlt7J/q9LTSDKUNM6+/cQVp8XmEPHIltunKnjd96zxUEWNFda8+2Fcbw8J1vIGxk4RsXmxSq4lNk0qYSWx/YIYrKFZ3xwBRRa5NhBrGigLCcphcRgIhZ3sf0uskJkONGPfylBAZYPbb+DvGazriEE4QMZrvD4M0JozTQ02R/nWloUt9VXRLeygy7i+yTRSI0LoLPf8UddZI3IM7pnP9784jv4ujM+4oOHgNXCmt9IF7CvuZUlhPeekJf/H95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/bOF0h5ZipjSTH9kisFNdhfyFkx4uU3GI4PKQDXaYI=;
 b=Tzmp7FH3PflMmyjPJig3F4f1xk4BwpSHkgRZOvDAPFtrgpDaa32/b9Peetp+QZEoIf5RQdSE8YKx413757GuPwpfDcLeMzYPR2hv9wIHMA48S3fIR5nucJ6UMiNhUxR64z/pZuZA/5swkjp6HnWXBlPskyrwdMiR7mmKpbRc77j7BEmTx/RctIIjrVtI62q5/6ZY8bBP7eft5P+a6cuDj8idGihbMUXIEKBegqYlyYx2Y/zig0RTRfSXPrvf/Wd/xjzlUZokMn7ds4jcm6Vd4yMrQu6/1CZPw/hRGXv1awUar7oBSEjdhBSCgAINGekAEnUTibkrYsULS58Likinqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB6094.namprd12.prod.outlook.com (2603:10b6:8:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 02:45:00 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Tue, 25 Aug 2026
 02:45:00 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 25 Aug 2026 11:44:48 +0900
Subject: [PATCH 2/2] gpu: nova-core: use kernel lossless integer conversion
 module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-const_as-v1-2-1ce712225fe2@nvidia.com>
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
In-Reply-To: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nova-gpu@lists.linux.dev, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: a0efe3e4-17af-4c1f-594f-08df0252db1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|7416014|1800799024|366016|921020|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6Wir7uzT7HD/C/9HF4I+i2fLnTebPn/4ucItBJnIHPZ/1sNwhcUV4IgqAms7D0W2K5uL1cfPgRqzcWEYrTnmVFlDr/kVXRKt3Zpb5u+aISoGrljw7Zz9nQBPfyCAh6uaXvNOndKGIMwBiBMpXsH+21qQbX+77YrCgswi4VpbRgq0Y8dOpMOvz9B99aMGscsYZwO4ito/BsqZxA0hD7uv37IkQCg5nMFcKCwdqBywel5JSYmW/OPIQCO8mZlt/QBgaLtrDjct7rb6f50iwKmRH3bQXBlkWjtJLuN5Z1+DBCX5mE5RrWc0TIm+vP3xeQ4RVCODu7HtmSyylI6tLHfbZ/sVZ3JkLQfnAxst8NvW61GUioa8ikkT8LzJ/dx0S0UkQns4R08NTeqbQloMnG8ExCwmWtNKJRngEhzqAp87XOCWNwSiexp0Il/Fw/7anDvyQNjr+ERdE+92PqymFhCOb1zqorwVolbHu/HSabBRBMf+mgsR1H+jrnBxPnnAcnbtjhHMIbBMSwI/51nLTSTCxRc3tpRfy5iKfQ0QbAPznLI2imyQwMwskEagpqq/te2gs+A6hJjLpICbXCUAMdQuhllQSh3cPRg3VWYlsdE+lzqOAYBbSrYtt+lg33MH3Id9WJMy12Ihvaf7PAzvFLZuafDmYDuwzmztRF5YIVhL2HRRetUDQMSIRQlAdKECmPqVypWacXGAMjF3eeuatK894Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(7416014)(1800799024)(366016)(921020)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y24xYmxMS0tydU5hOW1DYnhMRzRubjlQWVBhNVM5OHZJTytabnlvQXlUMWFL?=
 =?utf-8?B?Qk1iT3psbVlycHVscGljbWdqUHdBaU5rY3craXZJODAzNHhWRlFTN0xLaE53?=
 =?utf-8?B?WHNQeDdrSVpsTlZNQWVFSC9QeTM3NTBtQkdkc0xJamozcE5hV1pIYUl5Zzhm?=
 =?utf-8?B?STQvdmdvYjBRbmwzYi94Q0hUTnY3dDNMT1BZYXJyOTFSSytTZUwrMng3MkRa?=
 =?utf-8?B?c1R0YWlKeWdLSnZzR2Y0RnAzb3N5SVVQOFp2RjlTc0l4aU9MbTM4amhqdzdZ?=
 =?utf-8?B?c0NzOFdmeVpOcUcrL05CdGFuRFk1OUx3SzlMcEI5WHJmTWplWG9ibk5KRlFy?=
 =?utf-8?B?ZnBMQWhOKzc4WUw5QWlraTNVcHNwWnR1VUc1cGNRRC8xOU1tRmgwcmJ0UWdL?=
 =?utf-8?B?VUlreXhsKyt3MW9NTXJqaDJxV2tzWWNIUGQwS0ZDK05TSUdHZWtWblNsNWRV?=
 =?utf-8?B?TERpU0lFdmhyZzdRV3BFVzlTMFR2OGkwbTBZYUtOYVRyNERTRzJVd3llQVM3?=
 =?utf-8?B?NlJXbmwrU1hMUkxadXM4WTRSQ0ZSNlN6QmxZejNkazVUOTBtb3J6OXNoZzZW?=
 =?utf-8?B?TGVXQVBjd21hcjFzMHJmZjh4MzZzSmVVUVNSbDkrekFIWWpOQXVTMGRsRTV3?=
 =?utf-8?B?bndjSVdDMFpzQ09wb256WnZ0UzRReXFTYUFuS1FZaUw2dE1VY0FYQm1Sa0RF?=
 =?utf-8?B?S3JwZ0d0M295V2FKUzcyNmtVejRSVGtPMWZ1U0paWVlqWEJjNGx4aEord1Ry?=
 =?utf-8?B?SFNCTmFpWHhUQTFOeXF2akFhWi9PUkd6K1FsT1A1emhCeU1iVWtCNFAycHdV?=
 =?utf-8?B?T00xQlNhUWdJU3dobmZuTkliT015a0kyejE4WG1sNkt6V21WbWhBQlQxc282?=
 =?utf-8?B?eVVLN3JxcnViaXBTdmJJcE9ENThoK0tjTlFCT2JvS2Y5S2QvU2gzRXQrd2s5?=
 =?utf-8?B?d3lEZzVlR0JqMmlXSUcrdmg2MDNDWDF2dWxWUFFJZWFQcEZuZW53VERoUCtG?=
 =?utf-8?B?T3E4OWFWbTRiQVlDNUV6T0NDWlg3VEVGQ0xvV3I0b28va29XMkNYd01Qcmh3?=
 =?utf-8?B?QXZxYjkwaTBwVjZ3OVNFanVXTGI2eVRzakd3c0NhdWN2UVRyYVd5YU1CTXE2?=
 =?utf-8?B?MXBkcTk5WlF1NTZTYndaVTlDc1VReEd1Z3VwQnAzSHVHZDhCKzFYc0ticUtT?=
 =?utf-8?B?alNwYTdqUFg1dlZpZDUvNldvWlB5cGRsamVkU0RjcEZ4NTg2U0lTMTNqNWpH?=
 =?utf-8?B?bVdXSUNxU2hJSlViazU0NElpODdlbGd4M28yU0JRL0pRWm40ckhXT1dZclhX?=
 =?utf-8?B?blh1RTZSbG1vOXdpdVo2dWNEdEJIdkxxUi93aTYyQ1dzTkc4YUgwMzk2NkhH?=
 =?utf-8?B?WUEvc08vekhQT3hEY2tZUVpPSWhmSTU0L2VLQUVFSDNEUlBJMnRkelBtVEJI?=
 =?utf-8?B?OXRTTFBTa2NiNzVaSWdvT1ZSZ0NhVE9zNXFwcUJ2Ukw3RXRuM2huUVkwcTMv?=
 =?utf-8?B?RWcvdHdUdkcxektMZmpGN2dCTkpqUU5YUUJMV3JOWVFyOWR0NE1pY2I1Zjda?=
 =?utf-8?B?ajdVSkdFbENoRlhMaDdTei9LQ20ya2ZZTEI2M1hSN09WOFQzWXpZZlpSOHVL?=
 =?utf-8?B?UHdTczNidUNVMVNxSnB5Z3AyNlZyLzUrMk1Va2k0L3hnSFljTUl6dFh0WmhP?=
 =?utf-8?B?S3lnRGJDOUo3djdWRXlaU09kOHFYSEU5TmlLU3Z4Vnp1NS9DbDUvTUh4WWtq?=
 =?utf-8?B?UEU1ajM1T1k5bW0yZDhnTXZZR2RIMVRBWXUxa0JPa1Rkb3FVRlFLYmZCTlZ3?=
 =?utf-8?B?UkRlRjVyRmJZS20yK0tHUXVoVVFzMHMxT1dpaFNZSmtBS3oxV29ib0pYRzJF?=
 =?utf-8?B?YkkwYlFXUWJsT2JLSStzaW5pQ3VlMkVGZUVJOXdiZTRQZXZrdXJZdnE2Q1dD?=
 =?utf-8?B?OXcyaCtPcnFqd0R5TXZZYkV2TWJUTmpGbi8wamlmLzVFTE5XM2lpSHJnL3dU?=
 =?utf-8?B?WGRQM0ptcWtVQS9qdVZrNDR0bVFHYlRUdDBVU1VpTUdOK1diNDdscmNiMnQ3?=
 =?utf-8?B?c0VkQ3VSQlNrZTJBa2g5aG1LdDU4aXBkbktCYUd5UWVXYWFWcVBnSnNDQVNx?=
 =?utf-8?B?NkpHUHhvTi9PeHNVYUF0MllldWI0STc4aE9TMG5ZM0lmaWJ6ODF3ZDJuVWF6?=
 =?utf-8?B?Y01kejhVTkMwZUFiUVh0SExDNHRxNy9YTVJiMlNLZ3pyZXpyZ0FxL3VXLzAv?=
 =?utf-8?B?UFRvQWYzYThrMzIzZ0JzVW5lYThNcFlnZ2RnS1ZueVZXRUlDeHp0bE5FN3pk?=
 =?utf-8?B?cXdIS0VudHc1WVp5dnh1d0QxYldXODFsWEZLajdHSFgxZExYY0JNTUdVRGNp?=
 =?utf-8?Q?9KMIf/L/KyIC0khf/94WC3mFEnUCIR88LZsTX5IqrisM9?=
X-MS-Exchange-AntiSpam-MessageData-1: xLEO3Ma66nD5yg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0efe3e4-17af-4c1f-594f-08df0252db1d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 02:44:59.9712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8Olz9D/xO1vwuES4Idb0zLgw5rP31tDGgkHLStSZGUIquMkPckKOdm00MGJeaDKQhYQlQUWQY6soa5hGGFFjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6094

The `kernel` crate now features a replacement for our lossless integer
conversion routines. Switch to the kernel version and remove our own.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs                    |  12 +-
 drivers/gpu/nova-core/falcon/fsp.rs                |   4 +-
 drivers/gpu/nova-core/fb.rs                        |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs              |   9 +-
 drivers/gpu/nova-core/firmware.rs                  |   4 +-
 drivers/gpu/nova-core/firmware/booter.rs           |   4 +-
 drivers/gpu/nova-core/firmware/fwsec.rs            |   2 +-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   4 +-
 drivers/gpu/nova-core/firmware/gsp.rs              |   9 +-
 drivers/gpu/nova-core/firmware/tlv.rs              |  11 +-
 drivers/gpu/nova-core/fsp.rs                       |   8 +-
 drivers/gpu/nova-core/gsp.rs                       |   4 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |  22 +--
 drivers/gpu/nova-core/gsp/fw.rs                    |  50 ++---
 drivers/gpu/nova-core/gsp/fw/commands.rs           |   4 +-
 drivers/gpu/nova-core/gsp/sequencer.rs             |   2 +-
 drivers/gpu/nova-core/mctp.rs                      |   8 +-
 drivers/gpu/nova-core/num.rs                       | 211 ---------------------
 drivers/gpu/nova-core/vbios.rs                     |   2 +-
 19 files changed, 84 insertions(+), 288 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 65cb12d26e2b..eb54aa41e8bf 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -20,6 +20,10 @@
         },
         Io,
     },
+    num::casts::{
+        self,
+        FromSafeCast, //
+    },
     prelude::*,
     time::Delta,
 };
@@ -29,11 +33,7 @@
     driver::Bar0,
     falcon::hal::LoadMethod,
     gpu::Chipset,
-    num::{
-        self,
-        FromSafeCast, //
-    },
-    regs,
+    regs, //
 };
 
 pub(crate) mod fsp;
@@ -510,7 +510,7 @@ fn dma_wr(
         target_mem: FalconMem,
         load_offsets: FalconDmaLoadTarget,
     ) -> Result {
-        const DMA_LEN: u32 = num::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT }>();
+        const DMA_LEN: u32 = casts::const_as!(MEM_BLOCK_ALIGNMENT => u32);
 
         // DMA transfers can only be done in units of 256 bytes. Compute how many such transfers we
         // need to perform.
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 0437180b8829..2470ac511c98 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -16,6 +16,7 @@
         },
         Io, //
     },
+    num::casts,
     prelude::*,
     sizes::SZ_1K,
     time::Delta,
@@ -28,7 +29,6 @@
         PFalcon2Base,
         PFalconBase, //
     },
-    num,
     regs, //
 };
 
@@ -165,7 +165,7 @@ pub(crate) fn recv_msg(&mut self) -> Result<KVec<u8>> {
             Delta::from_millis(10),
             Delta::from_millis(FSP_MSG_TIMEOUT_MS),
         )
-        .map(num::u32_as_usize)?;
+        .map(casts::u32_as_usize)?;
 
         // Don't blindly allocate more than the maximum we expect from FSP.
         if msg_size > FSP_EMEM_CHANNEL_0_SIZE {
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 1576399389b1..8d5d9480378f 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,6 +10,7 @@
     dma::CoherentHandle,
     fmt,
     io::Io,
+    num::casts::FromSafeCast,
     prelude::*,
     ptr::{
         Alignable,
@@ -23,7 +24,6 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::FromSafeCast,
     vgpu::VgpuState, //
 };
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index d9e4d62ae632..8fb94696c715 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -11,7 +11,10 @@
         },
         Io, //
     },
-    num::Bounded,
+    num::{
+        casts,
+        Bounded, //
+    },
     prelude::*,
     ptr::{
         const_align_up,
@@ -26,7 +29,6 @@
         hal::FbHal,
         regs, //
     },
-    num::usize_into_u32,
 };
 
 struct Gb100;
@@ -82,7 +84,8 @@ fn write_sysmem_flush_page_gb100(bar: Bar0<'_>, addr: Bounded<u64, 52>) {
 
 // This PMU reservation size is r570-specific.
 pub(super) const fn pmu_reserved_size_gb100() -> u32 {
-    usize_into_u32::<{ const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()).unwrap() }>(
+    casts::const_as!(
+        const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()).unwrap() => u32
     )
 }
 
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index b49613a90bf0..19f13779bb30 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -9,6 +9,7 @@
 
 use kernel::{
     firmware,
+    num::casts::IntoSafeCast,
     prelude::*, //
 };
 
@@ -18,8 +19,7 @@
         FalconFirmware, //
     },
     gpu,
-    gsp::boot_firmware_files,
-    num::IntoSafeCast, //
+    gsp::boot_firmware_files, //
 };
 
 pub(crate) mod booter;
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index dc071edba331..aa830455b7e7 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -10,6 +10,7 @@
 use kernel::{
     device,
     dma::Coherent,
+    num::casts::IntoSafeCast,
     prelude::*, //
 };
 
@@ -32,8 +33,7 @@
         Signed,
         Unsigned, //
     },
-    gpu::Chipset,
-    num::IntoSafeCast,
+    gpu::Chipset, //
 };
 
 /// Signature for Booter firmware. Their size is encoded into the header and not known a compile
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 7a931f22f629..7f7ca3ba2298 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -19,6 +19,7 @@
         self,
         Device, //
     },
+    num::casts::FromSafeCast,
     prelude::*,
     transmute::{
         AsBytes,
@@ -42,7 +43,6 @@
         Signed,
         Unsigned, //
     },
-    num::FromSafeCast,
     vbios::Vbios,
 };
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index ec4d92317a93..d1fb7d2d7480 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -13,6 +13,7 @@
     },
     dma::Coherent,
     io::{register::WithBase, Io},
+    num::casts::FromSafeCast,
     prelude::*,
     ptr::{
         Alignable,
@@ -45,8 +46,7 @@
         },
     },
     gpu::Chipset,
-    num::FromSafeCast, //
-    regs,
+    regs, //
 };
 
 /// Structure used by the boot-loader to load the rest of the code.
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index e8f9491e84cc..e75ce6fe47d8 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -9,6 +9,10 @@
         DmaAddress, //
     },
     firmware,
+    num::casts::{
+        arch::FromSafeCastArch,
+        FromSafeCast, //
+    },
     prelude::*,
     scatterlist::{
         Owned,
@@ -26,8 +30,7 @@
         },
     },
     gpu::Chipset,
-    gsp::GSP_PAGE_SIZE,
-    num::FromSafeCast,
+    gsp::GSP_PAGE_SIZE, //
 };
 
 /// GSP firmware with 3-level radix page tables for the GSP bootloader.
@@ -154,7 +157,7 @@ pub(crate) fn radix3_dma_address(&self) -> DmaAddress {
 fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
     for sg_entry in sg_table.iter() {
         // Number of pages we need to map.
-        let num_pages = usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
+        let num_pages = usize::from_safe_cast_arch(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
 
         for i in 0..num_pages {
             let entry = sg_entry.dma_address()
diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
index 7b879f13a61e..6653c10e3e0a 100644
--- a/drivers/gpu/nova-core/firmware/tlv.rs
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -4,14 +4,15 @@
 use kernel::{
     device,
     firmware,
+    num::casts::{
+        self,
+        IntoSafeCast, //
+    },
     prelude::*,
     str::CString, //
 };
 
-use crate::{
-    gpu,
-    num::*, //
-};
+use crate::gpu;
 
 /// Requests the GPU firmware TLV `name` suitable for `chipset`.
 pub(crate) fn request_tlv(
@@ -51,7 +52,7 @@ fn parse(hdr: &[u8]) -> Option<Self> {
             return None;
         }
         let len_arr = <[u8; 4]>::try_from(hdr.get(4..Self::SIZE)?).ok()?;
-        let length = u32_as_usize(u32::from_le_bytes(len_arr));
+        let length = casts::u32_as_usize(u32::from_le_bytes(len_arr));
         Some(Self { tag, length })
     }
 }
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index ab685fb4168f..bd8505addd25 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -11,7 +11,10 @@
     device,
     dma::Coherent,
     io::poll::read_poll_timeout,
-    num::TryIntoBounded,
+    num::{
+        casts,
+        TryIntoBounded, //
+    },
     prelude::*,
     ptr::{
         Alignable,
@@ -47,7 +50,6 @@
         NvdmHeader,
         NvdmType, //
     },
-    num,
     regs, //
 };
 
@@ -285,7 +287,7 @@ fn new<'a>(
         };
 
         let version = hal.cot_version();
-        let size = num::usize_into_u16::<{ core::mem::size_of::<NvdmPayloadCot>() }>();
+        let size = casts::const_as!(core::mem::size_of::<NvdmPayloadCot>() => u16);
 
         Ok(init!(Self {
             header: FspMessageHeader::new(NvdmType::Cot),
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 13f361406a6c..fc8648de84c2 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -17,6 +17,7 @@
         io_write,
         Io, //
     },
+    num::casts,
     pci,
     prelude::*, //
 };
@@ -48,7 +49,6 @@
         cmdq::Cmdq,
         fw::GspArgumentsPadded, //
     },
-    num,
     vgpu::VgpuManager, //
 };
 
@@ -92,7 +92,7 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
         for i in 0..NUM_PAGES {
             io_write!(view, .0[build: i],
                 start
-                    .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
+                    .checked_add(casts::usize_as_u64(i) << GSP_PAGE_SHIFT)
                     .ok_or(EOVERFLOW)?
             );
         }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 6da728201281..99e775f6071e 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -23,6 +23,7 @@
         Io, //
     },
     new_mutex,
+    num::casts,
     prelude::*,
     ptr,
     sync::{
@@ -57,7 +58,6 @@
         GSP_PAGE_SHIFT,
         GSP_PAGE_SIZE, //
     },
-    num,
     sbuffer::SBufferIter, //
 };
 
@@ -162,7 +162,7 @@ fn read(
 #[repr(C, align(0x1000))]
 #[derive(Debug)]
 struct MsgqData {
-    data: [[u8; GSP_PAGE_SIZE]; num::u32_as_usize(MSGQ_NUM_PAGES)],
+    data: [[u8; GSP_PAGE_SIZE]; casts::u32_as_usize(MSGQ_NUM_PAGES)],
 }
 
 // Annoyingly we are forced to use a literal to specify the alignment of
@@ -235,8 +235,8 @@ unsafe impl FromBytes for GspMem {}
 impl DmaGspMem {
     /// Allocate a new instance and map it for `dev`.
     fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
-        const MSGQ_SIZE: u32 = num::usize_into_u32::<{ size_of::<Msgq>() }>();
-        const RX_HDR_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, rx) }>();
+        const MSGQ_SIZE: u32 = casts::const_as!(size_of::<Msgq>() => u32);
+        const RX_HDR_OFF: u32 = casts::const_as!(mem::offset_of!(Msgq, rx) => u32);
 
         let mut gsp_mem = CoherentBox::<GspMem>::zeroed(dev, GFP_KERNEL)?;
         gsp_mem.cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES);
@@ -289,10 +289,10 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         unsafe {
             (
                 core::slice::from_raw_parts_mut(
-                    data.add(num::u32_as_usize(tx)),
-                    num::u32_as_usize(tail_end - tx),
+                    data.add(casts::u32_as_usize(tx)),
+                    casts::u32_as_usize(tail_end - tx),
                 ),
-                core::slice::from_raw_parts_mut(data, num::u32_as_usize(wrap_end)),
+                core::slice::from_raw_parts_mut(data, casts::u32_as_usize(wrap_end)),
             )
         }
     }
@@ -307,7 +307,7 @@ fn driver_write_area_size(&self) -> usize {
         // `cpu_write_ptr`. The minimum value case is where `rx == 0` and `tx == MSGQ_NUM_PAGES -
         // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - 1 == 0`.
         let slots = (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
-        num::u32_as_usize(slots) * GSP_PAGE_SIZE
+        casts::u32_as_usize(slots) * GSP_PAGE_SIZE
     }
 
     /// Returns the region of the GSP message queue that the driver is currently allowed to read
@@ -343,10 +343,10 @@ fn driver_write_area_size(&self) -> usize {
         unsafe {
             (
                 core::slice::from_raw_parts(
-                    data.add(num::u32_as_usize(rx)),
-                    num::u32_as_usize(tail_end - rx),
+                    data.add(casts::u32_as_usize(rx)),
+                    casts::u32_as_usize(tail_end - rx),
                 ),
-                core::slice::from_raw_parts(data, num::u32_as_usize(wrap_end)),
+                core::slice::from_raw_parts(data, casts::u32_as_usize(wrap_end)),
             )
         }
     }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 05f54fee6186..c05991a72e48 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -19,6 +19,10 @@
         io_read,
         io_write, //
     },
+    num::casts::{
+        self,
+        FromSafeCast, //
+    },
     prelude::*,
     ptr::{
         Alignable,
@@ -49,15 +53,11 @@
         cmdq::Cmdq, //
         GSP_PAGE_SIZE,
     },
-    num::{
-        self,
-        FromSafeCast, //
-    },
 };
 
 /// Maximum size of a single GSP message queue element in bytes.
 pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
-    num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
+    casts::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
 
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
@@ -110,19 +110,19 @@ pub(crate) struct LibosParams {
 impl LibosParams {
     /// Version 2 of the GSP LIBOS (Turing and GA100)
     const LIBOS2: LibosParams = LibosParams {
-        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
-        allowed_heap_size: num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
+        carveout_size: casts::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
+        allowed_heap_size: casts::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
             * u64::SZ_1M
-            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB) * u64::SZ_1M,
+            ..casts::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB) * u64::SZ_1M,
     };
 
     /// Version 3 of the GSP LIBOS (GA102+)
     const LIBOS3: LibosParams = LibosParams {
-        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
-        allowed_heap_size: num::u32_as_u64(
+        carveout_size: casts::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: casts::u32_as_u64(
             bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
         ) * u64::SZ_1M
-            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+            ..casts::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
                 * u64::SZ_1M,
     };
 
@@ -681,13 +681,13 @@ fn id8(name: &str) -> u64 {
         let init_inner = init!(bindings::LibosMemoryRegionInitArgument {
             id8: id8(name),
             pa: obj.dma_address(),
-            size: num::usize_as_u64(obj.size()),
-            kind: num::u32_into_u8::<
-                { bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS },
-            >(),
-            loc: num::u32_into_u8::<
-                { bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM },
-            >(),
+            size: casts::usize_as_u64(obj.size()),
+            kind: casts::const_as!(
+                bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS => u8
+            ),
+            loc: casts::const_as!(
+                bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM => u8
+            ),
             ..Zeroable::init_zeroed()
         });
 
@@ -715,12 +715,12 @@ pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32, msg_count: u32) -> Self {
         Self(bindings::msgqTxHeader {
             version: 0,
             size: msgq_size,
-            msgSize: num::usize_into_u32::<GSP_PAGE_SIZE>(),
+            msgSize: casts::const_as!(GSP_PAGE_SIZE => u32),
             msgCount: msg_count,
             writePtr: 0,
             flags: 1,
             rxHdrOff: rx_hdr_offset,
-            entryOff: num::usize_into_u32::<GSP_PAGE_SIZE>(),
+            entryOff: casts::const_as!(GSP_PAGE_SIZE => u32),
         })
     }
 
@@ -851,7 +851,7 @@ pub(crate) fn set_checksum(&mut self, checksum: u32) {
     /// Returns the length of the message's payload.
     pub(crate) fn payload_length(&self) -> usize {
         // `rpc.length` includes the length of the RPC message header.
-        num::u32_as_usize(self.inner.rpc.length)
+        casts::u32_as_usize(self.inner.rpc.length)
             .saturating_sub(size_of::<bindings::rpc_message_header_v>())
     }
 
@@ -947,9 +947,9 @@ impl MessageQueueInitArguments {
     fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
         init!(MessageQueueInitArguments {
             sharedMemPhysAddr: cmdq.dma_addr,
-            pageTableEntryCount: num::usize_into_u32::<{ Cmdq::NUM_PTES }>(),
-            cmdQueueOffset: num::usize_as_u64(Cmdq::CMDQ_OFFSET),
-            statQueueOffset: num::usize_as_u64(Cmdq::STATQ_OFFSET),
+            pageTableEntryCount: casts::const_as!(Cmdq::NUM_PTES => u32),
+            cmdQueueOffset: casts::usize_as_u64(Cmdq::CMDQ_OFFSET),
+            statQueueOffset: casts::usize_as_u64(Cmdq::STATQ_OFFSET),
             ..Zeroable::init_zeroed()
         })
     }
@@ -969,7 +969,7 @@ impl GspAcrBootGspRmParams {
     fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> {
         let params = init!(Self {
             target: target as u32,
-            gspRmDescSize: num::usize_into_u32::<{ size_of::<GspFwWprMeta>() }>(),
+            gspRmDescSize: casts::const_as!(size_of::<GspFwWprMeta>() => u32),
             gspRmDescOffset: wpr_meta_addr,
             bIsGspRmBoot: 1,
             wprCarveoutOffset: 0,
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 6dc31d1bf5ae..201594fa437b 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -5,6 +5,7 @@
 
 use kernel::{
     device,
+    num::casts::IntoSafeCast,
     pci,
     prelude::*,
     transmute::{
@@ -15,8 +16,7 @@
 
 use crate::{
     gpu::Chipset,
-    gsp::GSP_PAGE_SIZE,
-    num::IntoSafeCast, //
+    gsp::GSP_PAGE_SIZE, //
 };
 
 use super::bindings;
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index bcad1421953a..fed881ba80b0 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -11,6 +11,7 @@
         poll::read_poll_timeout,
         Io, //
     },
+    num::casts::FromSafeCast,
     prelude::*,
     time::{
         delay::fsleep,
@@ -35,7 +36,6 @@
         GspBootContext,
         LibosMemoryRegionInitArgument, //
     },
-    num::FromSafeCast,
     sbuffer::SBufferIter,
 };
 
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 90c642c91a72..67f64ac2b8d1 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -9,14 +9,12 @@
 
 use kernel::{
     bitfield,
+    num::casts,
     pci::Vendor,
     prelude::*, //
 };
 
-use crate::{
-    bounded_enum,
-    num, //
-};
+use crate::bounded_enum;
 
 bounded_enum! {
     /// NVDM message type identifiers carried over MCTP.
@@ -76,7 +74,7 @@ impl NvdmHeader {
     /// Builds an NVDM header for the given message type.
     pub(crate) fn new(nvdm_type: NvdmType) -> Self {
         Self::zeroed()
-            .with_const_msg_type::<{ num::u8_as_u32(MSG_TYPE_VENDOR_PCI) }>()
+            .with_const_msg_type::<{ casts::u8_as_u32(MSG_TYPE_VENDOR_PCI) }>()
             .with_vendor_id(Vendor::NVIDIA.as_raw())
             .with_nvdm_type(nvdm_type)
     }
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index 6eb174d136ab..3921ef6f238e 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -5,217 +5,6 @@
 //! This is essentially a staging module for code to mature until it can be moved to the `kernel`
 //! crate.
 
-use kernel::{
-    macros::paste,
-    prelude::*, //
-};
-
-/// Implements safe `as` conversion functions from a given type into a series of target types.
-///
-/// These functions can be used in place of `as`, with the guarantee that they will be lossless.
-macro_rules! impl_safe_as {
-    ($from:ty as { $($into:ty),* }) => {
-        $(
-        paste! {
-            #[doc = ::core::concat!(
-                "Losslessly converts a [`",
-                ::core::stringify!($from),
-                "`] into a [`",
-                ::core::stringify!($into),
-                "`].")]
-            ///
-            /// This conversion is allowed as it is always lossless. Prefer this over the `as`
-            /// keyword to ensure no lossy casts are performed.
-            ///
-            /// This is for use from a `const` context. For non `const` use, prefer the
-            /// [`FromSafeCast`] and [`IntoSafeCast`] traits.
-            ///
-            /// # Examples
-            ///
-            /// ```
-            /// use crate::num;
-            ///
-            #[doc = ::core::concat!(
-                "assert_eq!(num::",
-                ::core::stringify!($from),
-                "_as_",
-                ::core::stringify!($into),
-                "(1",
-                ::core::stringify!($from),
-                "), 1",
-                ::core::stringify!($into),
-                ");")]
-            /// ```
-            #[allow(unused)]
-            #[inline(always)]
-            pub(crate) const fn [<$from _as_ $into>](value: $from) -> $into {
-                ::kernel::build_assert::static_assert!(size_of::<$into>() >= size_of::<$from>());
-
-                value as $into
-            }
-        }
-        )*
-    };
-}
-
-impl_safe_as!(u8 as { u16, u32, u64, usize });
-impl_safe_as!(u16 as { u32, u64, usize });
-impl_safe_as!(u32 as { u64, usize } );
-// `u64` and `usize` have the same size on 64-bit platforms.
-#[cfg(CONFIG_64BIT)]
-impl_safe_as!(u64 as { usize } );
-
-// A `usize` fits into a `u64` on 32 and 64-bit platforms.
-#[cfg(any(CONFIG_32BIT, CONFIG_64BIT))]
-impl_safe_as!(usize as { u64 });
-
-// A `usize` fits into a `u32` on 32-bit platforms.
-#[cfg(CONFIG_32BIT)]
-impl_safe_as!(usize as { u32 });
-
-/// Extension trait providing guaranteed lossless cast to `Self` from `T`.
-///
-/// The standard library's `From` implementations do not cover conversions that are not portable or
-/// future-proof. For instance, even though it is safe today, `From<usize>` is not implemented for
-/// [`u64`] because of the possibility to support larger-than-64bit architectures in the future.
-///
-/// The workaround is to either deal with the error handling of [`TryFrom`] for an operation that
-/// technically cannot fail, or to use the `as` keyword, which can silently strip data if the
-/// destination type is smaller than the source.
-///
-/// Both options are hardly acceptable for the kernel. It is also a much more architecture
-/// dependent environment, supporting only 32 and 64 bit architectures, with some modules
-/// explicitly depending on a specific bus width that could greatly benefit from infallible
-/// conversion operations.
-///
-/// Thus this extension trait that provides, for the architecture the kernel is built for, safe
-/// conversion between types for which such cast is lossless.
-///
-/// In other words, this trait is implemented if, for the current build target and with `t: T`, the
-/// `t as Self` operation is completely lossless.
-///
-/// Prefer this over the `as` keyword to ensure no lossy casts are performed.
-///
-/// If you need to perform a conversion in `const` context, use [`u64_as_usize`], [`u32_as_usize`],
-/// [`usize_as_u64`], etc.
-///
-/// # Examples
-///
-/// ```
-/// use crate::num::FromSafeCast;
-///
-/// assert_eq!(usize::from_safe_cast(0xf00u32), 0xf00u32 as usize);
-/// ```
-pub(crate) trait FromSafeCast<T> {
-    /// Create a `Self` from `value`. This operation is guaranteed to be lossless.
-    fn from_safe_cast(value: T) -> Self;
-}
-
-impl FromSafeCast<usize> for u64 {
-    fn from_safe_cast(value: usize) -> Self {
-        usize_as_u64(value)
-    }
-}
-
-#[cfg(CONFIG_32BIT)]
-impl FromSafeCast<usize> for u32 {
-    fn from_safe_cast(value: usize) -> Self {
-        usize_as_u32(value)
-    }
-}
-
-impl FromSafeCast<u32> for usize {
-    fn from_safe_cast(value: u32) -> Self {
-        u32_as_usize(value)
-    }
-}
-
-#[cfg(CONFIG_64BIT)]
-impl FromSafeCast<u64> for usize {
-    fn from_safe_cast(value: u64) -> Self {
-        u64_as_usize(value)
-    }
-}
-
-/// Counterpart to the [`FromSafeCast`] trait, i.e. this trait is to [`FromSafeCast`] what [`Into`]
-/// is to [`From`].
-///
-/// See the documentation of [`FromSafeCast`] for the motivation.
-///
-/// # Examples
-///
-/// ```
-/// use crate::num::IntoSafeCast;
-///
-/// assert_eq!(0xf00u32.into_safe_cast(), 0xf00u32 as usize);
-/// ```
-pub(crate) trait IntoSafeCast<T> {
-    /// Convert `self` into a `T`. This operation is guaranteed to be lossless.
-    fn into_safe_cast(self) -> T;
-}
-
-/// Reverse operation for types implementing [`FromSafeCast`].
-impl<S, T> IntoSafeCast<T> for S
-where
-    T: FromSafeCast<S>,
-{
-    fn into_safe_cast(self) -> T {
-        T::from_safe_cast(self)
-    }
-}
-
-/// Implements lossless conversion of a constant from a larger type into a smaller one.
-macro_rules! impl_const_into {
-    ($from:ty => { $($into:ty),* }) => {
-        $(
-        paste! {
-            #[doc = ::core::concat!(
-                "Performs a build-time safe conversion of a [`",
-                ::core::stringify!($from),
-                "`] constant value into a [`",
-                ::core::stringify!($into),
-                "`].")]
-            ///
-            /// This checks at compile-time that the conversion is lossless, and triggers a build
-            /// error if it isn't.
-            ///
-            /// # Examples
-            ///
-            /// ```
-            /// use crate::num;
-            ///
-            /// // Succeeds because the value of the source fits into the destination's type.
-            #[doc = ::core::concat!(
-                "assert_eq!(num::",
-                ::core::stringify!($from),
-                "_into_",
-                ::core::stringify!($into),
-                "::<1",
-                ::core::stringify!($from),
-                ">(), 1",
-                ::core::stringify!($into),
-                ");")]
-            /// ```
-            #[allow(unused)]
-            pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
-                // Make sure that the target type is smaller than the source one.
-                static_assert!($from::BITS >= $into::BITS);
-                // CAST: we statically enforced above that `$from` is larger than `$into`, so the
-                // `as` conversion will be lossless.
-                build_assert!(N >= $into::MIN as $from && N <= $into::MAX as $from);
-
-                N as $into
-            }
-        }
-        )*
-    };
-}
-
-impl_const_into!(usize => { u8, u16, u32 });
-impl_const_into!(u64 => { u8, u16, u32 });
-impl_const_into!(u32 => { u8, u16 });
-impl_const_into!(u16 => { u8 });
-
 /// Creates an enum type associated to a [`Bounded`](kernel::num::Bounded), with a [`From`]
 /// conversion to the associated `Bounded` and either a [`TryFrom`] or `From` conversion from the
 /// associated `Bounded`.
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index c03650ee5226..7a2ee29cbb91 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -5,6 +5,7 @@
 use kernel::{
     device,
     io::Io,
+    num::casts::FromSafeCast,
     prelude::*,
     ptr::{
         Alignable,
@@ -23,7 +24,6 @@
         FalconUCodeDescV2,
         FalconUCodeDescV3, //
     },
-    num::FromSafeCast,
 };
 
 /// BIOS Image Type from PCI Data Structure code_type field.

-- 
2.55.0

