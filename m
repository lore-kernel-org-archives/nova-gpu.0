Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3115368D51
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370504; cv=fail; b=aKojajKavid/YjXYEnyk6QjikVt3OgWCPpc63go5q8vjemCSH6Llq5B0yGRvyfOcMKtBTVClciJVieDTtC5ov188gIL7nNjooMIvifs6FUgtmoXcSuz/E/nFFuAGBCfmHJgd5QpoMyNFXgZqD7TUzaOfyzuQQDMm4GRZbChOClM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370504; c=relaxed/simple;
	bh=MaBiSc7z2K6kK3546BE4gq4D+GVA/S7AHDz7VdC/by4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H7k+0a/RPwK1D8UdsEXnCYh8bHBC2HvvyAGociaZx7YvIkSCpTUOtMCJDt2s6OMK0nj+qdziFX6GmNzQ3eaIij97S9RRxZDn5bBgkMmbzx2fTAxdi9NYf3p53PBY3iyZ67jpPaOAsVftZ1KMfBntxU8BmOcr/YAyk1zPoVBfQmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Lf3iN/B6; arc=fail smtp.client-ip=52.101.61.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lf3iN/B6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCl28+Jtt7H05Z9GETS5eNs2VKMV7coi7QolM0eX+NRWVsqp/Q9pApZrfxmhjA2ttHyHon9p2fpDF33YcG6BB9tWvEwkqrwGDcoVSFhJuCoDIMgpPB2HLeiSIHSXZLvM0O352Rq4KVa/mTBMn5iMvmDn8JmIbhXsXHSiOXgWPGYAD/F1KS6RIDnv/O3kMiGcxaRBnteC3MjoVx8i9RpEBuzKRXK604hiu1TUxdzoLamQXfJnZEeqP0pHYyLylPDpl1iG+yqZDVeQ8ogGhSz3seYujCtwSqwAl7Vil/9qH/VTZUW2c7SN4ObnyXkY7SuYH0m32LSkKI/c+6fPZjG4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PncTIjIFggL9sXzLAji51UTlvgw0lTblJFOJf6bwrAE=;
 b=Yap3zC+AaIOCKTVZ2LTqaPYS8bWiXsVLwtzmdK9L/6WgsQdigIjrzLChKtkAatBR2c1OVU50L3R9whG1cDAmg43olbWh/KOLYlGNC1yXnE2tI1p8k8hdPW+H7GmKxV2xUg62kjwQiFgPqy/6R1D2j0UIT9q56dHWNO7PX+WuhSGmRQMltLjXYnJ/wIb2y5UnflmY5ZolRAAHgbv3cBr/sbE0mzAVut0DWAe2tQ55qre79y0Ny+OLEhe1ny4leEjdWveKB9vvAmR8NNIwnWOkBoMVQYUJpBtCi4DCP/Eu1fnGN9HMQWTIyTcmgxdvWDtbk0RjS6ugnW2pFQdjqZYvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PncTIjIFggL9sXzLAji51UTlvgw0lTblJFOJf6bwrAE=;
 b=Lf3iN/B6o0Kdq5FOqRDfYnwWT9Dw6FeSjUz7Bnm02wCZVBjdOaeURyprxDPC2Qd/2W07nt312HkvznJSs+4ZVAORsn+ep6ABtE8uNDqAj5C33+oNZxTy7lcQW6LKq/++cV8G+7Ubz/DF4jFsAVV83ize4GUCkmx/R/hWqVG4v/dcLS0UlV7iw5yp1Z7muZvpfkfImztwFlOdUevSehJq0eMu9Z7h+UYGi0Oo1jr14tqOKbna/W5cdyRgflcMUDTAsUuKIuqTFMaSfswWHjAribtrSQ7hs3ZnFm0swoKfEU4/bXUkkbRHz+v1VKFbohCOYXBcXk7mOQc2rvFh43Dm/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:24 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH v12 08/22] gpu: nova-core: add support for 32-bit firmware images
