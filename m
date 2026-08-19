Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549623C1F4B
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111584; cv=fail; b=G+aUFRWXOhA3nqO271KoE03qf2guYGLSegueVLyaohd7nW+NI0sFa6X8KIIqB1Z90mHHwpmPxdEvobADN5qMhqlmiDTicKj2tXazOqAQM1Fjv98uzja86U6zWJbQlxDLXpZOInZO/8A/z0dOrAtpaRdVkwDThKKhfU2fXhmgTgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111584; c=relaxed/simple;
	bh=4q/JOoQZ1483vVtAYQkNYViPi24wk/9YKtW3YtVbVI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XaSb/ne88Ry3lDzn/V19W/tEwpH+V0A7lExq+QiHFjGFJQMB4jUTMX1oGjULay43jIVVPsP/+5NzLbvDqaBun8L0eZDJDKyge1lotuKt6csBX9dJdf2OgKLklF2FON/KB83Pm/qthugVFEBjVRhTPHE0EkjmqqnXwrKr6KxA6mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eMks3qV6; arc=fail smtp.client-ip=52.101.56.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eMks3qV6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLKWmQs+zzRtRjklPWn90DyLYZlas/pm4V9TEIRoDZw+9Zp/I+S+AIhWWxbx367g01jq//GJ2uNkJC6skT50aa0GAaLlh+NFEDopqkXidVnUNzMOltoHvnPrLu+0N/Y3X68hpzQBSQBtKe+31DpZQVf7MQDXohSeFTDpgW4yarwMjsI5m6rZ9GnC1D9rqf5s4anRPubu199bc8jePlxMjIaG9KUnTKRdIzWLolpk3D4x/S1twMNDLouhq0FQRW2j/DL0iHgi/hXb2zKk0Y5jjWSc2Ey06o51rhe8zvcLzuzKq/sPw1iBVWg6pJFMYhmoBVcxliounGSuh0aoE9uD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZAb5JCQB/zjxJw4cgch93gKz9cn8w7LHlbBE7GqHSY=;
 b=W/7ZqJgQh2c13jWpmZitDY1BvleBWC5iaChBHI0/XHoc52m8U/gbmI1tae/jN1JuI56wN33JuHcjX0eWpU5GvnsPHK3qb/9GmfLCMZFNKMgbotqwtvVTlUgoeiQMKUZ5I/7hPs83LF8eebsVf9waqn/P/v6p1VPGBI/4c8cmFm5njlN44NTwy1/LfzhI2lzdEeRUxlizzUtzdj+Mh9p7bsukA9Oa2+ZFhNorgK8Of3CQeBmiSQIT2vskvymdLBdqw6k1dLfV2iX+7bJNxV2x/KTlbXCCWg0Krw9XRHNs4o1jfiSC1K6DZA9JSU+ydM2IiV7uM37lPukkQ8y2o9K27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZAb5JCQB/zjxJw4cgch93gKz9cn8w7LHlbBE7GqHSY=;
 b=eMks3qV6jOhaua5LPxtko/u650a/Ym75V7eAn2BDrgdT4FTlwDXr/v93VPHJRviKuR4BvW5xXTFOaLAd7D9sSUdgcEmSzr05/vpeg0IJfRl1VlCJpQ31kADrYfI3Zj06jJST5P7Lmsj7iJK0DJV4Zb7Hz+Z/EglygCD2sRgo4SAgUgdMNJVTuG2b7xSoUWMbS+6CYHND11gx4PtiBqDjOKy3yDOje37GJ2O2tcMBDKR8khscQd/iuTuj3ZA8N28smV5tn/S8PAW4eM8C0Wv0+FpHFG7csJJdTFIKJvCAxoLdyfPFiraVk8oi+gNxUMkWObR/A+Gk4w1wRQHmvcoHtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 03:52:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:46 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 20/27] gpu: nova-core: handle the r000 load-and-execute bootloader event
