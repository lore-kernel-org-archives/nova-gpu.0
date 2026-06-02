Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE38B3672A5
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370502; cv=fail; b=Kq0uYccOKgxnkW75CbL5Yb3F4vXxmwA0r0QY3CUxhC7f4ocOnR2Ots1j/T1vFFrjP9Dz2bHa40pgr3xh9s4ykWWrJ1pdqrvwbgH+QjJhSHkfdDKL1I/fWqZwNWX30EbK+yMx0oY2uaBtArG0QBJcRU4tXhQUXjzUWP6q6sjwN0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370502; c=relaxed/simple;
	bh=uSM7UIzZzwHXbacDBdSHbzWKWBlHTDRICRpkdsH+O1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HYEk75QKm7Vs4fPZ/YgAD1iHRqzxP6YHI8ds9rwU2htX5EfxbChbWSnVgOFzTXOtgJfJvjba+VAuScRRZE5TfGroQBpRU29sgmP0on9jGAiTJvXJcLFY+h1A7ZM/8YQVPZgXQIUy3h7+ehErS5LVFKuTIyIyuEUIas74OCQYUcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=REBsXgxk; arc=fail smtp.client-ip=52.101.61.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="REBsXgxk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOG17IZHiPC8B8tQ6nAtgK4L4YvdSGGYYATrgkP2bsMTWRBhm5A4iI0ijuOmwf+Lhj1I0fw7Vbs6mEMKKx4BKD4Bbd19fIvPYYFWg8SbHUPI11gK7lJ1crS/7LCTJHgwh+NRTEPs45v6R98nNBzgIm6NQVTcUbE5HeX8WO9AmeiB9vTSOH6PPKQH7qnlPKd7mji8vHnlWWe3oVT2O8BuVVRV0sWW5BZAy3DnNZmpR4ZrcuEhMwIcc37LJMPpI3IHcOtGc809qWJ0FH+QuvSmU+GL9CNb5+6Eocpnza0VOf4YhVb3l3Hs4ZqXGibnttx/ObK6P/0/rBKiK3Hvs0QrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3ci+bLWG1nzcOx8tBibkRe3uBS21mHWtYC453dfeg4=;
 b=GZDINJy4QMuothioPmp8E2SkuDIaLqVEF7Q8rspVnnP/cS+aTi2kqqtcL+KCmoh6sY8s8o74Oe3Bxx3fmA6xpj3lHXph9feuyInRrQLIeRSby+ESixFC81GY4s8DW79jOKxbg+UEU6r2fhKSxiP+4OEV5UPy0EWVPisTzfLRkx41QxN2PBWeOIds7fBjJqGnOiUcDHiqVC+59CtOYPBlQXLKO2dfNEEwNapd8LNdy3WSWe1OBnxprAsDL5hSV4BliMkkZCADWko3shRGCDjc1U+4S7YmN5K4jjQkkezY96v5Hz+Sr1RVjChccG7GQm3PiMdmIgCoN0HU+Pw7m11NCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3ci+bLWG1nzcOx8tBibkRe3uBS21mHWtYC453dfeg4=;
 b=REBsXgxkgP+CMcBXNmXY+huibqR2UugPgVHO7bjUpXWYRbutylDjZC+A5DLDFNcRMXsubFtfl3yjC22dt197LYRoBkDCFQFXpaEx6p+rb+h5mvLzfFj4g56xmphtAsOL7wXgaXseQWietdLZjiOJn+qh/bdiPB6UFC5L3GOnSIacWcfqK4Pq2TU175GDwe9gF4b0tsuiLlNVX56ML7bJcr+LRP8vLxn6NcQ1DcdY9knH3n79IrDUCT1aR5qT2FskhGqfWvWZpYluSYvWJmTHea4x5/vswKlNiG72Of02nfYS3RV5LYPlZZcj7YuzBvuoc2gMQYAgaInFB6HuT2QAIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:22 +0000
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
Subject: [PATCH v12 07/22] gpu: nova-core: don't assume 64-bit firmware images
Date: Mon,  1 Jun 2026 20:20:55 -0700
Message-ID: <20260602032111.224790-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: a3944a98-ac3b-439a-6960-08dec0560589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yMztegDmmrTI6D7VAlVAZCg3YyzR/96d2XQg5xfw5gCWSnuKe6ji/f6gYyAV7tH7vh5jU3DsK99suSNNXIlbDE/yf7p29nE1JDQwK48dQrE5miPlADk37p16nDpRZihvHp/UzDMZsRt2YuKHfc6Z669jCCs56xqkAoOU0hORCW8l1+Udu/K8aRwYhk+MxSGDJ4U4KVfKmwDvMOxQh9mXwKcz7CZTBJEc30UfHfFSUcUgGfnW/0cnKmyIILahDkjASmKsA5ivN8NgxwUWl0QcXLmFO0FUktBw/VkWDeCqqCV0RFHiDpXNrY/fX/fHZPaNC899wG4CMqU6hBBx/R6CjcQbKC9+4gos8cXWd3A3/j8vYPx5myeVMqv4uXo5x04iKmR2GalUeEXUqpRqicxnbmASmAKF9hmhUlF5AuLAQu+ZZJyyzyTGr+6o4CI8nVoW0ndJGiSE/V7mYOSHaRGh+r251rCrkeYtbGSDPJgWxGrO1ETTfrsGisoZZhdtLHrgozLuRNGMmTtwvNBZ3UH7twxnlNC+67tanJv9tRBA5Zfu12UwbNEoYNlh58RolKJuewdWDaCFT5zmQ81ezsNkTENDD/bVvkj4OJwDuV9CX912pqm5HVv3yCKC08KbM353MCr+u9zf096razSL7gNJL/Qvj8pDMVlKel4zLf/jgTzFIsYOEWwesg5ILSH/4NVb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3kWVbMtE1bWwC/CJpAX7kBWRIL1PC940Be0g6yUDfH2wafw4ftWJ7jZLJ4qO?=
 =?us-ascii?Q?+drNc01cm/fIdmcfkcBOJwVkKczCJcgUh7eYDLVbiKIU/VorYdwZoaKjq9EE?=
 =?us-ascii?Q?A7IlXP7M1SqzVWf1Kx+6OZUmRBD+kzJR+zIkGI44Z8NX6v6uJIqroFXtgkOt?=
 =?us-ascii?Q?e/TSWlOk6RypgryXYfNepFnlt2bT863QMHB2JV5R4dUFFeG3gpODT9kFeOzt?=
 =?us-ascii?Q?MVHrkKgspJ+KlcZBof2c+QmBFRImLUboEDnkWHlbN4sECP0sw9AswAHnE3oF?=
 =?us-ascii?Q?1j/GyaqEzRVvnK71bX0DdimeAIWjQs+ELnclzrtsMBC8oUhVzxF0flAZqyp7?=
 =?us-ascii?Q?dHv6r4LT79v0aDas7O5/5f7Ty1z/dd2EVcYiQuPFXAWpTHqkVftynesQCrv5?=
 =?us-ascii?Q?3j5M/w6nhlL1mxwWQcDXSVGVIdfxqCMTYAxPSnDSDJYhk/F+CXQrelpnh2sY?=
 =?us-ascii?Q?noVjYrvdE5E3HlYkHPiLdNXlcnLJHlu7zmxoACCmwLggRoEnnJOWLfv7KxL1?=
 =?us-ascii?Q?728XAswYlYWSO6lPcwRwan34VvRrkoIyXTsH7DX/RafO2cAB7MypVwmOaLoz?=
 =?us-ascii?Q?sbOfKKiYwJTJgpa7OtG2DV01j3cuJz6RQdB9S9TrNHOmupLB9P5rjD2fbe5X?=
 =?us-ascii?Q?T3OOpw6k9VNalSTw2Bey5DPstbYN4cvEud4sR+IeifHSBBMyJJX5UyieimxW?=
 =?us-ascii?Q?m967Q0YrkqKAPyJN1xpvkWIe/Q9m8xOsEmE1tumAXScgi42Uu2Sk/aaN+/pP?=
 =?us-ascii?Q?bmj7XAipgJEJDmJrD+1RSLyTobOs6DblV48FSTMSEgR/D1tQBTEoO7X5WgXW?=
 =?us-ascii?Q?Pm1yYBBZYKi6CPgEhJYkYH9oomIiIPxdmvLlBBkFbOX62XQ5Y9UcpLWDH7uk?=
 =?us-ascii?Q?Ht9bX1IHTpO0fygKcDpcDVSOmTu8QXR2OmMvSygGry9yxky5cBak2I+op66M?=
 =?us-ascii?Q?EaQkrLMefGDN3jiMe0691cJhAFfYXdzP/YaSwUzKh4cE7i2oY6ZoccUTf6uw?=
 =?us-ascii?Q?JKdZSQoYrDkzKAaZtq3w4ZSgZTNoTCW/xNMXsOkfHT6tOgYVARvJZQgXb/Ja?=
 =?us-ascii?Q?pdXdTIGJqHYg8Z7ZOAYOBEKKpktRZghdu8VSWb4lmyl6O0A7JicoVTITjmbB?=
 =?us-ascii?Q?fVfO6Fz8J2kW6UDan4/5479CZZJKNZw2tjNpbZhIFTVM1RnQDj2n784C0UfW?=
 =?us-ascii?Q?W71KUupCkDThBPecC2DWKT4myyPR5fkxJsfudCX7poZ5snt4qhHXWHD0hfRb?=
 =?us-ascii?Q?g+WEGH8GNQe/G6vpaHClzXA6Phk9ysJL4/gAh8PEWsQvibLD3QtWPQpsPyoY?=
 =?us-ascii?Q?P/z8eU+6utRz5ezF2sedDmNO5IrWsFIBQD45u+Dy1pltRab/EwiXfE12hhtL?=
 =?us-ascii?Q?A+eJFYfAem7pgv4jNhBEn+NHoNhcJrC38m8azq9LNz+TOvad6gAY8pwxeVvV?=
 =?us-ascii?Q?vPGNg7oS1nbyQXfIco4zxagm58B0sbuRJrSXBfBXYJqaXpVWFaV8QMFYeMOR?=
 =?us-ascii?Q?5RRxVlLri0e85VjZed61cFRvzIFTAwmsH6QrXpUdSbt7y7RQXv6jOV3vbg5/?=
 =?us-ascii?Q?wGexA+YCAlZN0fPkz5En79TfJ3QiUHvRTKSZI+KMf4o1KtehwyJTxwNA/GzF?=
 =?us-ascii?Q?XdoU5XX1xHqBSTge2MTJqnFSTAr39A0htQheNb+O0D9VE7WCtK+PSh0L/mpU?=
 =?us-ascii?Q?9Ki93IBfFNx6iilv8zK7PFEvRMj9A0YrfPr4sPmXW0PjfzZ/xUMMcivpxR4I?=
 =?us-ascii?Q?bAvQ+mEjwA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3944a98-ac3b-439a-6960-08dec0560589
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:22.7113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vm9MPqKH9oXTW+H8x7nmGLdrMPeaOvQM4LD8vU0hlu3EwRMlIpDmjBLQTpmO512EmbN8j6+7cYwvatwvQNq2lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Introduce a single ELF format abstraction that ties each ELF header
type to its matching section-header type. This keeps the shared
section parser ready for upcoming ELF32 support and avoids mixing
32-bit and 64-bit ELF layouts by mistake.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 112 +++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 3aac073efee2..38088e950980 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 //! Contains structures and functions dedicated to the parsing, building and patching of firmwares
 //! to be loaded into a given execution unit.
