Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7882238DC70
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693706; cv=fail; b=dl66AO0iPyvtrms5Rl5y7omMAQU+64NaT7AOZmwUvhNAehV66RIB+979WF1z7W1NXq3oQUjwGv6v8XZhMX4uQwqvF6mpPVyjNy/FvmZU9YphrpUMYQAdjSwbXJunI1IS+P8DDewoYDJ03Y4BlsbPAPGN8Hn52LTnmJaeHZRvUVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693706; c=relaxed/simple;
	bh=XUGvRTSqcdmqNoBU6hejCe+UsVF4rPxBCgEsz/sVBTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FYaitNfTgEvZKvmbNLP9MrtTfiQJQ4BWzyMpyg9SPmfDWyjRu5lAwCXXR9AVrPBBwtX5lfIsKgeeBL+4LtfSLoM3rWCG1SWsU2qp8kkt67y1pP8ws2pDf697YySmYF1E1dOk+0rQQrDhfFv1wlYmitJrf09JPUcy1f+O3KrXL30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hXdE+bGa; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hXdE+bGa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xn2k6NcBvcf//6f3ioSxBdKechDr942iFMEq56ey2XkbeWTZB8hSiXm4Lss+fu4kZ6ESdP51ua67cPS9z2L4tCEfkWtpiErMJx1hWcGdgvfAkPe20pB20yIZ0FhcC2Vr+yJfNTFhGaygmuB6OY0/rJwB3czCpj75UdBVcdNPp6Z5PTBJbd72S4Gwp223WElSIxHE8ANk7A0hce2OS5+Cp6KI3KFZQcozZXmroLfC4UcczpBMh3h1y/LVllYXZsEElzEWCi8rK2RSZqosyQgnIhBQt3eiO54RAL8KQUM2SY6VEv1o2/0wEmZbJENkP5JywHZaRitj4omj6rl0ZYtIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXQwIIJv8xGrZII6HxDtYp8s+hETaTufEFahi8FYFno=;
 b=IbB7NMzgasaWgXxoeomcjSoaqjn5Jq9g56baEqsH+M221i/eqONtx4J1BQwKeCF9wLuzaLf+EwAK/Qmxrf10r/9GEeGdE+nkDjBCyw6JmWgWpFdCtGc92zpc6R5qUYRCG2HXAJwsrHoQ8XdYsKZv2WItwQtt0TOzcQT4ZbgGM23LJgAfOuRyWpu/nHsDeVx+3OF3VKBracD3P7XbSY8zsppza6eXEBbTU07mi9Kq7gaW8MGCCdbip5qhLVWAXarNIjuHtIKIBSOPI9qgRVAXCXChT8BJxJgpSqmH9ovPGNKyt+gIT0145ueLvqTLDPZxyNLgsnxJHEtq6+i57hunVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXQwIIJv8xGrZII6HxDtYp8s+hETaTufEFahi8FYFno=;
 b=hXdE+bGaTG7ej43ToN7O++eCv1jBWhvm4DShEfbWibDgMa+r5AJFfPhXkn5I/OWi4QFIsBMMRrH/vwSftASUh/df64vG/crmy2sNBcCznkNauGhpwLnTalbwDQV2oQlPA4KDsR+e/aCG1o5jQMlzoE7eLzxGL182NeF55rQkRoTvG0Q+lpUW+8O+KOeye9fVvRAq14zLaXxpJIkjtEvI5UBvJPq6w/wHO3Z27Mqml7jG7xJJo4CxcncXZgsXDyydLTN+i47/lOvnCpuP+2g5z3+LoPmn8bIccHK83rsUWooxQ3ZDm772Mk28FbWvd+do0x+s5Noldey+DEeRSrOQ8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:47 +0000
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
Subject: [PATCH v3 17/33] gpu: nova-core: add the r000 load-and-execute bootloader handler
Date: Thu, 17 Sep 2026 18:07:03 -0700
Message-ID: <20260918010719.1176945-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd1e33a-da1e-40e1-e2ab-08df1521402e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rKota24qCZzBEO5he+sO8nlIy++p1mqq6/zgCNoYPWFmd3nL11QtAaBVwse2qNsVFSvIlRV2z7r9WGlhSUHizkM1YumGG4TLeEFaoYBJUG00JPCr5rtFyweq4CQVKri5dw7jnw0JwEgKh/4kB9NkF34lkvQXLiQWQXJnolGYpMjREUUvAS03YRnIyduUkA8hARMiuBVXdLw4mZvKWciSeaIaK1KzWWPDSxkv3HTJnE2rWmSUA1wmRJV3CsZ6RZrYp3kviCwucOsU6GkccPFu+ya/o33B2haG/S0APc1X44AgHEA6+mYBxMuSprf2VCbNOr9C8ev/b0uc4uWcFc8VjShEIIXhu8FV8fBGwl2OYYWceVuM0XLMSdVDeS5agEvMyxd3RJNeyDGRJdMQCl9NNfoM+Ensd+LxMi91Xajh7YwvVcAtqr/oJKreLjgaq2oaauQZzLj9kE0Y2JQZbrGQzgYeyWp+iRdsRgc9m358ZkdvMH3gSAYMQNV/AhYe31HAs0oodkL3wwxcOtCL30LTUFdAmPB36KSGAEu1IrtIBTc66EyC3nwBt9Se3Eg5rwT+UmCxRERgPsfE0JTlDfHk7tmx1rlfvIDSvvncAt+eEAdCIkb4PZqrRCKjUtl+0Bqh1RmyHjXCQaCIt+lh18/YjVBJwwWrDNVMEqUdai0mwIg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XRr8LVgeX+fHkA7qN65D/vgQkp5tqjEj7tywE0WZmPNty2SFy/Nhm6GQsRf+?=
 =?us-ascii?Q?5eYHKMzK33zQ9BC2Y89yBVBnR8vBHFNkrk8NvDqmOKgGtYPLdUlXw0n/OjEF?=
 =?us-ascii?Q?Cu9Ej//QbE0Y2ZNy00e9GZsYsXM1NNk3bi6QS6jxSP2YWMiNuXQUmDUCIyE8?=
 =?us-ascii?Q?e5rr+Hni0qjZhQZy+EWJik+CSTIdA+mPKjFxtwcK3yDIwl4CYnWsY45vUs5I?=
 =?us-ascii?Q?NSqraMxaZVbrAL6N5lLczT85dQRWNjHvhfbCk9q7CCLn43AiDFnhCnapq+oP?=
 =?us-ascii?Q?rvAOAwWRO8OzNmW0aZBpYVDfs9QDQQo4GuWJFe4eH4PuCE+BWUSrJXoZ4eTt?=
 =?us-ascii?Q?823+ebqf9Ce6uoRhEqvBK+v0y6x+Gtdrmn59kobJcord6nXEcuL3j09yoi/d?=
 =?us-ascii?Q?N8b1HfLt1dM9bYGN4ik+Kv+hrZZvj/3n8gzCnkTleiykf+scrbyH+XIn2BWp?=
 =?us-ascii?Q?ONk8TveRCHCXvQZVpAqieYAwS3KFbBQ+GrzxxjpcL9mZlLmNkIjRbWFtL5FN?=
 =?us-ascii?Q?w4IbZPCw5XXC+DgDTPb7pkTTZ8YVI5vVJSq189ZW8gby9+kuI50TmEkht1wh?=
 =?us-ascii?Q?Yj6fFY7iUtyJUx+2XNlbEnjv37Bgv/ixB91bItRxw/Pzhe1zCUdt3LPqChT7?=
 =?us-ascii?Q?YL7LMVsxT/n3KuGOKoK7Z7ifCv3M5NSVr2oFRUbCPus32HH6O5lx3WgprXoI?=
 =?us-ascii?Q?xzpzX7T684UB9Lnt8fio2nR8pAUC8X3SQMTeWss4KRPiqm8tFSporfvZg7cW?=
 =?us-ascii?Q?r9TVQYiuaHiN0xpsDU+NKl7epuQDykSDsTFBkKvpkUfuE+5SuN6PyJdN7SMn?=
 =?us-ascii?Q?2TWv8KY9nugb3mqQ+TkgTMjz6v8hacejShdP+s5YjXlhch8T09T/bAuuwF+X?=
 =?us-ascii?Q?E9KdTuo0APIBUuPpG1gxSDNiNRSMn/qORIQFih+c3zVvIuWZnVbM4EaJlDMJ?=
 =?us-ascii?Q?Ig+w3IAPt2MUNpJxuoDltMC1lYpzYqCLdVkBKJNPWcIMdYASU1NdievTgtGj?=
 =?us-ascii?Q?VbayuGNNH13LrBQwT9b3hOgsURaYW35Enc8gy9Y/hlHBhzcjCQa3NBjgAC4P?=
 =?us-ascii?Q?j78xV+2QL0XiSlBkzbOx3KfCYt3F49oeSQnaukABQvFzPnP4OupKf2evpPrH?=
 =?us-ascii?Q?KP43HA5xXssuG+RJyq2MQ+BrY7b0TAgfWLVijyewQMxAu0V9+4/gw4DG8vln?=
 =?us-ascii?Q?SlYQAdrBAu5sg9WsYMDNsCkkujnjkziLyVM+7c2+z10XXvJ97uqb+zWV/ryi?=
 =?us-ascii?Q?9c9Yvbji5h3c7iJjQEvixT/TusLQ1WLHqHP6AWSZ9PEU2ZYr72/djgb6ElzE?=
 =?us-ascii?Q?fdewpjNl2vZLVqGg/9O0oQ5AQVbiGUdbGa+pawiAtTlor48w/Fnl1KqhekaD?=
 =?us-ascii?Q?4W7dq2Dh0Cxn3H+2twJz6Md9OF2O83UkTByOA6+djX2uY1dNsaoUlNbwMaAI?=
 =?us-ascii?Q?39vvliY4LkIizSiWz5TiJz+yZmMk2GM+ThX3E4BisaeUOJXF6QeTewp4CQvW?=
 =?us-ascii?Q?I8U9NKqCZRzEpaZ4EBBPY1Cn7IGxSGqnnvCflGuWt04NPEKv24J5iWjsv9Yd?=
 =?us-ascii?Q?f6tDtGu4u3xp1aR1NHV5u/0fO2oyTamE+RbBWW+l3vISVdJpsLk8H30Ak5gt?=
 =?us-ascii?Q?xwEoMAmQzZqF3XofoerD3L+Pu32Iyrw3cL4Nrce6E+Eve8/moitHQsuT2KPG?=
 =?us-ascii?Q?4TdoaB51Nz8amCwKUiY5qAMgCQ2PUbDGmOFef3YUihF20vpZY4VFecVhu+XJ?=
 =?us-ascii?Q?y8fEs+/d3Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd1e33a-da1e-40e1-e2ab-08df1521402e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:46.6413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpC84SYbnZwzt/yZ6DaYmrje4q16JvfAI0crrApGxJOp8mhd371THzupSotJwL3CU3MDTuoL8EV5RojXzuvLQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

