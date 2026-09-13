Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737E637B032
	for <nova-gpu@lists.linux.dev>; Sun, 13 Sep 2026 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329270; cv=fail; b=X4J53djGzdef3UVdjuFuy1gLfHrfBdDqx3Sd4MhgyY/6E4euveoUeqrUJ2v26MQlsXYYnes/w2u3TKsdAv8RJtvTnk1zRG/c7lYpN1l3tkgpqAOdAniyVyidtZjy67Ak4yUpVIvbw14Y5MfdTbNqG6uEG/pvKJHxuyxgWXK06So=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329270; c=relaxed/simple;
	bh=g9HklJPBB0zRsWyQmmaQV5QHEeibljuhNdu2Bk5nGbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sudiQJtDS9Qbwim6vE9hh/mgxnPnPFdC2kZ+zVkGynaCerGvw6IOWsNKSBVrsbtX3v8ioz+BLVajwIVze9KbCwpgIwYafKGrbgqorPDyUlmn9GIPMInUBdl36xgRmN31QLg2EpP7iRoydOo+uDmkH1Fqmf3l0q2W5DA37en456w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ayA3z2UZ; arc=fail smtp.client-ip=52.101.62.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ayA3z2UZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlepX/JIU+7u7+iHBFcd5LIjvPdPCcy7bl7TXjUHMNxzLxabQO0dWSxLYi4qX5WExilz9KyIm+kgvyp6sDl94tikz73CiAZm34uYNfWQhRBIfe72xdd8qkzwPtMeN/SSWbIsGNqiLkNQMP8lpT+UMZjNFzIz8khwooO5elCZ0ciuCm3QoCKV4pWqmfe69lGPHz7LppZpjIHOoWUWeknLfSuM9IqqOg6KbiPw1auzUQhStxIo+Kcqng31lK/xXG9OZJXrxVtoW18shIYvWgoiqVgrDLNZDorp7K8efmoTx+0jiuDMg85++JIqJ5Nq2Ftr78+pbar7cUQSlNTEDOQpwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtA7SsgrijQPnqQ1rh5XsMZUOCWl9O8VBOPJG3vAmiw=;
 b=VrdDiQBCZGM6F1vvqIV1UDnRIwbCOxA8VpcRu3Ej3hgcw/J7ZX5ZsuP+KuoOyXcE8C++LmG6Z1lImPsZwMGyfDlaVV5vVB1+WYcvOsn94FbvHGULEMxfKCtFNElgAntKjPbihZPEIcWVQ2Bc+lZ7PNfqiH5avzfl4o80lCTT1p+oerlMDPz3wDMxPhx0Medj2nMqcBZ8MNhu6lmin0Z2GnGSJglJP4hMEmD6GnFivJsP0d6kcfxkNLmT6iZgXmVR75J73p3vcpjiV0JqIwnMtVrA1ssFuEfGv9q/XbtCY8mI0hw0iopFv5OWRDqawOSrvX8jTRsEh7Hl2e5NiKE5Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtA7SsgrijQPnqQ1rh5XsMZUOCWl9O8VBOPJG3vAmiw=;
 b=ayA3z2UZLEwHTtmu+rTs07aJ+k0c6xLihCr2hUa16NBK2MNs5WwdcpKoGH1JYeXtzoeRDNr3Mh3BOJ8u1k3rYlimEG0FD1gBfqLAsuXsGOhKC2veWbWG3igjEkAAQ9Nl7SZT3x0mIeQFCYYnb5YLtohri3mW9anpxBC23c856+4UuWo0rFMEHMcXUydRc9Fp+HQrXzwv4ctskW6I5GDeqS3ROiTWhLvN85oNgzgXqCaUFaPLqeWSVXL6aIbnXh0UPaVsMLT+5IwbZZZsP/F/6hQTXDcmSoFUzoINmaiDcZBNYcRVJyx9qmFal3IP/418zTrRaUSjpvXtPQA3Gi98DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.8; Sun, 13 Sep 2026 19:54:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 19:54:22 +0000
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
Subject: [PATCH 1/3] gpu: nova-core: extract radix3 page table into its own module
Date: Sun, 13 Sep 2026 12:54:11 -0700
Message-ID: <20260913195413.742143-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913195413.742143-1-jhubbard@nvidia.com>
References: <20260913195413.742143-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: a211a0b8-05cf-4e1c-f089-08df11d0ce40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|7416014|11063799006|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NPHkErvlNkoJRu/lAI9LTk2/ganq9xTvhoPAMh4jtYyElza8b/UpOl4EWFKWtn7Iyx0MhK6Ih9DmnFZfInv5c2kSFpPdHtAxQ84OrtpcHBhbSi31OYDAHqpWLLWIH9lwgFTsuKraoQiV+AikKlPKaPF9PSmMCJa2m05iSu73izJRC1XHfQnnfw6VxwjMwrS7m81QUT0L34iDYDPoJiGHKZxvtrEZClYe8IoICIjAHUr7GHe80UMLtlFMxMs1WCSbZSpflLL/I+viM2cM59lu2JG+aSZDFqzOS4hDPF2Db+GL5xARMqyM9SyvNQDUaDW4ejWXT8yCoDI0aRIrECoQ7adtDfLXlSFo0fXkprcFafJ4frvqfn5IY7SVN1AMGy3RORp4Sas+81v8RumDhDHJKoM2oQwxRUv8jq+EBXuVfGkJmxRHo0cXrLrLGroCnaC/wfKanoi1qMyqwx7688JIp2LnU2OUFfjuN9apTus2OKLFR5We9bob9I0jwXAFsRLzE3YqHIOX7REIPx35GShEWDynBwzXVFXM/SN8EBlE6t3RGo8c2WJU4LuMJi1WArGiY3Oq382a3feW93dSUrsCR8WnkIFJ2/7cc3GuVIt2TKiX3kmQ60YYmZMXjukfOz4rydMDARqjRGK4mRHs3DHLXyb/L+VqLARVVWvXFhzT7JE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(7416014)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4kZT1g2vLSO3i6aRlQCS4HPO55ee9VLGD5GOQKKEAiWEkpvrBP3uHszHxWzC?=
 =?us-ascii?Q?2bAOTxqZNrTlWqbfs2ZBbs+iawHBPGlHaMfDBU/wq6RcL/1rrqmUW2XBOoVG?=
 =?us-ascii?Q?d7yYplT6O5/fPMxLZy319+Vw0K43uBH4N21DsiT5yWUU00yyVdV5ZAOx520/?=
 =?us-ascii?Q?UkFfCn3ZjHaSEZAEn/v7N3DqWefru4nW+l63J3hCbBPQn8wAIqUOHFwSfqZM?=
 =?us-ascii?Q?HgpqWptZSKkDQmYa2zaA6mAPAwIeBR/fEmiXe3tA/iL7no4wWZl2Y5eA4uSO?=
 =?us-ascii?Q?BO+JYETmhfN9IzvfrXQMd/nNqZakIIr5OFrCDlYoIFJtDxdwhtujI8a9y1bB?=
 =?us-ascii?Q?oH5ocV10q4Z/KtF0xKYNkUnHFUxInyc8/gED4TcUiylpzVoMbt3bP30MItyT?=
 =?us-ascii?Q?lY2dROS4lHXWqZtovsat2KOQrFF1nUjLljamKa3MlfGsQd517m0d4vsy/og+?=
 =?us-ascii?Q?3gz3vxqubgMZsVUQxXLRRIj2Us3iTS8eAFHKY7pS+Imy/bbkjaLtAja2DrQ4?=
 =?us-ascii?Q?wERRIzeiMwTdXMLUflTPJCooZdd3vds9eqqc03HmYG8F4dTxyF03U0WxVFY5?=
 =?us-ascii?Q?SJRr7vwT8GteZDKQFvTE0ZGStUsL74caz0z5rRn1QIpz2Sg2twOsf9aRJ8vL?=
 =?us-ascii?Q?ZQNhSqteYvYL05NswhMjJE3Ps4kxD9R1o9LU+qnTFA1Lvb9+uC8ZD3dVve6Z?=
 =?us-ascii?Q?appnIOjLIiWCTlx872zt3ZzVX7Z1Xlh99tPIaYnSZL4WYjNdl3iWKGVWmKH2?=
 =?us-ascii?Q?amorGUmm8B8jjOBKTV6BlF+rkWbbKU2k8rqyDuG5v4iUOBEnf1TLM4GJgxWR?=
 =?us-ascii?Q?cI1HqV96AjaDkOVflMIZ/xkjDqezgfPptofFnKPE0WpjSU1uYd94++UijugX?=
 =?us-ascii?Q?S+xzp3u5Zmn8wKeaMaR0osBFGmj7ceXX0w72X39qM3sMfMjHQu79uAMJmn2N?=
 =?us-ascii?Q?E7MDsaLCMbMc46Nh6K956qkEeeQBgQEZ8srOhw6DOpmUGYQC94AIQ0o6oocM?=
 =?us-ascii?Q?qIkkDC1/+Y39vbkXo/cIX8fl6Ry+vsKsEkHdFo6RCPwD7bytSqV8lbMwiL5A?=
 =?us-ascii?Q?Susq5NUGI+ZwBcTPw1fakUJ8SrFJcgjGg8/L3z5ShSAmRdf855X2WzXID7Va?=
 =?us-ascii?Q?wnHCpHTS/2OLn9Zx9IyXP1Qbf7/Gdpv/ClYMAkRaT+Hx4SRZW5hWOe+VXfQW?=
 =?us-ascii?Q?qBAKmJfgxb+M1RjieKSVF7uYHZq0VpyQv4Oa7e4L3Rbyh++cB08e3fSjwj1+?=
 =?us-ascii?Q?5MFIACMSFQVqR3kJbFxNJn5GIa/D0i/vchQhmV2Podd77F0aE2FLeyNXlZx4?=
 =?us-ascii?Q?YKpRka9aeuSRF5Q1DvAzJRipEKhV7hIN/I9itnn3e27MO7w89YMzSPVeNIj+?=
 =?us-ascii?Q?FRrbjSCNsX0gI+Kh7lwNbPiUDvrnC6Uo81FTByjVuwQ//mmqtc8VPmC6gUNf?=
 =?us-ascii?Q?rQMiIqCEzYAcKGEHHKmxgFSvTB0VSEPnkQa/CTA485qVIMp/nlPgB3gS1qkP?=
 =?us-ascii?Q?M+DGpYJWixOvF1jT/8viB2UuJjX59P2q5DKSVds9FFri8hJg3ytYY2RgRpH5?=
 =?us-ascii?Q?3GoPAtWed0HFZKqZbvzk4VEdXhdKsZN3rhAATVoLiMiFoQvckrg9ggDJ/+Jx?=
 =?us-ascii?Q?+2F/bsJZ9uuAt60FMh03wNkg/t+m3B/AiENbBU6mRd/QyG1M870ePFH7anwc?=
 =?us-ascii?Q?jEGH3x17r8W34e6uEiAnMDQj+kIIJ1+zAo98QR5l/qLb5TsyszqdVuZkNHUV?=
 =?us-ascii?Q?DMkIBUit23353FWuM58JnOOkqlVF7A0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a211a0b8-05cf-4e1c-f089-08df11d0ce40
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:54:22.2274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKObuf7hfFtskGoRQgBQ43PUVyv3HMwGcfDQA/yW6CYYW03mW1LkwW7PSSTWAZp68Ws2Y5KY5ozGKfJ2sJd31g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352

