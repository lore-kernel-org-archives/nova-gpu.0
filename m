Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27BE2F3C07
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363737; cv=fail; b=tDmYC9Hng5qSj2Dqr0ZrOBoheZcw2E6gVClPbtvhekdnBlSN1yFty6Z90SGbvmCkrB5g5CQZmGk1hMuQUYCU2vxKZix2c4QaqucCuVI7uqZ+wbCEBe2h0fvKJmPcGktTNVM5Y2YIZrlEVba8cojY71PNyax8CL+uPPMgYjUyplg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363737; c=relaxed/simple;
	bh=HYV9RsHpQoRScH3BkwWDinCyDfN2RmgAPIL42hx0LNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mK139OYjvJPwXZZfnJ5uxucRGGwj52Z8jz9mZvkiSFBHtIygjSl4swR49gyTHDSya/r4n2mVCZY3CxpPRfcFm4E+pcin8teZHJebZf6kA2gXvlqJJg47uRij0PMUKuO6Yo90ToATMo0XXuxf4XpCU9g4bCljFx5rkNsnK4Inzqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sozUMc9l; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sozUMc9l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/ze1ckK4Or55OtrhHfS4gButcm4pKNc7JUcMC5tSblVK8Vluv0dnZxDKjmz0kc6pRyGlwahu/geOSua9txCdvsPslqhiLYasx4/KNNb8neDyPXO8mMWj8VDc0qkMeRHHUuo3vMFhIdC7GlkcOg4r2a9QvXqsK7YiRv3td7Mui7MDZx52pwMktNrc5Q8uZWcNm4X2hvDmgn/tQtNnzqIAT6SxI8+W6Z2V9yC4pgG4T1Fyy1MBjLGXyBwV35qm02ELO9uhAVfFOfzEvSgbVpJ+LZnO1D3c2A9C72YXeKfTp9ExYnr7YML+Is7sG2LEb9gumKbxpMFREplUhK2vJqezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AR4v1+5UvTe0FJkhHyfmJ8OnyN6INoxTU6BYHSZAxw=;
 b=lylq/1zXqiYGmDxDGKN8k6DaEcXqCaiYMsK0vDsMNsr/xXjLl+rhT6i9QWBvMV7x9vx24H/PUY6gkQ38SD85BF6q0hGI7A9IHbqf2Po6geROspB0byRkD2EB63b1RVcIBhy7xhR67zaDNLMZOLkIVOqd8pptvpGV+bb21vpVt8dGk/g0GpltLugh2Wf3u/tiyQXBoeTFtb9YpKi6Z+pbSReg/r9uOVAnNpKe8uxQbgBwhlbMAv9gkRjm4Vb08lRUmRg4Sv0e3ZT0C8CeFJ+oPzlE0hkV3sfCvSpWcFPDeltR2s6/TuoQ08pGQQqaNvX0Gh0VWA+shgj+LLEYOjpvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AR4v1+5UvTe0FJkhHyfmJ8OnyN6INoxTU6BYHSZAxw=;
 b=sozUMc9lfh6t5yFTgIwanhQZy4O6It3tHr78RKlMp/Z5OQnHYOAajYV2ECeOT0IEtCrVmu6QM091Ki2YXhgHBVo4/h3K5EVPSlFvCIEMFglLOmcdNWFT8QU3mAQmpz7ijVFks5aZrYLEN5hhyQJIyae6m1LyPDA9a0QOipKtZyusBzsyrbogGyeNzKuVhUfcG849p8MYdOT04Ljbg97ULiJXUnvPZNINhQ1r3FAHUp1NYjI49hb4sMWH7jfk3tZSn09rYNlf+35mebnEqfS+Oi5A673CS0dS4UXPebuY7164zsiL3prfG9a5YJA0Rgn0FaIVJl/WR446Hd3gQkuW8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:24 +0000
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
Subject: [PATCH v2 10/31] gpu: nova-core: add build ID headers to debugfs log buffer dumps
Date: Fri, 21 Aug 2026 18:54:27 -0700
Message-ID: <20260822015448.238214-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 321047c4-d69d-4312-1471-08defff06ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oX4rDY70WW/9UwYDYmOqqU8zz2qf+uKH6W1uYWLbY3D/BTnkHn8p6m3gQmJmjVGhJCfBidUSr2G8364G0P15i6ls8z6/sz98w+1OFW9eXe9tCEe/DqlRqe9pvaYmGZOmN0RQ2tLGOsNhGOwOsW9cBan3Ex/TYge5JsBEqTsGRnhLi1rInZyRZ8SYuKj3rd2ARgs9ZVc4gmAkZlEujBqWX2rksAVUVC3VNqGrt9eGgYgfTVNqeZRBoryGchqs6rD4Fr4ZIM0pWsKl2dB1goUl5YEwE08ud4EMjxsgBbsOVGNJrQjSgiWVa0h45ba42nVjCx6PJfVZllqioThkKuqkkC6ivBLzQqFRJLUfeVqElGQtQesSx2ezh7Xg4ihLG2I9z/K4pLFQbDrV0APVcI7/6FpNTlppZM13RxDvSU3e51e3ZdcS0vhgC7yLFX6vGcfi2JJD6WeaYsGDE8pUeBHqAvE0vaOke5Odctp6R2h6W4hKnwowO8MdYJjqzS/AkJSoZ9lVmMSo9lbcJ9OZYwDqlI+MiiJdf+2xK0bynDj9mZG/4vE+3KxewNe0ryIux058130ISyHxVECkCLNQNNa6T9qMkQr1grdi8YDCXzdGINX3XdYDVdrQcSozxt3OzTqeuOFt2bUV+a7DeqL8Nrphr6WVFVPMQTrHLDs1eIQvuuQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Do6iybt75YVY0BfoJtomyLIc/18z/a//00gotvg979nxJ/z4URyyVxI2xXb?=
 =?us-ascii?Q?BIXmSCUdMagX3dyOP1TnjKkmHu/SIlJM3/nyRTgPquZ1kSZEjzbtlMz6Mb8g?=
 =?us-ascii?Q?j0NdPHVxWPIKhEw8f22uBLljH5mzjGOnPnj41mGob/JQFEFLUSjFp2nMBQVp?=
 =?us-ascii?Q?LGr+zbtUr1YuuiESDEn+DLpOHpEnYq8QwfyYwAPh5u7jEslujJDxv9uwSOi+?=
 =?us-ascii?Q?0XEjAyXJzZIbem46/Eg//v47K8kDw/H46b6mVU3xsE1QmuCHHM2MfJAaRyZe?=
 =?us-ascii?Q?TIYlolo67OCZ4HOPHM8eJP7i3v/TSs3Tie1XwUNLjdm7WkO0GevGAoEQuhaF?=
 =?us-ascii?Q?W2VX4vJCUxVaf0uYboboJHMBXm6PngR+U1QISZB6I76iq5Kqq95ouqZEEUlS?=
 =?us-ascii?Q?PDoZKZXXn+MyZZbjTolVtptJB9y3i5FNRBlVzosBkElZHBTV1+vSJpeJ1Y+5?=
 =?us-ascii?Q?+ohuhgjQxSkn2hEehXUHqvl0XEaUamgK0esAuO7TiKR0oJcGIFs+7s9lYepR?=
 =?us-ascii?Q?IRBkc/il5Ust/3YeYgBeWrTFeXWt2mzsJY2chanBkOqx9lMEbgfQVU3rt7KU?=
 =?us-ascii?Q?8bwpi2qUfMi8Cu11rrsF4S7J4vePIjP/B+Tf05N384QWIOx17iOO+zOA+ysW?=
 =?us-ascii?Q?bUNvF1IkNI1iO13rWjY3fPOZaP7YR5MARJlyuUYS+ruT6gNTVks0by/TAeT/?=
 =?us-ascii?Q?i1uO1nHaUQaCxSfnnh/6bznDQsxo/web5Ar5LN1EFwxnQx04+/yv+HucFo8q?=
 =?us-ascii?Q?0VAQ+DoGzcYPOr5Q4h6GfyJgxfVs0C4h931qfNqEEgrcou2rgEzhE+lmp48z?=
 =?us-ascii?Q?kuDyq8MTDGaEkwKxpRF2hAPNbAxgoRzZehuo37DUafmRyjXb6HM23+W8GO+C?=
 =?us-ascii?Q?fCK/z0d7BnMH3jnKqdYtAI5+VKe2fxIqPlTyNKS84y0YoBpsFmv/MxPmGQ8V?=
 =?us-ascii?Q?HL3FCRQaCZtOz0qaL/tSeFSk6jCQQMPS2S9PxjenehEVLpysNY3aYnODcxW4?=
 =?us-ascii?Q?c8xI8n9bsBZpS5aZep0p4Xuq7QYiIeOAjTaBQiU1sWu9VFYOI4SsnmLJXAOX?=
 =?us-ascii?Q?o+HStV+F06ZIVHW3IzZXMroDAvrIsoXzI524J7uu9+ozVkWziXIG+FsECEoI?=
 =?us-ascii?Q?Ec5eRQgqjQNRcw5UnwiE6jkVWBzwg3qf69vsviNNZs/x0WMFfConipv6zVZw?=
 =?us-ascii?Q?RRVIYM/q+1pTgincNX220M6KhQkTMF6a2jN6yeFrdTcacvHLBHz6urC/Wxll?=
 =?us-ascii?Q?qLHIlIv8mu1gi6GI77BEAe5DdaC54U5gWjnJX6FHgedwikbktdoSluZT5O0L?=
 =?us-ascii?Q?PZkE026SOkb4JqinflWguhOp7LHFihXYm/lGhgcwYh+8vDECmOkz+bpKOpN5?=
 =?us-ascii?Q?Yn0BzNmgpf23JMe0R6ZffArASAaJZ619R+T4xgUoqRpKXMDETJEPrwh9Cm1K?=
 =?us-ascii?Q?D9YjluU850nXL0GBB7ni6PzQbqAlHvCJxQ5i5qtSaSuRHDLR7hCL/9nBthx9?=
 =?us-ascii?Q?uaMSVLkh/UOJVuLJ8TKFxwmn39ZngXHrNobgT0ifYHTXiqFjpabLN1b4Z063?=
 =?us-ascii?Q?wqeFW1Dcn/b9s2jxCRGkXW3p7xQxPvRVfwe2PuU979iFimOt9qm+eRfJsMro?=
 =?us-ascii?Q?smwjWnKJ3x1XB7OMgfusEvs8XPsK7DUCl7mOY1iE723qS+a3/5A+cScIv6+Q?=
 =?us-ascii?Q?RqZ2KBwO2Qq+D6h31QxpF1P6McwZzlEBOfwa6qAa7QI0BmPCKk7i2ETKenn0?=
 =?us-ascii?Q?vatwZq6RqA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321047c4-d69d-4312-1471-08defff06ea9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:24.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWi6aMVM+6thtrvKPiLitSbiWjXkD5gr2gLoBnoXjkjJ9Fq4fukHLQN5B1JkPu4EubWHZkVGjiVBGSMbgnL8fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