On Turing and GA100, whose GSP boots through the generic falcon
bootloader, GSP-RM sends a second kind of load-and-execute event. It
requests the driver to run an image on the GSP falcon, and it carries a
descriptor that holds the image's addresses. The driver does not copy
the image itself. It loads the generic bootloader and the descriptor
into the falcon, and the bootloader reads the descriptor from DMEM and
copies the image, as in Open RM.

Add the handler. It runs the bootloader through the FBIF aperture that
the descriptor's address space and cache attribute select, and it
rejects the event on a chipset that boots without the bootloader.

Pair the bootloader with a descriptor as the firmware that the falcon
loads by PIO, and load FWSEC through the same pairing in place of the
FWSEC wrapper's own load implementation.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 .../nova-core/firmware/fwsec/bootloader.rs    |  53 ++------
 .../gpu/nova-core/firmware/gen_bootloader.rs  |  85 ++++++++++--
 drivers/gpu/nova-core/gsp/boot.rs             | 125 +++++++++++++++++-
 3 files changed, 209 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 96ad223df16f..48e0c9672412 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -16,22 +16,16 @@
         register::Array,
         Io, //
     },
-    prelude::*,
-    transmute::AsBytes,
+    prelude::*, //
 };
 
 use crate::{
     falcon::{
         gsp::Gsp,
         Falcon,
-        FalconBromParams,
         FalconDmaLoadable,
         FalconFbifMemType,
-        FalconFbifTarget,
-        FalconFirmware,
-        FalconPioDmemLoadTarget,
-        FalconPioImemLoadTarget,
-        FalconPioLoadable, //
+        FalconFbifTarget, //
     },
     firmware::{
         fwsec::FwsecFirmware,
@@ -50,16 +44,17 @@
 pub(crate) struct FwsecFirmwareWithBl<'a> {
     /// DMA object the bootloader will copy the firmware from.
     _firmware_dma: Coherent<'a, [u8]>,
+    /// The bootloader that copies the firmware.
     bootloader: GenericBootloader,
     /// Descriptor to be loaded into DMEM for the bootloader to read.
     dmem_desc: BootloaderDmemDescV2,
-    /// BROM parameters of the loaded firmware.
-    brom_params: FalconBromParams,
 }
 
 impl<'a> FwsecFirmwareWithBl<'a> {
-    /// Loads the bootloader firmware for `dev` and `chipset`, and wrap `firmware` so it can be
-    /// loaded using it.
+    /// Wraps `firmware` so that the generic bootloader can load it.
+    ///
+    /// The bootloader image for `chipset` is loaded here, to run from the last blocks of the
+    /// IMEM of `falcon`. The firmware is mapped for `dev`.
     pub(crate) fn new(
         firmware: FwsecFirmware,
         dev: &'a Device<device::Bound>,
@@ -141,7 +136,6 @@ pub(crate) fn new(
             _firmware_dma: firmware_dma,
             bootloader,
             dmem_desc,
-            brom_params: firmware.brom_params(),
         })
     }
 
@@ -155,7 +149,7 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
             .reset()
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
         falcon
-            .pio_load(self)
+            .pio_load(&self.bootloader.with_descriptor(&self.dmem_desc))
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
 
         // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
@@ -179,34 +173,3 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
         }
     }
 }