In order to boot the GSP, nova-core loads the GSP firmware image into
system memory, and the GPU copies it into the framebuffer, the GPU's own
memory. The GPU finds the GSP firmware image's pages via "radix3", a
three-level page table of 4 KiB pages that the driver builds. Today the
table exists as fields within the GSP firmware wrapper, which is fine
because there is only one radix3 consumer.

The upcoming r000 series[1], however, introduces a second radix3 caller:
the ucodes firmware image. That is because the GSP has been changed, so
that it automatically fetches the subset of ucodes that it requires,
thus reducing the size of the GSP image. This is a helpful change for
the firmware situation overall, but it will require nova-core to load
and provide ucodes, in much the same way that it was loading and
providing the GSP firmware image.

Therefore, split out radix3 into its own module.

[1] https://lore.kernel.org/all/20260822015448.238214-1-jhubbard@nvidia.com/

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs              |   2 +-
 drivers/gpu/nova-core/firmware.rs        |   1 +
 drivers/gpu/nova-core/firmware/gsp.rs    | 107 ++-----------------
 drivers/gpu/nova-core/firmware/radix3.rs | 126 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs          |   4 +-
 5 files changed, 141 insertions(+), 99 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/radix3.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index b3a6ab8b57a6..b18dc5447a73 100644
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
index c16fee6e2b2a..d8f6509a35d1 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -26,6 +26,7 @@
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod gsp_fmc;
+pub(crate) mod radix3;
 pub(crate) mod riscv;
 pub(crate) mod tlv;
 
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 22d1f9329c9f..341a8b19aa38 100644
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
@@ -26,38 +21,15 @@
         },
     },
     gpu::Chipset,