A raw log buffer dump cannot be decoded without knowing which firmware
build produced it, and which GPU and metadata format it belongs to.
GSP-RM's own decoder takes that from a header ahead of the data, in the
LIBOS_LOG_NVLOG_BUFFER_V2 layout.

Prepend that header to each debugfs dump. The build ID comes from the
BLID tag of gsp.tlv, so request the metadata once when the GSP manager
is created and hand it to the firmware loader rather than requesting it
again during boot. A buffer whose build ID is missing serves its
contents with no header.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  34 +++++
 drivers/gpu/nova-core/firmware/gsp.rs |   9 +-
 drivers/gpu/nova-core/gpu.rs          |   2 +-
 drivers/gpu/nova-core/gsp.rs          | 183 ++++++++++++++++++++++----
 drivers/gpu/nova-core/gsp/boot.rs     |   2 +-
 5 files changed, 199 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index dfd41364cc77..e0befe84aa3e 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -31,6 +31,40 @@
 pub(crate) mod riscv;
 pub(crate) mod tlv;
 
+/// Maximum length of a build ID, matching Open RM's `BUILD_ID_MAX_LENGTH`.
+const BUILD_ID_MAX_LENGTH: usize = 32;
+
+/// Build ID extracted from firmware, used to correlate debugfs log buffer dumps
+/// with the correct firmware symbols.
+pub(crate) struct BuildId {
+    bytes: [u8; BUILD_ID_MAX_LENGTH],
+    len: u8,
+}
+
+impl BuildId {
+    /// Constructs a [`BuildId`] from raw descriptor bytes.
+    ///
+    /// Returns `None` if `data` is empty or exceeds [`BUILD_ID_MAX_LENGTH`].
+    pub(crate) fn from_raw(data: &[u8]) -> Option<Self> {
+        if data.is_empty() || data.len() > BUILD_ID_MAX_LENGTH {
+            return None;
+        }
+
+        let mut bytes = [0u8; BUILD_ID_MAX_LENGTH];
+        bytes[..data.len()].copy_from_slice(data);
+
+        Some(Self {
+            bytes,
+            len: data.len() as u8,
+        })
+    }
+
+    /// Returns the build ID bytes.
+    pub(crate) fn as_bytes(&self) -> &[u8] {
+        &self.bytes[..usize::from(self.len)]
+    }
+}
+
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone, FromBytes)]
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 754df6849e43..298959e98c33 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -6,6 +6,7 @@
         Coherent,
         DmaAddress, //
     },