Date: Tue, 18 Aug 2026 20:52:13 -0700
Message-ID: <20260819035221.336390-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:a03:505::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b371ab-54b8-4a81-dbfb-08defda55486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|3023799007|18002099003|22082099003|11063799006|56012099006|5023799004|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Wh8egR8il4AzvcC2St6fO9j1Mk9P7/eX7OFd2O6fGwVSOH4H/Q5V2MkNuN1wJXZfz1kzAfwZx1bLEXTiuqd9nBMp9vfpPFVaBABaGyI8F+e412d/wVEtKgRdoTpu1iq0LTcUzgrCFM3+l3SlnMgqa6lXAp+7kV2zD1BJcbBFwN2EKSUIR7vwHLmElewTEvJmxfiM9LviOGU01sk/lOtuMZfbqBqfK3ng3GhtFg/EyKkqHuvPcn56FWY2oikK6Gk98ctM5GFoLZWRsdr1hHGKp5ZXeQpoiAZ8JICGi/AVl1gVotWVB9SlbXeve7AbSaSdaqgfg4raGIbY4ii4ta6jweRQcXjhbMhGyJ/XXC0P5iEJOI2xh9Tt62kKHOoNRgCkJt7/EKfA95BjEoJWmWnMnEFw2CgCsVb62HR1qlOAHw5Wkhza9+wJwz5u55XxZv7KKB+L1M7m8yaZPChH7eaAdWLW5gA34HWpDaLLAcDsX5PhrySvgtFt/4Ss1e7LZbWa7JYrVXDA7gKnoKiEAGxIOyRvyPYEBUxy9kJn8dG5tHq/reD9gAc6NVSeo3iQE+yinHtfGwDV/e98JjfEHj5u/xwXL5YHyL2cRp0dvcxpO0IGMBBh69XCcZwEFBDXVdqNTI31ODoducfkA/68W6V+L3ju8Lgkm3+Lzfk0XXpsHTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(5023799004)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qfdb+X0oytZ//HbPBrceCLm7/egeJC5dZZgUQgvCIs0+a9pFt2RiYJCMiKOQ?=
 =?us-ascii?Q?kPMMlfk6E9LNbWqimAxCQ3bNDX56RpwjNnOnoFciMRAbmeOvxoIKho9e0mPf?=
 =?us-ascii?Q?1YCk+5wqr6lIK0oFxRkStOslCdEU6pV6st51/Jv2FoNKDuYkJV/J854SAq59?=
 =?us-ascii?Q?SM5eUjsmn8RxoSAbsIjydXHKC/d4dNjbNovEQxaBJFnu6FfngqjFUSQUlFkU?=
 =?us-ascii?Q?0gCE/dRiaDdkUiqD8i1nfkhK2AHw5ShhAyPLuuwCGnpIfZUMJmFML9s0f4/i?=
 =?us-ascii?Q?HY4kPn1GbRaqx45lzG42bDkYsqKb2AhJRe4BBm8iM8n/bHDf8udN2ACVliET?=
 =?us-ascii?Q?SQsX8VkytSQxBv0V2CfhU14MGkFRWX22ZrQ6qjLx8X9yzRou0C/vVTdiSdP1?=
 =?us-ascii?Q?GXZ63eUekE+fqwU3AgxXUyCen6wglZ5L1DwIGWUeysAp1HuB1npJv3mmR0Lz?=
 =?us-ascii?Q?NUEWJt36Q9wb8htII3u1S1/7Rhu5ucNz09o7oCQUHfNkFEF67x6zwoFKeigy?=
 =?us-ascii?Q?admFqRxssoKfcsWpO7wXL5T81bM4AvCjiVfalpXtTrdClLMOBXOrvNMylbd7?=
 =?us-ascii?Q?x3q3G+rCrjJMvjYtKfPBEC3jZstFJwuY0djn5Iwl/iazlOLl1SR6130Y5PhE?=
 =?us-ascii?Q?CeKf3xRWaugIULK0cgwZHgP4BOZPTeddse1nvbA/AhYUVeDi3G6b5Z+vIeFQ?=
 =?us-ascii?Q?VeaNCUxIvNJ3h1IWRPajjxyPt9S3H6jU/F2Fn4zd70qdxNYTyjamNsMHWyVx?=
 =?us-ascii?Q?znDWioqwGlsfYwqgnvXpcQ3vvkcabmSECJ09omq9+KSRn0ALzdX4t3Qsi+kt?=
 =?us-ascii?Q?eOKiWGW7nnaFuu1uOLYr9VvlKT536PhIZ7saVGfv4DY7RkqJDyS2CmnQYkY+?=
 =?us-ascii?Q?0xixxJvUp3K5oVDuREBJbtkiagfMTV8lbahgjr0fXZBHrN8ia4OR8f6v1j+d?=
 =?us-ascii?Q?enMyPjzRHOXHNVZYgHR7qwIEbdNU2bU1ufMH84e9eQ+cfZqEsXJHEl5x0M6e?=
 =?us-ascii?Q?2W0XtaDmkLNaGJRaUvLM4PpPGPEA2nSBD20K1A2lBUVchiQUK6N0AB6UKP9B?=
 =?us-ascii?Q?mA70xEwquJEYbp/lhKNluMo3AxHL9ovqxMi9PyCtrNjW1zPtpVT+pfynjPdj?=
 =?us-ascii?Q?GqRqLx4hUZPNxupPs2v+jNeIbERdYNt3qY4PF3ZK08D7bFF4QeZuXGrYcxwI?=
 =?us-ascii?Q?zWcUCug/b+idPB0qCnO1oqGDIqKWtwSb4jxJ5Z3sGSnmxEtpezAfqyucyIj0?=
 =?us-ascii?Q?WgZhJxVe6R/ViF6ut49N04FuLceGpaBmn0N3Hyi84AnGIonR6hYgVnrxzzPZ?=
 =?us-ascii?Q?YbO27c0qQA9k1tp4LceAEp27DXMk5mpBvvMr+u0P8X/zXt0nEpk6/gtQ3JFS?=
 =?us-ascii?Q?cdIF/oq/neK5+bPOSm8qHODuZXToJmWQLLzsG5y9+k33879eERCJ2Piv/VxU?=
 =?us-ascii?Q?rHs2Ix0kjx7MYZZqsnh2B2Qn4kUpXJ+KKDW8+Zvn/5DjKJAlpfYUmI4iah+f?=
 =?us-ascii?Q?ofhR4bk7uar3asxHpZZWs+dEtWX7Y3dRg2ZhrPnc2S/HZ3j9RI2hzSEUn+Yr?=
 =?us-ascii?Q?K7HiI3MOH5rXWzgnrzObCMbHkMzHbASVQvSiNDbMuH9dZNkD4/WtUwVqCG14?=
 =?us-ascii?Q?dhDsQAwqy5+nMAqX5MIupM1DfK7HyENb0AJI5Gzg6jfeDRBHIfIVyAAMT6zn?=
 =?us-ascii?Q?CsFkRWoDmM11MGGxlzO0Po2OPF3BT5/n96uy7xU2O096OuB3ZvcERtkdWDb8?=
 =?us-ascii?Q?I/iabTWriQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b371ab-54b8-4a81-dbfb-08defda55486
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:46.3854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HGhJkvxqCXcCZSaxJehjVVKwDFJYXZiwLK0npoGb/bTyDHeCNastJ53j3fjWYdG/GH8vCGkd+LVPGVvIUvfiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5990

