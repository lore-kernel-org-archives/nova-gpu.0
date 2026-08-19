Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB23A3C4B8D
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111591; cv=fail; b=TDJ11TzWTFA6asfDaMSksGFXJL5z0wjRFyO70tSZS7DzI7Kz72xRaNtyviukhCQy0NL14VUdICqHRxXZrq9vxFDOx1pn6xDYNoeIWns5F8a536t5/Y8m+/I+93ujRXDFGJXIAta0pYL6sG7AakNKoW2+ddcZQR+F+u5JXUT+8wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111591; c=relaxed/simple;
	bh=85rj4KEpMHxPGv04uQ13M4LygveBxh9LWCvX79Ua7aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BrNQCrGVOtvvKO03dlqHJw3h/D7YIvZZiDmvSJaZOqTwBOsl9C24PT/2gELDcQ4DmetiIXYa2xCCHkoAPT6X/P1382jk7SNl3dJHr2QcY8QJRMbUgZw0WD7ryomW4YLtFQTutULwjXDwyIqFTL/G6qJzMBSMSACVShMtZmnU7SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ys3C9Ot2; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ys3C9Ot2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNRPPapjmiC10SXQp80JQOKe18CJVI3csqGYwX+Tb7whHIctNgUGbWtHP1BYPdL7VXFwkaDsZH+iZZ/byqWk+3HwUuetqeJEzWUmKtCiW/USdJ3TBQnv2U8bwcC/C7kV/AAPidzOhK3f1eKijk0Ci6H8hpuCkBMc+qxvlo6iWcaEXH9al8MhRUpbd+HbEicRpAYODplaR1TjGCJol4ghDeeJYonTw2/DH8+Z/ZEuCnlNaB2GiYHrLHCDnWWncGPOf0C61LqafQz0rilOpUc9FX/O9u5kJ5PKYWW+SsNKjw7K0+lpTFkUbxxYLKKtl/NsFpORJbpJ4jOUodlCihVS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6Jb4tJHEQ95+oLPpnFTVLv4RdTW9GPHdpdOs+g8bUU=;
 b=RcylOAdmgc+DEC7xpB8i9CjAjXObLwaL/0+9ocRYLRAsRCZcB537CNcMDNwH3bnLlWVQbtrn1Xd5BP13ZupOlLLCOj6yfHifhdbOZCTK9wH1ELqRiRuX5PPMclrL4hDux4BSfVsxBqs/gA19on8+Op7M6kIPDhPO0r6D1+ks97Or42O3eHSsRq7eKz2mZP5juKkMDSqswezZjbg2fxMTnvsrD6p1i2njeCYnQ81DJP1xXHPB8FKZxlHmQ9MAP9osSxETuFhlzwT9Kobx2fx3YDFIO8Ks5w9/4HKystFvftSQBQmrkvcdiIFwmWUhc85d0l3d+/iP65ISgiIJkhSORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6Jb4tJHEQ95+oLPpnFTVLv4RdTW9GPHdpdOs+g8bUU=;
 b=Ys3C9Ot2M0KwQVJGSa5lGZ5U8JJdlt5zU7/EjB6N039xszPiUKvXDVzds2BF9vG/9Bbf+C+VtdiSJB4SpszMyOEGFQ/fayv5il5OPy4UYLArdBU+xmqysXzBhtwmyuWmkpHAARi2xgb6Yadb4FSFwNTJbaCLZaQ2c91vqR14wyi71rN4Ej6FAjZdK1Jzf+u/DvGqnVowwmLDJXFsFeGv3embKvT0uS6J27IK2XitykED9frANG9iUi4MxMkuexz3yuUGMKOR+vUfKta4EqlvgQgxEBd3wAo1eXvAsW0RNck49CfSrcB5wwi6jOLSFYm8cBsP9bz7o4yK5AZJXEqsOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:44 +0000
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
Subject: [PATCH 18/27] gpu: nova-core: separate the generic falcon bootloader from FWSEC
Date: Tue, 18 Aug 2026 20:52:11 -0700
Message-ID: <20260819035221.336390-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: d72a1ac2-b15c-43c3-ec94-08defda5532f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lFq79RGtlr3LuF08aD2SuIOivcLTmLR2M36yDvUdj6ffM93/DmB4Csi/uSG6nqDHH+sNnGEAevk4NJ5XGhmBW9goOnST8TisPRM46hXgd/WROKcVJlHouiDnD3C52gPFGGL6aRN2hQomGyCQ1l11T2jSgjNjGeyfTJDYswgNQE/NthmqzN7xt2UgiU2zRfaZijqHWtYPrRp/VLafYXuXDJDz7P36quADUdJFa0TwDopuVseZpiEyAJYhW+w+E0OxFfzPVGETni5n9qBCnLTk+OJmeec7Xe0ugPmARjB09DNEokCFax8gfKSLVje7711sBz+wS+dKO/VhJjzdfJ66q+TtROwin/XSIJ/dPgO5HKUARcJT1qfxbhpIbpn1ZSei4p2/CkJcAIRB3KInm0rVSHcIMScWnk7EeCjcXLvfKqWJwslVes3FceABDTSIVqLKxqViXsEiRnYaNl2S+U6lPuBeKhmgOpgZfuSZtGmLQgY/1e7bMusW/ZMtpybIqWpkYz9SXBaJ4kXTlpkiS59qsjD9TQ7YtX1m91VFNWjPjSwvku+cPr355ofvypDR0d6ZN0RrQvQ7AKLKll0WOVT3yqzgzIT2i4phWEjuNH5MOE5MIh/QQUee0nBus/ucdzemrXER0eDybf52PyAACE3PUM1/+LyoCALqIiXAPo8TAo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ZcJz+VEx5exQ+EeEjThOWvDCqJMepJOipFW/NMvtmqT9h3z+7noyGTpzJAT?=
 =?us-ascii?Q?zMqY7t45NRZX8LAa/pW4nZQ7VaS7spfsJBoBHD8oTnZFBqr746dpylJ/1hrm?=
 =?us-ascii?Q?KqIc4P/ommPCUAVUNILwOUuQxfpK6TVej1TLEQbnZ/+a1LJxXbnpj5DK7dQQ?=
 =?us-ascii?Q?0Gdd4D1uQ5FV4S3gjdMvvdc9eSiCbxCBcM7+ojFur0x3CL+NH8mPKs3vzn11?=
 =?us-ascii?Q?gPQYL6EruF1JzLOMKYRKa2f/u5RkQH4+YytKmdMd4MQh9/b+9ao1jZ+lQzbB?=
 =?us-ascii?Q?7KfW/PywBthJM2PnaIA0OYOMEzxc28AWsZ7ckRFLaR72Tn2YH9ZdOSABioT6?=
 =?us-ascii?Q?kXBBq5wC/tifhIRZGArfJn1UrTa8OGMKLKEZR3qzvU2Ll4In8kZlb99LI6dT?=
 =?us-ascii?Q?K9DZiXsZNPSGVhNetoLW7IVG/aYf0WnToXR0CcEsiKZU1O7lonOGXWDXmRnf?=
 =?us-ascii?Q?RlHQ5Et6bSXsNuDeBHuHytgg4kcoclr6hjeIk8a88zUS/7q8r/xEf/CkLgUY?=
 =?us-ascii?Q?ZJvWppmldApKXg4OileRxRBhh8HtheAAXiml8rohA+ARdG5wWPwhSKRIiFZ2?=
 =?us-ascii?Q?22J8FuMsJXnREiNw5JBZMXcMKSYlsYB4ATnxcdioJ0jyJNOhK+Fn9VtiNT5c?=
 =?us-ascii?Q?2W5dXQBtESJDr53zHCSV5v82acMMd1DrVKwXdYFES8QipWxOWtkW+KazA/hU?=
 =?us-ascii?Q?E3wPCCh+JaqfslV21rxLvYrFMguVEHg5tN2VBujjAyD4AoPNbAWd7oOzIhac?=
 =?us-ascii?Q?GoXw4VauE3aJNQzJakTlNKWP6WmOD1VF97s0EovjxacXt/o8LGVs8gOUU6Wc?=
 =?us-ascii?Q?hNNX63zNdbPb9EolyqShpaLmT/Gv7osFFPopVGRUxrZYOaQ/VQ8+uxcHkfAW?=
 =?us-ascii?Q?qk9FWiQJs5b8ag6i8heTIJSRKjqm+K3tHoE2uAHfxclNdFYv/CpusTVX+d/J?=
 =?us-ascii?Q?dd3lGoh568iLWZJtBg98rG94PkCmPVJAV7hwDRI4EmIiYOo8GQG3l62XcR30?=
 =?us-ascii?Q?c2j0REPMy+NNsL1xkrWY4/H80mEZ9t0uGrl6TkRmwgiMciGTrh3W4hhZtMMW?=
 =?us-ascii?Q?v0+OExmuhxNngNVbf1h7BcVnfpBEfWVN6EmwGrVQb1BxaFslEjDYyr1zUfj0?=
 =?us-ascii?Q?yc3j50CrNwkGqXfdgg/ZHiR2PTHHlkBxh2zBy2mKPjKgkodHScW+t9jLZCe1?=
 =?us-ascii?Q?5lCUIvjwq2G6mioJeDa6HAhmf6CfjJST5oNCc6wuU7Ojpps2ZgJKvSRgy2cq?=
 =?us-ascii?Q?imC1fJoUZewxdvQttEhkDYrYje446wQV7CkFj6O3Y6W+fKT2AqadqXIacUIC?=
 =?us-ascii?Q?vZeFcTr/t7FFOW16+LT6lDlu0NnD4uTPKxbiNQhB4cSs8ONaFvyFaTP7ak9U?=
 =?us-ascii?Q?YK7w6gGM/JXnGh5lumdOqcCWVZs+PoBFWxFGRQzdac/AuzUF+PrHnoI1UMpD?=
 =?us-ascii?Q?gXlNfLyesCant74o4OrEbw2z6xUmMFJ0dS8OjPeSuUJzSMQCWWyznp/Qkiqd?=
 =?us-ascii?Q?asLOqB1MqGGSJpX66BdGZw/p9EhiO6CZU/wewvcHB569xUwCzfG+TIPpTKhS?=
 =?us-ascii?Q?bnViswWR9pLm5Hv87hqDe4imCdxcQ2F1gQ1nnmRzpTet7OyHX1tshc4+M+V0?=
 =?us-ascii?Q?B9SwAPHAd3urKuLwUwvIQKpoE8YMAwhEwWw529/U0MMzeBj7vHJCEulwI0lw?=
 =?us-ascii?Q?SITTrz4/RtVk6iTY+hq66McKxp0OlsL1tnS9VIy4esBjtpJV2EQniA6STXYZ?=
 =?us-ascii?Q?i3ILWEoShQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72a1ac2-b15c-43c3-ec94-08defda5532f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:44.1577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfG73XAm+HGy62gUEPp/LYlpST3cNQaXOqI9LDUxGt0AmAK7gKJ2XjzkPyoFAV5mGroKCfbCy5yXX+Kh/a/7gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