+    firmware,
     prelude::*,
     str::CString,
 };
@@ -15,8 +16,8 @@
         radix3::Radix3,
         riscv::RiscvFirmware, //
         tlv::{
-            request_tlv, //
-            Tlv,
+            request_tlv,
+            Tlv, //
         },
     },
     gpu::Chipset, //
@@ -46,10 +47,10 @@ impl GspFirmware {
     pub(crate) fn new<'a>(
         dev: &'a device::Device<device::Bound>,
         chipset: Chipset,
+        gsp_tlv: &'a firmware::Firmware,
     ) -> impl PinInit<Self, Error> + 'a {
         pin_init::pin_init_scope(move || {
-            let firmware = request_tlv(dev, chipset, "gsp")?;
-            let tlv = Tlv::new(firmware.data())?;
+            let tlv = Tlv::new(gsp_tlv.data())?;
             let fw_version = CString::try_from_fmt(fmt!("{}", tlv.get_string(b"VERS")?))?;
             dev_dbg!(
                 dev,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 11a66a597298..c0ba561a3bf1 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -396,7 +396,7 @@ pub(crate) fn new(
 
                 vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut()),
 
-                gsp <- Gsp::new(pdev),
+                gsp <- Gsp::new(pdev, spec.chipset),
 
                 // This member must be initialized last, so the `UnloadBundle` can never be dropped
                 // from outside of the constructed `GspResources`, ensuring that the unload sequence
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index de5cf3914949..79fec8664ea9 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -12,6 +12,7 @@
         CoherentView,
         DmaAddress, //
     },
+    fs::file,
     io::{
         io_project,
         io_write,
@@ -19,7 +20,8 @@
     },
     pci,
     prelude::*,
-    sync::Arc, //
+    sync::Arc,
+    uaccess::UserSliceWriter, //
 };
 
 pub(crate) mod cmdq;
@@ -45,6 +47,13 @@
         sec2::Sec2 as Sec2Falcon,
         Falcon, //
     },
