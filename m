Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81183C1F2B
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111558; cv=fail; b=SKzSuV0ScSMFNaNQNVAz/P2cG5AAsbLBxZXaYuYMjo7KkUngTYPEmSFr5yHxEtVydRjoVvkIhxIgjIuY5mAiNgOJDWO+wpIvjKoiP1y0yP1IU3bD9qiYBJYFLkwe9M9DZp3W0A/3tpYIn3dGMZJ0h5cZ6DOjhKVcN7p7JaczDwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111558; c=relaxed/simple;
	bh=Jvg4np0acxOA6E3Wuf3HYDr+W3dEjqd3Ge3sfQ8JjXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eXFcv82VzfNAcd9ZPYxG9CzScNy+8isVLeRgHO9FtKywKtnXgB7zxYpCjNE0KbzL2T684OPzSo8OhOM9IG83dJWnS6QWUbbMS3PTC3KBthoTQYMs3kRVWFvys272Ob4vrEXIVUd081RMwHg1w2WGk9JgQnD5p71z2P5TToLXwNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EOYxiwME; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EOYxiwME"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXKc6k6tMhcAh1SRd2tHHsQuPGqVTvzjw6wQd1P0AAtPmsqdBZfT9sXkOHNOtqQGIAvaZs/LDEnrZkaawvq/ur8ikwBB1f2mq+UQq1hHCVtNgH3h1C7z3dSQZmkxzMQ6RZMDndZXC37eMWxBedo7vVgCzEg9d0h0SP1kSHPUHKmfrClIBg0NHqpWUvEoz1XpRTy/yO1LooajjcZrbZNlIVo9GYLClLWfMEfxCBRb5N1FFlSv2bk9sBUu9VEv7WDQP+huWUb+UIy+BGWV/52R7ASnTfW7/9DQCCNRwtUHXoaLrAc9lSsHLyu/FfYXIWkOWKQa2tJMuAk7jABXbBHNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dlxui/Yw//1tpLi4QJUjPYyO5DJnInE26AZIX8hfbM=;
 b=ISM4epIj8NmWQju+f2InJCToDI68bdTINBmsYeCO6lNE2+BPrHms7EEk3iA54rX9NBA2b5nOqATcRETOs8BQ4OxjkUqa8h2H3aokgtqY0rGbjR6eXN4msutO6feMxuNoGif/kcuYOzjBhy1rynNe6uhV6/Y1DLOy60VU4c4R3l2vQ2+AarIKJvJ+2ciHQAxI2HtmX+e104hwEiNi89KQAIJz6m6ksty5bZ67p5joHfSGXR32jobv36qdVW6ttEqpSiOLuZ+Fw1f9e5eXx7f7me4CUgmhHzRfLraIwFkjgj3HB7twikkSljKmeqUzPNrFHs13l0vL3Gc5STwvKuqA2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dlxui/Yw//1tpLi4QJUjPYyO5DJnInE26AZIX8hfbM=;
 b=EOYxiwME2wk7qwMvXRz6jfLL2P8VLEKSmCC4RKloqxdqhlNQvth4rXRMOzrwMbuykMnptkgBgd9uBgC4wzwLQcTgeX6X78XvUC0IL/dmd/Wn/clf50ky0jArTmSXiVfcaxnJM5H/TYvVdIyOANydvuscLULS0hQs5EuPaS3dhPOuph4fzvJr7whhDcPqnGcfU+46fJiVRW/k9QW37ZLF1oGCQlm3jjqU1HOfKC0/VieKWHiCHK54r3imarL87bLTCVXFXZnSyjNsUanGbwq5/QXo6YCuXstUFmn+f8N7FCM45cHboCXNi5r7Y2XfMk4kHyRnfj1JglGzTCQdWZO1FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:25 +0000
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
Subject: [PATCH 02/27] gpu: nova-core: extract radix3 page table into its own module
Date: Tue, 18 Aug 2026 20:51:55 -0700
Message-ID: <20260819035221.336390-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5fe085-27cf-471f-dd0f-08defda5482d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MvGczM7LePmbq0ngR1mvRam2eYoULWRFexQj+VE54/MkKHTxQpxGjygDdm2wWN3rPTYMSEVNx88ajxdx6lPeUOcE0NcHw0Q9UAzsRcUZ0CxogdvoX4XPdynAWY+0Hn3hDupCo3i33x5VIazDg5EA2B8sFQzOUNDggpxLJ4xQHxuNI23VFlBfLDzrMuOg1qqwqlBNgxT1IC3EK/yZeZDe7oH9bvgL0p5QqdUXLC5xuEUeBLGuBYpGaAqZFlCd/en2rt0RS2zTT6TFkvFa/9KPBCHnAY7dJwZ1ffR12M+uMzOKuOKAAqRwwMjiVA7KswYNJ91nkVHD+chNNGABoyWK8bvZj376xE4pBP3ap1ol6KeOKjTiushZSjK5BBYyrqxY+mgMpswq7PPfwo03ioolJzPA9qUzvhjlAVjMtraxgdZOUypgMBIHGykMCPwgHt/L7CPSgk++QyR0cEIcQzugrM8+aQCTfRMCii/b1RCwxjOrIQcsdollPLI7CQGyvK/DKtEfM7iJhl59pJDOWsQvgZgsYxTQ+nI5vPXaRWXKxXLTfaBlwVnG+NeckyN65IeaNOfbJORXAriu2PUQaCzfuHhXeoPevreRPNUUS1k+IPCPaqNNtvfkeFX882DS9yzBh508okVn5POHXwTExv1wa2+upHiZ8bKAJcfTCHFjXEg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8adEWeAH+KQ+dG2WGbxxD1Mnk67ApKYIvoNl/oW6WQqjxu/JmoNXZhubRN73?=
 =?us-ascii?Q?2i9rpiBwCNdfM4gUEeT85Sk1UmgAD47lRqtDzc1lvjO3GdeYFytjikPfLIEX?=
 =?us-ascii?Q?q/gOtgxV4Egkc2nVgIxW7FnESgdhE3UlRzymxqZjTFZ21sKBXAFzmS55Nhnj?=
 =?us-ascii?Q?Qw617+jBztgF+RSz7zvAE4P9VSmoIIvWNP7f8INqkQV+Av1IoMZj45+ShQhZ?=
 =?us-ascii?Q?sdhr0AZQVvQPCgyv8cEGTIu7u31DASaZGDfSNmF5lKxeXOLpS4+qNWKHYTce?=
 =?us-ascii?Q?MIKZRe2AEqSrQwXWRX2sSjJo+GQNitb3lCu1HI9Kgo4x5+z69idetH1hDEIW?=
 =?us-ascii?Q?+OytR1TkNU3kPDhrJoLKUhPd9jmJKFKVBqd5Mbo2yKtF7UbdPcYOgyVlLUqZ?=
 =?us-ascii?Q?fmbDnSUGET/vbEQBsqMmTmq0lRLLSxpTW/MLazZyV8eiV/ri+BVLwg3pll/a?=
 =?us-ascii?Q?PB8mCasMoPSjkhb8Ofdfo8VyJzgk12A9oR1DBItJ1+D5JIkshbdlQE/oBfGH?=
 =?us-ascii?Q?epNUCv9m0wW1oQW6e//fZphea1IeF/CN9Znu9TIYcPrLoEHBnebrO0b2QWE7?=
 =?us-ascii?Q?ZpJMVZHP9rkhjodOhJwK+yqlo3efVbZCU1wiUfhJodLWw0/t6MqDBN0l3xPm?=
 =?us-ascii?Q?gfP5RnHX9eKI9z3r/d4mZyoK2P8JcuuNH/kcVhOeZhEYIB7bobBKpENoPk8P?=
 =?us-ascii?Q?ZIpmiE8hsvi7/o2TVYeBwNWbf4h1Eyrai1D8gA51UVVzWcu3txTXDQoWq7Lx?=
 =?us-ascii?Q?gmU/60gyGNfDEBE8TzR0M/YX/NaKkZWcK6v9ckUr2UeXyyDJ1TmrcKIRoug0?=
 =?us-ascii?Q?N7PpZk8i0TEIInlmW2yPOcC4Ag7Z8ZRCIrMFpbyu2vqZ4RPIqNcr1mOK/com?=
 =?us-ascii?Q?avmA2/GsxTNBM7kOMyhu9VUPTE55n3fVN1Fx8WrKt2oMoncFMtRoT49ofVXl?=
 =?us-ascii?Q?KX7AL0grQ9PKnKPYjgjeLq/iVBd3NUa1lx1IH09TxnH9v2FLrDrQ3zGgZ3K1?=
 =?us-ascii?Q?JpsOCWurAGS1bZLQceI7F6CPZCL0PpsFduEg2IOWINL4E1ny2FdEPyP55yrY?=
 =?us-ascii?Q?Bqhvoy7VBeolgiL+CupkPX542GRKavN/g/4aCNdaAeX/VDZsx7Cm8gQkHOl6?=
 =?us-ascii?Q?UAJd9d3TL264gLlYPhjdO1E6Vx9dnV+JHgaB1ryTUJ9+PMyE6swuCFmxnjO/?=
 =?us-ascii?Q?iIQcmpV/afmmEAa483Du6FJ7fbnCFnM9snoruPplxi0lCYISUoa6knXtwL7R?=
 =?us-ascii?Q?8Shkx0l0lFGzAHczHZv0EtpG62ZHt8fjrxTvZDpC+G97EQY7NtWiqg8DtPPb?=
 =?us-ascii?Q?DpZU57/zeO19jvjE7aSW8MImCB392TsrM5iRe8wAorz1li0mr8LNY6RpuS9E?=
 =?us-ascii?Q?g42KTjxc5bEySXFxqgML8N/hX+gUgonfUJ+QtIEs0arEkNJXWaSyAsQjQzJc?=
 =?us-ascii?Q?7MSlhjQHG9hIqaLgk3NYmJ+ClOz+Bz9NdBoDQLxzYGgGavI1EEtJJ7eewafN?=
 =?us-ascii?Q?1uuis3zyD90TjgFsmT0fhtwgBVFB1FBP7ffb54dRBj3pV9Zq7+TEJd586xIl?=
 =?us-ascii?Q?4t+zCt4Kl4Z0LC5eoAtT5q9Q7Eyo9M93Ugovc5OkxMipcZkAcgBramGWPPyP?=
 =?us-ascii?Q?dElSGmTy0B2FH+pgQgLZG4zg+VKoyc6fhbCS7p0UqNZEdBrDxPJi/qRjVzh3?=
 =?us-ascii?Q?LKikYmKq2GCOXHVut/CdPqnU0L/zpsnrleittQXSmtwU+2mtRRfuaCOTkXqZ?=
 =?us-ascii?Q?h53lUUMznw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5fe085-27cf-471f-dd0f-08defda5482d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:25.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1O8IxYaZynaKG/jLMnf3CFlrleGwr4RvLEOvA2Lt9IgendfPgaDWYz3kBGcZWGNfJYHWYrOK0Vaqo1z6USprA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