The r000 GSP boot protocol sends a load-and-execute event for the
generic falcon bootloader.

Nova-core stored the image and its load parameters in the FWSEC firmware
wrapper, which kept the r000 boot path from loading it independently.

Separate the bootloader image and load parameters from the FWSEC
wrapper. Place the bootloader at the end of the target falcon's
HWCFG-reported IMEM rather than below a fixed 64 KiB ceiling, so its
placement remains within bounds on falcons with less IMEM.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs               |  15 +++
 drivers/gpu/nova-core/firmware.rs             |   1 +
 .../nova-core/firmware/fwsec/bootloader.rs    |  64 ++---------
 .../gpu/nova-core/firmware/gen_bootloader.rs  | 102 ++++++++++++++++++
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |   6 +-
 drivers/gpu/nova-core/regs.rs                 |   5 +
 6 files changed, 135 insertions(+), 58 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/gen_bootloader.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 20a288050c37..b8013d2eb582 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -387,6 +387,21 @@ pub(crate) fn new(
         })
     }
 
+    /// Returns the size of this falcon's IMEM, in bytes.
+    ///
+    /// `NV_PFALCON_FALCON_IMEMC` addresses IMEM with a 16-bit byte offset, so the result never
+    /// exceeds 64KiB.
+    pub(crate) fn imem_size(&self) -> usize {
+        let blocks = usize::from_safe_cast(
+            *self
+                .bar
+                .read(regs::NV_PFALCON_FALCON_HWCFG::of::<E>())
+                .imem_size(),
+        );
+
+        blocks * MEM_BLOCK_ALIGNMENT
+    }
+
     /// Resets DMA-related registers.
     pub(crate) fn dma_reset(&self) {
         self.bar.update(regs::NV_PFALCON_FBIF_CTL::of::<E>(), |v| {
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index e0befe84aa3e..9ff764930bcd 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -26,6 +26,7 @@
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
+pub(crate) mod gen_bootloader;
 pub(crate) mod gsp;
 pub(crate) mod radix3;
 pub(crate) mod riscv;
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index ec4d92317a93..6670d17b4eeb 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -14,18 +14,12 @@
     dma::Coherent,
     io::{register::WithBase, Io},
     prelude::*,
-    ptr::{
-        Alignable,
-        Alignment, //
-    },
-    sizes,
     transmute::AsBytes,
 };
 
 use crate::{
     driver::Bar0,
     falcon::{
-        self,
         gsp::Gsp,
         Falcon,
         FalconBromParams,
@@ -39,10 +33,7 @@
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
@@ -101,16 +92,12 @@ unsafe impl AsBytes for BootloaderDmemDescV2 {}
 pub(crate) struct FwsecFirmwareWithBl {
     /// DMA object the bootloader will copy the firmware from.
     _firmware_dma: Coherent<[u8]>,
-    /// Code of the bootloader to be loaded into non-secure IMEM.
-    ucode: KVec<u8>,
+    /// Bootloader that performs the load.
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
 
 impl FwsecFirmwareWithBl {
@@ -120,29 +107,9 @@ pub(crate) fn new(
         firmware: FwsecFirmware,
         dev: &Device<device::Bound>,
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
+        let bootloader = GenericBootloader::new(dev, chipset, falcon)?;
 
         // `BootloaderDmemDescV2` expects the source to be a mirror image of the destination and
         // uses the same offset parameter for both.
@@ -213,21 +180,11 @@ pub(crate) fn new(
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
 
@@ -282,7 +239,7 @@ fn brom_params(&self) -> FalconBromParams {
     fn boot_addr(&self) -> u32 {
         // On V2 platforms, the boot address is extracted from the generic bootloader, because the
         // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
-        u32::from(self.start_tag) << 8
+        self.bootloader.boot_addr()
     }
 }
 
@@ -292,12 +249,7 @@ fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
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
index 000000000000..f949223af2d0
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! The generic falcon bootloader.
+//!
+//! A small program loaded into falcon IMEM using PIO, which then DMAs a larger image into IMEM and
+//! DMEM from a descriptor the driver leaves in DMEM at offset 0. Open RM's
+//! `ksec2GetGenericBlUcode` supplies the same image for both SEC2 and GSP.
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
+        Falcon,
+        FalconEngine,
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
+/// The generic falcon bootloader image and the IMEM placement it was loaded for.
+pub(crate) struct GenericBootloader {
+    /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
+    ucode: KVec<u8>,
+    /// Byte offset in IMEM the code is loaded at.
+    imem_dst_start: u16,
+    /// Tag the first code block is loaded under.
+    start_tag: u16,
+}
+
+impl GenericBootloader {
+    /// Loads the generic bootloader image for `chipset`, placed in the last blocks of `falcon`'s
+    /// IMEM so the image it goes on to load has the rest to itself.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if a required TLV field is absent or the image does not fit in IMEM.
+    /// - `ENOMEM` if the padded copy of the code cannot be allocated.
+    pub(crate) fn new<E: FalconEngine + 'static>(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        falcon: &Falcon<'_, E>,
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
+        let imem_dst_start = falcon.imem_size().checked_sub(ucode.len()).ok_or(EINVAL)?;
+
+        Ok(Self {
+            ucode,
+            imem_dst_start: u16::try_from(imem_dst_start)?,
+            start_tag: u16::try_from(tlv.get_u32(b"STRT")?)?,
+        })
+    }
+
+    /// Returns the address the falcon must boot from to run this bootloader.
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
index a5c0ca355493..68a48c882c0f 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -166,7 +166,7 @@ fn run_fwsec_frts(
         )?;
 
         if self.needs_fwsec_bootloader {
-            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset)?;
+            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset, falcon)?;
             // Load and run the bootloader, which will load FWSEC-FRTS and run it.
             fwsec_frts_bl.run(dev, falcon, bar)?;
         } else {
@@ -224,7 +224,9 @@ fn build_unload_bundle(
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
index 5d265b5788e3..5501c36a56af 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -247,6 +247,11 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         31:0    value => u32;
     }
 
+    pub(crate) NV_PFALCON_FALCON_HWCFG(u32) @ PFalconBase + 0x00000108 {
+        /// Size of this falcon's IMEM, in blocks of [`crate::falcon::MEM_BLOCK_ALIGNMENT`] bytes.
+        8:0     imem_size;
+    }
+
     pub(crate) NV_PFALCON_FALCON_DMACTL(u32) @ PFalconBase + 0x0000010c {
         7:7     secure_stat => bool;
         6:3     dmaq_num;
-- 
2.55.0

