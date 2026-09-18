Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715FA38B7A5
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693692; cv=fail; b=gIM7+97k2HmPEqEBeIN7kTH5axdMRSSZe1en2la7nC/k+Ek1wK2J2XTyWkFLSrXqQzmCYGYskkUztNwvtPlPmXQZYReKTGCV+cEySETP+YlZ5ZTq6PYax+c9SmZv8AHa0FsdJ9aZBdAXHk6LV0kf/b1jAIHTD+5X98LmEI4YPjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693692; c=relaxed/simple;
	bh=mnfUbt2ueZpNNduoYT8H7wZFTQhLEaE0RD+frX/aCt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KKUjVGMFjZWRJewukslkyjXzeFT2WkYTNftK95V7cUonUxOtSr0wXIED+dLrOx1U2BA5EccHV3HiMRnIfZl44MIe8yEQS97GuS6DhRfnKk8KhIS0jxdjXAiO1QXKGyKdUsuAIYk/Nr/hNM7Dn2Ly93KS+LzA+niTelueO3a8ZYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=agBpuMvp; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="agBpuMvp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8YM9kWVEq5zb4xGBd7++KUvJ4S6g/NorZhFAK/B+vR6AiVSRbzFy5vDWTnGrfxeGGAQi2VqiJtVaiimUrXsHC9vhV2qwd/G42KMQBUHZA8h9YV90Q59B6oarlLU7lR3+/w/U9pXm05d90H+dTYMIgpwuy9RS8MD0XRzBF+USZjkrphWpvqBDlaPiYejc3gqb09Xn1YJAiI6GD3gyM5n8/VTZPnD+7ddZHyRoGvS6mTp+guuqkeHavYn3CyLmGx0v89av7h94FA2MNaeNPinfK+qL+UTLuZhd/X94C9kSFq0q9LFTDrvsTE7baUSjgEH+N8/wvuib9Z5bt9Uob3U/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wp2LAuTktINLpCLtp8peUmlz1yO2C/4Eepq4cPgpVWg=;
 b=eMaxArwSaAJXKjhA/jSux9P8rhe0r2V8bBH0m1vJZdCvK+k/KrhyP1P7rlhy12ofGipGZI+2lKVuZN4FApQ3FAewHUWMAJ0TlIUKy8rgQv9xgawmWkUNV9R5lADPYQlsYe1A1ZltWVamCCqMmGNomh6EJ9oycDN37DM2o0G0O8qJhxWbLPf2/ozbQjU/X7km/sr123+9MFbs+I4qvMV5wenE+Ki6tzToP4t3XSmMGGiRnD2VDZEswj4TPCazl6auVPyHh4UARpkRwFX9mClsAsxvjNqZe5s+XR/nIs7Ta1nIyNoqewqDUqLsnj9N2jk3OtOp2WzugUFdPNpx5nXyNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp2LAuTktINLpCLtp8peUmlz1yO2C/4Eepq4cPgpVWg=;
 b=agBpuMvpitWMg+EilItlKJrdUZYJTclWtN1dAY/48ktSGOC6lh9rFmBqRUtGvj3HA595MOevZJFCIEjEtWZl7iE9b1K6C9sxVYR3YXP061BKcbDUsHgIpgUCS76fxqKfU2L2SWFIOs+y794YF6BrBt1u9sbaliI9eh+PrCW9o0SeXmTIvX/wpWTkZqPfdyQh3dealmnIR4UZq5RXFh61gKwXCd8moPat03Fs1Ym8Hu06oX1C7+v5huc1yr/HVfbr9RUg4aexM7FLcGNYwWKGwdlcmPnAvGM3PUwYUI3iZRvziYgqNm/r1C6eWA+T/1sGDy1s75Ke0Gcpo98QXGRLYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:41 +0000
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
Subject: [PATCH v3 13/33] gpu: nova-core: separate the generic falcon bootloader from FWSEC
Date: Thu, 17 Sep 2026 18:06:59 -0700
Message-ID: <20260918010719.1176945-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: b87e3c97-c101-45f9-df83-08df15213ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qp6zQHaH+wr6lO2t3a+FED7P6x9AbrpQSVjBy7g1mPLpSIddax7iENmTTNC+Qqwyz5bNWgx8mt3Y1pr95IoIfRGBOY8qHI76v0QKw1hwgiXr30FK7S5u1/F91g/DLd8n9IqU3Af9aEzHtbyAVKHLBVIdKhwk4nJYdrkaYmxxmVgg82I/ukbVXB3RLsI3haYcCiIVZpBVqi7XiL64j1egQmq8Gk78PPdkCSpn8N74naXznC+Vt+WXXu7Kh92yyySmMP+qLgIGwGzRAoukxGYdXMlR+Z2bg/kp9EaV5iebcA23tmSHPCPHSGwPvIr0ktATGuTNYAvMDjCzjFLagaDIF78NMiYC9BwYs+zOYzDjhtlFj5DYbK+ItQ8S2nJ0O6bKzk+DgMKL9GU5vwnPzHNsXnnymIJkWaFstOJqkyUiWFKO80gMnE9xiukC8GPyysjiZSca4r8yiI/Ce/O/xjDGu3gyehEDMj+Whfrd8MF26b5OhRON3IaKojSErEdaSTD5GYJ+SFmHXBIlfxbEF1knWxig1QWYSs8yxRXtYwsDqiUoo5wYiPk655PZ9m32lu7HYF5WmsA0ngZWkqKxxnyc+3J0l0uxKajBAwrNrJA2te/1Od7w8ljvOd0ByJWsOub60YTiRLpGWFePVH49Ak0dBg8ZvnJWegQzsfs1D6F7XlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VPLKsE2BC1r5FU48IIXOsat/jn8sqhk1Cbr4aF6WOEvToOl+0tlkoAbNtpIj?=
 =?us-ascii?Q?jaHk5vfRaEIFC4G8Vfv/+uaPpQ0/ZGPBbj48kcZDQh1tHnvLQuAYU0YYgN9R?=
 =?us-ascii?Q?Mqvu9MMB1qWcM6BE33DuABXg3+RYsnAlbYa+yBxXBP4BNASyOiHAJ4UIpmhV?=
 =?us-ascii?Q?HGCZdXvSYCKbdMSr8HkeVAD7AZEcBNiAJ2kVLGbFMBXoCeQjMlhfcdfTe/Sh?=
 =?us-ascii?Q?iscGyiDg/Sk2hZbRBFs0NUKuEEgamwtEWTh62TS/YlzmL1V9Yqdt22StXn7h?=
 =?us-ascii?Q?v1HG4dz5IAYxtkrBN9fHZC7qXZyqGEkeWcyA8W1Bfs8DR5BI7ukiZ+ect5Lj?=
 =?us-ascii?Q?nnxlwZkVG7oUG5N4SFQFEoaP3EC+Zpeg2YzyyaWLuIti2bSrgltPAPK1bxrd?=
 =?us-ascii?Q?uowHGM9UZfRSm9xM3KLbxtfCK1HfKcj2eh0eEeFwzJtUZQooThmBqg2nWzsd?=
 =?us-ascii?Q?XkEwmT2t2AF3m6IK5rtdsIqsXI2XW2/vzXeAZBRZuGwHLTbTXadWNKh+rGEm?=
 =?us-ascii?Q?kIZ3M5da/63/1n4I7zyVxekrDWbbv8NLLg5bbBR6ZcTuvtgg5vAPOEVm1CVU?=
 =?us-ascii?Q?APhoxx8VgL8R96xqhQbvws9jI6KR/nvTwodRi4E7gg/WdlarNBe3rr83CJDO?=
 =?us-ascii?Q?+NriwzMZLYArr0njL5eZn7OOAgptUpoGqCh9PzScgOde9Grb96vD0ZqesQc7?=
 =?us-ascii?Q?CM2BeN2w3ncpl/u3XDHq2g4JnBgX1StPi0AXeit3MJcAAoOhPzjvEMa7U5sM?=
 =?us-ascii?Q?YDnxFNUNdR/UmStDtoR01oFdBll5SlUnXTQGepuZ2Gr0PiBdWq+ALNSkhQfU?=
 =?us-ascii?Q?E9twHxStawWRZqjzzsTkFcBacWUm/fCAWZIa3TlyaDd4AxvaY1Q6bxycXqmM?=
 =?us-ascii?Q?djE0yqtQrkviKLpYwhbY4kxyO4HznR3U99nO2hLJ/Oy+plYl5unj5uCN/Ias?=
 =?us-ascii?Q?rW7HmZDAHK8yiuEE/VpSbek3BRVnLVTZOqiWyma3n8sMXd4ee3T8qtw8vpr/?=
 =?us-ascii?Q?mtEF4kN8VBaIVXDus7w8WLvMu8+RObUXxpaD6Rvz4+dXEtk54Ht8ghZVG7R0?=
 =?us-ascii?Q?GfMRxlm07+RvF24igSjLvm222UNq/BzhREvUC9KswEaMlTdbYH61G3wzqh4x?=
 =?us-ascii?Q?se8jCjXCOIlCjt3+YIOMd1u2/ruH/a18NPZBCza9+DKQRJkHI/wuSzybqLdu?=
 =?us-ascii?Q?15meelzqySh1kbXbpCHiiTgp0+A7Ein7vK4OnfEagGppTuBW34ybLxfnPQQD?=
 =?us-ascii?Q?Ot7gTEkYgEqJ33QfCdxX/j0FQVVvIpBFSWf0fUr9YCDn3daibmjqB8qkDW/X?=
 =?us-ascii?Q?SzRjsrj2frE0V9ffTbRA52K+dnhlDoa8ZzGxoW/524ypDLnr6PnbuSg8VHqf?=
 =?us-ascii?Q?IiYNZX4GRnd5jmkB8aooMD8mHLQuhD6M1H0k4m+wPPNLAJerbHAjeQOi/FQ1?=
 =?us-ascii?Q?auHJWxIiFv9oDDoGIurL2psOX5HKuFgLdxrZQpuRkJ3FmHq1CNanE80VQODo?=
 =?us-ascii?Q?fuEZMHaS4p41vE4LNgicf5BTk1U9P6xWb1JNNvHjjaeSdeO7rv/fZ4L1HbvP?=
 =?us-ascii?Q?bDuid1kYm9JKIXvIPDDJyaEmRSwwWzIDW1M1NPrG4i2FOLRrOXiMB2v6iZeX?=
 =?us-ascii?Q?DnrpdCYWSk4B4GAdSL7vsQCvekiTMBEIw37AgYker/N8z0SzesMt5lV2Zz4q?=
 =?us-ascii?Q?oAADog4OmorShOSlTRC+yeQFnrg+yp3heuQJAY1FYYqVB3iF80ObidYgO3go?=
 =?us-ascii?Q?0FA3xLiRyw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87e3c97-c101-45f9-df83-08df15213ce0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:41.1519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMqABMmlI2Rq+K7iymIhJ1CPHcCPukON9Ank/XDUUaYoY/Ej5g9CVrJwH7qqJYjgfrzhMIUreV5w6GzXIT5nqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