@@ -467,17 +468,72 @@ mod elf {
         transmute::FromBytes, //
     };
 
+    /// Trait to abstract over ELF header differences.
+    trait ElfHeader: FromBytes {
+        fn shnum(&self) -> u16;
+        fn shoff(&self) -> u64;
+        fn shstrndx(&self) -> u16;
+    }
+
+    /// Trait to abstract over ELF section-header differences.
+    trait ElfSectionHeader: FromBytes {
+        fn name(&self) -> u32;
+        fn offset(&self) -> u64;
+        fn size(&self) -> u64;
+    }
+
+    /// Trait describing a matching ELF header and section-header format.
+    trait ElfFormat {
+        type Header: ElfHeader;
+        type SectionHeader: ElfSectionHeader;
+    }
+
     /// Newtype to provide a [`FromBytes`] implementation.
     #[repr(transparent)]
     struct Elf64Hdr(bindings::elf64_hdr);
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64Hdr {}
 
+    impl ElfHeader for Elf64Hdr {
+        fn shnum(&self) -> u16 {
+            self.0.e_shnum
+        }
+
+        fn shoff(&self) -> u64 {
+            self.0.e_shoff
+        }
+
+        fn shstrndx(&self) -> u16 {
+            self.0.e_shstrndx
+        }
+    }
+
     #[repr(transparent)]
     struct Elf64SHdr(bindings::elf64_shdr);
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    impl ElfSectionHeader for Elf64SHdr {
+        fn name(&self) -> u32 {
+            self.0.sh_name
+        }
+
+        fn offset(&self) -> u64 {
+            self.0.sh_offset
+        }
+
+        fn size(&self) -> u64 {
+            self.0.sh_size
+        }
+    }
+
+    struct Elf64Format;
+
+    impl ElfFormat for Elf64Format {
+        type Header = Elf64Hdr;
+        type SectionHeader = Elf64SHdr;
+    }
+
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -485,47 +541,49 @@ fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
     }
 
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
-        let hdr = &elf
-            .get(0..size_of::<bindings::elf64_hdr>())
-            .and_then(Elf64Hdr::from_bytes)?
-            .0;
-
-        // Get all the section headers.
-        let mut shdr = {
-            let shdr_num = usize::from(hdr.e_shnum);
-            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
-            let shdr_end = shdr_num
-                .checked_mul(size_of::<Elf64SHdr>())
-                .and_then(|v| v.checked_add(shdr_start))?;
-
-            elf.get(shdr_start..shdr_end)
-                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
-        };
+    fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
+    where
+        F: ElfFormat,
+    {
+        let hdr = F::Header::from_bytes(elf.get(0..size_of::<F::Header>())?)?;
+
+        let shdr_num = usize::from(hdr.shnum());
+        let shdr_start = usize::try_from(hdr.shoff()).ok()?;
+        let shdr_end = shdr_num
+            .checked_mul(size_of::<F::SectionHeader>())
+            .and_then(|v| v.checked_add(shdr_start))?;
+
+        // Get all the section headers as an iterator over byte chunks.
+        let shdr_bytes = elf.get(shdr_start..shdr_end)?;
+        let mut shdr_iter = shdr_bytes.chunks_exact(size_of::<F::SectionHeader>());
 
         // Get the strings table.
-        let strhdr = shdr
+        let strhdr = shdr_iter
             .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
+            .nth(usize::from(hdr.shstrndx()))
+            .and_then(F::SectionHeader::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find_map(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+        shdr_iter.find_map(|sh_bytes| {
+            let sh = F::SectionHeader::from_bytes(sh_bytes)?;
+            let name_offset = strhdr.offset().checked_add(u64::from(sh.name()))?;
             let section_name = elf_str(elf, name_offset)?;
 
             if section_name != name {
                 return None;
             }
 
-            let start = usize::try_from(hdr.0.sh_offset).ok()?;
-            let end = usize::try_from(hdr.0.sh_size)
+            let start = usize::try_from(sh.offset()).ok()?;
+            let end = usize::try_from(sh.size())
                 .ok()
-                .and_then(|sh_size| start.checked_add(sh_size))?;
+                .and_then(|sz| start.checked_add(sz))?;
 
             elf.get(start..end)
         })
     }
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf64Format>(elf, name)
+    }
 }
-- 
2.54.0