+    firmware::{
+        tlv::{
+            request_tlv,
+            Tlv, //
+        },
+        BuildId, //
+    },
     fsp::Fsp,
     gpu::Chipset,
     gsp::{
@@ -103,6 +112,50 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
     }
 }
 
+/// Size of the header prepended to debugfs log buffer dumps.
+///
+/// This header makes each dump self-describing so that decoding tools can
+/// identify the firmware build, GPU architecture, and metadata format without
+/// out-of-band information.
+const LOG_BUFFER_HEADER_SIZE: usize = 0x48;
+
+/// Build a log buffer header from GPU and firmware metadata.
+///
+/// Layout (all little-endian):
+///   0x00  gpuArch (u32)
+///   0x04  gpuImpl (u32)
+///   0x08  version (u32) = 2
+///   0x0C  buildIdLength (u32)
+///   0x10  taskPrefix[8]
+///   0x18  localToGlobalTimerDelta (u64) = 0
+///   0x20  buildId[32]
+///   0x40  flags (u32) = 1 (packed metadata)
+///   0x44  reserved (u32) = 0
+fn build_log_buffer_header(
+    chipset: Chipset,
+    build_id: &BuildId,
+    task_prefix: &str,
+) -> [u8; LOG_BUFFER_HEADER_SIZE] {
+    let mut h = [0u8; LOG_BUFFER_HEADER_SIZE];
+    let chipset_val = chipset as u32;
+
+    h[0x00..0x04].copy_from_slice(&(chipset_val >> 4).to_le_bytes());
+    h[0x04..0x08].copy_from_slice(&(chipset_val & 0xF).to_le_bytes());
+    h[0x08..0x0C].copy_from_slice(&2u32.to_le_bytes());
+
+    let bid = build_id.as_bytes();
+    h[0x0C..0x10].copy_from_slice(&(bid.len() as u32).to_le_bytes());
+
+    let prefix = task_prefix.as_bytes();
+    let prefix_len = prefix.len().min(8);
+    h[0x10..0x10 + prefix_len].copy_from_slice(&prefix[..prefix_len]);
+
+    h[0x20..0x20 + bid.len()].copy_from_slice(bid);
+    h[0x40..0x44].copy_from_slice(&1u32.to_le_bytes());
+
+    h
+}
+
 /// The logging buffers are byte queues that contain encoded printf-like
 /// messages from GSP-RM.  They need to be decoded by a special application
 /// that can parse the buffers.