Move the 3-level radix page table construction out of GspFirmware
into a standalone Radix3 type in firmware/radix3.rs. The ucodes
(bindata) firmware that GSP-RM loads at runtime also needs a radix3
page table, so the logic needs to be reusable.

Refactor GspFirmware to use the new Radix3 type and expose firmware
size through a size() method instead of a public field.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs              |   2 +-
 drivers/gpu/nova-core/firmware.rs        |   1 +
 drivers/gpu/nova-core/firmware/gsp.rs    | 116 ++++----------------
 drivers/gpu/nova-core/firmware/radix3.rs | 133 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs          |   4 +-
 5 files changed, 159 insertions(+), 97 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/radix3.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 1576399389b1..f208d6deb5e3 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -236,7 +236,7 @@ pub(crate) fn new(
 
         let elf = {
             const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
-            let elf_size = u64::from_safe_cast(gsp_fw.size);
+            let elf_size = u64::from_safe_cast(gsp_fw.size());
             let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
 
             FbRange(elf_addr..elf_addr + elf_size)
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index b49613a90bf0..34657004568c 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -26,6 +26,7 @@
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
+pub(crate) mod radix3;
 pub(crate) mod riscv;
 pub(crate) mod tlv;
 
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index e8f9491e84cc..48c73a676ecb 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -4,21 +4,16 @@
     device,
     dma::{
         Coherent,
-        CoherentBox,
-        DataDirection,
         DmaAddress, //
     },
     firmware,
     prelude::*,
-    scatterlist::{
-        Owned,
-        SGTable, //
-    },
     str::CString,
 };
 
 use crate::{
     firmware::{
+        radix3::Radix3,
         riscv::RiscvFirmware, //
         tlv::{
             request_tlv, //
@@ -26,38 +21,21 @@
         },
     },
     gpu::Chipset,
-    gsp::GSP_PAGE_SIZE,
     num::FromSafeCast,
 };
 
 /// GSP firmware with 3-level radix page tables for the GSP bootloader.
 ///
-/// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
-/// space:
-///
-/// ```text
-/// Level 0:  1 page, 1 entry         -> points to first level 1 page
-/// Level 1:  Multiple pages/entries  -> each entry points to a level 2 page
-/// Level 2:  Multiple pages/entries  -> each entry points to a firmware page
-/// ```
-///
-/// Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
 /// Also known as "Radix3" firmware.
 #[pin_data]
 pub(crate) struct GspFirmware {
-    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table.
-    #[pin]
-    fw: SGTable<Owned<VVec<u8>>>,
-    /// Level 2 page table whose entries contain DMA addresses of firmware pages.
-    #[pin]
-    level2: SGTable<Owned<VVec<u8>>>,
-    /// Level 1 page table whose entries contain DMA addresses of level 2 pages.
+    /// The GSP firmware image mapped via a 3-level radix page table.
     #[pin]
-    level1: SGTable<Owned<VVec<u8>>>,
-    /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
-    level0: Coherent<[u64]>,
-    /// Size in bytes of the firmware contained in [`Self::fw`].
-    pub(crate) size: usize,
+    radix3: Radix3,
+    /// Firmware file path requested from userspace.
+    pub(crate) fw_path: CString,
+    /// Firmware version from the TLV metadata.
+    pub(crate) fw_version: CString,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     pub(crate) signatures: Coherent<[u8]>,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
@@ -74,7 +52,12 @@ pub(crate) fn new<'a>(
         pin_init::pin_init_scope(move || {
             let firmware = request_tlv(dev, chipset, "gsp")?;
             let tlv = Tlv::new(firmware.data())?;
-            dev_dbg!(dev, "loaded gsp firmware v{}\n", tlv.get_string(b"VERS")?);
+            let fw_version = CString::try_from_fmt(fmt!("{}", tlv.get_string(b"VERS")?))?;
+            dev_dbg!(
+                dev,
+                "loaded gsp firmware v{}\n",
+                fw_version.to_str().unwrap_or("unknown")
+            );
 
             let size = usize::from_safe_cast(tlv.get_u32(b"SIZE")?);
             let mut fw_vvec = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
@@ -87,49 +70,9 @@ pub(crate) fn new<'a>(
             let signatures = Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?;
 
             Ok(try_pin_init!(Self {
-                fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
-                level2 <- {
-                    // Allocate the level 2 page table, map the firmware onto it, and map it into
-                    // the device address space.
-                    VVec::<u8>::with_capacity(
-                        fw.iter().count() * core::mem::size_of::<u64>(),
-                        GFP_KERNEL,
-                    )
-                    .map_err(|_| ENOMEM)
-                    .and_then(|level2| map_into_lvl(&fw, level2))
-                    .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
-                },
-                level1 <- {
-                    // Allocate the level 1 page table, map the level 2 page table onto it, and map
-                    // it into the device address space.
-                    VVec::<u8>::with_capacity(
-                        level2.iter().count() * core::mem::size_of::<u64>(),
-                        GFP_KERNEL,
-                    )
-                    .map_err(|_| ENOMEM)
-                    .and_then(|level1| map_into_lvl(&level2, level1))
-                    .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
-                },
-                level0: {
-                    // Allocate the level 0 page table as a device-visible DMA object, and map the
-                    // level 1 page table onto it.
-
-                    // Fill level 1 page entry.
-                    let level1_entry = level1.iter().next().ok_or(EINVAL)?;
-                    let level1_entry_addr = level1_entry.dma_address();
-
-                    // Create level 0 page table data and fill its first entry with the level 1
-                    // table.
-                    let mut level0 = CoherentBox::<[u64]>::zeroed_slice(
-                        dev,
-                        GSP_PAGE_SIZE / size_of::<u64>(),
-                        GFP_KERNEL
-                    )?;
-                    level0[0] = level1_entry_addr.to_le();
-
-                    level0.into()
-                },
-                size,
+                radix3 <- Radix3::new(dev, fw_vvec),
+                fw_path: filename,
+                fw_version,
                 signatures,
                 bootloader: {
                     let bl = request_tlv(dev, chipset, "gsp_bootloader")?;
@@ -140,28 +83,13 @@ pub(crate) fn new<'a>(
         })
     }
 
-    /// Returns the DMA address of the radix3 level 0 page table.
-    pub(crate) fn radix3_dma_address(&self) -> DmaAddress {
-        self.level0.dma_address()
+    /// Returns the size of the GSP firmware image, in bytes.
+    pub(crate) fn size(&self) -> usize {
+        self.radix3.size()
     }
-}
 
-/// Build a page table from a scatter-gather list.
-///
-/// Takes each DMA-mapped region from `sg_table` and writes page table entries
-/// for all 4KB pages within that region. For example, a 16KB SG entry becomes
-/// 4 consecutive page table entries.
-fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
-    for sg_entry in sg_table.iter() {
-        // Number of pages we need to map.
-        let num_pages = usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
-
-        for i in 0..num_pages {
-            let entry = sg_entry.dma_address()
-                + (u64::from_safe_cast(i) * u64::from_safe_cast(GSP_PAGE_SIZE));
-            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
-        }
+    /// Returns the DMA address of the radix3 level 0 page table.
+    pub(crate) fn radix3_dma_address(&self) -> DmaAddress {
+        self.radix3.dma_address()
     }
-
-    Ok(dst)
 }
diff --git a/drivers/gpu/nova-core/firmware/radix3.rs b/drivers/gpu/nova-core/firmware/radix3.rs
new file mode 100644
index 000000000000..b60611c7bea0
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/radix3.rs
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! 3-level radix page table for GSP firmware data.
+//!
+//! The GSP bootloader expects data to be mapped via a 3-level page table:
+//!
+//! ```text
+//! Level 0:  1 page, 1 entry         -> points to first level 1 page
+//! Level 1:  Multiple pages/entries  -> each entry points to a level 2 page
+//! Level 2:  Multiple pages/entries  -> each entry points to a data page
+//! ```
+//!
+//! Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
+
+use core::mem::size_of;
+
+use kernel::{
+    device,
+    dma::{
+        Coherent,
+        CoherentBox,
+        DataDirection,
+        DmaAddress, //
+    },
+    prelude::*,
+    scatterlist::{
+        Owned,
+        SGTable, //
+    },
+};
+
+use crate::{
+    gsp::GSP_PAGE_SIZE,
+    num::FromSafeCast, //
+};
+
+/// 3-level radix page table mapping arbitrary data for the GSP.
+#[pin_data]
+pub(crate) struct Radix3 {
+    /// The data mapped via a SG table.
+    #[pin]
+    data: SGTable<Owned<VVec<u8>>>,
+    /// Level 2 page table whose entries contain DMA addresses of data pages.
+    #[pin]
+    level2: SGTable<Owned<VVec<u8>>>,
+    /// Level 1 page table whose entries contain DMA addresses of level 2 pages.
+    #[pin]
+    level1: SGTable<Owned<VVec<u8>>>,
+    /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
+    level0: Coherent<[u64]>,
+    /// Size in bytes of the data contained in [`Self::data`].
+    size: usize,
+}
+
+impl Radix3 {
+    /// Builds a 3-level radix page table that maps `data` into `dev`'s DMA address space.
+    ///
+    /// Takes ownership of `data`. May sleep.
+    pub(crate) fn new<'a>(
+        dev: &'a device::Device<device::Bound>,
+        data: VVec<u8>,
+    ) -> impl PinInit<Self, Error> + 'a {
+        let size = data.len();
+
+        pin_init::pin_init_scope(move || {
+            Ok(try_pin_init!(Self {
+                data <- SGTable::new(dev, data, DataDirection::ToDevice, GFP_KERNEL),
+                level2 <- {
+                    VVec::<u8>::with_capacity(
+                        data.iter().count() * core::mem::size_of::<u64>(),
+                        GFP_KERNEL,
+                    )
+                    .map_err(|_| ENOMEM)
+                    .and_then(|level2| map_into_lvl(&data, level2))
+                    .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
+                },
+                level1 <- {
+                    VVec::<u8>::with_capacity(
+                        level2.iter().count() * core::mem::size_of::<u64>(),
+                        GFP_KERNEL,
+                    )
+                    .map_err(|_| ENOMEM)
+                    .and_then(|level1| map_into_lvl(&level2, level1))
+                    .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
+                },
+                level0: {
+                    let level1_entry = level1.iter().next().ok_or(EINVAL)?;
+                    let level1_entry_addr = level1_entry.dma_address();
+
+                    let mut level0 = CoherentBox::<[u64]>::zeroed_slice(
+                        dev,
+                        GSP_PAGE_SIZE / size_of::<u64>(),
+                        GFP_KERNEL,
+                    )?;
+                    level0[0] = level1_entry_addr.to_le();
+
+                    level0.into()
+                },
+                size,
+            }))
+        })
+    }
+
+    /// Returns the DMA address of the radix3 level 0 page table.
+    pub(crate) fn dma_address(&self) -> DmaAddress {
+        self.level0.dma_address()
+    }
+
+    /// Returns the size of the mapped data, in bytes.
+    pub(crate) fn size(&self) -> usize {
+        self.size
+    }
+}
+
+/// Build a page table from a scatter-gather list.
+///
+/// Takes each DMA-mapped region from `sg_table` and writes page table entries
+/// for all 4KB pages within that region. For example, a 16KB SG entry becomes
+/// 4 consecutive page table entries.
+fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
+    for sg_entry in sg_table.iter() {
+        let num_pages = usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
+
+        for i in 0..num_pages {
+            let entry = sg_entry.dma_address()
+                + (u64::from_safe_cast(i) * u64::from_safe_cast(GSP_PAGE_SIZE));
+            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
+        }
+    }
+
+    Ok(dst)
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 9b29308678a7..d3678f16750a 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -188,7 +188,7 @@ pub(crate) fn from_ranges<'a>(
             magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
             revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
             sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_address(),
-            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
+            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size()),
             sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_address(),
             sizeOfBootloader: u64::from_safe_cast(gsp_firmware.bootloader.ucode.size()),
             bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
@@ -243,7 +243,7 @@ pub(crate) fn from_sizes<'a>(
             magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
             revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
             sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_address(),
-            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
+            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size()),
             sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_address(),
             sizeOfBootloader: u64::from_safe_cast(gsp_firmware.bootloader.ucode.size()),
             bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
-- 
2.55.0