-    gsp::GSP_PAGE_SIZE,
     num::FromSafeCast,
 };
 
-/// GSP firmware with 3-level radix page tables for the GSP bootloader.
-///
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
-/// Also known as "Radix3" firmware.
+/// The GSP firmware image, its signatures, and the GSP bootloader.
 #[pin_data]
 pub(crate) struct GspFirmware<'a> {
-    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table.
-    #[pin]
-    fw: SGTable<Owned<VVec<u8>>>,
-    /// Level 2 page table whose entries contain DMA addresses of firmware pages.
+    /// The firmware image and the radix3 table that maps it.
     #[pin]
-    level2: SGTable<Owned<VVec<u8>>>,
-    /// Level 1 page table whose entries contain DMA addresses of level 2 pages.
-    #[pin]
-    level1: SGTable<Owned<VVec<u8>>>,
-    /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
-    level0: Coherent<'a, [u64]>,
-    /// Size in bytes of the firmware contained in [`Self::fw`].
-    pub(crate) size: usize,
+    radix3: Radix3<'a>,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     pub(crate) signatures: Coherent<'a, [u8]>,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
@@ -87,49 +59,7 @@ pub(crate) fn new(
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
-                    let mut level0 = CoherentBox::<'_, [u64]>::zeroed_slice(
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
                 signatures,
                 bootloader: {
                     let bl = request_tlv(dev, chipset, "gsp_bootloader")?;
@@ -140,28 +70,13 @@ pub(crate) fn new(
         })
     }
 