The generic falcon bootloader is a small program that loads a larger
image into a falcon. The r000 boot protocol needs it to run an image
that GSP-RM names in a load-and-execute event during boot.

Nova-core used the bootloader only to load FWSEC, so the bootloader code
was part of the FWSEC code, and there was no way to run it on another
image.

Move the bootloader into its own type, which FWSEC then uses.

Place the bootloader at the top of the falcon's IMEM, using the IMEM
size that the HWCFG register reports, instead of assuming a 64 KiB IMEM.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs               |  8 ++
 drivers/gpu/nova-core/firmware.rs             |  1 +
 .../nova-core/firmware/fwsec/bootloader.rs    | 63 ++----------
 .../gpu/nova-core/firmware/gen_bootloader.rs  | 99 +++++++++++++++++++
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |  6 +-
 drivers/gpu/nova-core/regs.rs                 |  5 +
 6 files changed, 124 insertions(+), 58 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/gen_bootloader.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 9015de965a53..04e35cbcb6f0 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -385,6 +385,14 @@ pub(crate) fn new(
         })
     }
 
+    /// Returns the size of this falcon's IMEM in bytes.
+    pub(crate) fn imem_size(&self) -> usize {
+        let blocks =
+            usize::from_safe_cast(*self.pfalcon.read(regs::NV_PFALCON_FALCON_HWCFG).imem_size());
+
+        blocks * MEM_BLOCK_ALIGNMENT
+    }
+
     /// Resets DMA-related registers.
     pub(crate) fn dma_reset(&self) {
         self.pfalcon.update(regs::NV_PFALCON_FBIF_CTL, |v| {
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d8f6509a35d1..358c9b8db0b8 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -24,6 +24,7 @@
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod gen_bootloader;
 pub(crate) mod gsp;
 pub(crate) mod gsp_fmc;
 pub(crate) mod radix3;
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index a87878fe2aec..1584a4b814d2 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -17,17 +17,11 @@
         Io, //
     },
     prelude::*,
-    ptr::{
-        Alignable,
-        Alignment, //
-    },
-    sizes,
     transmute::AsBytes,
 };
 
 use crate::{
     falcon::{
-        self,
         gsp::Gsp,
         Falcon,
         FalconBromParams,
@@ -41,10 +35,7 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        tlv::{
-            request_tlv, //
-            Tlv,
-        },
+        gen_bootloader::GenericBootloader, //
     },
     gpu::Chipset,
     num::FromSafeCast, //
@@ -103,16 +94,11 @@ unsafe impl AsBytes for BootloaderDmemDescV2 {}
 pub(crate) struct FwsecFirmwareWithBl<'a> {
     /// DMA object the bootloader will copy the firmware from.
     _firmware_dma: Coherent<'a, [u8]>,
-    /// Code of the bootloader to be loaded into non-secure IMEM.
-    ucode: KVec<u8>,
+    bootloader: GenericBootloader,
     /// Descriptor to be loaded into DMEM for the bootloader to read.
     dmem_desc: BootloaderDmemDescV2,
-    /// Range-validated start offset of the firmware code in IMEM.
-    imem_dst_start: u16,
     /// BROM parameters of the loaded firmware.
     brom_params: FalconBromParams,
-    /// Range-validated `desc.start_tag`.
-    start_tag: u16,
 }
 
 impl<'a> FwsecFirmwareWithBl<'a> {
@@ -122,29 +108,9 @@ pub(crate) fn new(
         firmware: FwsecFirmware,
         dev: &'a Device<device::Bound>,
         chipset: Chipset,
+        falcon: &Falcon<'_, Gsp>,
     ) -> Result<Self> {
-        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
-        let tlv = Tlv::new(fw.data())?;
-        dev_dbg!(
-            dev,
-            "loaded generic bootloader firmware v{}\n",
-            tlv.get_string(b"VERS")?
-        );
-
-        let ucode = {
-            let blob = tlv.get_bytes(b"BLOB")?;
-            let code_size = usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
-            let code = blob.get(..code_size).ok_or(EINVAL)?;
-            let aligned_code_size = code_size
-                .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMENT }>())
-                .ok_or(EINVAL)?;
-
-            let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
-            ucode.extend_from_slice(code, GFP_KERNEL)?;
-            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
-
-            ucode
-        };
+        let bootloader = GenericBootloader::new(dev, chipset, falcon.imem_size())?;
 
         // `BootloaderDmemDescV2` expects the source to be a mirror image of the destination and
         // uses the same offset parameter for both.
@@ -215,21 +181,11 @@ pub(crate) fn new(
             }
         };
 