The r000 GSP boot protocol asks the driver to run an image on the GSP
falcon, and passes a bootloader descriptor naming where the image lives.
Open RM does not copy the image itself. It runs the generic falcon
bootloader, which reads that descriptor from DMEM and does the copy.

Nova-core has no handler for that event, and keeps its copy of the
descriptor in the FWSEC module that first needed one.

Move the descriptor next to the bootloader that reads it, and add the
handler. It points the requested FBIF aperture at the image, loads the
descriptor and the bootloader, runs it, and restores the aperture.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 .../nova-core/firmware/fwsec/bootloader.rs    |  52 +-----
 .../gpu/nova-core/firmware/gen_bootloader.rs  | 115 ++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs             | 161 +++++++++++++++++-
 3 files changed, 278 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 6670d17b4eeb..43908eb11f7d 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -33,60 +33,16 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        gen_bootloader::GenericBootloader, //
+        gen_bootloader::{
+            BootloaderDmemDescV2,
+            GenericBootloader, //
+        },
     },
     gpu::Chipset,
     num::FromSafeCast, //
     regs,
 };
 
-/// Structure used by the boot-loader to load the rest of the code.
-///
-/// This has to be filled by the GPU driver and copied into DMEM at offset
-/// [`BootloaderDesc.dmem_load_off`].
-#[repr(C, packed)]
-#[derive(Debug, Clone)]
-struct BootloaderDmemDescV2 {
-    /// Reserved, should always be first element.
-    reserved: [u32; 4],
-    /// 16B signature for secure code, 0s if no secure code.
-    signature: [u32; 4],
-    /// DMA context used by the bootloader while loading code/data.
-    ctx_dma: u32,
-    /// 256B-aligned physical FB address where code is located.
-    code_dma_base: u64,
-    /// Offset from `code_dma_base` where the non-secure code is located.
-    ///
-    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
-    /// expected to be a mirror image of its loaded state.
-    ///
-    /// Must be multiple of 256.
-    non_sec_code_off: u32,
-    /// Size of the non-secure code part.
-    non_sec_code_size: u32,
-    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
-    ///
-    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
-    /// to be a mirror image of its loaded state.
-    ///
-    /// Must be multiple of 256.
-    sec_code_off: u32,
-    /// Size of the secure code part.
-    sec_code_size: u32,
-    /// Code entry point invoked by the bootloader after code is loaded.
-    code_entry_point: u32,
-    /// 256B-aligned physical FB address where data is located.
-    data_dma_base: u64,
-    /// Size of data block (should be multiple of 256B).
-    data_size: u32,
-    /// Number of arguments to be passed to the target firmware being loaded.
-    argc: u32,
-    /// Arguments to be passed to the target firmware being loaded.
-    argv: u32,
-}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
-
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
 pub(crate) struct FwsecFirmwareWithBl {
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index f949223af2d0..f0a6c841d2aa 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -13,14 +13,23 @@
         Alignable,
         Alignment, //
     },
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::{
     falcon::{
         self,
+        gsp::Gsp,
         Falcon,
+        FalconBromParams,
         FalconEngine,
-        FalconPioImemLoadTarget, //
+        FalconFirmware,
+        FalconPioDmemLoadTarget,
+        FalconPioImemLoadTarget,
+        FalconPioLoadable, //
     },
     firmware::tlv::{
         request_tlv, //
@@ -30,6 +39,57 @@
     num::FromSafeCast, //
 };
 
+/// Structure the generic bootloader reads from DMEM offset 0 to find the image it must load.
+///
+/// Mirrors Open RM's `RM_FLCN_BL_DMEM_DESC`. The driver fills one in when it loads a firmware
+/// through the bootloader, and GSP-RM sends one in a load-and-execute event.
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    pub(crate) reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    pub(crate) signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    pub(crate) ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    pub(crate) code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located.
+    ///
+    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
+    /// expected to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    pub(crate) non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    pub(crate) non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    ///
+    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
+    /// to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    pub(crate) sec_code_off: u32,
+    /// Size of the secure code part.
+    pub(crate) sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    pub(crate) code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    pub(crate) data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    pub(crate) data_size: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    pub(crate) argc: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    pub(crate) argv: u32,
+}
+
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for BootloaderDmemDescV2 {}
+
 /// The generic falcon bootloader image and the IMEM placement it was loaded for.
 pub(crate) struct GenericBootloader {
     /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
@@ -99,4 +159,57 @@ pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
             start_tag: self.start_tag,
         }
     }