@@ -117,7 +170,13 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 /// then pp points to index into the buffer where the next logging entry will
 /// be written. Therefore, the logging data is valid if:
 ///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer<const NUM_PAGES: usize>(Coherent<[[u8; GSP_PAGE_SIZE]; NUM_PAGES]>);
+///
+/// When a build ID is available, the debugfs file for this buffer prepends
+/// a header so the dump is self-describing.
+struct LogBuffer<const NUM_PAGES: usize> {
+    header: Option<[u8; LOG_BUFFER_HEADER_SIZE]>,
+    buffer: Coherent<[[u8; GSP_PAGE_SIZE]; NUM_PAGES]>,
+}
 
 /// Log buffer for a task that GSP-RM logs to at its default size.
 ///
@@ -132,19 +191,68 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 
 impl<const NUM_PAGES: usize> LogBuffer<NUM_PAGES> {
     /// Creates a new `LogBuffer` mapped on `dev`.
-    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
-        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
-
-        let start_addr = obj.0.dma_address();
+    fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        build_id: Option<&BuildId>,
+        task_prefix: &str,
+    ) -> Result<Self> {
+        let buffer = Coherent::zeroed(dev, GFP_KERNEL)?;
 
+        let start_addr = buffer.dma_address();
         let pte_view = io_project!(
-            obj.0,
+            buffer,
             [build: 0][build: size_of::<u64>()..][build: ..NUM_PAGES * size_of::<u64>()]
         )
         .try_cast::<PteArray<NUM_PAGES>>()?;
         PteArray::init(pte_view, start_addr)?;
 
-        Ok(obj)
+        let header = build_id.map(|bid| build_log_buffer_header(chipset, bid, task_prefix));
+
+        Ok(Self { header, buffer })
+    }
+}
+
+impl<const NUM_PAGES: usize> debugfs::BinaryWriter for LogBuffer<NUM_PAGES> {
+    fn write_to_slice(
+        &self,
+        writer: &mut UserSliceWriter,
+        offset: &mut file::Offset,
+    ) -> Result<usize> {
+        if offset.is_negative() {
+            return Err(EINVAL);
+        }
+
+        let offset_val: usize = (*offset).try_into().map_err(|_| EINVAL)?;
+        let header = self.header.as_ref().map_or(&[][..], |h| h.as_slice());
+        let total_len = header.len() + self.buffer.size();
+
+        if offset_val >= total_len {
+            return Ok(0);
+        }
+
+        let count = (total_len - offset_val).min(writer.len());
+        if count == 0 {
+            return Ok(0);
+        }
+
+        let mut written = 0;
+
+        if offset_val < header.len() {
+            let hdr_count = (header.len() - offset_val).min(count);
+            writer.write_slice(&header[offset_val..offset_val + hdr_count])?;
+            written += hdr_count;
+        }
+
+        if written < count {
+            let buf_start = offset_val.saturating_sub(header.len());
+            let buf_count = count - written;
+            writer.write_dma(&self.buffer, buf_start, buf_count)?;
+            written += buf_count;
+        }
+
+        *offset += written as i64;
+        Ok(written)
     }
 }
 