-        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
-        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
-        let imem_dst_start = BOOTLOADER_LOAD_CEILING
-            .checked_sub(ucode.len())
-            .ok_or(EOVERFLOW)?;
-
-        let start_tag = u16::try_from(tlv.get_u32(b"STRT")?)?;
-
         Ok(Self {
             _firmware_dma: firmware_dma,
-            ucode,
+            bootloader,
             dmem_desc,
             brom_params: firmware.brom_params(),
-            imem_dst_start: u16::try_from(imem_dst_start)?,
-            start_tag,
         })
     }
 
@@ -278,7 +234,7 @@ fn brom_params(&self) -> FalconBromParams {
     fn boot_addr(&self) -> u32 {
         // On V2 platforms, the boot address is extracted from the generic bootloader, because the
         // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
-        u32::from(self.start_tag) << 8
+        self.bootloader.boot_addr()
     }
 }
 
@@ -288,12 +244,7 @@ fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
     }
 
     fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        Some(FalconPioImemLoadTarget {
-            data: self.ucode.as_ref(),
-            dst_start: self.imem_dst_start,
-            secure: false,
-            start_tag: self.start_tag,
-        })
+        Some(self.bootloader.imem_load_params())
     }
 
     fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
new file mode 100644
index 000000000000..65af57a34940
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! The generic falcon bootloader: a small program that the driver loads into a falcon's IMEM by
+//! PIO. It reads a descriptor that the driver writes at DMEM offset 0, and loads the image that
+//! the descriptor names into IMEM and DMEM by DMA.
+
+use kernel::{
+    device,
+    prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+};
+
+use crate::{
+    falcon::{
+        self,
+        FalconPioImemLoadTarget, //
+    },
+    firmware::tlv::{
+        request_tlv, //
+        Tlv,
+    },
+    gpu::Chipset,
+    num::FromSafeCast, //
+};
+
+/// The generic falcon bootloader image and its IMEM load parameters.
+pub(crate) struct GenericBootloader {
+    /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
+    ucode: KVec<u8>,
+    /// Byte offset in IMEM at which the code is loaded.
+    imem_dst_start: u16,
+    /// Tag under which the first code block is loaded.
+    start_tag: u16,
+}
+
+impl GenericBootloader {
+    /// Loads the generic bootloader image for `chipset`, placed in the last blocks of an IMEM of
+    /// `imem_size` bytes.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if a required TLV field is absent or the image does not fit in IMEM.
+    /// - `ENOMEM` if the padded copy of the code cannot be allocated.
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        imem_size: usize,
+    ) -> Result<Self> {
+        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
+        let tlv = Tlv::new(fw.data())?;
+        dev_dbg!(
+            dev,
+            "loaded generic bootloader firmware v{}\n",
+            tlv.get_string(b"VERS")?
+        );
+
+        let ucode = {
+            let blob = tlv.get_bytes(b"BLOB")?;
+            let code_size = usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
+            let code = blob.get(..code_size).ok_or(EINVAL)?;
+            let aligned_code_size = code_size
+                .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMENT }>())
+                .ok_or(EINVAL)?;
+
+            let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
+            ucode.extend_from_slice(code, GFP_KERNEL)?;
+            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
+
+            ucode
+        };
+
+        // The top of IMEM, above the blocks that the bootloader loads the image into.
+        let imem_dst_start = imem_size.checked_sub(ucode.len()).ok_or(EINVAL)?;
+
+        Ok(Self {
+            ucode,
+            imem_dst_start: u16::try_from(imem_dst_start)?,
+            start_tag: u16::try_from(tlv.get_u32(b"STRT")?)?,
+        })
+    }
+
+    pub(crate) fn boot_addr(&self) -> u32 {
+        u32::from(self.start_tag) << 8
+    }
+
+    /// Returns the PIO parameters that place this bootloader in non-secure IMEM.
+    pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
+        FalconPioImemLoadTarget {
+            data: self.ucode.as_ref(),
+            dst_start: self.imem_dst_start,
+            secure: false,
+            start_tag: self.start_tag,
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index e90db1a23032..1b17ece53bd6 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -165,7 +165,7 @@ fn run_fwsec_frts(
         )?;
 
         if self.needs_fwsec_bootloader {
-            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset)?;
+            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset, falcon)?;
             // Load and run the bootloader, which will load FWSEC-FRTS and run it.
             fwsec_frts_bl.run(dev, falcon)?;
         } else {
@@ -223,7 +223,9 @@ fn build_unload_bundle<'gpu>(
         // Load the FWSEC SB firmware, as well as its bootloader if required.
         let fwsec_sb = FwsecFirmware::new(dev, gsp_falcon, bios, FwsecCommand::Sb)?;
         let fwsec_sb = if self.needs_fwsec_bootloader {
-            FwsecUnloadFirmware::WithBl(FwsecFirmwareWithBl::new(fwsec_sb, dev, chipset)?)
+            FwsecUnloadFirmware::WithBl(FwsecFirmwareWithBl::new(
+                fwsec_sb, dev, chipset, gsp_falcon,
+            )?)
         } else {
             FwsecUnloadFirmware::WithoutBl(fwsec_sb)
         };
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index c6ba226dcfe3..69dd6526e469 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -181,6 +181,11 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         31:0    value => u32;
     }
 
+    pub(crate) NV_PFALCON_FALCON_HWCFG(u32) @ 0x00000108 {
+        /// Number of 256-byte blocks in this falcon's IMEM.
+        8:0     imem_size;
+    }
+
     pub(crate) NV_PFALCON_FALCON_DMACTL(u32) @ 0x0000010c {
         7:7     secure_stat => bool;
         6:3     dmaq_num;
-- 
2.55.0