-    /// Returns the DMA address of the radix3 level 0 page table.
-    pub(crate) fn radix3_dma_address(&self) -> DmaAddress {
-        self.level0.dma_address()
+    /// Returns the size of the firmware image, in bytes.
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
+    /// Returns the DMA address of the radix3 table that maps the firmware image.
+    pub(crate) fn radix3_dma_address(&self) -> DmaAddress {
+        self.radix3.dma_address()
     }
-
-    Ok(dst)
 }
diff --git a/drivers/gpu/nova-core/firmware/radix3.rs b/drivers/gpu/nova-core/firmware/radix3.rs
new file mode 100644
index 000000000000..6b8251ed871d
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/radix3.rs
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! The radix3 page table, through which firmware running on the GPU reads a buffer in system
+//! memory. LibOS, the operating system of the GSP, defines the format: three levels of
+//! [`GSP_PAGE_SIZE`] pages, each entry the little-endian DMA address of one page.
+//!
+//! ```text
+//! Level 0:  one page, one entry  ->  the first level 1 page
+//! Level 1:  pages of entries     ->  each entry a level 2 page
+//! Level 2:  pages of entries     ->  each entry a page of the buffer
+//! ```
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
+/// A radix3 page table and the data it maps.
+#[pin_data]
+pub(crate) struct Radix3<'a> {
+    /// The mapped data.
+    #[pin]
+    data: SGTable<Owned<VVec<u8>>>,
+    /// Level 2: one entry per page of `data`.
+    #[pin]
+    level2: SGTable<Owned<VVec<u8>>>,
+    /// Level 1: one entry per page of `level2`.
+    #[pin]
+    level1: SGTable<Owned<VVec<u8>>>,
+    /// Level 0: one page, whose single entry is the DMA address of the first `level1` page.
+    level0: Coherent<'a, [u64]>,
+    /// Length of `data`, in bytes.
+    size: usize,
+}
+
+impl<'a> Radix3<'a> {
+    /// Builds a radix3 page table over `data`, mapped for `dev` to read. May sleep.
+    pub(crate) fn new(
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
+                    let mut level0 = CoherentBox::<'_, [u64]>::zeroed_slice(
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
+    /// Returns the DMA address of the level 0 page, which is the address of the table.
+    pub(crate) fn dma_address(&self) -> DmaAddress {
+        self.level0.dma_address()
+    }
+
+    /// Returns the length of the mapped data, in bytes.
+    pub(crate) fn size(&self) -> usize {
+        self.size
+    }
+}
+
+/// Appends one level of the table to `dst`: one entry per [`GSP_PAGE_SIZE`] page of each
+/// DMA-mapped region of `sg_table`, in region order.
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
index 8778c4bf79c0..ae98da42410b 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -187,7 +187,7 @@ pub(crate) fn from_ranges<'a>(
             magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
             revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
             sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_address(),
-            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
+            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size()),
             sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_address(),
             sizeOfBootloader: u64::from_safe_cast(gsp_firmware.bootloader.ucode.size()),
             bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
@@ -242,7 +242,7 @@ pub(crate) fn from_sizes<'a>(
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