@@ -173,9 +281,11 @@ struct LogBuffers {
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp {
+    /// Preloaded GSP firmware TLV metadata used during boot.
+    gsp_tlv: kernel::firmware::Firmware,
     /// Libos arguments.
     pub(crate) libos: Coherent<[LibosMemoryRegionInitArgument]>,
-    /// Log buffers, optionally exposed via debugfs.
+    /// Log buffers for all LIBOS3 tasks, exposed via debugfs.
     #[pin]
     logs: debugfs::Scope<LogBuffers>,
     /// Command queue, shared with the GSP event interrupt handler.
@@ -188,18 +298,32 @@ pub(crate) struct Gsp {
 
 impl Gsp {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
-    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+    pub(crate) fn new(
+        pdev: &pci::Device<device::Bound>,
+        chipset: Chipset,
+    ) -> impl PinInit<Self, Error> + '_ {
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
-            let loginit = TaskLogBuffer::new(dev)?;
-            let logintr = TaskLogBuffer::new(dev)?;
-            let logrm = TaskLogBuffer::new(dev)?;
-            let logmnoc = TaskLogBuffer::new(dev)?;
-            let logroot = SmallLogBuffer::new(dev)?;
-            let logrmon = SmallLogBuffer::new(dev)?;
+            let gsp_tlv = request_tlv(dev, chipset, "gsp")?;
+            let tlv = Tlv::new(gsp_tlv.data())?;
+            let build_id = tlv.get_bytes(b"BLID").ok().and_then(BuildId::from_raw);
+            if build_id.is_none() {
+                dev_warn!(
+                    pdev,
+                    "GSP firmware build ID not found, log buffer headers omitted\n"
+                );
+            }
+
+            let loginit = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "INIT")?;
+            let logintr = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "INTR")?;
+            let logrm = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "RM")?;
+            let logmnoc = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "MNOC")?;
+            let logroot = SmallLogBuffer::new(dev, chipset, build_id.as_ref(), "ROOT")?;
+            let logrmon = SmallLogBuffer::new(dev, chipset, build_id.as_ref(), "RMON")?;
 
             Ok(try_pin_init!(Self {
+                gsp_tlv,
                 cmdq: Arc::pin_init(Cmdq::new(dev), GFP_KERNEL)?,
                 rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadded::new(cmdq.as_ref()))?,
                 rm_state_monitor: Coherent::zeroed(dev, GFP_KERNEL)?,
@@ -210,9 +334,18 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         GFP_KERNEL,
                     )?;
 
-                    libos.init_at(0, LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-                    libos.init_at(1, LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-                    libos.init_at(2, LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+                    libos.init_at(
+                        0,
+                        LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.buffer),
+                    )?;
+                    libos.init_at(
+                        1,
+                        LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.buffer),
+                    )?;
+                    libos.init_at(
+                        2,
+                        LibosMemoryRegionInitArgument::new("LOGRM", &logrm.buffer),
+                    )?;
                     libos.init_at(3, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
 
                     libos.into()
@@ -238,12 +371,12 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         .expect("DEBUGFS_ROOT not initialized");
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
-                        dir.read_binary_file(c"loginit", &logs.loginit.0);
-                        dir.read_binary_file(c"logintr", &logs.logintr.0);
-                        dir.read_binary_file(c"logrm", &logs.logrm.0);
-                        dir.read_binary_file(c"logmnoc", &logs.logmnoc.0);
-                        dir.read_binary_file(c"logroot", &logs.logroot.0);
-                        dir.read_binary_file(c"logrmon", &logs.logrmon.0);
+                        dir.read_binary_file(c"loginit", &logs.loginit);
+                        dir.read_binary_file(c"logintr", &logs.logintr);
+                        dir.read_binary_file(c"logrm", &logs.logrm);
+                        dir.read_binary_file(c"logmnoc", &logs.logmnoc);
+                        dir.read_binary_file(c"logroot", &logs.logroot);
+                        dir.read_binary_file(c"logrmon", &logs.logrmon);
                     })
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 874f6e9499f0..dfc5be27384a 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -42,7 +42,7 @@ pub(crate) fn boot(
         let dev = pdev.as_ref();
         let hal = super::hal::gsp_hal(chipset);
 
-        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset), GFP_KERNEL)?;
+        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, &self.gsp_tlv), GFP_KERNEL)?;
 
         self.cmdq
             .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
-- 
2.55.0