+
+    /// Pairs this bootloader with the descriptor of the image it is to load, giving something
+    /// [`Falcon::pio_load`] accepts.
+    pub(crate) fn with_descriptor<'a>(
+        &'a self,
+        dmem_desc: &'a BootloaderDmemDescV2,
+    ) -> GenericBootloaderLoad<'a> {
+        GenericBootloaderLoad {
+            bootloader: self,
+            dmem_desc,
+        }
+    }
+}
+
+/// The generic bootloader together with the descriptor it reads from DMEM offset 0.
+pub(crate) struct GenericBootloaderLoad<'a> {
+    bootloader: &'a GenericBootloader,
+    dmem_desc: &'a BootloaderDmemDescV2,
+}
+
+impl FalconFirmware for GenericBootloaderLoad<'_> {
+    type Target = Gsp;
+
+    fn brom_params(&self) -> FalconBromParams {
+        // The bootloader is not signed. Every chipset that loads it this way uses a falcon HAL
+        // whose BROM programming is a no-op, so these values are never written to hardware.
+        FalconBromParams {
+            pkc_data_offset: 0,
+            engine_id_mask: 0,
+            ucode_id: 0,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.bootloader.boot_addr()
+    }
+}
+
+impl FalconPioLoadable for GenericBootloaderLoad<'_> {
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        None
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        Some(self.bootloader.imem_load_params())
+    }
+
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
+        FalconPioDmemLoadTarget {
+            data: self.dmem_desc.as_bytes(),
+            dst_start: 0,
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index ae2aca5d935a..d62a5c834ccf 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -27,7 +27,13 @@
         FalconMem,
         FalconModSelAlgo, //
     },