-
-impl FalconFirmware for FwsecFirmwareWithBl<'_> {
-    type Target = Gsp;
-
-    fn brom_params(&self) -> FalconBromParams {
-        self.brom_params.clone()
-    }
-
-    fn boot_addr(&self) -> u32 {
-        // On V2 platforms, the boot address is extracted from the generic bootloader, because the
-        // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
-        self.bootloader.boot_addr()
-    }
-}
-
-impl FalconPioLoadable for FwsecFirmwareWithBl<'_> {
-    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        None
-    }
-
-    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        Some(self.bootloader.imem_load_params())
-    }
-
-    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
-        FalconPioDmemLoadTarget {
-            data: self.dmem_desc.as_bytes(),
-            dst_start: 0,
-        }
-    }
-}
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index 943a5bc16e93..7e826bd6497b 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -12,28 +12,36 @@
         Alignable,
         Alignment, //
     },
-    transmute::AsBytes, //
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::{
     falcon::{
         self,
-        FalconPioImemLoadTarget, //
+        gsp::Gsp,
+        FalconBromParams,
+        FalconFirmware,
+        FalconPioDmemLoadTarget,
+        FalconPioImemLoadTarget,
+        FalconPioLoadable, //
     },
     firmware::tlv::{
         request_tlv, //
         Tlv,
     },
     gpu::Chipset,
-    num::FromSafeCast, //
+    num::{
+        self,
+        FromSafeCast, //
+    },
 };
 