Date: Mon,  1 Jun 2026 20:20:56 -0700
Message-ID: <20260602032111.224790-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4917fd-9fce-42d1-c8aa-08dec0560650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	PFwFO7gG2YiiZAb34i0XD1LAQEYhmjzgyXTFkMXFmGw+fy3Gyt4RUx71ZGkF3egk5A2YyE0w7jCGzrPswKXfWNPfso+VM4612C7i9Ox9Kv3xTQppsJLjweeZATNsH+yv5FmY/gRoTA599t7LRDmabZPDaOHNi1oF/rppCaj++MJkPukhofpGRGKkikKvX5mAW/IPHGEOsmep25hRJHlwfBxR/JQwRYYVH8CBesCoGVVpACD6qbxjB8JgkRtBHvQyZScMx0HV6Ux86loU4jHr4VZJ3AYPN7rBCJp3qJAqYO0rv3zPgeTF7WsNHIU/rGZ7Y1fN8aFBArbRZV1xPdDMzZTqwteeGu8z8mg/PwNVRYyufK8XWqs8FT70mixJZF6mIVueZKLL5f54e6zqppVDf1gOTtuH3e3yw0lxhX8X0I2MGqAWiHVglZWyVsUAokDFLfhaVc9jv9tzlP7tCc8W0vw85DqfrgF/yP6MHjP+6lLL216lSkxv/h13yAkOiiizNoIkm8c3VHDzdgavAX6QiPAsfAN/GlTUagvNY06rnuf0yMHao8eRALr7dRKdKINpxSAjEFfQEp3dOoGecE2e4pjLTqYU5+Xtl85H9ojagyiItvhbmefj0CqXxskOoLKSfo1h4tNySbDpN0Dtkm1tPMDcagYe2XlaiBcQCRFxXAFz3mDOBUmYxpPLsqcXqj5Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j+r869tA2jy9bRu8/MOPUvAPdja35yZumOoa2yd7vC/hV5odw8Ufe/i1Dlc8?=
 =?us-ascii?Q?Xp2r6OeBVrM4b9ldupp0Y32y133sMLgpeLW6tViQ2pb3f3ze67fM0MdDmnCO?=
 =?us-ascii?Q?IfZ2pggOV1wUueNvICNO8pOp4271A+W2LW98eqnQPMT275VoCarHl9o3t0Hl?=
 =?us-ascii?Q?NeoHqYakoyiAu254Bn72q4D3I3mPMeHZTumnnTSfgtJgpyPIf35yURVDczf7?=
 =?us-ascii?Q?LBf/2yTFyC5p614h561aOdp+os4Jl4xwVZi1oj/pJKQS1yL68pCMw7O4CfeJ?=
 =?us-ascii?Q?90JmyuDIUK1vhXEzidvGJbf93GIcaF5/SQbI8jWNO3kYw9JALf3engAC7zM3?=
 =?us-ascii?Q?vDjgEwj15+nuAm5Fdo+Vg8Z6XFn2lToR9Xhm/p5gowhXkiP2ddORiSVbfrIq?=
 =?us-ascii?Q?Npl8AtEhytPaGZdEX54W+EH1dH730ABukxVX/D+hr3vz8AraFd1Ge18ubW88?=
 =?us-ascii?Q?JO/hjCwuKdI06+Xrqtcs38yIzjfF8MQQM2GRHkGu/njYKtZG1X3bEIw1Mv+A?=
 =?us-ascii?Q?9H4bX9ywCoEc2xSSEaNl3qj1RvZxRuaX+F1boZuZAZlQZZ19Q2a1cQ7OKmIs?=
 =?us-ascii?Q?MZROKpvD0i2GKgE009n9w5kZ5PdLfXjr9BOLHp85CtnNF3yAGVXjxGpYf6R7?=
 =?us-ascii?Q?madmLGR4Sfet3HuoQVGNAX+IiIokwbQO/jtdr/76LBZcebDVCTEyFUzrsJ1o?=
 =?us-ascii?Q?XaMm5i5YwB26qmTTE4blPdSp3m5Ls8FxaAkoWGZa/VeGaRwzxvf0TKrF+WT9?=
 =?us-ascii?Q?ndi95NSa1Ya6RuwwwhquevREJYqKTawoANLxhYCbY5+j8T2vdVsaiKVSha0T?=
 =?us-ascii?Q?j6jSOKMyyKGabnHSjoxws2aKj8yQ9BbRwm+OBsO6z1VqcBUgdklAGaBbddHd?=
 =?us-ascii?Q?Mm371hMtm1vE2mHa2ibKVS7ytaFfn448Z5XtPONQMIBB2VTD5z0JP33tngTb?=
 =?us-ascii?Q?lyVTO/6PGdT4/rKnS32whhTPzlwl4eY01ZgjxCTfNkd/9oM+8LVHYUiQHsSH?=
 =?us-ascii?Q?K7Z3EpQc8XcNBmh1B/v6RvJQUJzi0rtsdfVohjOR8LhY2QptJI945kkOl/z8?=
 =?us-ascii?Q?1TQNFB9w8068y5EMNwT1+gUiP1hHn1zQvW+bHDKlbMvT8x0sS/aRVFkNO82/?=
 =?us-ascii?Q?xnI3jaK6R6iLs9Ob8sxNE1RVQh1APdAJTkcp+7s+jqdaBgm1t3VFmknm+zwr?=
 =?us-ascii?Q?WoqJd6xmJ2ufFn9G99D2XrtsnLbwAENbf/+GI2u8wWhWoMCTMTegTy+B9jAU?=
 =?us-ascii?Q?04hofwbGpfY9O0b7Sq3MStTWWI9PTzbZBuft4VdneCbhdmy1H7mmbYyfA/dT?=
 =?us-ascii?Q?8yhMGDPsOCy/T+9a2qtgAduc+KFnkZHSY6hKIiHUaeawglCe9uUnZKfDHHbR?=
 =?us-ascii?Q?e2rEa3CWltYI1S9Fz9jC2iw7z5Zv8lPs/iobDraWzjVzokrS51KBPE5d4x57?=
 =?us-ascii?Q?hcxD/xmnqKzzN2g5KYUZ+9zFScKSbyb92f1CG/FSy6cUnY38raNv+0XYhj46?=
 =?us-ascii?Q?d35l7/T5kaDl17DpgVdQHBoQVfOKnioC1LSf68iKliUTn/V0dkTG2Ts8K1zQ?=
 =?us-ascii?Q?rvYMKKTOzdWlkTURn/0k3HpQ+We4yEclIZRx+2dsDPWnF5MyfLiNSxzfnswX?=
 =?us-ascii?Q?sT0nCjgBFv1aAtd6wzzm/kSVFbJh6pYMvlsdgtrcd+XR3xEWpPnnKaAuqrVT?=
 =?us-ascii?Q?T2mBQjG/dKrJoys2J95XiGR1fUOrsJKpkmh/LKulGn8sGMvUuunia6HD0dX0?=
 =?us-ascii?Q?OCZLiJA2fA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4917fd-9fce-42d1-c8aa-08dec0560650
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:23.9971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPD2gOBU91sBb6dBicfpLa/3UllyawEXsP7aU7mKAf242Uh1UHUIktyQ58g0/6eupC2CRiPvJhLrc1hcpHi+/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Some GPU firmware images are packaged as 32-bit ELF rather than 64-bit.
Add a 32-bit implementation of the shared ELF section-parsing
abstraction so those images can be parsed alongside the existing 64-bit
path.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 53 +++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 38088e950980..e4dcc9a87b7e 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -534,6 +534,53 @@ impl ElfFormat for Elf64Format {
         type SectionHeader = Elf64SHdr;
     }
 