-    firmware::gsp::GspFirmware,
+    firmware::{
+        gen_bootloader::{
+            BootloaderDmemDescV2,
+            GenericBootloader, //
+        },
+        gsp::GspFirmware,
+    },
     gsp::{
         cmdq::Cmdq,
         commands, //
@@ -156,6 +162,101 @@ fn core_resume(
         Ok(())
     }
 
+    /// Handle a `GSP_LOAD_EXEC_GENERIC_BOOTLOADER` event.
+    ///
+    /// The driver does not copy the image the GSP asks for. It writes the descriptor the event
+    /// carries to DMEM offset 0, places the generic bootloader in IMEM, points the requested FBIF
+    /// aperture at wherever the image lives, and runs the bootloader, which does the copy from
+    /// the descriptor and jumps to the image. The aperture is restored afterwards.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if the payload is shorter than the parameter block, the descriptor is not the
+    ///   size this driver mirrors, or the event names a context DMA slot or an aperture that does
+    ///   not exist.
+    /// - `ETIMEDOUT` if the GSP does not suspend, or the image does not halt, in time.
+    #[expect(dead_code)]
+    #[allow(clippy::too_many_arguments)]
+    fn handle_load_exec_bootloader(
+        payload: &[u8],
+        bootloader: &GenericBootloader,
+        gsp_falcon: &Falcon<'_, Gsp>,
+        sec2_falcon: &Falcon<'_, Sec2>,
+        bar: Bar0<'_>,
+        dev: &device::Device,
+        bootloader_app_version: u32,
+        libos_dma_handle: u64,
+    ) -> Result {
+        let params = LoadExecGenericBootloaderParams::from_bytes_prefix(payload)
+            .ok_or(EINVAL)?
+            .0;
+
+        let desc_size =
+            u32::try_from(core::mem::size_of::<BootloaderDmemDescV2>()).map_err(|_| EOVERFLOW)?;
+        if params.dmem_desc_size != desc_size {
+            dev_err!(
+                dev,
+                "Load-exec descriptor is {} bytes, expected {}\n",
+                params.dmem_desc_size,
+                desc_size
+            );
+            return Err(EINVAL);
+        }
+
+        let ctx_dma = params.ctx_dma()?;
+        let fbif_target = params.fbif_target()?;
+        let transcfg = || {
+            regs::NV_PFALCON_FBIF_TRANSCFG::of::<Gsp>()
+                .try_at(usize::from(ctx_dma))
+                .ok_or(EINVAL)
+        };
+
+        gsp_falcon.wait_for_processor_suspend().inspect_err(|_| {
+            dev_err!(
+                dev,
+                "Timeout waiting for GSP suspend (mbox0={:#x})\n",
+                gsp_falcon.read_mailbox0()
+            );
+        })?;
+
+        gsp_falcon.reset()?;
+        gsp_falcon.dma_reset();
+
+        let saved_transcfg = bar.read(transcfg()?);
+        bar.update(transcfg()?, |v| {
+            v.with_target(fbif_target)
+                .with_mem_type(FalconFbifMemType::Physical)
+        });
+
+        let run = (|| -> Result {
+            gsp_falcon.pio_load(&bootloader.with_descriptor(&params.dmem_desc))?;
+
+            // Also clears the suspend bit that `wait_for_processor_suspend` polls, so the next
+            // load-and-execute event does not read this one's suspension.
+            gsp_falcon.write_mailboxes(Some(FLCN_ERR_BINARY_NOT_STARTED), None);
+
+            gsp_falcon.start()?;
+            gsp_falcon.wait_till_halted().inspect_err(|_| {
+                dev_err!(
+                    dev,
+                    "Timeout waiting for the loaded image to halt (mbox0={:#x})\n",
+                    gsp_falcon.read_mailbox0()
+                );
+            })
+        })();
+
+        bar.update(transcfg()?, |_| saved_transcfg);
+        run?;
+
+        Self::core_resume(
+            gsp_falcon,
+            sec2_falcon,
+            dev,
+            bootloader_app_version,
+            libos_dma_handle,
+        )
+    }
+
     /// Handle a `GSP_LOAD_EXEC_HS_BINARY` event.
     ///
     /// The GSP asks the driver to run a high-security binary that it has already placed in the
@@ -347,6 +448,64 @@ pub(crate) fn unload(
 /// points it at local framebuffer.
 const HS_BINARY_CTX_DMA: u8 = 0;
 
+/// Number of FBIF context DMA slots a falcon has.
+const NUM_CTX_DMA: usize = 8;
+
+/// Parameters for loading and executing the generic bootloader.
+///
+/// Sent by GSP-RM as the payload of `GSP_LOAD_EXEC_GENERIC_BOOTLOADER`. The descriptor carries
+/// the code and data addresses, while `addr_space` and `cpu_cache_attrib` say which FBIF aperture
+/// reaches them.
+#[repr(C)]
+struct LoadExecGenericBootloaderParams {
+    dmem_desc: BootloaderDmemDescV2,
+    dmem_desc_size: u32,
+    addr_space: u32,
+    cpu_cache_attrib: u32,
+    _reserved: [u32; 4],
+}
+
+impl LoadExecGenericBootloaderParams {
+    const ADDR_SYSMEM: u32 = 1;
+    const ADDR_FBMEM: u32 = 2;
+    const NV_MEMORY_CACHED: u32 = 0;
+    const NV_MEMORY_UNCACHED: u32 = 1;
+
+    /// Returns the context DMA slot the bootloader is to fetch the image through.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if the slot is outside the FBIF `TRANSCFG` array.
+    fn ctx_dma(&self) -> Result<u8> {
+        let ctx_dma = self.dmem_desc.ctx_dma;
+
+        u8::try_from(ctx_dma)
+            .ok()
+            .filter(|slot| usize::from(*slot) < NUM_CTX_DMA)
+            .ok_or(EINVAL)
+    }
+
+    /// Returns the FBIF aperture that reaches the image.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if the address space and cache attribute pair is not one this driver maps.
+    fn fbif_target(&self) -> Result<FalconFbifTarget> {
+        match (self.addr_space, self.cpu_cache_attrib) {
+            (Self::ADDR_FBMEM, _) => Ok(FalconFbifTarget::LocalFb),
+            (Self::ADDR_SYSMEM, Self::NV_MEMORY_CACHED) => Ok(FalconFbifTarget::CoherentSysmem),
+            (Self::ADDR_SYSMEM, Self::NV_MEMORY_UNCACHED) => {
+                Ok(FalconFbifTarget::NoncoherentSysmem)
+            }
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+// SAFETY: The nested descriptor is `FromBytes`, and every other field is an integer type for
+// which all bit patterns are valid.
+unsafe impl FromBytes for LoadExecGenericBootloaderParams {}
+
 /// Parameters for loading and executing an HS (High-Security) binary.
 ///
 /// Sent by GSP-RM as the payload of `GSP_LOAD_EXEC_HS_BINARY`. The firmware
-- 
2.55.0