-/// Structure used by the boot-loader to load the rest of the code.
-///
-/// This has to be filled by the GPU driver and copied into DMEM at offset
-/// [`BootloaderDesc.dmem_load_off`].
+/// Descriptor that the generic bootloader reads from DMEM offset 0 to find the image to load.
 #[repr(C, packed)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, Zeroable)]
 pub(crate) struct BootloaderDmemDescV2 {
     /// Reserved, should always be first element.
     pub(crate) reserved: [u32; 4],
@@ -72,9 +80,18 @@ pub(crate) struct BootloaderDmemDescV2 {
     /// Arguments to be passed to the target firmware being loaded.
     pub(crate) argv: u32,
 }
+
+impl BootloaderDmemDescV2 {
+    /// Size of the descriptor in bytes, as the load-and-execute event states it.
+    pub(crate) const SIZE: u32 = num::usize_into_u32::<{ size_of::<BootloaderDmemDescV2>() }>();
+}
+
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for BootloaderDmemDescV2 {}
 
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for BootloaderDmemDescV2 {}
+
 /// The generic falcon bootloader image and its IMEM load parameters.
 pub(crate) struct GenericBootloader {
     /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
@@ -144,4 +161,56 @@ pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
             start_tag: self.start_tag,
         }
     }
+
+    /// Returns the bootloader and `descriptor` as one firmware that [`Falcon::pio_load`] accepts.
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
+/// The generic bootloader together with the descriptor that it reads from DMEM offset 0.
+pub(crate) struct GenericBootloaderLoad<'a> {
+    bootloader: &'a GenericBootloader,
+    dmem_desc: &'a BootloaderDmemDescV2,
+}
+
+impl FalconFirmware for GenericBootloaderLoad<'_> {
+    type Target = Gsp;
+
+    fn brom_params(&self) -> FalconBromParams {
+        // The bootloader is unsigned, and the falcon HALs of the chipsets that load it this way
+        // write no BROM registers, so these values never reach hardware.
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
index 3cfb21964250..ee366d782218 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -30,7 +30,13 @@
         FalconModSelAlgo,
         FLCN_ERR_BINARY_NOT_STARTED, //
     },