+    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32Hdr(bindings::elf32_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32Hdr {}
+
+    impl ElfHeader for Elf32Hdr {
+        fn shnum(&self) -> u16 {
+            self.0.e_shnum
+        }
+
+        fn shoff(&self) -> u64 {
+            u64::from(self.0.e_shoff)
+        }
+
+        fn shstrndx(&self) -> u16 {
+            self.0.e_shstrndx
+        }
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32SHdr(bindings::elf32_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32SHdr {}
+
+    impl ElfSectionHeader for Elf32SHdr {
+        fn name(&self) -> u32 {
+            self.0.sh_name
+        }
+
+        fn offset(&self) -> u64 {
+            u64::from(self.0.sh_offset)
+        }
+
+        fn size(&self) -> u64 {
+            u64::from(self.0.sh_size)
+        }
+    }
+
+    struct Elf32Format;
+
+    impl ElfFormat for Elf32Format {
+        type Header = Elf32Hdr;
+        type SectionHeader = Elf32SHdr;
+    }
+
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -586,4 +633,10 @@ fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Format>(elf, name)
     }
+
+    /// Extract the section with name `name` from the ELF32 image `elf`.
+    #[expect(dead_code)]
+    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf32Format>(elf, name)
+    }
 }
-- 
2.54.0