-    firmware::gsp::GspFirmware,
+    firmware::{
+        gen_bootloader::{
+            BootloaderDmemDescV2,
+            GenericBootloader, //
+        },
+        gsp::GspFirmware, //
+    },
     gsp::{
         cmdq::Cmdq,
         commands, //
@@ -41,6 +47,8 @@
 
 /// The falcons, device and boot parameters that the load-and-execute event handlers share.
 struct LoadExecContext<'a, 'gpu> {
+    /// The generic falcon bootloader, on chipsets that boot through it.
+    bootloader: Option<&'a GenericBootloader>,
     gsp_falcon: &'a Falcon<'gpu, Gsp>,
     sec2_falcon: &'a Falcon<'gpu, Sec2>,
     dev: &'a device::Device,
@@ -133,6 +141,75 @@ fn core_resume(&self) -> Result {
         Ok(())
     }
 
+    /// Runs the generic bootloader on the GSP falcon, as a `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER`
+    /// event requests, and then restarts GSP-RM.
+    ///
+    /// The descriptor that the event carries names the image that the bootloader loads.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if this chipset boots without the generic bootloader, if the payload is shorter
+    ///   than the parameter block, if the descriptor is not the size that this driver defines for
+    ///   it, or if the event names a context DMA slot or an aperture that does not exist.
+    /// - `ETIMEDOUT` if the RISC-V core does not suspend within two seconds, or the GSP falcon does
+    ///   not halt within two seconds of starting the image.
+    ///
+    /// Errors from [`Self::core_resume`] are propagated as-is.
+    #[expect(dead_code)]
+    fn handle_load_exec_bootloader(&self, payload_0: &[u8], payload_1: &[u8]) -> Result {
+        let Self {
+            gsp_falcon, dev, ..
+        } = *self;
+        let Some(bootloader) = self.bootloader else {
+            dev_err!(
+                dev,
+                "GSP asked for the generic bootloader, which this chipset does not use\n"
+            );
+            return Err(EINVAL);
+        };
+        let params = read_params::<LoadExecGenericBootloaderParams>(payload_0, payload_1)?;
+
+        if params.dmem_desc_size != BootloaderDmemDescV2::SIZE {
+            dev_err!(
+                dev,
+                "Load-exec descriptor is {} bytes, expected {}\n",
+                params.dmem_desc_size,
+                BootloaderDmemDescV2::SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        let fbif_target = params.fbif_target()?;
+
+        self.reset_gsp_falcon_after_suspend()?;
+
+        gsp_falcon.with_fbif_transcfg(
+            params.dmem_desc.ctx_dma,
+            |v| {
+                v.with_target(fbif_target)
+                    .with_mem_type(FalconFbifMemType::Physical)
+            },
+            || {
+                gsp_falcon.pio_load(&bootloader.with_descriptor(&params.dmem_desc))?;
+
+                let (mbox0, _) = gsp_falcon
+                    .boot(Some(FLCN_ERR_BINARY_NOT_STARTED), None)
+                    .inspect_err(|_| {
+                        dev_err!(
+                            dev,
+                            "Timeout waiting for the loaded image to halt (mbox0={:#x})\n",
+                            gsp_falcon.read_mailbox0()
+                        );
+                    })?;
+                dev_dbg!(dev, "Loaded image halted with mbox0={:#x}\n", mbox0);
+
+                Ok(())
+            },
+        )?;
+
+        self.core_resume()
+    }
+
     /// Runs a Heavy-Secured (HS) binary on the GSP falcon, as a `GMCAPI_CMD_EXEC_HS_BINARY` event
     /// requests, and then restarts GSP-RM.
     ///
@@ -361,6 +438,52 @@ fn read_params<T: FromBytes + AsBytes + Zeroable>(payload_0: &[u8], payload_1: &
     Ok(params)
 }
 
+/// Payload of a `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER` event.
+///
+/// The descriptor carries the code and data addresses, and `addr_space` and `cpu_cache_attrib`
+/// say which FBIF (framebuffer interface) aperture reaches them.
+#[repr(C)]
+#[derive(Zeroable)]
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
+    /// Returns the FBIF aperture that reaches the image.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if the pair of address space and cache attribute is not one that this driver
+    ///   maps.
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
+// SAFETY: The nested descriptor is `AsBytes`, every other field is an integer type, and the
+// layout has no padding.
+unsafe impl AsBytes for LoadExecGenericBootloaderParams {}
+
 /// Payload of a `GMCAPI_CMD_EXEC_HS_BINARY` event.
 ///
 /// GSP-RM has written the code to `imem_phys_addr` and the data to `dmem_phys_addr` in the
-- 
2.55.0

